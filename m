Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 941117B4EA9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 11:05:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dr780/9O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzZms3SgJz3wKT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 20:05:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dr780/9O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzZVV4VZbz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 19:53:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40E8160DC5;
	Mon,  2 Oct 2023 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 233BCC32791;
	Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696236796;
	bh=CWlJL9Lw1/ldMKMXIXxw/hUhoDe/0uo8LXE4rcCIDvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dr780/9OgUcsdtC82ja0MVSV0MPcrkXtIHn1pfiy0bouUWxiebn11JLyTjawcIz1B
	 ACtOMw8UJL7kZBt4+Lypa11r9YIbBL2pUR4tV7r3QIOnCIuJuaBBW/9q4JfKHjx1rO
	 6DzPgfGQxmcnE3sD8DWla26vXCXsl+oyLhwVGCFiYwBOrRxzVfX7ROfuVdzYIv7UN4
	 DLxNvEoWgw3dN2cyVkNUBQeJlZ7BFF4dfqBAUktV8qF7Fxq4p/dDrq364NaHDDdMbT
	 HPQK4lMcdLy+TTpsVeHkfkPs0w8oUjzfHoz+Rpqcu+CKTvTQz3xFFRsIiD83pD1xv0
	 sGtUhoGU9ETOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF3CE784B4;
	Mon,  2 Oct 2023 08:53:16 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Mon, 02 Oct 2023 10:55:31 +0200
Subject: [PATCH v2 14/15] Drivers: hv: Remove now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20231002-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v2-14-02dd0d46f71e=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=aRo7NVdYCvLdNgGSBgQ6l0+E6oBOdQJH07rUCLQlR94=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlGoV/RVrZ++DlZt66bGmFv2tACCjFtyc9bKCyt
 Xh72+xBYa2JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRqFfwAKCRC6l81St5ZB
 T9wCC/9S9uDWtQoaUtTyJySq/BwgMLnAny2OrneSlhO0UKqMZFvbOgUuQGiJNs8VyC7IlWrxHVm
 2gbT3WD/mQhI9WX/B0z4TarGuU+BJmzwoPPun5D3G6oUedf0JdyIZLs9TJwZyL4KbQHIhVQ8skt
 9d2ELBqWveNmV8f+e8MKgjsdagi/9I77W0Dlj2eujgXgyIiPLQ/ZS+2g+heBSUicyN16ibHEu82
 LllVj4x/NiItYuyLOncHEA6dI2/PYrOmYAHIkg5yUqWOhwDEKS4RmcYq0Y0lzUl8APdk06uQkJb
 FFdVwsBnc3/rIeI8WobAqGTPjJ+p7k6APq5wq2IG+SuGmix2X7nozc7PdKVDApIkihzXIqIdVzt
 YXt3lgmdjZI5hmlPt6RyTPvW/lX88Ru+QtyDLF7HtMgyQnjyq5zqqu1URjGJnly2oy19F7wlilb
 AGIwY7o8qjN9C7sQC6yGWy2cGGyxw/g56tiwhVyVidw8uSz1wSXK/WM5kW7C0TiW0R8hQ=
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

Remove sentinel from hv_ctl_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/hv/hv_common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index ccad7bca3fd3..4372f5d146ab 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -148,7 +148,6 @@ static struct ctl_table hv_ctl_table[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE
 	},
-	{}
 };
 
 static int hv_die_panic_notify_crash(struct notifier_block *self,

-- 
2.30.2

