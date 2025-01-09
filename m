Return-Path: <linuxppc-dev+bounces-4913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B4A077B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQpz5wzNz3bwf;
	Fri, 10 Jan 2025 00:38:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736429915;
	cv=none; b=GKwRAxkqow6EZzo9mLWm/dP3VITNSB2aCRV3rUUneZf2r1NKivcbLlYswSpQLQaDjpH9UqHFIB5h/q56DPgF32gQ7tdtlOKlL+KVXZIdm1fXyX1eoBNUePv7JnCGmUbyC0Lb3DOvTQB15hdvaYtNH0wdAk8z8gyl6FMiehOxg1dmley22klFm0Fc2Ruj+kIIYEi+pUKfL7z+8AeJ7DPg66fkEVa9wFrr1NlMxtwJTMZOyWSLNW9FgWMgNMhE9lDNh/RCLjxHYVPlp56DLa0TNtMA7NZo/mmgIBo0muTVY6PtcV3Oe5rp7k2X96lq8Z/SUsXkH8Spa1OzZolMCT9YZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736429915; c=relaxed/relaxed;
	bh=zguszej+6js0jv121He/RU1+H3xrJy3UeZApbWTSTbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BXSLMWAlGiG0YTKZfB0rPKt3SWR/bp1su2fqgpjO84BO0ef0j0KD8Up9dPjC6ikkbp1HEsppLWVewajtNVGhRJOnwedqfu3JEoBouqA90tqj7WJsh55BtvxvyA2WKgHFQ0FxtOoe4v0Q0EAiqJkX0mS7q3AC9Y0HSgU7XTv1Bsjpq7AcoY+GsLgXnYp8sUweX3cB2+GgDh9VmAsm8Qh4483VoaC+tE9BOMFE8PSkAeSAgeT58iwBxfITScW2JNgCR2k5zz4KOPxEBps6H52y4dEYNjrNZdifWV4POnvP4U7tDEQ4cxKUfs6ogeNB4r0NX12LOnQCdJBEdfe5snUn+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQXP3Z4q; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8KsiW+d; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQXP3Z4q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8KsiW+d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQpy6lBvz3bWf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:38:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zguszej+6js0jv121He/RU1+H3xrJy3UeZApbWTSTbc=;
	b=WQXP3Z4qnt9M/Y7jlwzRTQlhY6y7FrOy3KIXd8hX+DW980B5nrMNsySY32fMhJMy/EOY9y
	L3z158JTqvYn7hhIiNcyxYNfz73vwCFCBbv8iO50uuhR4nfwlg6U7xyOxAQ3WDbLw7litu
	F5R3XKg4/s7JIi+NQQ0EFFj7ZgtkhAA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zguszej+6js0jv121He/RU1+H3xrJy3UeZApbWTSTbc=;
	b=D8KsiW+d3zH4p+WGvFiAHz67apSzDG2Kn75DDPOBDA0KbFTYe2ypSdoqlHx52TkcUHu0A4
	vy4HJIGSStlaxt0pv4JCeo6O+cDcVZr0Nlo0l2hHxc3XeOPbhCa72rD6H5vaoxf6vl+E7Q
	V0+yA1v0SQSehSFsZGJ6+Y6ssmE0fOQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-ep1O4aBSNvOfWT5dWRUEUA-1; Thu, 09 Jan 2025 08:38:29 -0500
X-MC-Unique: ep1O4aBSNvOfWT5dWRUEUA-1
X-Mimecast-MFC-AGG-ID: ep1O4aBSNvOfWT5dWRUEUA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6704ffcaeso89968366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 05:38:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429909; x=1737034709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zguszej+6js0jv121He/RU1+H3xrJy3UeZApbWTSTbc=;
        b=Drn/orCu93JdsU35ntqXh8Jul66d8t/GUlL6svLF7+jUUqDQr0TjpLTKzJRR1ubrqw
         kNDMn9ojnib3+AQj7CJEK5p3eHT8acZGmjHEhqUDEXvzeKtIyEWBDLzqmIkyM9l7fCfe
         99WjfCxIf5rmgkYAcJvM8ZtzWrbz7C+J4GUyc8AWR0klw6y2DXwCE+rP8+ghYn6FvWhP
         wY5XwK0QCifE9aCFqa8ht/JKbeNSocoe9yzKbVfhBlfuMpF/7PKCj5imsEZffJYFmcQS
         ypoMR4/vVz7jXp0wVPtQcWeJ8lDsOJdjjOiqAuOb4jmTJfT54/teAwW9drYmZC3Ne9J5
         B94A==
X-Forwarded-Encrypted: i=1; AJvYcCXdcnfft/uLwuO9t5ANy9todqCtB7SkN1rZIXc6hb4AfZHHRy8ccSQ1PP5UPHqWWqgmrFDUn+9cblC/li0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpdAJeL8AuQ6Q695YNc42dPh2WOalDh6WCUxnVSrrl7rRbeziJ
	udwF3qrjwKfCED5/0iTbjZruP2m3JpwvaQ/h7rS39tuBAK7K6xkuW3tVWKW7rqdqqYNzf7Qmdgg
	akmqkoopPS/YIsZ0mV4VfI/4oVRc4m0/Q2zGoiXLOcgo9w4bBri88AcVF6STjX64=
