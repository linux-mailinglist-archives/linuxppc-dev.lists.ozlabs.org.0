Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21C73FDF9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 18:19:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H08Pv4LDfz2yb3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 02:18:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WNxhuzCC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WNxhuzCC; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H08PD5rrtz2xh1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 02:18:23 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id q21so1807944plq.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R1KAvDybghA49rnK1KgFcFNqnqba7IMOtASvqepVLCE=;
 b=WNxhuzCCewaDEs4zji4k6vdkah/Pd2laLAC3tLzqBD0NyqY16vBjjxaBKP8A8U7cTs
 VioelpDQssUC2oMidW80be6+OKBcHSYnfIj5Fb5Wc+ZyUlWnTneOwd470ddUuF8sm7lI
 mK+IzSkY40gIl53YaHL003/6+c3/sb6fixBod5Vb1hQ5G74vE2n1Kt4kwNDQ7SVFf55X
 5SwSYObB+qAbanXq0LrjhiVdKDWGRqbFp3HZoz4cZw7M/g7dvTgMfuA48jU3imEMUe4h
 oPhSrUVmCF2NnZTqMj+Z371T8HFoYZ2dFEuA9b9MBLB7KKsu+4waCACHQT8gcIP/lxen
 Dr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R1KAvDybghA49rnK1KgFcFNqnqba7IMOtASvqepVLCE=;
 b=bhpdNApE8GtaZE99Td+Q/lzs0OgRymqo89CYp5Bs/b71fCeTUAIl0H9ikqsTPDkUH3
 QoNSFfdROPBg/k8cJIMPnUcBvs9znxq+JwDbF6erivrnsRqVQ+GNjmrbFUkqucSJD1b/
 PbJkivMqGys/tSIhBwUKHy/tQ++eFHfv30BEqD5hqWHRr3f3JMfc7dVMt/lYMTloqknN
 Bkg4vqP7BtS9i6uFnK0q/XhgNp9X0Z8/3cCmiH9r5rj9lC8Lhz0sB8lEdMSJ40mc9BJi
 RAfJ7b8M+OszNDVW1el3z02wLzZ6D3n5Ouv/07jkPL35rgokeonNKc8rxFO2AnrpaNln
 4qFA==
X-Gm-Message-State: AOAM532t1rObGMoIYsst1G+3vxE0Nk2HoLJSQfRXu1PLaDUrfCjGMder
 hzwKoQ4BGgHc+/3fTv5eb9JZJOCLxYs=
X-Google-Smtp-Source: ABdhPJw2jvtUWwVH6/H9DD7zyVE223+HfdX7p7wfBVNmn6myWhuDB3Q9+j3dtKbIvOeTweRjcs3p9Q==
X-Received: by 2002:a17:903:143:b0:138:e2f9:7211 with SMTP id
 r3-20020a170903014300b00138e2f97211mr264840plc.30.1630513100103; 
 Wed, 01 Sep 2021 09:18:20 -0700 (PDT)
Received: from bobo.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id d7sm155261pgu.78.2021.09.01.09.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:18:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/2] powerpc/64s: system call scv tabort fix for corrupt
 irq soft-mask state
Date: Thu,  2 Sep 2021 02:18:09 +1000
Message-Id: <20210901161810.1411015-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Eirik Fuller <efuller@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a system call is made with a transaction active, the kernel
immediately aborts it and returns. scv system calls disable irqs even
earlier in their interrupt handler, and tabort_syscall does not fix this
up.

This can result in irq soft-mask state being messed up on the next
kernel entry, and crashing at BUG_ON(arch_irq_disabled_regs(regs)) in
the kernel exit handlers, or possibly worse.

Fix this by having tabort_syscall setting irq soft-mask back to enabled.

Reported-by: Eirik Fuller <efuller@redhat.com>
Fixes: 7fa95f9adaee7 ("powerpc/64s: system call support for scv/rfscv instructions")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index d4212d2ff0b5..44f99df36fb2 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -438,6 +438,10 @@ _ASM_NOKPROBE_SYMBOL(tabort_syscall)
 	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
 	TABORT(R9)
 
+	/* scv has disabled irqs so must re-enable. sc just remains enabled */
+	li	r9,IRQS_ENABLED
+	stb	r9,PACAIRQSOFTMASK(r13)
+
 	/*
 	 * Return directly to userspace. We have corrupted user register state,
 	 * but userspace will never see that register state. Execution will
-- 
2.23.0

