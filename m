Return-Path: <linuxppc-dev+bounces-4910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C608BA077B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 14:38:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTQpx5SPPz3bX9;
	Fri, 10 Jan 2025 00:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736429913;
	cv=none; b=edsPD9kx83RaMgtNm6oI8qqPQR4CbymVTF5COYOKSiEQfMGbr/yqwr3bepFor3XCu0cl/s9Uf2uf29FuZqdYrsnEzyoKU9QfFLVd0baWIbSZ1N4x1fjz2EcJP2lUsan4ZCm3oJi9v2WryRFrl4ngFkmXTQj5pgt9UUPN8sNh4J/cJbfIRMRfqVyrqND+60/60SF3BFuFAp2luBB/oSSJCC1q+Bm1N9yCbKsv81sE4VDnU/wzTnUpdoCoQ+AJyjK3+MZEETLG6IW14EvaUCmvnKCoM1rgJuNakLY2z7eo7i+jC7QKKHp2Z1fXPKLE4cPyrBKZ+kK78xPIo8iOCEylCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736429913; c=relaxed/relaxed;
	bh=uldQPwdfE7L9Dk1HaWI6s1M7Pg4/zwkf9XHa0qYWEsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=FgiXXDuIGs1noIdUAJp0YOQf4767xI5liXBFEstr3X4fXFRLLiLCzCbjef3boGQbKfqjgG25lxfMFy4Nc/P90rYUAD1EYopLhV6DkjAzoBxP4VzxzqWsnUZo1ZqKfvBZanucpZrjKge6z+LbV4K+OUopCjk6dymk1kjSVb+0sHVaGADZ3vUpBnmM6OdvbMo1lVXpnboVRyFQ9MVQ3swzL/AbYnW2n0DP6K8M5gCZ8ZfOiYPiye5b3VCuDZidNfaNeK5aeOqStuXPIOWTYk2AO/bY3vdR0gD7XVzVzfsWM8RXPaZDoXz/JfxCBux5NyCJYUr7f6ANH74Ls3671P+Q7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dCTiN5TC; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dCTiN5TC; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dCTiN5TC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dCTiN5TC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTQpw2NMFz304C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 00:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uldQPwdfE7L9Dk1HaWI6s1M7Pg4/zwkf9XHa0qYWEsU=;
	b=dCTiN5TCB5dLWdu29dzI8ZhdC8hknocJCnuM/TbmoW6HDP58TLBLX3ebuHmShs3xSbHW1H
	dkHUbCGzzDe/uelgKX6S63/tvO+NGthrZsmxXWHimHUBZJmouTBnSOXcBimiBUCV/7A/4J
	ruQVxrEMZwQ6zv1mdP37OQFSGQrpgks=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736429904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uldQPwdfE7L9Dk1HaWI6s1M7Pg4/zwkf9XHa0qYWEsU=;
	b=dCTiN5TCB5dLWdu29dzI8ZhdC8hknocJCnuM/TbmoW6HDP58TLBLX3ebuHmShs3xSbHW1H
	dkHUbCGzzDe/uelgKX6S63/tvO+NGthrZsmxXWHimHUBZJmouTBnSOXcBimiBUCV/7A/4J
	ruQVxrEMZwQ6zv1mdP37OQFSGQrpgks=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-73-7f1pFYp4ML6cavzoxdDKgA-1; Thu, 09 Jan 2025 08:38:21 -0500
