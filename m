Return-Path: <linuxppc-dev+bounces-352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0495B79A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 15:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPqt3XKZz2yV6;
	Thu, 22 Aug 2024 23:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.190
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724331984;
	cv=none; b=OSNbYIdkZoQUZ/i0uRtnwTLu7EAKeThCU/OC/D+IGj1VppmOFKyaNDTnOOy102xKdm5Icb6sBKtLFRTfav5Jvm5RcDjVTVVmRi7ej+CePctMxdFqI0l7VMY4z9H1ZY76RymT5yuq8Q274f9xKWJEc4dikcMlBec7F+itK579A9Owm0Ry4mrSeaEktufVgsyah2eSJQaLHwZ+YD/pnLkMaon/foTJ1EMskPK21BPGFWcA7bcjURXbRduFQLHPzqh044ymr1pJwo1dsqVhdpUHavC7kUEi+4jgCo/U4h4CwQtwP/7obRSlrtJj87/k0O0NvAa5elmUBOKLB4s0B8AGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724331984; c=relaxed/relaxed;
	bh=Eeu7F1aKwiNxKPtUl2jqa9/CJTF1mcFydpEFAvmHVuI=;
	h=Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=LBzuc065kPRPJSfQpuqI2Mj92VH2p3ByShH/APwWtt3IXK5YfFoGxjjDYJEnL3qmD/cc/6uIDOJMuPQN2GCHeAPrJXo4+wWLPa7Kvkd59luYpwCHMO4h/Cdh1M169j0Nwh08uTc+0l1WU2hnnk27jB2rEddBM1A+hhm636FrNKONgyYFMbHuwZJBorRX8WjIVeVZKPeYFTAOompvioXnnVXOhD9rL0GAWCQXbsPioIHMb99wCrIulrZYRhJqy/c3yZCo2N58IldLCblxxWYF4me/k6OFt/NNvehUkbyDzQZWlHAiXgbPT/uibCxghQbJ3SNlybRj/nEWgnM9iT2m/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; spf=pass (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqNkS1BJvz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 23:06:23 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WqNcs19KBz20mDD;
	Thu, 22 Aug 2024 21:01:33 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 50D941401F1;
	Thu, 22 Aug 2024 21:06:13 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 22 Aug 2024 21:06:12 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<Liam.Howlett@oracle.com>, <tglx@linutronix.de>, <cuigaosheng1@huawei.com>,
	<bgray@linux.ibm.com>, <joel@jms.id.au>, <bhelgaas@google.com>
CC: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 4/4] powerpc: Remove obsoleted declarations for use_cop and drop_cop
Date: Thu, 22 Aug 2024 21:06:09 +0800
Message-ID: <20240822130609.786431-5-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822130609.786431-1-cuigaosheng1@huawei.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The use_cop() and drop_cop() have been removed since
commit 6ff4d3e96652 ("powerpc: Remove old unused icswx based
coprocessor support"), now they are useless, so remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/include/asm/mmu_context.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index a334a1368848..a157ab513347 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -116,9 +116,6 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 }
 #endif
 
-extern int use_cop(unsigned long acop, struct mm_struct *mm);
-extern void drop_cop(unsigned long acop, struct mm_struct *mm);
-
 #ifdef CONFIG_PPC_BOOK3S_64
 static inline void inc_mm_active_cpus(struct mm_struct *mm)
 {
-- 
2.25.1


