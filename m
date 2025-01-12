Return-Path: <linuxppc-dev+bounces-5091-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB56A0A813
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW9kb18Fbz30gK;
	Sun, 12 Jan 2025 20:55:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736675751;
	cv=none; b=A2jGih9teF/L+defKlzffENOp6uALtA2Z2NbYiRFdNuIdOiNQ2GTso3Jpc7Orj7/5hgU61lzjvbk2w6/h4myAj0Kwt2fu/zm+kg6u7AD6yXIynbg3TZmqLnODI3NCvzzdd6+VYkHKTWjfSblCA3rOZekUDBZ18BXMsUKJfdpaNko2IIi0r/sZNLtJ5I4/sMaO2RyafJKoufV/8fooWcZmntIy1dh/gkjdijfMrb1X13o6Rm8Tyf4Ivb+vRaXLmric1fOOqqD89bCwKlMPjdxypBbLN+bw0jUksZiz15ccKOI61sYEuQwRm6ZMdw3ou1miOO5hh2lWJh8mCnpxW6wwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736675751; c=relaxed/relaxed;
	bh=53tOW+li8LibaZME0FEdug9t3b3VYRiHfAOklFpMuVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BrEriHZhPhOHevrHh6OJlzVFGena584FTAPtA4G7qH+4Bumfab69qAjFOe+MdShPZUipxT3Ku4bNnf8IG11B3hjuDIRDZJICvUTSR2rWRh4pn1VWpJRO8eHfT+1/ad8/vHsd6D8VTG0s37ut7U3v+mZdI14QlTZdxF4LcUCyDFjOvztKTbZMmktcU8UTM7jBUfyeI+CcS47vFF61o1pf4B8mBiJ5aiX6XT+JGS4HcZ+nxOE/jguc1ps+KFkwD+GRHY5dbFV7FnzdKcwGPzTwn4gNykwOvLuO2GA8jnEEyZ7eLW9G2fMYgQJyNwIDO+nUTc/xkigqmqyUeGLN30uFjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOlKPffP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOlKPffP; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOlKPffP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOlKPffP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW9kZ0CKHz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 20:55:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53tOW+li8LibaZME0FEdug9t3b3VYRiHfAOklFpMuVY=;
	b=eOlKPffP4mlqsirjiXDCEtgFpCbEvxaglDnenanSVmF3LY3Aw81iGraYQnghtslyoeHqM2
	EMG6wlLb4Hm1WNKXMREGVYJ5qIYr0/mXpPKzTC/+BOJ+SrjL74ASopQ7uorzKrO5Fi9cKi
	tQtaOT2WYgsqgzTrntDPUUeeeADRK/w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53tOW+li8LibaZME0FEdug9t3b3VYRiHfAOklFpMuVY=;
	b=eOlKPffP4mlqsirjiXDCEtgFpCbEvxaglDnenanSVmF3LY3Aw81iGraYQnghtslyoeHqM2
	EMG6wlLb4Hm1WNKXMREGVYJ5qIYr0/mXpPKzTC/+BOJ+SrjL74ASopQ7uorzKrO5Fi9cKi
	tQtaOT2WYgsqgzTrntDPUUeeeADRK/w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-Lmk_ZGKgOSKvKfUxlLmM2g-1; Sun, 12 Jan 2025 04:55:44 -0500
X-MC-Unique: Lmk_ZGKgOSKvKfUxlLmM2g-1
X-Mimecast-MFC-AGG-ID: Lmk_ZGKgOSKvKfUxlLmM2g
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab2e529dc35so212279066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675743; x=1737280543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53tOW+li8LibaZME0FEdug9t3b3VYRiHfAOklFpMuVY=;
        b=BbTIwGc32WqlqbR6Wyd1dlu1nWHNR4SQUpEIFGYmTI3TWWcCzjWExLPi8/K+RWwxhR
         1ay8vuEDNTzW9FmLufHR3ijJLdqxKl/3Tbb2Hr3scl/y6Tcn8MtGb4rePv20VoPfLuvL
         iZan/W4PIfTymPPIuSS95KZrfHuz/TQq8GCKtA7+0g36Y4PU0yyHAyyOLpIJ+QnnsLa+
         YpLCRRvAPDr9eU6Px/2KI9+bmX3bgwIH/+2ndjRLNM5YX4MrQB+O0Jv7C7O+fm5gdJD3
         w1UGqtY2p1Kk2W/Vj2rBbauevcuH2yiTFJhi8+IMAYLHtUl9csiev0PFPeFVeeB3DlXk
         fCew==
X-Forwarded-Encrypted: i=1; AJvYcCXvpYq3qlsweUg/IXzK1xi1NY09F0APx4o3O8U+ZKmXLa1Wucd3DzvD9UuhEJsvaqEtAE6OTax8/X1nOYg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxF4Xs4ALqHABDg2ff+yRkUv9pL7kUrFX3HCAFjLLR7qsaVSyu
	JwFjNt0IG/E2qUOv0X6uhzz4xF1pf2V6KXeZ2RkBNctX7eFSXlzuO71I9+UATmEiomnJwJRgUiO
	fPauWEUoBI+Nx2qcDDS/hTcRv0L/40wfS1tDc2IXoHRhJ6R42Q+fCh/hP+850uJo=
X-Gm-Gg: ASbGncvvdCtrN/Uf2fBTvY2JFuTgNs3yBTUzCCETj1uS5cY5Xl0XES3rypwsxQ0HjCZ
	D6+oCwcooHwdX9OxOOHb7ih259Jfnzk3MeD8mFtVXGvAR7Qa4A1zh6QlBDLvbZJ7ueMFU8PwS1n
	PJ8a+ZIpNqa3lQ5ndcioNStwXIUFbXenbLWMWmjZfSDSsG32Zi4iZ+H2rJ9KkygchSo9vDYjD8C
	ya28oXjfN1K9Qrxz5PhBm+sgWheSf25UdB68lGr1eVr9muc+doIFe4xWl0=
X-Received: by 2002:a17:907:7f1e:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-ab2abde30a8mr1561037366b.49.1736675742910;
        Sun, 12 Jan 2025 01:55:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGJlu2i7msf3zvSzymzm23VI3HB+hujDx3jJa79Xm9BhmbLM60jNLT6BqjxStf0JBpA+edAQ==
X-Received: by 2002:a17:907:7f1e:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-ab2abde30a8mr1561036366b.49.1736675742572;
        Sun, 12 Jan 2025 01:55:42 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905e2ebsm363088866b.10.2025.01.12.01.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH 4/5] KVM: e500: map readonly host pages for read
Date: Sun, 12 Jan 2025 10:55:26 +0100
Message-ID: <20250112095527.434998-5-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: tSZCEVGzReckAI9ozoOl6-wKHK1pOFecbeFC70usHHQ_1736675743
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The new __kvm_faultin_pfn() function is upset by the fact that e500 KVM
ignores host page permissions - __kvm_faultin requires a "writable"
outgoing argument, but e500 KVM is nonchalantly passing NULL.

If the host page permissions do not include writability, the shadow
TLB entry is forcibly mapped read-only.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index b1be39639d4a..b38679e5821b 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -374,6 +374,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 			unsigned long slot_start, slot_end;
 
 			pfnmap = 1;
+			writable = vma->vm_flags & VM_WRITE;
 
 			start = vma->vm_pgoff;
 			end = start +
@@ -449,7 +450,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -494,7 +495,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	}
 	local_irq_restore(flags);
 
-	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, true);
+	kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg, writable);
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
 	writable = tlbe_is_writable(stlbe);
-- 
2.47.1


