Return-Path: <linuxppc-dev+bounces-4912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DBA077B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQpy2tXnz304C;
	Fri, 10 Jan 2025 00:38:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736429914;
	cv=none; b=N4Cu1QxXBRg4vjGmGO97RLczGeuyMmXoTJG6KFURFzV0traXAUTzw1aAeY7i35tDReR6YSiz8pcyDpb8/WAcV1hH52BS3/fMlODMV1dRzTkGN+0Uzp8QwX2PPwwHRHgZA/p285Fm1Gq2d4pauqlxSIrlyA2BM5KxpHBLNCdskPuXXNoc/L6LZBFTXeKcbAV3bxFo8Ot/7wxYhJP6L4ixmef+YdddwaWDgsysyBfioF07nE0+fhTMct1VAiieQLtehq/DhkDssaCoPDZmuLa/eYXLAWw6t1OU6M+/5px8aSm33xYEl2CxxyKLa1rAZDbaTDcTZbuTST0m+gzaRJ+tQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736429914; c=relaxed/relaxed;
	bh=d/K9YNVS7ltWEgnQj5oYbH5hWmhcl5BqPq+/x8nLjmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=EJXdW9lLTKoipTvOgc2xpYHld0ykjaZQFVs3Dm//qtAoGHSrR04BZ4jbfIA+KXbpAj87MOnbJZWaeiKINsPlkmRhVmd0PA3WagyMDj4DxUbeHRSwFz4u1+kIAl58QxmhwyWkK2jHhxlCcD2rYe4g210ispL7leMWEQ7UKkVm38CG9m8EOrQ3q3p5HrANiDCSDJKoTRE4whB8niPK6AVqbU7Z9uvSYmCPQ8ifcTaJh2fNeUhoF1+OW2drEF2CCweuQd/bQ2BoFgEjJY02X8zW4et4o72ANXlWzIowjXcibbQx59CwN0JFdsjPzsM3GTQLh+JI6PBvb3+vcehd89pY5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCp7uBfJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCp7uBfJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCp7uBfJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PCp7uBfJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQpw2rGBz3bWf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:38:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/K9YNVS7ltWEgnQj5oYbH5hWmhcl5BqPq+/x8nLjmU=;
	b=PCp7uBfJ9YTZNgzPiqD6ghIY3gKdbwCfJqIBf1sfw3po9sQAHP9OC5+3LczZ5rQoPpzdbG
	h31E4eDysYTqGYF3t2szbeL3jpAfKFOxCQgb93iP0TqpuuCzNl0sR6wo5C0/uLXW5Om6XL
	kzf3CSZBcfVQyBEJPQymrL1fj9whZuA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d/K9YNVS7ltWEgnQj5oYbH5hWmhcl5BqPq+/x8nLjmU=;
	b=PCp7uBfJ9YTZNgzPiqD6ghIY3gKdbwCfJqIBf1sfw3po9sQAHP9OC5+3LczZ5rQoPpzdbG
	h31E4eDysYTqGYF3t2szbeL3jpAfKFOxCQgb93iP0TqpuuCzNl0sR6wo5C0/uLXW5Om6XL
	kzf3CSZBcfVQyBEJPQymrL1fj9whZuA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-YuWm6ismO5CGLs0myd9AVw-1; Thu, 09 Jan 2025 08:38:27 -0500