X-Gm-Gg: ASbGncutatqSzHrAMSFz85rnRtbHN6qDF8kA845j31CbZbRzblg4XfqG3T2ieWNyyFO
	KN/DhcaArdSSFbtn8P2GUD7wnfSBrbvsiars5I7EnGEOLzEHwoTnM7w2UPTN8/i/J/uuDP2v333
	+bMsV7R53iARNnQD0GkndoaligwXwtaYjoEE9zRL+bd/83PW2CZTDZpTTi07N8WdxUE+g/RUXI8
	69MEt5NPqlDSOwWpGSfhqNtsyrKHlhdyncZxZQaq1kyEo5kxJLQ4QziScYa
X-Received: by 2002:a17:907:724b:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-ab2abc91b53mr573667566b.37.1736429908682;
        Thu, 09 Jan 2025 05:38:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo9tyQhMRCjTpqjQKY5ONk4yRTr2KDDRMNsirKe/0lHnxJJpvXbaOhKUZHyIFh2cUX8sdNHg==
X-Received: by 2002:a17:907:724b:b0:aa6:abb2:be12 with SMTP id a640c23a62f3a-ab2abc91b53mr573664766b.37.1736429908325;
        Thu, 09 Jan 2025 05:38:28 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95af187sm73137566b.142.2025.01.09.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:27 -0800 (PST)
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
Subject: [PATCH 3/5] KVM: e500: track host-writability of pages
Date: Thu,  9 Jan 2025 14:38:15 +0100
Message-ID: <20250109133817.314401-4-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 4krDpJAMoK3dJPxcFgB6a91kprbIOesrlo1XnbVVclM_1736429909
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add the possibility of marking a page so that the UW and SW bits are
force-cleared.  This is stored in the private info so that it persists
across multiple calls to kvmppc_e500_setup_stlbe.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500.h          |  2 ++
 arch/powerpc/kvm/e500_mmu_host.c | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/e500.h b/arch/powerpc/kvm/e500.h
index 6d0d329cbb35..f9acf866c709 100644
--- a/arch/powerpc/kvm/e500.h
+++ b/arch/powerpc/kvm/e500.h
@@ -34,6 +34,8 @@ enum vcpu_ftr {
 #define E500_TLB_BITMAP		(1 << 30)
 /* TLB1 entry is mapped by host TLB0 */
 #define E500_TLB_TLB0		(1 << 29)
+/* entry is writable on the host */
+#define E500_TLB_WRITABLE	(1 << 28)
 /* bits [6-5] MAS2_X1 and MAS2_X0 and [4-0] bits for WIMGE */
 #define E500_TLB_MAS2_ATTR	(0x7f)
 
diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 06e23c625be0..e332a10fff00 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -45,11 +45,14 @@ static inline unsigned int tlb1_max_shadow_size(void)
 	return host_tlb_params[1].entries - tlbcam_index - 1;
 }
 
-static inline u32 e500_shadow_mas3_attrib(u32 mas3, int usermode)
+static inline u32 e500_shadow_mas3_attrib(u32 mas3, bool writable, int usermode)
 {
 	/* Mask off reserved bits. */
 	mas3 &= MAS3_ATTRIB_MASK;
 
+	if (!writable)
+		mas3 &= ~(MAS3_UW|MAS3_SW);
+
 #ifndef CONFIG_KVM_BOOKE_HV
 	if (!usermode) {
 		/* Guest is in supervisor mode,
@@ -244,10 +247,13 @@ static inline int tlbe_is_writable(struct kvm_book3e_206_tlb_entry *tlbe)
 
 static inline void kvmppc_e500_ref_setup(struct tlbe_ref *ref,
 					 struct kvm_book3e_206_tlb_entry *gtlbe,
-					 kvm_pfn_t pfn, unsigned int wimg)
+					 kvm_pfn_t pfn, unsigned int wimg,
+					 bool writable)
 {
 	ref->pfn = pfn;
 	ref->flags = E500_TLB_VALID;
+	if (writable)
+		ref->flags |= E500_TLB_WRITABLE;
 
 	/* Use guest supplied MAS2_G and MAS2_E */
 	ref->flags |= (gtlbe->mas2 & MAS2_ATTRIB_MASK) | wimg;
@@ -303,6 +309,7 @@ static void kvmppc_e500_setup_stlbe(
 {
 	kvm_pfn_t pfn = ref->pfn;
 	u32 pr = vcpu->arch.shared->msr & MSR_PR;
+	bool writable = !!(ref->flags & E500_TLB_WRITABLE);
 
 	BUG_ON(!(ref->flags & E500_TLB_VALID));
 
@@ -310,7 +317,7 @@ static void kvmppc_e500_setup_stlbe(
 	stlbe->mas1 = MAS1_TSIZE(tsize) | get_tlb_sts(gtlbe) | MAS1_VALID;
 	stlbe->mas2 = (gvaddr & MAS2_EPN) | (ref->flags & E500_TLB_MAS2_ATTR);
 	stlbe->mas7_3 = ((u64)pfn << PAGE_SHIFT) |
-			e500_shadow_mas3_attrib(gtlbe->mas7_3, pr);
+			e500_shadow_mas3_attrib(gtlbe->mas7_3, writable, pr);
 }
 
 static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
@@ -492,7 +499,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1


