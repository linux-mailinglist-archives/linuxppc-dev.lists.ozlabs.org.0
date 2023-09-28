Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE297B1E26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 15:25:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cZ7nyMza;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxDkP0Lp1z3dJL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:25:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cZ7nyMza;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxDcp0w2Vz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:20:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D4FECE21BD;
	Thu, 28 Sep 2023 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80E56C07618;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907236;
	bh=jejSCWbFLCFF2dkjqTkEdiAPz2XEiyBfn7Kx6dJyBRE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cZ7nyMzaaFGJTdj0cQqjiU1KLFU7WnEfcSz8Z8D1PNPaIUWfpiEvebX1GZG3Vu9xk
	 pcCQC9yWnO5mDjBeYV68yUbfxRDGX0NUmqDLT9IPyXgaUbbXA2UKWfuTYHhsjplAVs
	 sHYt++vYmu+132G0xpM5JpYteq3GwkUvZmpjMJ2kO4eAfNSzH/nteMMsaDWjkLc9D+
	 Dab8WB+OuUjY9J4ifmA3HpOLo0eSGtZwKMnEb7ul//qTMBnvZ4PaJYrNi94a/7hF1c
	 LKhHi0gdw60QhY+KcUG5P8VSRB3JuT1hyPOFvcUN+xR8XlYb3TwFJnXF93xwVUFv1d
	 Y10RNqtfK6wXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60545E732D1;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:29 +0200
Subject: [PATCH 04/15] tty: Remove now superfluous sentinel element from
 ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-4-e59120fca9f9@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=j.granados@samsung.com;
 h=from:subject:message-id; bh=8sTvUGRVDTp9H1bDylG6Zdr7SdjuawIyFt9Rw8abcOY=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3cdF4EIlnMzaDc9G1cMmQnLIu/8Bu3kPy9n
 QS3nW1BnkyJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93AAKCRC6l81St5ZB
 TymCC/93IOLpSBLeRvxqmQfi+lOXxSMU432q2hGOTJuwaFN4hoNYNr5JYby9ccthVv/ftgOHQWc
 M9C+kthX5+CFu7e0qqMVk/DE+aSJ4xeiApfapfP7GJjYu8sQ7XDPEVcqWSG0mWBUGo3CvDDgAXj
 VrOGclYbtMQ5oVdoJOzh/2ppeRTUPRIoeM/xZGcvNSsDeIPl0/3eOaTjZ5rXe5MVOagVGsiRTP3
 ezgKR03gT8Yingu9bLjUv7OnG9nl1QoJYIDP4/FVL1BTSUXU5yv7j77gZzRRQIbzk4ipEXAyv5c
 RrGUnHweFzoUFB4S3PkbWCKDKsNqwxU7WLvG2w5iAYfe/RYHS/0f9eRdcydszQ7u8ndwuDnCi9w
 uoQTfWDAeadPvRLvv6gnqZnsVQRFswvm9os0gC8/WUJizL51h0PN6Xk1tTcFBVrMNIOyHRONik8
 q0ZJIlhNLM4i70qg1sQ94ogeJkRyTF9X0puD9rr+5zpwm2KBw80tiFM1eim5U1g9W+n+o=
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

Remove sentinel from tty_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/tty/tty_io.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 8a94e5a43c6d..2f925dc54a20 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -3607,8 +3607,7 @@ static struct ctl_table tty_table[] = {
 		.proc_handler	= proc_dointvec,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{ }
+	}
 };
 
 /*

-- 
2.30.2

