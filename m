Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108732EE9B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:22:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWgd3qjZz3hbZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:22:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HcQ5rHPo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HcQ5rHPo; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWNG1mvhz3dPR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:09:02 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id q204so2233320pfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13/LI6QJ9l5UtYR4jbZJIMmUnJrtQHumj1KYrw7W0CI=;
 b=HcQ5rHPoa9dsaFfRDSWl5mhHtEPXd8Qz7sv0LZY8FtCipBq7rRpLOqMVNLdCS4cl5r
 EqapcsCVUXi5fbXcotEoDay4OYPwhlxIdR2kSDiyWX3cYzAsUIpbluQVfyRT0rYnGE3F
 RMJRtUQGUaYzw1Fv/VyZlpB8SrFbvPAI46SeV8RfJ0zw+UzR3MsqkU5cMY/XjiZ6+oYu
 iMBzoZqbGq/64riAKAxd4NXTg1RKLf7ZsphFIoPpZ+s+tgzOpNEzYKouQoFch/vomxw5
 gSJLPZJ6/Qa0HKHhQIQJrduvfq3pVFedkTqILFByJxgkMGAbL0EG2ioMuSuJZ/4/QDIE
 QsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13/LI6QJ9l5UtYR4jbZJIMmUnJrtQHumj1KYrw7W0CI=;
 b=H3LjD34K/8UI2Nf9wG52HyiDm32dGYuSin1EqIvhrBOqYY4gD4IT2G5jQ0WbCJn3iA
 xGIr1YYwG/REvOQ/wRqw0oqYBfZrbTW716kBBiW02s34kRL2QkN5nooyMyXRszmnVVJb
 Y6LoxOmDW3zml/ISpFHskPemOJj3iuu+NUOaz/riYNncShVfLRMrHp6HAj8OY0hpeM6f
 380zE5xn/8dh8c/HZPtVL92DIfDQ2FqwArQiZhLfB2cHObyPuOkHL57WVB3zGx3ffa2O
 IE22gEVOQX5fGPTx46jLT2teB8hdWxIrbVX/MwJFscT5uhI4gXcOKW/g0L9agqap6xWr
 R0Wg==
X-Gm-Message-State: AOAM532+Vho9rJcmpaVLxlkeXpqNJQjA9F1ifK2fl7kXlrzAorF+Lpl+
 XfpvhivbgfJyTgZYbrdjS2A=
X-Google-Smtp-Source: ABdhPJwDErNNhVln7WdJYJ736K6EN62eaFZPypbMoyWrVhFK1+XYvOrZv1RhJU1htu6rtEYz4pmJJw==
X-Received: by 2002:a63:465d:: with SMTP id v29mr8923837pgk.225.1614956940349; 
 Fri, 05 Mar 2021 07:09:00 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:08:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 36/41] KVM: PPC: Book3S HV P9: Allow all P9 processors to
 enable nested HV
Date: Sat,  6 Mar 2021 01:06:33 +1000
Message-Id: <20210305150638.2675513-37-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All radix guests go via the P9 path now, so there is no need to limit
nested HV to processors that support "mixed mode" MMU. Remove the
restriction.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 928ed8180d9d..5debe7652928 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5393,7 +5393,7 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 {
 	if (!nested)
 		return -EPERM;
-	if (!cpu_has_feature(CPU_FTR_ARCH_300) || no_mixing_hpt_and_radix)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
-- 
2.23.0

