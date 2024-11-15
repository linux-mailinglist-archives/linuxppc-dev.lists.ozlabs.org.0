Return-Path: <linuxppc-dev+bounces-3259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D59CF92A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 23:09:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqrlH0g3xz30WS;
	Sat, 16 Nov 2024 09:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731705796;
	cv=none; b=kQ2rP6AehaalELX7B0mJusGZpR6LKG0/IZrLGVlpUOVNy4aY8yNeMokztSqkziwQM+3pErw2Se+Nba+ibI96KloC8uFfTqnFMKING4u71KgisX1E5uBBvoc+0OHjjdeSr65bY6f7HpLmQ8An+gFkwzMM9vRcTWydyvzpxB4Oh55xd4zfcMUFaOqHgnRe28t9TNHdtUn4oO1HecrtXOFuzRMwRvetx2gQhf3mit2UiTVtQmVcfJzKY+VuX0bP95UC04I6/ucVcUrH/uPHLvr112L79gppvmpFcqVqqhYPCBD1MxxecDHRIXk2Dt7jPjIqPMBLHalbM0J03ZAAgBHPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731705796; c=relaxed/relaxed;
	bh=2qNmVTIUPIQHjxG6U+oz3oOJorUpDTvltiEua1kgDGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSX3bOfEndqDkDriWEpXyBqiQEBSOn8b0Ib7/iAmN51lpOhasycUkMsAu19eljXyIC/E3UayOiiID9M2QkxtVngJ55uBsPBFdnXeqSOxTacRsX7YtLF39GVVuXW0vBb55DHqM1qt8CXrLg7QKWHsFbGsy3fiZDsZF+Js1H87rjHmkswPnZOKlMqXgzov7L1BlxBm5tgVWfbrR+DusRNxwPAMPkwK0r+GzYqF0fClB7M8Jfcp66+iY4nkU14+abJbvAluFllUxy29MInaZp7GqJryU1V5fVpaj+Cft+6ZYIBqm0HV8gGGl3kQgXlBKNxtb5WUNeTyZoAxhB3W4f+ZrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=jwtdE59v; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=jwtdE59v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XqqkW50kgz2yD8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 08:23:15 +1100 (AEDT)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id ADD5A206BCE7;
	Fri, 15 Nov 2024 13:22:42 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ADD5A206BCE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731705762;
	bh=2qNmVTIUPIQHjxG6U+oz3oOJorUpDTvltiEua1kgDGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jwtdE59vuxdQNE0RiS/g1dZX+uqTWG/w9IblshEquJbSzhtkY3Zk6fbDpk+PaYqJ3
	 QDyNOhOWd9ZJoQqLoj3N42Lk4lBijUYlMVpBY8G/XYg13FKv7CiQTz5tjAvkJe5Ryj
	 q0FRAVEgJKXl2OZRO71N5d2wqJQesfADXbZgbw84=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Fri, 15 Nov 2024 21:22:34 +0000
Subject: [PATCH 04/22] s390: kernel: Convert timeouts to use
 secs_to_jiffies()
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
Message-Id: <20241115-converge-secs-to-jiffies-v1-4-19aadc34941b@linux.microsoft.com>
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
 arch/s390/kernel/lgr.c      | 3 ++-
 arch/s390/kernel/time.c     | 4 ++--
 arch/s390/kernel/topology.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kernel/lgr.c b/arch/s390/kernel/lgr.c
index 6652e54cf3db9fbdd8cfb06f8a0dc1d4c05ae7d7..68021cb38574b122bbe3d9f70e9168305360017b 100644
--- a/arch/s390/kernel/lgr.c
+++ b/arch/s390/kernel/lgr.c
@@ -166,7 +166,8 @@ static struct timer_list lgr_timer;
  */
 static void lgr_timer_set(void)
 {
-	mod_timer(&lgr_timer, jiffies + msecs_to_jiffies(LGR_TIMER_INTERVAL_SECS * MSEC_PER_SEC));
+	mod_timer(&lgr_timer,
+		  jiffies + secs_to_jiffies(LGR_TIMER_INTERVAL_SECS));
 }
 
 /*
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index b713effe057967623f64da8297314fcc42ff1af2..e28c61d39d27c6e89f490e779ff674ba2fe21d3e 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -656,12 +656,12 @@ static void stp_check_leap(void)
 		if (ret < 0)
 			pr_err("failed to set leap second flags\n");
 		/* arm Timer to clear leap second flags */
-		mod_timer(&stp_timer, jiffies + msecs_to_jiffies(14400 * MSEC_PER_SEC));
+		mod_timer(&stp_timer, jiffies + secs_to_jiffies(14400));
 	} else {
 		/* The day the leap second is scheduled for hasn't been reached. Retry
 		 * in one hour.
 		 */
-		mod_timer(&stp_timer, jiffies + msecs_to_jiffies(3600 * MSEC_PER_SEC));
+		mod_timer(&stp_timer, jiffies + secs_to_jiffies(3600));
 	}
 }
 
diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
index 813e5da9a9737e05ec3ef85a495fe38cbb40c49b..99095ff3897c1b5337f7e2abcf10f3fe8219ad7c 100644
--- a/arch/s390/kernel/topology.c
+++ b/arch/s390/kernel/topology.c
@@ -370,7 +370,7 @@ static void set_topology_timer(void)
 	if (atomic_add_unless(&topology_poll, -1, 0))
 		mod_timer(&topology_timer, jiffies + msecs_to_jiffies(100));
 	else
-		mod_timer(&topology_timer, jiffies + msecs_to_jiffies(60 * MSEC_PER_SEC));
+		mod_timer(&topology_timer, jiffies + secs_to_jiffies(60));
 }
 
 void topology_expect_change(void)

-- 
2.34.1


