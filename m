Return-Path: <linuxppc-dev+bounces-5089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F5A0A80F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW9kS5m0hz2ymg;
	Sun, 12 Jan 2025 20:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736675744;
	cv=none; b=FYMHzjuNJgNwJf5GL0tAjg4FzLo+9v+/Vsg71V05ywe8MRIvFjlSpVVk+G2JdBbWDX0ITN6c6N327rsizP88xDn/5a5nxI0eXHo6Vi0S6ytJKYnoUNG4KzwpxJbMRG/1v6LvKek47KJaOpLOFdJhVqOqVj47OVW7SQdVXi0X6NvkrslJafXYOPvIDulkCQyFCeNf9LNEBXuI72dKucwXDn9d1PdcmGIEQOs7WDumWnx413qjovIg7sOSpLD8EOqKZtJTQqUC1aFzIXnSeg4WnUTNqdR0NMtRmo/tpG3GwEFp1N30R+GPR+o6i+J3xfP8Hxc/okA5wIXFF/gbMwuUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736675744; c=relaxed/relaxed;
	bh=Ia6sv5K1rPK0oxjj8pHkn374uhH5Bs7h1d/ShzUvYRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=dlAWF41wCOsPEF33dvwRrerwhhHZ0e7ag2JndA4gG5rbqiA0r84/JB+BauYzKH9BflZRXF23agSboynlacsqATfo7O2tEBySrDyyvAsMDWCX3p3nCXBEbWt5MLW1xtZD8JBQh6NYoIiUm74ZxTjfxMweTrwiD2MgS1jKSxpyJb7KmSH6nRexOZ3No9hYEJ7l1COWs6OpTKp3670xo/wxuppQDNpMiAyN3CuTm9BolPbYucpt9Ex/blDQ/lWwHBW5yj19AHwPyIJHNhtoWuX6GTPJ1vxUpUnZ7+Heyz2F3z+SevQ2KoHlnUcrlp1Hxrbnjq2+ofmSNhlnEPnmV4VmKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJAbn9Oa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQTcIDOm; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NJAbn9Oa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jQTcIDOm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW9kR3r6Dz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 20:55:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia6sv5K1rPK0oxjj8pHkn374uhH5Bs7h1d/ShzUvYRM=;
	b=NJAbn9OaEx/kJFcY/+MZpPCQlDEZcb7RWFa45QTLKhZFQJq3Pc4hLyCf1Y/IFPyY45aMjC
	oURPcdRtGqDeqV1BzL6/+7G2rV3C2XOK0B//bYNY1kpA3g5zqgMj3eo9k08mu1EfCaHGTq
	F1hccReFGR5Ltu6fD1+aI0wNdTjGHA0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ia6sv5K1rPK0oxjj8pHkn374uhH5Bs7h1d/ShzUvYRM=;
	b=jQTcIDOmB81CO2y6dgXnbC3D+BgH0f5XmhMDYxhRxeOVJxjdDrhB2yc+eBP4vq+8Njt0K1
	10g4SJakr/3QkICzb5MwRYo+fL7GTS/wXSYTYXc+vNt1yH1x484LWXZlqWJ3YMYx8zNr0z
	9IviJS23CG51rNE98exoPfjxuPuuquI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-9p4lWoXOPJexEl68Xa47WA-1; Sun, 12 Jan 2025 04:55:37 -0500
X-MC-Unique: 9p4lWoXOPJexEl68Xa47WA-1
X-Mimecast-MFC-AGG-ID: 9p4lWoXOPJexEl68Xa47WA
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aabf8e856e2so359526466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675736; x=1737280536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia6sv5K1rPK0oxjj8pHkn374uhH5Bs7h1d/ShzUvYRM=;
        b=sZIMU81pAjm4ydacxnFBijKlQW/qrSGbDpFnp/1ipaFBsCsDKWdKq9YWuDvZS+E45K
         nNFYAG6qsTHUAyZK9j0IpSo0c7bHJdTxxq8ob23rrgE3i0guwCZk64MIsdDUYXLAOPPG
         z6Sje6Ef8z6/hYnX7La2fjxbgfFO2TltJsgMN2ATDBuf4oLNXBSjy4uCS9dFry/ur2ZH
         jr8dPlY1BjrBh6c/1b2EM2e2uWpX0yuQr4dADBJmKNxAL4xGiLHUqaP5UCdx/GITN69T
         NSbV6+b54jG+r4TSdxpH0FFgt6QYIbkKKj/GcsmNNbRPGNdz8Q2+jWi9Mx0ZfwgLHVEP
         BGLA==
X-Forwarded-Encrypted: i=1; AJvYcCXW2OJoi9CyAzVkW0Qc+BiEYm5Vav0JrHOJOLsBEQ8QVws8EVja7jdDGMByawCy4qWs3kyk4l09Ouu/uhQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAKOAvQqaiUGNJMt0mV6EKkAFhz24BR1m7GWIQXoD5/qWV1C/0
	jOQH2Z9MRCcT6Am6VgRil5kQhQezhrlvyctUIqm0Z40V5QffskzztndvLK+6IYu93TNfaKoNKP+
	bTovsBGoi2BTXjZT9/4EOxwHTC9wPwoJSnfX0+rlizGxAxzOpbDhrVO1W8tBjeLU=
X-Gm-Gg: ASbGncvCPEJzl3kVzkFn7irMwV+rYOlZogw/yqEAEhTTK+jaJT8mMo21ZTu3HJKGvx4
	L/ffBOd5CG2NEnV1HgH3asqRCDDPqxHHw3QaHS8ATjkVjywd5/XdnbuHWsmVLMHgGRLJDYr4Dib
	4yHmDXGR2+bFtYzlxM6Z4en0QBCDI/DWrjgq/P5e2ugGsrX7HzJ0NqF0WtHGiR2hlUL4GVikrx4
	WeH6mQB326kl8VEGIrPXFllR4fXXfnnU7iUA34zHKEhyc2J5+BpqaF2ekU=
X-Received: by 2002:a17:906:478f:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab2ab703f93mr1611128266b.17.1736675736617;
        Sun, 12 Jan 2025 01:55:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE57lWwmpDxmyLrpFomxsQp5nUpO/tCN5jrf13BA6wccxa5tYF5ClNyyJ2YVR15koS+dU7MVg==
X-Received: by 2002:a17:906:478f:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab2ab703f93mr1611127466b.17.1736675736279;
        Sun, 12 Jan 2025 01:55:36 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e283sm356143866b.31.2025.01.12.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 2/5] KVM: e500: use shadow TLB entry as witness for writability
Date: Sun, 12 Jan 2025 10:55:24 +0100
Message-ID: <20250112095527.434998-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250112095527.434998-1-pbonzini@redhat.com>
References: <20250112095527.434998-1-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: tBO4ELeq6kO020fRN6aLRCqpX1LPjAsWlSwe7dF7JsA_1736675737
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
index 6824e8139801..c266c02f120f 100644
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
@@ -489,9 +487,10 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
-	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
+	writable = tlbe_is_writable(stlbe);
 
 	/* Clear i-cache for new pages */
 	kvmppc_mmu_flush_icache(pfn);
-- 
2.47.1


