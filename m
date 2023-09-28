Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D679B7B1E1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 15:24:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OZuf7hMN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxDjR5T47z3dFl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 23:24:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OZuf7hMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+j.granados.samsung.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxDcn3vjRz3c4y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 23:20:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9B2D61CB8;
	Thu, 28 Sep 2023 13:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3C10C32779;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695907237;
	bh=5zO7s9Lwosi7QmmL2WLVnIc8u/uJoPITOshfrd6dPWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OZuf7hMNQH/6jfPbtQZPCoyl72bn87/HT1LPJ3FoDxaF5e08+Voy29HA90DNmKOoG
	 K8KTyPsT29Q26moP3JUFagj7TAexacVLiF290EeK6+rY62iPg6ZyRTx4ilgv7E7E8F
	 DvR4G7zQgEsTokMkNy6lVyh3stCdclTnVH5Vp3bKDcYTPfCdpzizojbvyyoPPS5pjd
	 Mq7h9q+sOBnZ7vG+kASbLG/sVqWDBGgHfd0LO7kF40frLpwZuwHCNu4vrFnpG85OVQ
	 lokojtHlhEBwQcvtiHV40wjfGBbAImHeFyFCmXQ0lP4q6HD2l3RILeABD1jxtaSzcZ
	 GfMvBEvqEdDYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD06BE732CF;
	Thu, 28 Sep 2023 13:20:36 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Thu, 28 Sep 2023 15:21:34 +0200
Subject: [PATCH 09/15] char-misc: Remove the now superfluous sentinel
 element from ctl_table array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230928-jag-sysctl_remove_empty_elem_drivers-v1-9-e59120fca9f9@samsung.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=tCD6uUjpENwGRI1wSieFMxVn0HaUdToj9oadXuH2mRs=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlFX3e649I8iEgCQ+8jvmfVnSbEH+5cM+/uGjHp
 +7sMjQufCiJAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZRV93gAKCRC6l81St5ZB
 TwJnC/0dPQEskd6EkB4tfpnbwc2TgKq0dfoj8tKncz1G9fyLn3o0DNocpaZy1J4AYL6xD9M4XOC
 kb8puBCX15k3E5sE5lbIupq0uxghhIz2QY6VgfmuomBSGqMVmc8v3gckB2sJCJ0z5cPwmGU9LLM
 wq7K6pONMby24XwTPGt/fPbLT0WQ6y5WkunD9VwmNnFA7zmxQCtUqfY644ugivFOBW5pgclR9hM
 C5jdw8MqjkddlipW10caCiPkzcMV+kSoo3qs3wHncPTT7vISH2e6tkmI2Xy75z1budS54vtamLX
 QwV6V1xjrMUdchaAvkfWGb/tMSrwmBFOgQuQ0mmvFwoQ26xpdGB0iMIQEopG12V2aUFxEI1/vaJ
 8Q6aXtkcH9hwbAp8iR1LbVAzPoCeivNtsvq9A8ogh/og192Qwas7QVtFgbNNcPKSovvljsGIJ6c
 iM6sGTzKbWd6JxxlKEyGZw2u6ept3Ng28GdM6XTYEcyB8nWkVSiKcpqhOpbwekS5ZZmaI=
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

Remove sentinel from impi_table and random_table

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 drivers/char/ipmi/ipmi_poweroff.c | 3 +--
 drivers/char/random.c             | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
index 870659d91db2..b65ab51bf9fa 100644
--- a/drivers/char/ipmi/ipmi_poweroff.c
+++ b/drivers/char/ipmi/ipmi_poweroff.c
@@ -655,8 +655,7 @@ static struct ctl_table ipmi_table[] = {
 	  .data		= &poweroff_powercycle,
 	  .maxlen	= sizeof(poweroff_powercycle),
 	  .mode		= 0644,
-	  .proc_handler	= proc_dointvec },
-	{ }
+	  .proc_handler	= proc_dointvec }
 };
 
 static struct ctl_table_header *ipmi_table_header;
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 3cb37760dfec..4040715cba19 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1682,8 +1682,7 @@ static struct ctl_table random_table[] = {
 		.procname	= "uuid",
 		.mode		= 0444,
 		.proc_handler	= proc_do_uuid,
-	},
-	{ }
+	}
 };
 
 /*

-- 
2.30.2

