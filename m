Return-Path: <linuxppc-dev+bounces-3274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40989CF948
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 23:11:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqrnz4ym2z3bkb;
	Sat, 16 Nov 2024 09:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731705829;
	cv=none; b=K/93fazmzKAwDM0O8G+OEurcw5RYKxs+F39dvYclSNe8fxzyI5HhNHafrKK/Jr1FC1bGQaa6uGfR6cS9Ye9DnBsFLcZjl0OKISVf7bD7wWnGBIqnV/sLzdrdPQXyXuxFYwDLsyYD4SflwQgtHBlrfw9iFjqXnCE+uCgZTCel0rWg+rSEtgkYaRKsIxsw6A5tYgJjUfDzZ+kVB8kSEePQnnXFImDl/FDPnCd8gcIZitaWapksZzeGEs30PLeJx7sfFTbZwcfeig1HR6yYZWzCq+OCdHox6cKBCSHttIr4o2BJRuhSDrbZ1OIXMaEgdwDkK9U18a7bAfhIoSySz+5SnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731705829; c=relaxed/relaxed;
	bh=cDb5q9ey4rgvzuTMFsMkjW3R4ZHiX3a+lRd3JDjV6+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+Zju0geapry85FQ5rEKnzLd4qRgYJbNjODry+bqBRDFhJA1x0La+VmQ/2KXlIfCuY6/9KhRppMSg6WYEUMFskzly6QoDDQchrBSm5XebKpmRNr0ffZ9o0w2iTuoBfspQeKagMoK+tBbj/u9T2Wa2DCVACpfVIpacBUaLgJq/P6r1c4WZNkrp4lX05gg8GhIx0yx9t5+sLBQvDioGM6CCBT4vAj8NLWLzmJXS4brMpaJuJyycdS36MvKx8DeepFcQlNtmnmsOFLtfg0GHdJQGqaMBaogHRPhCSe7Vp8XMPOIfOQBBn777Wq5oTmbkxpxHVWwjawzhpySKgpam0KD5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=imd3kVk/; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=imd3kVk/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqql86Dxqz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 08:23:48 +1100 (AEDT)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id 256D9206BCE9;
	Fri, 15 Nov 2024 13:22:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 256D9206BCE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731705763;
	bh=cDb5q9ey4rgvzuTMFsMkjW3R4ZHiX3a+lRd3JDjV6+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=imd3kVk/tJhJYNa/xeixDhpAwYPvx4IlSinPbk/21FlgSBXFMaFV4APntdnbxA1fq
	 WRyS0aWoUlD4yY9/jG3e/ehoXMMrIljBVBgBQNEO519W/APj0YYahRFp6DV4wrhONm
	 8XT+qK7qOCSuyxWBlS/5K7TjbCkS44CjtifGQlCE=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Fri, 15 Nov 2024 21:22:36 +0000
Subject: [PATCH 06/22] mm: kmemleak: Convert timeouts to secs_to_jiffies()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-converge-secs-to-jiffies-v1-6-19aadc34941b@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org, 
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org, 
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com, 
 linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes made with the following Coccinelle rules:

@@ constant C; @@

- msecs_to_jiffies(C * 1000)
+ secs_to_jiffies(C)

@@ constant C; @@

- msecs_to_jiffies(C * MSEC_PER_SEC)
+ secs_to_jiffies(C)

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 mm/kmemleak.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 0400f5e8ac60de555f43d85f1d36f67e48b4ebed..2c099d0819b1896390b842af76069a46bffabc23 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1816,7 +1816,7 @@ static int kmemleak_scan_thread(void *arg)
 	 * Wait before the first scan to allow the system to fully initialize.
 	 */
 	if (first_run) {
-		signed long timeout = msecs_to_jiffies(SECS_FIRST_SCAN * 1000);
+		signed long timeout = secs_to_jiffies(SECS_FIRST_SCAN);
 		first_run = 0;
 		while (timeout && !kthread_should_stop())
 			timeout = schedule_timeout_interruptible(timeout);
@@ -2202,7 +2202,7 @@ void __init kmemleak_init(void)
 		return;
 
 	jiffies_min_age = msecs_to_jiffies(MSECS_MIN_AGE);
-	jiffies_scan_wait = msecs_to_jiffies(SECS_SCAN_WAIT * 1000);
+	jiffies_scan_wait = secs_to_jiffies(SECS_SCAN_WAIT);
 
 	object_cache = KMEM_CACHE(kmemleak_object, SLAB_NOLEAKTRACE);
 	scan_area_cache = KMEM_CACHE(kmemleak_scan_area, SLAB_NOLEAKTRACE);

-- 
2.34.1


