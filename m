Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DFE4DFFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:18:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRm01w31zDqF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:18:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="k6O4+58o"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRH83683zDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:36 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g4so2372951plb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wfxe6XFnwScTeykr718WFM8qQvCgvpsUVCVzY509yhY=;
 b=k6O4+58oCaQAVv2mrBJQH1BuqES+9Fgt2xbKgeBsQ1csGiQlVbqRE79WOtzlcFWKzf
 ij+7DWc5arMvlM97QgHfEEIgCyps5ZXE4dx3W/tKCbvKIJJDGvZ6Unhyd2TAK44FKnfU
 MVsYIE4Qy0mYjWL9fuTBgT8sNmvPE0m/PMO8C7gQBwuDgZG5CZfWW7JNBo5kFbucX1ee
 OG9VKMK/5HPdGV7DOMtA/L3jSr2ie2i8cymllgZ8Vb2t5GUXeQsruqXhAhLDGLd8MWjV
 vjbz8qBfmN4exKCfyoLqiIyM+X6NLIdKTq5QuuYma+yhjmQhvpNJkuTvjwTfgM0h50QF
 0OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wfxe6XFnwScTeykr718WFM8qQvCgvpsUVCVzY509yhY=;
 b=Aofiup0KgNi6DTo/Sa+7RycQ/JtCz3jgTzJOscJA6BOC8KclFOLgz+ehMaVvvrd0Dt
 ATh+Zi3hWmQlY9me3uklC9kFLJWznNrisaArb9fDIc/uB6CUz0k3T1tJnN/Td6mJ1rcr
 x4Ci0RnrzSgYa2mSgTJ4EG6T4dLgFliW5R5dSr+Tgl8rvgMfolmKc6nBZyj/oIEVyaIF
 IQ2mzoTJve8n/Ga/nrDKSslmXhpAWfQ8Xtuvo06Lp2ybps2STwU9uS+770JbW50rNvSE
 IDMcnuWsuIr9IChFeG00gjPB7CiYy3IgYN94maGqvfIh8TYnc0xuaJqqCn7ldSE6+f6H
 a9OQ==
X-Gm-Message-State: APjAAAVfPWoIKiLK23U99jlqZt2PlXpL+TDijAncu9FXRCJi5qcY0x0O
 VaIdtme1n42TjIxAvgriLn7LoRBXeTK1gg==
X-Google-Smtp-Source: APXvYqw8sm1irr/AVt490259FjHYRzE+YYcUeYxCWgOso2qMvS6DzcJbkjAyX5cRDfnq5NsVRer7AQ==
X-Received: by 2002:a17:902:1129:: with SMTP id
 d38mr18419779pla.220.1561092994550; 
 Thu, 20 Jun 2019 21:56:34 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:34 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 10/13] powerpc/mce: Enable MCE notifiers in external modules
Date: Fri, 21 Jun 2019 10:25:52 +0530
Message-Id: <b1fda5be895ecda99f4cda9105009bb0a5ca1289.1561020760.git.santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561020760.git.santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Reza Arbab <arbab@linux.ibm.com>

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ++++++
 arch/powerpc/kernel/mce.c            | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c83e38a403fd..311f1392a2ec 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -458,6 +458,12 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 
+	/* Notifiers may be in a module, so enable virtual addressing. */
+	mfmsr	r11
+	ori	r11,r11,MSR_IR
+	ori	r11,r11,MSR_DR
+	mtmsr	r11
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_notify
 	ld	r11,RESULT(r1)
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 9cb5a731377b..413f7866a9c4 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -50,11 +50,13 @@ int mce_register_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_register(&mce_notifier_list, nb);
 }
+EXPORT_SYMBOL_GPL(mce_register_notifier);
 
 int mce_unregister_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
 }
+EXPORT_SYMBOL_GPL(mce_unregister_notifier);
 
 static int check_memcpy_mcsafe(struct notifier_block *nb, unsigned long val,
 			       void *data)
-- 
2.20.1