X-MC-Unique: YuWm6ismO5CGLs0myd9AVw-1
X-Mimecast-MFC-AGG-ID: YuWm6ismO5CGLs0myd9AVw
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa68952272bso104194566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 05:38:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429906; x=1737034706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/K9YNVS7ltWEgnQj5oYbH5hWmhcl5BqPq+/x8nLjmU=;
        b=hweMUYUe20tYCLcSHMX8kJq2MWlvm5g7HRxBgdo2404jcj0MmTJYPIwvPSYxsdaRYm
         X7K1rJalj+WoTzkWBDE1ZqPJ987iWBl04ZUjSnofNk6O8s3dVVnSO8iLrA4uWd9J8JAR
         lkBIyQX45kW7IyYWGQRywyq7sJvEJjO3VZIfiYMXXpHd0F7nQMgdLWB/btWgRMi2mvo5
         A/u9/55MzYZ2SiFcSqHaZ+aZFMSiJp2uOvtFZrsATntX3nFYcMp4/3/T6c3KHDVGG9NK
         Qc9rEjit4l1vwdzuOvlI8MjPo7Ee16dxFf65qf2+umMdF6B/4DPs4YvmBHhf+vgL4cNw
         R/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrubZUkkq0klYe2CBymr7wKVly+MDq0r0tx2RyUeTFDCOfmajUlch4ZWjvKkCyGgOnz4QEO2UVr0LaJIM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1S0f+LaB8w+ag6uLKnazGjvy03h6E83BK8MFUqpOjYE+mAPDj
	s4ArcIvVus4NbTRLXSuYi5CWDSYIXSESOeP4ev7v0YMu5r1gCWCavcgiMfOi6gK7tbXSCXbrL7h
	auPrNoE4UqTkhUA5SvTohI20QOIuYWHabHe4uozmU08AUOmnGQNBDGiX16oySPwo=
X-Gm-Gg: ASbGncuulGaYRdEA5yXwu3n1s5zOLbgaZjQq7+9gFWs1RSdqQ9K1F6aIWa3/rTnzzJ6
	WnWROAI8pg9s4L1BOMOq+SROxC7aQ+xU8oDeNvNKgrd+nBUz2VBNlP7CbsQDcKuLFB8q+8ARAK0
	NOg0VZG+VvyrM9RdQAgWVxZZ/ZfbLFzlVB427Cm1GdNSGxvZVUxsnNiMIEZQOwEP/JwLJeMhu30
	puMM/VuwI7CcAijJVg5RUm0Mo96/BrkuUCVHOqeK61/oINZlAc4/r08jZoo
X-Received: by 2002:a17:907:94cc:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-ab2ab6a851amr624677366b.4.1736429906036;
        Thu, 09 Jan 2025 05:38:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTbBeYDIBQ3z954w6dfAEk3XY9Iu9HEUTdIMdZmv3AtPH2uw4HEV5T8fdkL1pcscV4BnFyug==
X-Received: by 2002:a17:907:94cc:b0:aa6:7cae:dba7 with SMTP id a640c23a62f3a-ab2ab6a851amr624675766b.4.1736429905640;
        Thu, 09 Jan 2025 05:38:25 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95648e7sm72802566b.95.2025.01.09.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: oliver.upton@linux.dev,
	Will Deacon <will@kernel.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev
Subject: [PATCH 2/5] KVM: e500: use shadow TLB entry as witness for writability
Date: Thu,  9 Jan 2025 14:38:14 +0100
Message-ID: <20250109133817.314401-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109133817.314401-1-pbonzini@redhat.com>
References: <20250109133817.314401-1-pbonzini@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tsef9PEnzjUo-gS5fobAvHI7T5rG5zzxyNIL2SzQNcA_1736429906
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

kvmppc_e500_ref_setup is returning whether the guest TLB entry is writable,
which is than passed to kvm_release_faultin_page.  This makes little sense
for two reasons: first, because the function sets up the private data for
the page and the return value feels like it has been bolted on the side;
second, because what really matters is whether the _shadow_ TLB entry is
writable.  If it is not writable, the page can be released as non-dirty.
Shift from using tlbe_is_writable(gtlbe) to doing the same check on
the shadow TLB entry.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 732335444d68..06e23c625be0 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -242,7 +242,7 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 	return tlbe->mas7_3 & (MAS3_SW|MAS3_UW);
 }
 
-static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
+static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
 					 kvm_pfn_t pfn, unsigned int wimg)
 {
@@ -251,8 +251,6 @@ static inline bool kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
-
-	return tlbe_is_writable(gtlbe);
 }
 
 static inline void kvmppc_e500_ref_release(struct tlbe_ref *ref)
@@ -493,10 +491,11 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			goto out;
 		}
 	}
-	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
 
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
+	writable = tlbe_is_writable(stlbe);
 
 	/* Clear i-cache for new pages */
 	kvmppc_mmu_flush_icache(pfn);
-- 
2.47.1


