Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F07B4E9E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 11:04:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oGcOGSdF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzZkx4sxCz3w5h
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 20:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oGcOGSdF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzZVV4SH4z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 19:53:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E359E60D3D;
	Mon,  2 Oct 2023 08:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5543C32781;
	Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236795;
	bh=7IWRTGCcHSZcJzQ9+CQB1q8u0SSRDwfa1ILU59ULK2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oGcOGSdFN01g9tO0zq1jWZxxY5eHTEK6Ieh32g8Zl/2u76GNVZiQplz+70dwM408C
	 xjGlLWU9svr3ba5PnteRqLQfz0+/I37zpSxnNv1EoOGbS4xjDcu/B9evHnXvTA8j7v
	 d7BQmq6BXC7iZHS906y/XkAV5W/lOuNd4ZfYBZNpclFo6eOLGpnNk7uNvGblazVEHf
	 os8uOGrLIInyl8EPMHRpCflKVwdVNnAKpOvp5OB+K6OLgI8MJQzgp/5rAIMjY36OfD
	 3H/N/aFfLHnF8zbVNeIF9+kNw12/GhyMqXUJ4Ex2+CIwPcnwWQrSlYs4vgLjPwpQuh
	 /R3FAf3MQKt6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB085E784AF;
	Mon,  2 Oct 2023 08:53:15 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:28 +0200
Subject: [PATCH v2 11/15] sgi-xp: Remove the now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-11-02dd0d46f71e=40samsung=2Ecom=3E?=
References:  <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
In-Reply-To:  <20231002-jag-sysctl_remove_empty_elem_drivers-v2-0-02dd0d46f71e@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Phillip Potter <phil@philpotter.co.uk>, 
 Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 "James E.J. Bottomley" <jejb@linux.ibm.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Doug Gilbert <dgilbert@interlog.com>, 
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Corey Minyard <minyard@acm.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, David Ahern <dsahern@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Robin Holt <robinmholt@gmail.com>, Steve Wahl <steve.wahl@hpe.com>, 
 Russ Weight <russell.h.weight@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Song Liu <song@kernel.org>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=ePmiIBkulMk2J0Hn3yd3SHNfMVzMlB72hhtExcVcV3k=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV+aKXagxwn9FWH6ZTWvhVjY34ucdd7w4DTR
 2dN5LSnfq+JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfgAKCRC6l81St5ZB
 T1upC/0f07DfBkp9sG4MGPmaJMzGlZZGiOnSzrgySbn+KY4QlvVmzeCW1RNh4/SI3qUvFnRH36B
 HBgmh4yFhDu4q+nFYCARsivwe8aPPp1SDmgVepBn+ew8CtGedybiL+3GVk+plFOmzUKyXRqAKon
 nl6r/yKeTppABClVqoKzfvgqLzNdwZ1N0/hKaxCvpE3bXE8C738wQoCchtxfzSD/xxKTcP3goQ9
 RcUh/CLFpuWwPYKkhhje8q2K9Kuag3MAUHMxqTBKjQxCHsRQoM6bMQBD2HAZv/dnO7CIzJlXrG1
 DMp+Kj8HcvmcGue1narnsl/PUBnvXc6MHPZjyHedBOfa4+ZohotYOHCdLnRsB4tbge4IwuYE0Ju
 MRVv3O66uFsRuysv/tf6I/ai86ZsmS9bXTFhF3IKs1z75FxvjZH8a228UoQ5l+88yppXQR7bEK9
 7kXy21jdGYBzOOmBMhIg6MzwCUczClJJAyH8bUbGA9Uew0qK+QE+XeevXulpo/4D6CW2o=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received:  by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: j.granados@samsung.com
Cc: Joel Granados <j.granados@samsung.com>, linux-hyperv@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-raid@vger.kernel.org, linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel from xpc_sys_xpc_hb and xpc_sys_xpc

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/misc/sgi-xp/xpc_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index 6da509d692bb..3186421e82c3 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -110,7 +110,6 @@ static struct ctl_table xpc_sys_xpc_hb[] = {
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = &xpc_hb_check_min_interval,
 	 .extra2 = &xpc_hb_check_max_interval},
-	{}
 };
 static struct ctl_table xpc_sys_xpc[] = {
 	{
@@ -121,7 +120,6 @@ static struct ctl_table xpc_sys_xpc[] = {
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = &xpc_disengage_min_timelimit,
 	 .extra2 = &xpc_disengage_max_timelimit},
-	{}
 };
 
 static struct ctl_table_header *xpc_sysctl;

-- 
2.30.2

