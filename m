Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FB7F5C5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:08:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PY75MvGzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:08:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d2fKJmyf"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PLt24tPzDqxH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 20:59:50 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id f5so27076233pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R2NF6P17PKz3upjs1/CZJw05PPuqz6k3ABhSgMlkQRo=;
 b=d2fKJmyfU2FJax+QoPbp8a2zg/YpxT5bzMJv/tRJaaZybrStWifNifJsYehvZoYUmC
 OiR8ciUThc7inSn7BCQZkTQFzp43VaF8G61QZHIzGa7jdfXJvRWC898OyYMF5Dfr1M0g
 KEDgTntMNdC5ZoPf8r7cJ559IjIEewKxNqAsNmeES1QovGW5pIhYBuyWIGVcDBTu/xnV
 rAoxFHIw+lDAtQ0jFwrP5NFq4mj0XZmc4w9bgAYpDaiHrTQUzwodbm/nz+Cf6QkYnA/k
 It22nsZEKwcHz8WCGHnlpzsZ+BaSvPw1Ijk3jcztgdfp8RCgnt3fIgUKO/h29PZMz6x5
 nSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R2NF6P17PKz3upjs1/CZJw05PPuqz6k3ABhSgMlkQRo=;
 b=oFuaSP/Tdmd9P2YQHTNPzYUpwheu05lYrRS9tzwDN+1BwYuczIy8yfIOdUg3tIAEWO
 q4y+FOoZhKvoh0Qn8Y9+OWKYZKPlntmwdvndBsAKMYgJ1Pocsqb01JKyr0pOWFG4rtCH
 32i69iY0fikGMmM9O3SAdwYX9KCUJC+O6ZG5MutCht+miMA9CoLE8OPrjtvtY3Dvahi8
 RzKcn/TcecW0+AlNBrqr1t6xRxH5V1hf00lTUNBTt3O7YaIh50jr/DSuLYSCXX//OZCj
 MgvD47YYuFZtl1rRm36jl/HEzOU7c8WNvfIpSM4QnAGHtxduQzQBbUzO39UA9Oj+84yK
 Jkkw==
X-Gm-Message-State: APjAAAV79TJYft5+Pmbe8IzukLgKwncMskv6VvJ9qeO0v7PJC/pKj2q6
 Rk2uIDRlexEZEsXHhA/sWHiN5CJ0Kdg=
X-Google-Smtp-Source: APXvYqz4WshzU7VbNj/PPLZG41pbQ1m+H8giRhKspx7QC92VZLml+XO2p8tIlIxg/Wr5Ftt1yj+vmw==
X-Received: by 2002:aa7:8a92:: with SMTP id a18mr59882309pfc.216.1564743588353; 
 Fri, 02 Aug 2019 03:59:48 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/44] powerpc/64s/exception: machine check fix KVM guest
 test
Date: Fri,  2 Aug 2019 20:56:28 +1000
Message-Id: <20190802105709.27696-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The machine_check_handle_early hypervisor guest test is skipped if
!HVMODE or MSR[HV]=0, which is wrong for PR or nested hypervisors
that could be running a guest in this state.

Test HSTATE_IN_GUEST up front and use that to branch out to the KVM
handler, then MSR[PR] alone can test for this kernel's userspace.
This matches all other interrupt handling.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 33 +++++++++++-----------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6d8d21fa935f..e00cffb25517 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1108,11 +1108,8 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
-BEGIN_FTR_SECTION
-	b	4f
-END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 
-#ifdef	CONFIG_PPC_P7_NAP
+#ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
 	 * of the following is true:
@@ -1128,30 +1125,26 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 #endif
 
-	/*
-	 * Check if we are coming from hypervisor userspace. If yes then we
-	 * continue in host kernel in V mode to deliver the MC event.
-	 */
-	rldicl.	r11,r12,4,63		/* See if MC hit while in HV mode. */
-	beq	5f
-4:	andi.	r11,r12,MSR_PR		/* See if coming from user. */
-	bne	9f			/* continue in V mode if we are. */
-
-5:
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-BEGIN_FTR_SECTION
 	/*
-	 * We are coming from kernel context. Check if we are coming from
-	 * guest. if yes, then we can continue. We will fall through
-	 * do_kvm_200->kvmppc_interrupt to deliver the MC event to guest.
+	 * Check if we are coming from guest. If yes, then run the normal
+	 * exception handler which will take the do_kvm_200->kvmppc_interrupt
+	 * branch to deliver the MC event to guest.
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
 	cmpwi	r11,0			/* Check if coming from guest */
 	bne	9f			/* continue if we are. */
-END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 #endif
+
+	/*
+	 * Check if we are coming from userspace. If yes, then run the normal
+	 * exception handler which will deliver the MC event to this kernel.
+	 */
+	andi.	r11,r12,MSR_PR		/* See if coming from user. */
+	bne	9f			/* continue in V mode if we are. */
+
 	/*
-	 * At this point we are not sure about what context we come from.
+	 * At this point we are coming from kernel context.
 	 * Queue up the MCE event and return from the interrupt.
 	 * But before that, check if this is an un-recoverable exception.
 	 * If yes, then stay on emergency stack and panic.
-- 
2.22.0

