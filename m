Return-Path: <linuxppc-dev+bounces-5088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97286A0A80C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 10:55:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YW9kR2gzSz30Vs;
	Sun, 12 Jan 2025 20:55:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736675743;
	cv=none; b=j0ncLaGtgL8Ki7DctPR5gk+Aa+eIRi1NYMK2s7xiQUgihClO9NIGN8Za8RWZAOiqF7kD7t+dX7UjoE51Uz2vH0UjzSXCazhmAsqEQ4g8xwmFV8AC1+LLuIoj/odNl4pl7wWRD330wzRdL+99iD11aZGBVjSK4Zls5tse4e3RVd820Gvg1GCpqwynKrY9AD0qCIdt2ImPoEaltdQwWRCovOxUHKblZLrKqqIpk37hp6Iku70OVp+6Soo8oOdGX8O6HdTnlfeF9gBCzoBAYAIbo/QwxOazhhQBeqZvt7BwjYHRe3nNbGBueuYVhaOn0/HJa3RBejBPOxaMIi0IDtr3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736675743; c=relaxed/relaxed;
	bh=LbPMvXWxkqoPEVecK8C7xcWKRlslEHctKLKomp3MgmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=W3GQ6uAQtwSsx1jODkIKSAj0bhStFdq6vYzeKBE6ozkcFWpIt/KDMG62W6rkqsItX5irDyjdoPyzV7zYMs1+FUqRq5QOvjIAdVj93QkJE94HTrl06xNUd0ixvyOY8feRizUMV/sZ3qds74r59OuxcbrsgJHiCBX4Rtkn6l9ygx9nxefh5AcFPc16YmJ5Bdz49qJqJs9DzlDaw5tqGiRvIeAWAcdSP4mcMCQt14fCp0UeN8K14eDAYEvXyRXLxwiGkDKrMoqWK1NFtm4BjhEzNSNvFYfJB+v+Vwluc9tTYfelgfE21cHtvN6X3SJncQZZrqIrG20Aha0Fz4u9DFkIaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gj/iOerU; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gj/iOerU; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gj/iOerU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gj/iOerU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YW9kP544Gz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 20:55:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LbPMvXWxkqoPEVecK8C7xcWKRlslEHctKLKomp3MgmA=;
	b=Gj/iOerUo+UE0anCbABSP6rVFVb+IFje1InB0Vzsx9h0s/UXtbQ/jgbJRZLl8kicY6aM31
	8GYGPEQXpeMYTcSfpRtOH+CtcYDPHZRG/tqnfRCsHg8ktuo6MCCpqa3WmgJcOI4N9AIxC3
	SBFEnm6ar8sN8HUbf4t9EPbidswq9Ek=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736675734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LbPMvXWxkqoPEVecK8C7xcWKRlslEHctKLKomp3MgmA=;
	b=Gj/iOerUo+UE0anCbABSP6rVFVb+IFje1InB0Vzsx9h0s/UXtbQ/jgbJRZLl8kicY6aM31
	8GYGPEQXpeMYTcSfpRtOH+CtcYDPHZRG/tqnfRCsHg8ktuo6MCCpqa3WmgJcOI4N9AIxC3
	SBFEnm6ar8sN8HUbf4t9EPbidswq9Ek=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-_HPZjr8dMxeDnZbC06oFzA-1; Sun, 12 Jan 2025 04:55:32 -0500
X-MC-Unique: _HPZjr8dMxeDnZbC06oFzA-1
X-Mimecast-MFC-AGG-ID: _HPZjr8dMxeDnZbC06oFzA
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3e4e09ae7so4802591a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jan 2025 01:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675731; x=1737280531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbPMvXWxkqoPEVecK8C7xcWKRlslEHctKLKomp3MgmA=;
        b=rdAcDocxW4977eb6YqDnkfAQa5LS7UJrDRK3GU5AcQ2Kiisof/Iw5rLHNK5FZvA68l
         tgqbjiXJlNtmt5WRHML+0EM/ekf7R/ncFsI9ysWj8URbX9evza2W2/hBVkTRO9BC4Kws
         /H/YoaLWOBBdkzw24xa/HraAgav12ywLXAvjzo6o1pGMp7BIH+QKyNU5SMvl7jrVWkfA
         Wy0cqPQcgq3amhB6riN2E26TrYNBr3w6cFY4HVcwRtSF6lxnpxYKMamtQZnhMP+7qf3a
         x99miWIxsW48/gjIdXm1i7D9Fu9rd4arEd/PKTmriYbbawTRyWj8PNCnNiYBFN/VNuFT
         4Lmw==
