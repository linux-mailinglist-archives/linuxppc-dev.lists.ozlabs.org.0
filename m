Return-Path: <linuxppc-dev+bounces-2503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE60E9AC9F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 14:22:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYSqh49MFz2yMD;
	Wed, 23 Oct 2024 23:22:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729686176;
	cv=none; b=GkqFI0V9/oqUtqc4OM6oun5+WCIz3LddguAywAHlIYP0OsljPPS66hYEuLG+ndTD0BGyzURcCT4EbY4YSsTRbbTwzxWXuBQ7OGGgpoQP/pilxqlJwLQfFaSOAq5AqeMDqRcdW+j32jzVjdMb1An279SVV8jyZskk4pnN4CC6htcETSRRZJ7VQc4EQxbbCto7Llsb2nTouMDTuDUoJ0RHLueiGIKs4cBMq4X+1+ga9XVM0rGid2G9zO9MjPFsXpOSTl+wbTEcHSBlF4ziOW7MawFW2k+xYqY7LDmjAGq9LknISY+DC6MEUqsYo+j2/piD+1qtKYOq6N7C7r+tpzSH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729686176; c=relaxed/relaxed;
	bh=OVEgOjS7IZfalfaetPcE+o4eLxAgXAQMLvzv6FrjZQI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O1k2WqZ6S2Zh/AirRfyY+sctsik3gEuaAISzbghsNY96yVSiR2ii3/zP5ljwj4dF9AdxDwZMaQd3Jqj3pMs4abTQs19A46hNaHcnYJA5DxTHYRm98oiC8faLOS+Oo0LCZq3R7ZObdQHruHLuZzOk9z9OZsnqr2x27OvB1i46GWoe+rbEi/4I6uLZp6mhObOEAm2o/5JjW7Cms3O9VI7NtPkxC+ahzV/GgmXkNYCkFNfgGMdbGq4dd4cO1zpM+Vp15/dtN7SSoZT5TSHwQjDKu8SIQ7zP8STG+ma99U1U2Wfhj3JODiy1jG34zClnxTymAf5IRfoWhaphKhbFcVdKjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass (client-ip=111.22.67.135; helo=cmccmta1.chinamobile.com; envelope-from=liujing@cmss.chinamobile.com; receiver=lists.ozlabs.org) smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cmss.chinamobile.com (client-ip=111.22.67.135; helo=cmccmta1.chinamobile.com; envelope-from=liujing@cmss.chinamobile.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 182 seconds by postgrey-1.37 at boromir; Wed, 23 Oct 2024 23:22:52 AEDT
Received: from cmccmta1.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYSqc1s1mz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 23:22:52 +1100 (AEDT)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36718e9e1270-38a8b;
	Wed, 23 Oct 2024 20:19:45 +0800 (CST)
X-RM-TRANSID:2ee36718e9e1270-38a8b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from leadsec.example.com.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66718e9dd58e-cd953;
	Wed, 23 Oct 2024 20:19:45 +0800 (CST)
X-RM-TRANSID:2ee66718e9dd58e-cd953
From: Liu Jing <liujing@cmss.chinamobile.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	maddy@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] KVM: Array access out of bounds
Date: Wed, 23 Oct 2024 20:01:11 +0800
Message-Id: <20241023120111.3973-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In the kvmppc_mmu_book3s_64_xlate function,
r = be64_to_cpu(pteg[i+1]); i used is 16 after the last loop and adding 1 will cross the line.

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

diff --git a/arch/powerpc/kvm/book3s_64_mmu.c b/arch/powerpc/kvm/book3s_64_mmu.c
index 61290282fd9e..75d2b284c4b4 100644
--- a/arch/powerpc/kvm/book3s_64_mmu.c
+++ b/arch/powerpc/kvm/book3s_64_mmu.c
@@ -284,11 +284,16 @@ static int kvmppc_mmu_book3s_64_xlate(struct kvm_vcpu *vcpu, gva_t eaddr,
 		second = true;
 		goto do_second;
 	}
+	if (i < 14) {
+		r = be64_to_cpu(pteg[i+1]);
+		pp = (r & HPTE_R_PP) | key;
+		if (r & HPTE_R_PP0)
+			pp |= 8;
+	} else {
+		dprintk("KVM: Index out of bounds!\n");
+		goto no_page_found;
+	}
 
-	r = be64_to_cpu(pteg[i+1]);
-	pp = (r & HPTE_R_PP) | key;
-	if (r & HPTE_R_PP0)
-		pp |= 8;
 
 	gpte->eaddr = eaddr;
 	gpte->vpage = kvmppc_mmu_book3s_64_ea_to_vp(vcpu, eaddr, data);
-- 
2.27.0




