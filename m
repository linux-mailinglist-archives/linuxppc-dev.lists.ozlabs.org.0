Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FB55DF42
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:03:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dtry3rTMzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oNfu9RAN"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthQ6qhKzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:55:50 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id i189so818438pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPpgYhewlwO9TqQ03LrhR75ijbMW8NzdnCXiXDw1zFM=;
 b=oNfu9RANClref1zwoifvawkpD1QUwFyjty5bv0ZhjcSc4ZhldOipgiG8x4HmUAKDfJ
 Kvk2WrzKTLmZdCtvvGp5Xom6/KRN5M+HtBveAULN1W1dkdFj8XcTYF2Rg6XVdbR8LZwK
 gyin7y3a42fFHl5XssbKSgZ5YbI0u8KxEFV+FRfTc+iRYj/SP6t+ta/+ue4pTKkKnwe/
 Wvpxukz2jUPSZmy+bWfvHd3u4WyLKBX3JOgDHR4POxpZsztk6/5KnVfbceFedB9u1qfc
 Fo0O7KCoaT5EB68vIgTMN0FF31r51YZXzgTC31nCFlF8lo3oIXQm1CUnN84IW9nfmaC4
 vQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPpgYhewlwO9TqQ03LrhR75ijbMW8NzdnCXiXDw1zFM=;
 b=fyHrNl2kBIJfk3JzsyfzwV6yZxcugEJtyMHy8mmyCF1fch8NN52vVYybLJVYs4VB5Y
 23Y6YYTSW80zdElQWXgFcAdqpsj7QPtJeY7/QKUF7KUpRNwYDYKbSdOWQAS5+Q4XsZ3y
 Fo2Exp2G3TQMGI6xk/sIucIIKCAS1lCriKmVipa00XFnrFQRX4GbfZ+e9Jpwmk7QRbPw
 jrZYJZT0R6PeFgQr+PgrA2QIsFEX0vJKE/mjpjN3O5aQ7v4FJLonItUUcSi2iQJh4Q/i
 f2Z323jSQNAuvDsDpYXZjUKKb1Bbis/NGNpgYAUPet5d+kUhekQM4y+po1yBigjfTQm0
 8sgQ==
X-Gm-Message-State: APjAAAXDWonzBVKic0JZeZgpvhpvKT8DtRfwxFr2pXz7i2t6EBM3tzsg
 elbhDnQuZojd4DClgKYUpdb4MOeh
X-Google-Smtp-Source: APXvYqykorMscgBepd0vmoooiolQR9vmHBQiq4weINk15qvZXoCymL8qaW+VutKrV+cbWuGdyBz7SQ==
X-Received: by 2002:a63:788a:: with SMTP id
 t132mr17944842pgc.332.1562140548164; 
 Wed, 03 Jul 2019 00:55:48 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.55.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:55:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/14] powerpc/64s/exception: machine check fix KVM guest test
Date: Wed,  3 Jul 2019 17:54:33 +1000
Message-Id: <20190703075444.19005-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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
index e8734a1dfdb9..5789a00691f9 100644
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
2.20.1

