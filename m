Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13B7B1E61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 15:29:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TWsVtO1s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxDq71s56z3cmS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TWsVtO1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxDcp5ftpz3c4y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:20:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 549DDCE21D5;
	Thu, 28 Sep 2023 13:20:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 156AFC3277A;
	Thu, 28 Sep 2023 13:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=lrXHVV3iKHeN1GBo4fXrfsJZ5+V8aEe9bhvkg3xQu78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TWsVtO1se30j6NzRsQjznKd0IGCNIY2VgIg21hGNa14HC3vwxzs1aVq4U4DLOEsfT
	 vQbxlngy5nU2UnJYZDYUyFIYmMWGnsQnlKbC22dRFKc074V3GF2R65SppEJW2FUD6N
	 IXO4n+4W6rJ6vuS2fVDGW2rfRnJ509II8Amksn6W8cNuHoWjUjPqnPiMHHFuQl2GtJ
	 4EN9T0bOlFEfubaFgkknSCgzfOEIbfjhhaJdVWQnxqL/g3zNbR9XAg06lmEDArens3
	 5pg3ppf9QpErzQbOwwM6QfDuD/ut8bNLQAA9LcKsi0cVAHbIjDQOnVyunv179quYiT
	 9Pd5mZe9q6Tqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3F5E732D4;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:35 +0200
Subject: [PATCH 10/15] vrf: Remove the now superfluous sentinel element
 from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: =?utf-8?q?=3C20230928-jag-sysctl=5Fremove=5Fempty=5Felem=5Fdrive?=
 =?utf-8?q?rs-v1-10-e59120fca9f9=40samsung=2Ecom=3E?=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=957; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=1NLC9qP1CY5hbDPyr23yN2zoH2+i6NGjxa91ihvztxA=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3efmxA5MIacGiPYUJqzMHLsUucZXUhKmZvp
 uwNl2wpIdyJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93gAKCRC6l81St5ZB
 T7zVC/9nccm8Jt9uhH7oQGv/uUE1TUHdyD8riQXjy6Q7siM8V6fZZKtqQAuVbgk+dQ+XYCY0MXU
 +gofOFghmvbuZW33bSsn6BpCMPsZitmR2AIrJz40JNmDes9atMglKzaw6YK2sktVhAl5vRjsBF6
 C5J/9HUHSFTD8MEiz/KG9qmfVDtOhZJrKQgG/eDxaK/tTOWULGYjcrTRsBdqVkhYUwiQyEmiisu
 obKNXMg1SnhtJyaW6u1yDjXdEuCYd7wdKEyFxJI/TVAsD80Usfi+gJ22UC1YiyxBWVYbaLTcm3/
 zXaEujj/bV6H7Mg+H3VBldoOzwUvs2J/KXMTzFHPGN3CideOlJrNCrkFP8axi7opC2TPD+ep4pW
 0zw45g4ZcDDdEZ7ttDDSQIcb3A6YNO2mXHNC8l8Op9uQPlfVSgcF0E0Tm7cxZd0lrEy+neUKS8q
 GUMrJtSPCvRNPD4xWGcwfpGrX5UX9Vuuit+whdxcOw2k8YWghpbrglRWCjHk82JtuA8a4=
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

Remove sentinel from vrf_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/net/vrf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/vrf.c b/drivers/net/vrf.c
index a3408e4e1491..94eed8708467 100644
--- a/drivers/net/vrf.c
+++ b/drivers/net/vrf.c
@@ -1962,8 +1962,7 @@ static const struct ctl_table vrf_table[] = {
 		.proc_handler	= vrf_shared_table_handler,
 		/* set by the vrf_netns_init */
 		.extra1		= NULL,
-	},
-	{ },
+	}
 };
 
 static int vrf_netns_init_sysctl(struct net *net, struct netns_vrf *nn_vrf)

-- 
2.30.2