X-MC-Unique: 7f1pFYp4ML6cavzoxdDKgA-1
X-Mimecast-MFC-AGG-ID: 7f1pFYp4ML6cavzoxdDKgA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa6a87f324cso91110866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 05:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429900; x=1737034700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uldQPwdfE7L9Dk1HaWI6s1M7Pg4/zwkf9XHa0qYWEsU=;
        b=ZJ2Jtt8atWqFd+zrs2VdIAVjt5wVKDNbF5P9wHbL3ZVUcV1T6BrgAmTF5ZJ6OXiWrh
         /ARYK0ZF0KcnUMCHjrQ9agKpHyL9j0AvoMyq32BfDvxMTPTMedpRgxB7b6jLJD1N4H9e
         6GLPcJiLzMFvzE+KxecOuLCq8ZDEcml4cpv1/EY92TR3yXBVNdsYwG0MHCBcK0JNnO4B
         HakgJ9ZDPlF63EWbEqyJU0zOwZQg6VbS0H2mDlDnA7ZCnC8k1DowE8DuFlbaDh53Q1xx
         LQ5hyHm7+N4FFMWb4pLXajnfrDo6+FHgMxyoc0/N8EneOCVBM9sGV39IqplyywX6x87J
         4cYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP1QSRnhPsHizbZmLhWuoxrSKUXOYdXp8hdMHc3Wn9c5ydbLgIc5AsZQ5D73hDhR9A6hNw6aG3aBY1S10=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiCgUR7EHlMh6pyGOWs55a6FpT+ymwKrrSMfLMBh7ArkkuQWaf
	xt7xvbgTE8UJD0cesxcPKhAdJSArp/h6hfcGpCSKV/i4dY+yK4ko0GRH1XARhnVz0O+5/Vnz7S4
	VY8MRG8oFaZaUjj90YQpc9wc4QJ1Wy0bExHlZQaGHdE0oESvbtgOQ+HYGxg/c+eI=
X-Gm-Gg: ASbGncvx9W7hNJm07aHpgT171CwMQZtSUm3jwiw03PHzlEJXqeCby10M2NCIMduebYF
	qNp34csLRCFMe41c8BTiXryvJrQcIKobbP6CJLllPEEOkPO17xxnCjXQ3McZ63ROOGu5TMz6a7F
	kotjW9kOrw1xK5XhC+ov0WPDnTpEveBlWXxU6J78EGM1pjX1GkZetpDpIAXRkroRv9qL/WaihYE
	aBSWIIbM27OqQy69bpuYNu/jnZu6AGZ/OO0XwRtFMlwRK9RVALIWbUPqwxO
X-Received: by 2002:a17:907:36c8:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-ab2abc92570mr698464666b.42.1736429900052;
        Thu, 09 Jan 2025 05:38:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGidjwN/yFK9ZauIimr2u7AiwN7b2XDO8B6ecoGAlxpK3GFkQSMXGdYvA9XVkfNkK6maNXm2Q==
X-Received: by 2002:a17:907:36c8:b0:aa6:4494:e354 with SMTP id a640c23a62f3a-ab2abc92570mr698462166b.42.1736429899595;
        Thu, 09 Jan 2025 05:38:19 -0800 (PST)
Received: from [192.168.10.47] ([151.62.105.73])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9904a5277sm591739a12.80.2025.01.09.05.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:38:19 -0800 (PST)
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
Subject: [PATCH 0/5] KVM: e500: map readonly host pages for read, and cleanup
Date: Thu,  9 Jan 2025 14:38:12 +0100
Message-ID: <20250109133817.314401-1-pbonzini@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 693IWrw-oDf2ZuIGB-gHWuHyvgCqqmHoYeLejo1mcwI_1736429900
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

[Oliver/Will/Anup/Andrew, you're Cc'd because of an observation below
 on VM_PFNMAP mappings. - Paolo]

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

The series is compile-tested only.  Christian, please test
this as we do not have e500 hardware readily availabe.

Thanks,

Paolo

Supersedes: <20250101064928.389504-1-pbonzini@redhat.com>

Paolo Bonzini (5):
  KVM: e500: retry if no memslot is found
  KVM: e500: use shadow TLB entry as witness for writability
  KVM: e500: track host-writability of pages
  KVM: e500: map readonly host pages for read
  KVM: e500: perform hugepage check after looking up the PFN

 arch/powerpc/kvm/e500.h          |   2 +
 arch/powerpc/kvm/e500_mmu_host.c | 202 +++++++++++++------------------
 2 files changed, 89 insertions(+), 115 deletions(-)

-- 
2.47.1


