Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E035005F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 08:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kf8W15gW3z2ynx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 16:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=myoGwm2G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=xiam0nd.tong@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=myoGwm2G; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kf8VN33Jtz2xmN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 16:21:15 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so8400825pjn.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 23:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=v6BSL8VhVmwIej2fDS4fILub4T69woLAa8tFuzppLBk=;
 b=myoGwm2G1MSWxH52mFS6PB//GYIp24Zl7kzfWhLsbgDggF7p3Uq899B13XQH5s71gu
 HHFqo6T+QWWaM66hqv+AyVlDLgA/ey/zDE2HM5L7WTYH4D2kU2LDq9fB6nM1HjNmFtCp
 hEqP6Z0xmeWKJqmVJ2bT6wT/f9FTWcSfZT1ed9mXOqC/ZtcS0ppQJyMNs4teGiBy2J3R
 nGsG4/HlF/Up6SkA56i2FJJZzhjZLHyUV95Ii+3tbh5yryu0XvRuWwPUFVqgq9b+ij1o
 A54iIEeEkJ81az7JwRj8iFxQMs2XOc+AC/ZlQRYtkaZZIUz1liYyXYTwdzsiLOPqesFB
 Glmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=v6BSL8VhVmwIej2fDS4fILub4T69woLAa8tFuzppLBk=;
 b=lTH5LKy0B1z/gsfKfM1FhUYKTSF5XDwjDkdKHun/3NKDTPhkjyoah95DjLXhnzEnyZ
 /bmbiOnfl48w1GDufRbkjIpBh/coQAffqOQH452FYae1yeYcqFkffWINlEjhLXDWV4ry
 bVbF87/Wyt9wndkLee1IKq/ieiaKBvNmLDHRNN7+NLNo7zUsbNMvNrXzqTCrwiKf85IH
 XxIl/7EeOr9g6H1FhsUbjyFMEQPRVp7mYT2xbzs64PJ1kazlSjhsMoN6bIJ1zxapiKau
 StBP7nNgt2FJbzdWZsIPoVsaGnd1yi5SGlnyY6Jp9PiTih6mieWQcGXS/2w+Bjf7xQa9
 cbdA==
X-Gm-Message-State: AOAM530IzXQToXaXeehiPS1qi9Cq8hJO9FBcMFYYa115GOWquE2UgfPa
 1eY/puuN5FtULzPyqMGrOS0=
X-Google-Smtp-Source: ABdhPJx/+VfCKqnYmadJUeIHFXxCThNG7ojieyEdrIdWyLC4NUzoCeJQJbvhMw0o07fEgwbpqK4R8g==
X-Received: by 2002:a17:90b:314a:b0:1cd:3a73:3a99 with SMTP id
 ip10-20020a17090b314a00b001cd3a733a99mr2641203pjb.189.1649917270729; 
 Wed, 13 Apr 2022 23:21:10 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 nl17-20020a17090b385100b001c70883f6ccsm5042588pjb.36.2022.04.13.23.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 23:21:10 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 akpm@linux-foundation.org, liam.howlett@oracle.com, david@redhat.com,
 maz@kernel.org, Felix.Kuehling@amd.com, maciej.szmigiero@oracle.com,
 apopple@nvidia.com, bharata@linux.ibm.com, linuxram@us.ibm.com
Subject: [RESEND][PATCH] KVM: PPC: Book3S HV: fix incorrect NULL check on list
 iterator
Date: Thu, 14 Apr 2022 14:21:03 +0800
Message-Id: <20220414062103.8153-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Xiaomeng Tong <xiam0nd.tong@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The bug is here:
	if (!p)
                return ret;

The list iterator value 'p' will *always* be set and non-NULL by
list_for_each_entry(), so it is incorrect to assume that the iterator
value will be NULL if the list is empty or no element is found.

To fix the bug, Use a new value 'iter' as the list iterator, while use
the old value 'p' as a dedicated variable to point to the found element.

Cc: stable@vger.kernel.org
Fixes: dfaa973ae9605 ("KVM: PPC: Book3S HV: In H_SVM_INIT_DONE, migrate remaining normal-GFNs to secure-GFNs")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index e414ca44839f..0cb20ee6a632 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -360,13 +360,15 @@ static bool kvmppc_gfn_is_uvmem_pfn(unsigned long gfn, struct kvm *kvm,
 static bool kvmppc_next_nontransitioned_gfn(const struct kvm_memory_slot *memslot,
 		struct kvm *kvm, unsigned long *gfn)
 {
-	struct kvmppc_uvmem_slot *p;
+	struct kvmppc_uvmem_slot *p = NULL, *iter;
 	bool ret = false;
 	unsigned long i;
 
-	list_for_each_entry(p, &kvm->arch.uvmem_pfns, list)
-		if (*gfn >= p->base_pfn && *gfn < p->base_pfn + p->nr_pfns)
+	list_for_each_entry(iter, &kvm->arch.uvmem_pfns, list)
+		if (*gfn >= iter->base_pfn && *gfn < iter->base_pfn + iter->nr_pfns) {
+			p = iter;
 			break;
+		}
 	if (!p)
 		return ret;
 	/*
-- 
2.17.1