X-Forwarded-Encrypted: i=1; AJvYcCWyKjG7pvGbMO89cxIC4o0IEW1wQZwiWpgoKgcbjFIBQ1wxpIhNnHrGVUN1WWqubZ3SpWh3KqDPjTPP5a4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yze1IrD2vLKC4GNlZGnzWj2TY6L3G6xBE1Pu5YxNoN1uGdQhXbm
	1WYoFY0Ufe1XY7xeRCS+geCbUu+BIX/aHOI+61h9Lm7CIqT/j7V7DsZ6QeAt/nqJjRlehkhLhMQ
	MLI+V0ENN2fELqJL9wjijOpQ7TUhsa3AG55NHaDgDDSSKk4WGz4+05ujN36kYfgQ=
X-Gm-Gg: ASbGncsQHzoDFeE19frnFpxABlY9+Jx/N+S0I3kcZViebUQEKsktkodPqwGBnBCOnmY
	jVg7BmasuuUo+EVufmISzxeuf+wi67o0h5LzlStUvxfHVwf0s9LjXSC0hfzQwUL+sMMm7mk/2Yw
	FBe9ut5NScM1vGY9y13ensTzPRfu512YmWI3PBO+6o+/Vzw8b8aGhI5RjsA8+NHVLkVOiFhp4Uf
	XSvV2drL/p5eC5P2ka39VuR6dBTUubJU3VHh5A/BbmMOl7240sgC8Mtkd0=
X-Received: by 2002:a05:6402:354c:b0:5d3:ba42:e9d6 with SMTP id 4fb4d7f45d1cf-5d972e14828mr16993852a12.17.1736675731150;
        Sun, 12 Jan 2025 01:55:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVLh0vGs9D36Q0IyXZ3HUQ2iOTSRSffuWayJjX6NDL6ISEn6UK/f5SUb1xvo4fnr5VPoS7bQ==
X-Received: by 2002:a05:6402:354c:b0:5d3:ba42:e9d6 with SMTP id 4fb4d7f45d1cf-5d972e14828mr16993834a12.17.1736675730719;
        Sun, 12 Jan 2025 01:55:30 -0800 (PST)
Received: from [192.168.10.3] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c3206sm3714091a12.46.2025.01.12.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:55:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	linuxppc-dev@lists.ozlabs.org,
	regressions@lists.linux.dev,
	Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [PATCH v2 0/5] KVM: e500: map readonly host pages for read, and cleanup
Date: Sun, 12 Jan 2025 10:55:22 +0100
Message-ID: <20250112095527.434998-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.47.1
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
X-Mimecast-MFC-PROC-ID: e4El8Y2fZyZrCfmRIB-3umK7ENiUsnuPNpIl6LJm_I0_1736675731
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The new __kvm_faultin_pfn() function is upset by the fact that e500
KVM ignores host page permissions - __kvm_faultin requires a "writable"
outgoing argument, but e500 KVM is passing NULL.

While a simple fix would be possible that simply allows writable to
be NULL, it is quite ugly to have e500 KVM ignore completely the host
permissions and map readonly host pages as guest-writable.  A more
complete fix is present in the second to fourth patches (the first is
an independent bugfix, Cc'd to stable).

The last one removes the VMA-based attempts at building huge shadow TLB
entries, in favor of using a PTE lookup similar to what is done for x86.
This special casing of VM_PFNMAP does not work well with remap_pfn_range()
as it assumes that VM_PFNMAP areas are contiguous.  Note that the same
incorrect logic is there in ARM's get_vma_page_shift() and RISC-V's
kvm_riscv_gstage_ioremap().

Fortunately, for e500 most of the code is already there; it just has to
be changed to compute the range from find_linux_pte()'s output rather
than find_vma().  The new code works for both VM_PFNMAP and hugetlb
mappings, so the latter is removed.

If this does not work out I'll go for something like
https://lore.kernel.org/kvm/Z3wnsQQ67GBf1Vsb@google.com/, but
with the helper in arch/powerpc/kvm/e500_mmu_host.c.

Patches 2-5 were tested by the reporter, Christian Zigotzky.  Since
the difference with v1 is minimal, I am going to send it to Linus
today.

Thanks,

Paolo

v1->v2: do not bother checking again that a memslot exists, instead
	add a fix to restore irqs even if !ptep


Paolo Bonzini (5):
  KVM: e500: always restore irqs
  KVM: e500: use shadow TLB entry as witness for writability
  KVM: e500: track host-writability of pages
  KVM: e500: map readonly host pages for read
  KVM: e500: perform hugepage check after looking up the PFN

 arch/powerpc/kvm/e500.h          |   2 +
 arch/powerpc/kvm/e500_mmu_host.c | 199 +++++++++++++------------------
 2 files changed, 85 insertions(+), 116 deletions(-)

-- 
2.47.1


