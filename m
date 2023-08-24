Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B178698F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:08:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G+ioXOlM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbM06p6Nz3dh5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=G+ioXOlM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbGv3rJlz3dDR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:05:11 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bf078d5f33so51410705ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692864308; x=1693469108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhPhAEYXOjd7Sn6E5mFHIsVfVenAXGYibiKvIzNeJhI=;
        b=G+ioXOlMhzzSsFeOo98ApC0O6Bz+xTN7o7NvHt6zUSzMtMjnoOCwssUrtpM3Ea/f4q
         QzZWnac70CX9Tsu8jkszmzYyq03LndVS91OTCpw8PH2TyoJt/jfWUy1VBPEHCSH5NHQI
         lVh4ksRnv/2AHsWJlta0CGXZwJ81ZZyP1PIsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864308; x=1693469108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhPhAEYXOjd7Sn6E5mFHIsVfVenAXGYibiKvIzNeJhI=;
        b=HE1034TDo5IPXgRknunVOHdqtOnCZZoz535rFrhZvx+htwgSOdWCbBliwsoZC4RFBJ
         SWr+d/xeteXjdmOMM6nUGKPYkgW7AijOZLLwwcvpGeWOBZoLe18vqPDPiZIDd5SxX8Sa
         SGRYnbahBf6rvKdWngfUApa4EqCir+sZCPdn/6Oj9zZkee76sDwsQfLo6CvjqXlHchEF
         hKcBqeKEljGeowd/5qtRz0U362Cb7+DHXnejYHmPkKcjIu3vm5VGGMB6hVGzp2apSUdW
         f7JSvBRLPfgsLUb5KRipCgX37L/VrW7XL6ieI9zmU2a18uZL8Ev2Rxd9UNvjoKzAY0gU
         b1IA==
X-Gm-Message-State: AOJu0YwgOPHnNNXXx5nS8f8j8/KJAT6cUdYJIL09DBVxtPBFH/IrZi5L
	fyr+4hyLGtIinXSVFuOrRlGMKA==
X-Google-Smtp-Source: AGHT+IFkCGH2GwA3ilX5jB05HUrrf1vUBIbmMJaFJx2swg78OUGHa276ImTXLpzo2mY30kNcsT6wbw==
X-Received: by 2002:a17:902:c947:b0:1c0:7bac:13d4 with SMTP id i7-20020a170902c94700b001c07bac13d4mr10820347pla.65.1692864308600;
        Thu, 24 Aug 2023 01:05:08 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:515:8b2a:90c3:b79e])
        by smtp.gmail.com with UTF8SMTPSA id q6-20020a170902a3c600b001bf095dfb76sm12370611plb.237.2023.08.24.01.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:05:08 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
X-Google-Original-From: David Stevens <stevensd@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: [PATCH v8 4/8] KVM: x86/mmu: Migrate to __kvm_follow_pfn
Date: Thu, 24 Aug 2023 17:04:04 +0900
Message-ID: <20230824080408.2933205-5-stevensd@google.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824080408.2933205-1-stevensd@google.com>
References: <20230824080408.2933205-1-stevensd@google.com>
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, David Stevens <stevensd@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: David Stevens <stevensd@chromium.org>

Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn. Most arguments
directly map to the new API. The largest change is replacing the async
in/out parameter with FOLL_NOWAIT parameter and the KVM_PFN_ERR_NEEDS_IO
return value.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 arch/x86/kvm/mmu/mmu.c | 41 +++++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce..dabae67f198b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4296,7 +4296,12 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
 static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 {
 	struct kvm_memory_slot *slot = fault->slot;
-	bool async;
+	struct kvm_follow_pfn foll = {
+		.slot = slot,
+		.gfn = fault->gfn,
+		.flags = FOLL_GET | (fault->write ? FOLL_WRITE : 0),
+		.try_map_writable = true,
+	};
 
 	/*
 	 * Retry the page fault if the gfn hit a memslot that is being deleted
@@ -4325,12 +4330,20 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 			return RET_PF_EMULATE;
 	}
 
-	async = false;
-	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
-					  fault->write, &fault->map_writable,
-					  &fault->hva);
-	if (!async)
-		return RET_PF_CONTINUE; /* *pfn has correct page already */
+	foll.flags |= FOLL_NOWAIT;
+	fault->pfn = __kvm_follow_pfn(&foll);
+
+	if (!is_error_noslot_pfn(fault->pfn))
+		goto success;
+
+	/*
+	 * If __kvm_follow_pfn() failed because I/O is needed to fault in the
+	 * page, then either set up an asynchronous #PF to do the I/O, or if
+	 * doing an async #PF isn't possible, retry __kvm_follow_pfn() with
+	 * I/O allowed. All other failures are fatal, i.e. retrying won't help.
+	 */
+	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
+		return RET_PF_CONTINUE;
 
 	if (!fault->prefetch && kvm_can_do_async_pf(vcpu)) {
 		trace_kvm_try_async_get_page(fault->addr, fault->gfn);
@@ -4348,9 +4361,17 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, true, NULL,
-					  fault->write, &fault->map_writable,
-					  &fault->hva);
+	foll.flags |= FOLL_INTERRUPTIBLE;
+	foll.flags &= ~FOLL_NOWAIT;
+	fault->pfn = __kvm_follow_pfn(&foll);
+
+	if (!is_error_noslot_pfn(fault->pfn))
+		goto success;
+
+	return RET_PF_CONTINUE;
+success:
+	fault->hva = foll.hva;
+	fault->map_writable = foll.writable;
 	return RET_PF_CONTINUE;
 }
 
-- 
2.42.0.rc1.204.g551eb34607-goog

