Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC603B2C85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 12:35:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9c333KdPz3c68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 20:35:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ItVpaR72;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ItVpaR72; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9c2P1D1Zz3bxW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 20:34:36 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so3196108pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ISlLS/Bnqpf/oAWEGOJgKBZ0Rb18u3bU0Ep0kv2LMg0=;
 b=ItVpaR72A3eWg+6QNdd9RNw76aFcKOXvgi86A4U+ygjRobuSVtqGLn83lJQMbfCPA4
 LQIa3P9bWqZxWn65q97p0mTXZfMJxza4XBkddIpoDzA0Y1gz2b4OTCDChEW1fNnXNMtx
 Fd/HR/h+M9YqDeioWNf5AArKjGRkQ+rrWucptSeSf/UUf6QUwL4Nowo/4rEimVbdxS4Q
 CrrkCNn+4rsxvoMWh2fX66Avx4PzjnR2opDju0qKu/sbanWcGLqwESvvdl5Yw6PwyCya
 zQM4h5g6tjIbnWhNNgTE1fjofoOSBjtXdTRyzTMD0NSsHlc5YkGJ7hehN9KlI5q5bxjS
 Pecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ISlLS/Bnqpf/oAWEGOJgKBZ0Rb18u3bU0Ep0kv2LMg0=;
 b=X+cxMs8XkH8M620Xa8tt+CgYX0PfeOknXpqWWIBi/SzqMqBkmkDt3vnOg6rTZJc3f6
 oDn4/gnG/GhoStjWgx/6UQNoyRj8Y12uGM6Xh9tU7wyBteXh7z4lNLSDwp23UIdR/dKy
 LBtK107oMp4TOQYKQjvz7R0d8Vu2mGNhBvzHW3Cx4Zc/80qLEQjeqXahcsLG2J7gm50t
 O9ngZ8W6MUOZ08dP27wk2LMjox3MBBlWyTd90QkfQBNrbTMe+Cx8s6x8Q30FIGtm6ZzP
 11eDtfZI4JkFSUudP7RmnIK4NIEDylN10MIIF9c74VDtNOBsASIRTIJd5VuZZTIECdlN
 Qpww==
X-Gm-Message-State: AOAM530apY7cPRUkh6lMevFPbupnWLXOmvrbsbupoKPVah9zvPYc60u/
 cvrhCp6hyCHxfvlCOPdKcwM=
X-Google-Smtp-Source: ABdhPJy6kajrzF0OadUDC6nHAS6U7gmSDYSh4DBdORcOqITOBjGnDhRDrYwGVGZv+udz0pGSetXg8w==
X-Received: by 2002:a17:90b:4ac6:: with SMTP id
 mh6mr15043416pjb.210.1624530871905; 
 Thu, 24 Jun 2021 03:34:31 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id k63sm7664839pjh.13.2021.06.24.03.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:34:31 -0700 (PDT)
Date: Thu, 24 Jun 2021 20:34:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-1-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624530624.8jff1f4u11.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Stevens <stevensd@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Morse <james.morse@arm.com>, kvm-ppc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
> KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
> follow_pte in gfn_to_pfn. However, the resolved pfns may not have
> assoicated struct pages, so they should not be passed to pfn_to_page.
> This series removes such calls from the x86 and arm64 secondary MMU. To
> do this, this series modifies gfn_to_pfn to return a struct page in
> addition to a pfn, if the hva was resolved by gup. This allows the
> caller to call put_page only when necessated by gup.
>=20
> This series provides a helper function that unwraps the new return type
> of gfn_to_pfn to provide behavior identical to the old behavior. As I
> have no hardware to test powerpc/mips changes, the function is used
> there for minimally invasive changes. Additionally, as gfn_to_page and
> gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
> easily changed over to only use pfns.
>=20
> This addresses CVE-2021-22543 on x86 and arm64.

Does this fix the problem? (untested I don't have a POC setup at hand,
but at least in concept)

I have no problem with improving the API and probably in the direction=20
of your series is good. But there seems to be a lot of unfixed arch code=20
and broken APIs remaining left to do after your series too. This might=20
be most suitable to backport and as a base for your series that can take
more time to convert to new APIs.

Thanks,
Nick

---

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6a6bc7af0e28..e208c279d903 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2104,13 +2104,21 @@ static int hva_to_pfn_remapped(struct vm_area_struc=
t *vma,
 	 * Whoever called remap_pfn_range is also going to call e.g.
 	 * unmap_mapping_range before the underlying pages are freed,
 	 * causing a call to our MMU notifier.
+	 *
+	 * Certain IO or PFNMAP mappings can be backed with valid
+	 * struct pages, but be allocated without refcounting e.g.,
+	 * tail pages of non-compound higher order allocations, which
+	 * would then underflow the refcount when the caller does the
+	 * required put_page. Don't allow those pages here.
 	 */=20
-	kvm_get_pfn(pfn);
+	if (!kvm_try_get_pfn(pfn))
+		r =3D -EFAULT;
=20
 out:
 	pte_unmap_unlock(ptep, ptl);
 	*p_pfn =3D pfn;
-	return 0;
+
+	return r;
 }
=20
 /*
@@ -2487,6 +2495,13 @@ void kvm_set_pfn_accessed(kvm_pfn_t pfn)
 }
 EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
=20
+static int kvm_try_get_pfn(kvm_pfn_t pfn)
+{
+	if (kvm_is_reserved_pfn(pfn))
+		return 1;
+	return get_page_unless_zero(pfn_to_page(pfn));
+}
+
 void kvm_get_pfn(kvm_pfn_t pfn)
 {
 	if (!kvm_is_reserved_pfn(pfn))
