Return-Path: <linuxppc-dev+bounces-2020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC28C999028
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVm1D2Nz3bnV;
	Fri, 11 Oct 2024 05:26:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584768;
	cv=none; b=XoKYpIDZlEKgWrGtRAlfO26FhxjC6qpQB7FzEGCnrNg+hnanDi9xQzW7iRkSXg67Ue3qaNju4AfGu+fhqToQk1D+fb4d7WlYHi9GOmTD/Mhh6uv2zJ6UBp3Q/g+b6WXX+NJkYkYlAMo9wZHjWOu0Heb92bxiM1o8XpH0/VRzRk+ZKFZu11ngR9tcEXgHMBraGL5dkU8zAEuM6ucyAnXcPNmpdxi1FrYvwf+lld4d5qrzarvvLkw74/panyb5Px7GYchDHhrtCu/CZP9/1rTBL/QtBK/XnzR9GyVztEphAR0rNgxPfctDUA/3WyO7WfQDq2WMhxblvl0b6NJ4Nd8USQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584768; c=relaxed/relaxed;
	bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g0IKMoNu170cJwl8USYtcP8G7Y34UwNfBwDO5M5LpN4EB26ysx0Fv8Q12CbCVDgUujcval0M7qJxhRqvKH5zC8lJHQnjXXrwXp5BYjt2Pkr6tdTz0NrcLDVhtCqLCDaQKdkfzkNR8TlvVAQyIl+XkpAN+OOcudLnPHBOkTugGuyv0awAvpyVcfJmcVIJDHkgZBitBZvmDiKWIWlh2+UvZNcWBQ8Z5u3Y2oJjnFNZ5RmjcB9grGRGptwqWZ9mzri5hTiqgeExrB/dj/nV1GWIYiavNgcPUkLhxEOwwj+HKap3YiR+5B2hIQU81qEzVTtGfGWZnetLIFJfzP2KLCL2mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=R/6EWhGP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3pbwizwykdnmh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=R/6EWhGP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3pbwizwykdnmh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVl2f56z3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:07 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7cd9ac1fa89so1435648a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584765; x=1729189565; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
        b=R/6EWhGPsTL3G1J3ta1oM+xFKY8vNR49F+2xX+Pd6goIvhxwxY+iJg8sL/EbUBe2fK
         j7mN+ySmFAd9yxy3dw72KcNfdXMj8wkcRxa06n63I06A1IDuLbfGM5y9ujUQvXYt+sNW
         HzvH5jNwedNqpC/BsGfn6RaGp9zbyq38OFQHl0MqO7mTqwSfeago814N2Sy06QuMw+XW
         GtwUMpdDwppx2ON+ZvMj4Y7W8dvIm1ja8JicuicYOTVfSq+N4T166Ea9iqSYE5wATA5z
         MfVx746qXkp5Axv6SDZY/aQ8SlFcK24YzdL5ppC5uvp/Dpm5vdwHTNpptHqEei36apr8
         nqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584765; x=1729189565;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ByBZxBThzycQ9+5cWv7LHsEIs8PvxVG+sWS1etQw10Y=;
        b=FIjPAv5JFbfzl2LXBmh+63F0LyDbh8Qu5NJtLJki2rQX1C3tA1SrZrWgdcGlxmjYrn
         ZsmP7z4StZX/Hf1SvWqhxjM04PcvVr8k+Hwxe4InWapl2vYrr2lzkTTvdW10D728FWno
         Oz0X67OglVvcwZCLlWSElYHZiSBdZr8zUWc4XKKkZEHkVZYFO3GiKvBwDc1qVjYRpduw
         VtuTzIDVGUpf2u9peqjlcA8kVweeEIELUdHQHImx1R8XCfDW8XgxDa2uijpXZx/6zkHn
         5RPKO6NaKgr0eVWNkilFU52iHMVyj65PCxwwyDE/wE5bJY1DhlR7i/zDLR6ezVyDa1RE
         HUKA==
X-Forwarded-Encrypted: i=1; AJvYcCUH8LCILmZZj3Hf+812iQTaE7eD3i/sTVg5NIy7WDfBPTvU046xQqrMUXy/LwwgoFA5wCLu+twg5r7tCPY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8blJVbu7+YfGM27pUsTKY8i14dYHCvZbfaYOHJwSkRUj+VcyG
	yhKcl3XpYbApD3nEvSgtR+lcbjCfB6xF8U/Vlir6awIVJia+keKx2Yz7QLddt7WV9WVj1kSQ0OR
	mYg==
X-Google-Smtp-Source: AGHT+IE23QkhjcWr/3QASJ/S9+dapZUNy7Z4CCepJKqapzuUx8eBu6OhWGfM5laLrlsw47tRhKuFSYugMsQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:ff61:0:b0:7cb:c8c3:3811 with SMTP id
 41be03b00d2f7-7ea5356a658mr52a12.5.1728584764791; Thu, 10 Oct 2024 11:26:04
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:37 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-36-seanjc@google.com>
Subject: [PATCH v13 35/85] KVM: Disallow direct access (w/o mmu_notifier) to
 unpinned pfn by default
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Add an off-by-default module param to control whether or not KVM is allowed
to map memory that isn't pinned, i.e. that KVM can't guarantee won't be
freed while it is mapped into KVM and/or the guest.  Don't remove the
functionality entirely, as there are use cases where mapping unpinned
memory is safe (as defined by the platform owner), e.g. when memory is
hidden from the kernel and managed by userspace, in which case userspace
is already fully trusted to not muck with guest memory mappings.

But for more typical setups, mapping unpinned memory is wildly unsafe, and
unnecessary.  The APIs are used exclusively by x86's nested virtualization
support, and there is no known (or sane) use case for mapping PFN-mapped
memory a KVM guest _and_ letting the guest use it for virtualization
structures.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b845e9252633..6dcb4f0eed3e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -94,6 +94,13 @@ unsigned int halt_poll_ns_shrink =3D 2;
 module_param(halt_poll_ns_shrink, uint, 0644);
 EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
=20
+/*
+ * Allow direct access (from KVM or the CPU) without MMU notifier protecti=
on
+ * to unpinned pages.
+ */
+static bool allow_unsafe_mappings;
+module_param(allow_unsafe_mappings, bool, 0444);
+
 /*
  * Ordering of locks:
  *
@@ -2811,6 +2818,9 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pf=
n *kfp, struct page *page,
 	 * reference to such pages would cause KVM to prematurely free a page
 	 * it doesn't own (KVM gets and puts the one and only reference).
 	 * Don't allow those pages until the FIXME is resolved.
+	 *
+	 * Don't grab a reference for pins, callers that pin pages are required
+	 * to check refcounted_page, i.e. must not blindly release the pfn.
 	 */
 	if (map) {
 		pfn =3D map->pfn;
@@ -2929,6 +2939,14 @@ static int hva_to_pfn_remapped(struct vm_area_struct=
 *vma,
 	bool write_fault =3D kfp->flags & FOLL_WRITE;
 	int r;
=20
+	/*
+	 * Remapped memory cannot be pinned in any meaningful sense.  Bail if
+	 * the caller wants to pin the page, i.e. access the page outside of
+	 * MMU notifier protection, and unsafe umappings are disallowed.
+	 */
+	if (kfp->pin && !allow_unsafe_mappings)
+		return -EINVAL;
+
 	r =3D follow_pfnmap_start(&args);
 	if (r) {
 		/*
--=20
2.47.0.rc1.288.g06298d1525-goog


