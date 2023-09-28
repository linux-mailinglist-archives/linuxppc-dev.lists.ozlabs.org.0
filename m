Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA22B7B1E58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 15:28:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X1KG2Csl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxDnF5Y7hz3dCb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:28:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X1KG2Csl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxDcp1kcRz3c5c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:20:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D863961C67;
	Thu, 28 Sep 2023 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28DEAC3277C;
	Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=WESDWSBIxBgTV46NKfEUHelTwfrWg95I2h4/Iqr/LRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X1KG2CslKyXTmAHOE9ut19dU3D1ndZDLDdqUloNr92yULn+YqrPZji2xw2INBYpUm
	 6F9yTU649cXeMkhlXPNSEgx9CZEqSU2KI7nIVnuEAcHdctqE7BBYS5qhtEf2yOfQnG
	 R1mpQOonF6UvHW7ScvUsXX6PuQxhn8SfiZiDQ0St7xAhbhnYOBS6MvxU2R0XUDnGt/
	 DBV2CmPFYybbpaGP/rLAB1yXMe/SnzrzBKC0su2BZmK87DmShTLpzxZCLR/mQ4v1pN
	 8cUsQWYemfXRz8FCPMeF9hl3BfYwspIRCViLCTG6Pj0iu6BAbtFCXNuyprY8KmJO9t
	 qJcclRkDU4adA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F863E732D0;
	Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:36 +0200
Subject: [PATCH 11/15] sgi-xp: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-11-e59120fca9f9=40samsung=2Ecom=3E?=
References:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
In-Reply-To:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=pY2XyujxOt+Rj6u6+44+o009/nkYZtGGPZk9nN2iFyE=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3fe3sdkuVX/cH9+wfjrH5ueAgUPjamrIOH4
 /3zyIkdfAqJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93wAKCRC6l81St5ZB
 TwpRC/4lSj5L+OahMU8+3S1fvTtKAyIY/uKM1bPNHdispZZPQR1Rd3tvqJTptup1mzRuFuO8L1m
 8PJXRwGmMWlfPnW6wWYP/M4Aqq1CITeSckvnMuyUa9IAlZg0a3oKSGu5yX6zSvvAQ0+k7mBAb3y
 UBqDMmlaWuIsDoJskRRHROj9+KwmhMmsEKZWwN5UGxnjSX57Ws5oYdteVXY5AI8Zp7Hy8Tx0heX
 FCndhRyQrnj2jq8I3cC94HaHBQ+r/FbCmV0KJSg5xqjdEy9VmQiEja6TCN2IAUta6kgV5r3iSsz
 uRL2Spqp9oaZW9r25KtgCboTiH5fnCIkTB16pgKJEydjH49JsnKqmlAleVwBd/WjEU86E4be+/t
 V9Kx7iqRDYUo2aZWNOMBizEJlyYBMYHFFIiSdMNx4xMMW78VnCfWmHYPolywQlOL/IO7kdASIva
 qz9zA7cr0tjD3lcLzXnQuXIHAhNUbhz37de0+vmc7TtbbfZaFsJe0s2ItUEMGxrc4UUuo=
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
 drivers/misc/sgi-xp/xpc_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/sgi-xp/xpc_main.c b/drivers/misc/sgi-xp/xpc_main.c
index 6da509d692bb..c898092ff3ac 100644
--- a/drivers/misc/sgi-xp/xpc_main.c
+++ b/drivers/misc/sgi-xp/xpc_main.c
@@ -109,8 +109,7 @@ static struct ctl_table xpc_sys_xpc_hb[] = {
 	 .mode = 0644,
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = &xpc_hb_check_min_interval,
-	 .extra2 = &xpc_hb_check_max_interval},
-	{}
+	 .extra2 = &xpc_hb_check_max_interval}
 };
 static struct ctl_table xpc_sys_xpc[] = {
 	{
@@ -120,8 +119,7 @@ static struct ctl_table xpc_sys_xpc[] = {
 	 .mode = 0644,
 	 .proc_handler = proc_dointvec_minmax,
 	 .extra1 = &xpc_disengage_min_timelimit,
-	 .extra2 = &xpc_disengage_max_timelimit},
-	{}
+	 .extra2 = &xpc_disengage_max_timelimit}
 };
 
 static struct ctl_table_header *xpc_sysctl;

-- 
2.30.2

