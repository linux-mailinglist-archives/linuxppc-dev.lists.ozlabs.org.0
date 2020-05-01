Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC661C0D64
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:26:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzjT74xrzDrNw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sGIbvD0I; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cysx1rFHzDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:49:08 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id y6so1860835pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x/1UahqPf2Rz6S7wLSNU9qiKXpiX/9Y6AhsC8mYdMyk=;
 b=sGIbvD0IYLP922OrH+7+Euwwa6XmwDsPB4x69AM02wjlNVqLohMppDqkNHZ0EuO9ZL
 UwXjC3wDUWMnY/03LZu0KKJUltF7z0KY2L30t4DZsH7KhlYpNoLCxtUQhOBvd8HsT+VH
 drHuSarwgNqG90S1xMHH0OaZsDIoOYN+bh3pmKJiL7FcwhFrLHItG0IzqOEZz8qr1PEt
 r6raw/nRH/XmeMFN5ygYMbKTmO/wIQ1mfcopNKumfyzZvLpK3xQDiWBsppwuiONYzf/M
 ylm/Fr6BhuV6jczZQ3/zJurhCEW58rIVupfy2ZbnyOIfoWAyzHHIyM2J2SDAnFCHRRMC
 Gyyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x/1UahqPf2Rz6S7wLSNU9qiKXpiX/9Y6AhsC8mYdMyk=;
 b=tIxR66g2z2Vyr9ahJrcyYupuAJlevP1gkV80pzKRf5yBLs/BtB/QgH/PIY9Y0NFKIl
 hK7Z6k0CSrpRtzvkeMfaBwO9En5m8HnnGIe5fhxKPymrypnh+1fNLWK6kjJOVB9F1+9n
 rjhzc+GuiNkdhcC0tXoPqBl+lxXUTKeUtnDCr5Fn2nEAoxiJHZhNvOndHjgT5mZEFBKH
 qTcv7/8mdbTY/xUVEG8Ud2wsDIAzhatRiElbX7pej9vF72b4FYhhIiBEU0ZEbMEFesm9
 wAITjlKUoGSOq/46yt5SKiXlfhnbfjBn/fyryiS7viFg0amOovEdhtEL1nvHHUTBrJr0
 veuw==
X-Gm-Message-State: AGi0PubyS5xQ7ZlfMeTiYFol39o4BBIJYHCHFSq8GVNXqRZ6tioso6Ot
 Lh2JRdJ+XgiJGsGH/kpRzZONzsH8da8MNw==
X-Google-Smtp-Source: APiQypJzl3gP77PIbD9/FF1UMGx9JTrk8tpV6tSU+TL8NHUkbr4905EudUx2APXDxJYWtFsFZOcE1A==
X-Received: by 2002:a17:902:7809:: with SMTP id
 p9mr2464592pll.190.1588304946183; 
 Thu, 30 Apr 2020 20:49:06 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:49:05 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 21/28] powerpc: Enable Prefixed Instructions
Date: Fri,  1 May 2020 13:42:13 +1000
Message-Id: <20200501034220.8982-22-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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

