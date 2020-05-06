Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 388311C66BB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 06:22:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H3ND3pPGzDrMK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 14:22:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fGKb509s; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H2by5r43zDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 13:47:42 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id y6so206265pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x/1UahqPf2Rz6S7wLSNU9qiKXpiX/9Y6AhsC8mYdMyk=;
 b=fGKb509s0lFuppJvzcDuhsFtGlMP2YzD9r8Nn83vpfwtrbuMKgzfX/gZIhn1IcQl77
 h0ZqIgvVJn+3fpxcd6/uYeIkvllCWKvhpes2Qxy5kVJ305eGANcHxq7RGVfjIj0K0rZ4
 9TzKKZuUM2+9UdLaq0bJ0VKLy3a1+BLlGm+qZqRBY9j+ky1O/t4RivyFJdnhbpX2PwEo
 fgZcK/3fclDDfuoS7ahGK2r0ez8FbEiTTQbuaHE+5K+YKyfeHpml1E9l3PLTV88YPQFi
 vhod1iIz9FD62e5fCcU8pxJcou8kA+YIabWlSs2BWawC73iI3gxUKP4/ks8weouk0QFc
 BBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x/1UahqPf2Rz6S7wLSNU9qiKXpiX/9Y6AhsC8mYdMyk=;
 b=NoL/WnQ8pLjfN0QujoiIRmLmU+UERQNRbVjMkx8T8iEN8CGkZrY+piZ1fc5l+wkm20
 0ARc0EwaQrNkjMeGxVCuzhaRL8tcrME6h+7WiZ9vau2sIBReZJLar+jaBAe67Ud9Go3a
 NoI+W6GKHhcKK4C5v1wmxDhePwot0OHES8/ApvoHsDlMvd8RSr7XEliTr0CGlISIoW64
 9mXAeu6jJ9N9d3mlyBWjjcpjTUBAlpJpUFBZz5i7iz99kJVWNRBRZa1IKqrBF9T9k3Bz
 n4lLvOApQBHZwMAKEezMK97bcK7P9ng7p+HEDAF6VfqwjXelidPxo8U+mDvLAEU6rMy0
 yRtg==
X-Gm-Message-State: AGi0PuZV+IjH8u05P94nB+53zumAd/yrd8FFUYwzgr5rhYjVqvk03ZEY
 I9QUrwIU1DeTorT3hXx2gwi1ntWwOPUN+Q==
X-Google-Smtp-Source: APiQypK5vLKc04sg8pWKL8JiNRD6cvoRbtS08glao7VLNd13p1RQj7yeRNtHXmlggs64mO3JvBlkQQ==
X-Received: by 2002:a17:90a:3568:: with SMTP id
 q95mr6803431pjb.47.1588736858089; 
 Tue, 05 May 2020 20:47:38 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id k4sm465676pgg.88.2020.05.05.20.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 20:47:37 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 21/30] powerpc: Enable Prefixed Instructions
Date: Wed,  6 May 2020 13:40:41 +1000
Message-Id: <20200506034050.24806-22-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506034050.24806-1-jniethe5@gmail.com>
References: <20200506034050.24806-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alistair Popple <alistair@popple.id.au>

Prefix instructions have their own FSCR bit which needs to enabled via
a CPU feature. The kernel will save the FSCR for problem state but it
needs to be enabled initially.

If prefixed instructions are made unavailable by the [H]FSCR, attempting
to use them will cause a facility unavailable exception. Add "PREFIX" to
the facility_strings[].

Currently there are no prefixed instructions that are actually emulated
by emulate_instruction() within facility_unavailable_exception().
However, when caused by a prefixed instructions the SRR1 PREFIXED bit is
set. Prepare for dealing with emulated prefixed instructions by checking
for this bit.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Alistair Popple <alistair@popple.id.au>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v4:
    - Squash "Check for prefixed instructions in
      facility_unavailable_exception()" here
    - Remove dt parts for now
---
 arch/powerpc/include/asm/reg.h | 3 +++
 arch/powerpc/kernel/traps.c    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index da5cab038e25..773f76402392 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -397,6 +397,7 @@
 #define SPRN_RWMR	0x375	/* Region-Weighting Mode Register */
 
 /* HFSCR and FSCR bit numbers are the same */
+#define FSCR_PREFIX_LG	13	/* Enable Prefix Instructions */
 #define FSCR_SCV_LG	12	/* Enable System Call Vectored */
 #define FSCR_MSGP_LG	10	/* Enable MSGP */
 #define FSCR_TAR_LG	8	/* Enable Target Address Register */
@@ -408,11 +409,13 @@
 #define FSCR_VECVSX_LG	1	/* Enable VMX/VSX  */
 #define FSCR_FP_LG	0	/* Enable Floating Point */
 #define SPRN_FSCR	0x099	/* Facility Status & Control Register */
+#define   FSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   FSCR_SCV	__MASK(FSCR_SCV_LG)
 #define   FSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   FSCR_EBB	__MASK(FSCR_EBB_LG)
 #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
 #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
+#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
 #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3fca22276bb1..493a3fa0ac1a 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1720,6 +1720,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
 		[FSCR_TAR_LG] = "TAR",
 		[FSCR_MSGP_LG] = "MSGP",
 		[FSCR_SCV_LG] = "SCV",
+		[FSCR_PREFIX_LG] = "PREFIX",
 	};
 	char *facility = "unknown";
 	u64 value;
-- 
2.17.1

