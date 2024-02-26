Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D23867079
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:19:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gN/fvoCY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxRj2zyyz3vZN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:19:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gN/fvoCY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJh2Dd4z3dVb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:08 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e48eef8be5so1841726b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942386; x=1709547186; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jAuqrxMcZW4wl23iP7z8CzJrLIJVN3gCB9fphF+waQ=;
        b=gN/fvoCYLmpj6xkJHvd2L3XLeqtkF/JqO89lustaiMPpkLlr0SS+kxsRcLOHNhY9U4
         dW9kbLFompmXb7/1n8OVoShZjc0hBeN0GQTHfzPphNetuvY8nOAWMDyy2xIwXefNISbQ
         Q7wAwoXXUadCkdWt8FNlU8VgIrV6U3u8jfTrdCZpqxlb0DRchbXsyYMNXJusSohHd2D7
         lXOf/KG6JtWmGlZaconJP9Fdqf6CjbmLJA3K4ISCgxi2XoAbrgC9WkbAgQpHa5utBH40
         HZrdhmn6SGO76eQoNtbXZgB9o14Kj+GPezCA7qIPfPeNYqBcXd5o1SHMQehdsm/xIORr
         KkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942386; x=1709547186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jAuqrxMcZW4wl23iP7z8CzJrLIJVN3gCB9fphF+waQ=;
        b=dOO0xjJNdMmsN8x+tGLTc0e1V3dzTxDSPB/TywT9WJAQ3MlxykMrnkrtsTp+2TcFCs
         9QT6R0j+Wtf8tPS1FnbMIFHmnUa3I8wb2fDYj/JrnxglqCSr2xFSsyZMIqJgKp5u5Yc1
         8i9b7RzNaTJ5S9FZWQltBraLNB+4T5m+COdnqR/naVCygeF7K1Tf7c9W6r9CHwPR2ajS
         7n1m73of+eZf9gtGy2tKdflFh/UI19OIm5+8cR3E/has5R5BFLBS6iYhvp9NVdHEhGoT
         vEa9OYlumyYOQzAfVuPJv27CNBLgY0NnrlNnF2UuGjcz/pMDTqzNjcYQdDVqGahyIn3D
         VqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY82AGaIsGaflOvX31uzkhFcHcxuwTUP11C5RmJv5Oh1DcNVI4GcR+Bn5XxS/BVAt2qLl6PNdxexK5xasNUsGi5xV3tLiKGNuhpMR8Mg==
X-Gm-Message-State: AOJu0Yxkf2i4iU6a4FP6s1GLXfj8hCSgQ2QJOsGkEcpUlrHk80m79NtD
	NVf1RGZQFtgI3NW+n1FKNvcrWzrTISzrl77La5qzAaMsf1vlaEwR
X-Google-Smtp-Source: AGHT+IFx6C3wv07L2DjnRHJQeATNcvuoKZUoZcB0ZDNHuzcUbtvukPfSOqP0fRfztgkY099c8H1quw==
X-Received: by 2002:a05:6a00:1817:b0:6e4:ea94:3625 with SMTP id y23-20020a056a00181700b006e4ea943625mr8337098pfa.13.1708942386575;
        Mon, 26 Feb 2024 02:13:06 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 08/32] powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
Date: Mon, 26 Feb 2024 20:11:54 +1000
Message-ID: <20240226101218.1472843-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Storing certain values in MMCR0 can cause PMU interrupts when msleep
enables MSR[EE], and this crashes the test. Freeze the PMU counters
and clear any PMU exception before calling msleep.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/reg.h |  4 ++++
 powerpc/sprs.c        | 17 +++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index 1f991288e..c80b32059 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -24,6 +24,10 @@
 #define   PVR_VER_POWER10	UL(0x00800000)
 #define SPR_HSRR0	0x13a
 #define SPR_HSRR1	0x13b
+#define SPR_MMCR0	0x31b
+#define   MMCR0_FC		UL(0x80000000)
+#define   MMCR0_PMAE		UL(0x04000000)
+#define   MMCR0_PMAO		UL(0x00000080)
 
 /* Machine State Register definitions: */
 #define MSR_EE_BIT	15			/* External Interrupts Enable */
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 44edd0d7b..cb1d6c980 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -476,12 +476,7 @@ static void set_sprs(uint64_t val)
 			continue;
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
-		if (!strcmp(sprs[i].name, "MMCR0")) {
-			/* XXX: could use a comment or better abstraction! */
-			__mtspr(i, (val & 0xfffffffffbab3fffULL) | 0xfa0b2070);
-		} else {
-			__mtspr(i, val);
-		}
+		__mtspr(i, val);
 	}
 }
 
@@ -538,6 +533,16 @@ int main(int argc, char **argv)
 		if (sprs[895].name)
 			before[895] = mfspr(895);
 	} else {
+		/*
+		 * msleep will enable MSR[EE] and take a decrementer
+		 * interrupt. Must account for changed registers and
+		 * prevent taking unhandled interrupts.
+		 */
+		/* Prevent PMU interrupt */
+		mtspr(SPR_MMCR0, (mfspr(SPR_MMCR0) | MMCR0_FC) &
+					~(MMCR0_PMAO | MMCR0_PMAE));
+		before[SPR_MMCR0] = mfspr(SPR_MMCR0);
+		before[779] = mfspr(SPR_MMCR0);
 		msleep(2000);
 
 		/* Reload regs changed by dec interrupt */
-- 
2.42.0

