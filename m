Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D6A19D7BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:38:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v1GS1HwdzDrft
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 00:38:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N3NiZr4L; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v11P4C2hzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 00:26:49 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id k5so3522870pga.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtY2WfL1JPGj+fO1hNVGxKtL2inTNkP2M7UMo8aWaBA=;
 b=N3NiZr4Lh+295bJELGlWwGrV2SFvUXrUI+ZUo8vGQ+XGx7vtbu4QKgbMCOIVzAjpcb
 DXPHSsDMF4aQp0/WuDVagnECNZKQQjY9NqqcQ6eCPolrJ5UUB0dbkuuKIpZ6NZMwrQn5
 7KIigdzbFrK9Lj8t1MA90KD+p/ec2KPCh1nUJWO9nMtB3OYSSaaDqggT0uw186UZcAx1
 Azi9C2mxz2/xig6EsKAKvNlfhAWQFPl1DjiCnHRo5SRmiw58ZixwfpsezYHRNldzDaH8
 hw6XaguW1sVsG+QgQcfo/Zw4Y9N0y1Cb/RHGlX2Ce1sCIAfPpU58Llqp44ieXOBFzfyV
 PrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtY2WfL1JPGj+fO1hNVGxKtL2inTNkP2M7UMo8aWaBA=;
 b=hqCEccrBwj3o2deOrOE8PUawT97c2641oZvlCX9VMonjnlL0EWqpgpyM1QMXXqIsQb
 f/mSBtNu5swqi2hjBh9KY9RlE8w+Jhh6zmPjDdyHIuVDY08IilFaZ0F+Jpw848PFeBxW
 IEmSFHpv7fNJDyku8E0Cr1Uqx1u/h+gvAM/8CB0T4ds5R2kHiiNVpNqg2imafZgl1kL5
 uCWYQWNPOF2bhafZrV472zSCkOaurGIqOc15pBtKE+LYihkJP1i2wTRjWKnvHn9k2tR6
 TY/fYinv72nluS2pOAAHx37cGdtbATY0wG9PxIaYfqTPi+Y8+WM154a31tH0z6nDYGAN
 pXqQ==
X-Gm-Message-State: AGi0PuaCfjbVIhrW9PF5rComuwGt792fiEyWWEAmlrGgipzcmDiHZCIq
 WW0jplUyzXra/hM0A9V8021RkUdn
X-Google-Smtp-Source: APiQypKFB721jHBVK3dNdp7m72x86a02+Dudb/+MzdxcDkqp+w4zH0tEv0Dtrn5yySXwneZhd5rtdQ==
X-Received: by 2002:a62:7bca:: with SMTP id w193mr8727746pfc.319.1585920407296; 
 Fri, 03 Apr 2020 06:26:47 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o65sm5941422pfg.187.2020.04.03.06.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:26:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/14] powerpc/64s/exceptions: Fix in_mce accounting in
 unrecoverable path
Date: Fri,  3 Apr 2020 23:26:10 +1000
Message-Id: <20200403132622.130394-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200403132622.130394-1-npiggin@gmail.com>
References: <20200403132622.130394-1-npiggin@gmail.com>
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
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index bbf3109c5cba..3322000316ab 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1267,6 +1267,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	andc	r10,r10,r3
 	mtmsrd	r10
 
+	lhz	r12,PACA_IN_MCE(r13)
+	subi	r12,r12,1
+	sth	r12,PACA_IN_MCE(r13)
+
 	/* Invoke machine_check_exception to print MCE event and panic. */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
-- 
2.23.0

