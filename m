Return-Path: <linuxppc-dev+bounces-3934-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987819EBC99
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 23:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7CR4607Lz3024;
	Wed, 11 Dec 2024 09:03:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=13.77.154.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733868192;
	cv=none; b=EHYCws2+EDoKMoJf/XxUg6gKOT0TwffD4g1JJWezus1ZiXjNO2GbTO6etaXjoJnvYMmkmIv3erpB59kAxSgrHmnXhSP95fbqi0PeEVtXsJBE4mh1Rm0nWrG+NZ1/5SXHaSLyh5HxoIDHyiUKjQep3hghNwtTgMoBreP2AM0l+W6BWVAaIDYQjC8uMiP8mDzeL+rkFbRuiKgkcmUlEw8UiWFfF/axxnW8EKloM3BejKmKhGvE1lGK7RrD8EK4pIb/mj0WQNuSs7B8ufG8muzRJYQTRjsZq4iRmXNCfMXPakY2/RfGZvk4N9xVlTMjZnWOFfwdIR4u1nlzICIdl0z9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733868192; c=relaxed/relaxed;
	bh=p+8g58BSBlt5b8YhFCU18nddw3DZx2oHU0RyK/mdTxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhjJdiJCmBdR0Rh4Yo6pYro811KZ2owGtlHNg35kk56M4qU2Ci4FvNg6/4oFFpQOIE22TiPv2niVrTtfI8C869X21+0uv2C+4E/PsF45HoC0m1bWFa7NN/rMEZUyMlk1ointjmUU5O/k87WGNeq/Fvc7CkpWDY6975YRQq/+Uf61vDoIwuOI2+mS7ZSQlsfC6zBI2RQrsHnRlOkbPTZ9bpxI2AW5r+A22Qpy+mmgFAJQzjPi3ED36JRNtmocU4xwmajtqa6b1cj4gBkqylDpD0X44QQMsQeBL+4MST9E+prZ9x8tb7kNqmNEaFlSxt8wMoLmehQ4ar/fSNlPYQVMlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=D0ztEAtB; dkim-atps=neutral; spf=pass (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.microsoft.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=D0ztEAtB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=eahariha@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7CR06rmVz2yXd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 09:03:08 +1100 (AEDT)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
	by linux.microsoft.com (Postfix) with ESMTPSA id B8E722047229;
	Tue, 10 Dec 2024 14:02:36 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B8E722047229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733868156;
	bh=p+8g58BSBlt5b8YhFCU18nddw3DZx2oHU0RyK/mdTxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D0ztEAtB7CqvQGSZsYp+tRN4xkI1U+Pf0qGPT6ILcEXORWxv5WkL8NhY8sec+1ep2
	 o0YIUC89qlYyBwdj7sp7PypSXEaSKBYajv+HMKS2o/OP0mphIdTsuM5S4VkeWurXmd
	 SYBz6bHa118hfuIgWOgwAoVQLPZwu51P6o2dfTvU=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Tue, 10 Dec 2024 22:02:33 +0000
Subject: [PATCH v3 02/19] coccinelle: misc: Add secs_to_jiffies script
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
Message-Id: <20241210-converge-secs-to-jiffies-v3-2-ddfefd7e9f2a@linux.microsoft.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
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
 Takashi Iwai <tiwai@suse.com>, Louis Peens <louis.peens@corigine.com>, 
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
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This script finds and suggests conversions of timeout patterns that
result in seconds-denominated timeouts to use the new secs_to_jiffies()
API in include/linux/jiffies.h for better readability.

Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 scripts/coccinelle/misc/secs_to_jiffies.cocci | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
new file mode 100644
index 0000000000000000000000000000000000000000..8bbb2884ea5db939c63fd4513cf5ca8c977aa8cb
--- /dev/null
+++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+///
+/// Find usages of:
+/// - msecs_to_jiffies(value*1000)
+/// - msecs_to_jiffies(value*MSEC_PER_SEC)
+///
+// Confidence: High
+// Copyright: (C) 2024 Easwar Hariharan, Microsoft
+// Keywords: secs, seconds, jiffies
+//
+
+virtual patch
+
+@depends on patch@ constant C; @@
+
+- msecs_to_jiffies(C * 1000)
++ secs_to_jiffies(C)
+
+@depends on patch@ constant C; @@
+
+- msecs_to_jiffies(C * MSEC_PER_SEC)
++ secs_to_jiffies(C)

-- 
2.43.0


