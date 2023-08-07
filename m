Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D07735AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 03:07:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rHwQlDZD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKZlz2TRvz3cV5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:07:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rHwQlDZD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3nnvrzaskdakjltn0un72wppxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKXKt4p99z3dB3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:17:53 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-585fb08172bso58801557b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691450271; x=1692055071;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O6ADKvrj6NKuTG8K0De5TN5TBG7YUj/XYIH2D8dp568=;
        b=rHwQlDZDzym7DX7JPTeHFjVedtFRUtAMiKX2VU1EjC3DDPS+GKehZ420ny5GaoR1ql
         DJZSgsfTVJl3vHuTgVdsaoMbYWxHvGzjOU0b7lDeewUWBnmHCx4rEyCV+u7mMO4LYlh5
         X/eCH8/74nhTzgvQgUg3W7ew8mnRsIapj5OejxlfXYe7B7oIEIOpl62BZW0oI322fnfO
         0Voq/X8G0TvKlJzbTSRNfra4zE+z5UETF5mjVUp3srNKrf5MdQ1+J9GDHb9R/7Klrk79
         sQ7ciz1qdHaVGW7a/1FblT/tag2WVBkp7Xupx92Rz9XtAvp0t79KGYAXs3GugjDd4DWz
         Be4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691450271; x=1692055071;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6ADKvrj6NKuTG8K0De5TN5TBG7YUj/XYIH2D8dp568=;
        b=gzZwvaktQmw8FlJwNSiAq7HEjgAc00+rkgCjzUwjJc1kMi/xPr6VNuKDoFoBNhwjJT
         TRHpG3MzGigRIj/8W8bQ/eU2Bj4sr6ihlwGFnEFeNhLNWsbtNxoi43JtfCxB03f9V418
         aQQa6HHSbDDi47wTAkcVRqEDebF67CxEEvWJGxzwaEyiSKPIq8tktLgiM6TZRzwgHrOo
         1MxcNboNZBf59botuEVT+fFo4vnOfpWK6/D+HaKm+tpesD24BxFENi2LVsOgHoqwE+7R
         2msJIASIklpFjJs5mxKoGYBGIqZJKhbFGn2ExVWX8mGsBzSTeK5OKorXxyx+QUUy3HWU
         GMAQ==
X-Gm-Message-State: AOJu0YxT+0Prin5pyL++vy2r6rvlvBMG/zTQ8x3aG3K4zcf1BqWi0nVH
	hymz+v3O3SdgtrT2Z/4la7+Cnn8tFV1pKfg7+w==
X-Google-Smtp-Source: AGHT+IGSgl+5gSINX//lCEXF+ifa5KuvDte/Vqkh35HGceplFQQ8fBj/FZjwVUabZs4KoYQYU07HEfGWMf/BZUZt+g==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:ce50:0:b0:d4f:d7a5:ba3b with SMTP
 id x77-20020a25ce50000000b00d4fd7a5ba3bmr34924ybe.8.1691450270921; Mon, 07
 Aug 2023 16:17:50 -0700 (PDT)
Date: Mon, 07 Aug 2023 23:17:49 +0000
In-Reply-To: <20230718234512.1690985-28-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:10 -0700)
Mime-Version: 1.0
Message-ID: <diqzr0oe30iq.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 27/29] KVM: selftests: Expand set_memory_region_test
 to validate guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Aug 2023 11:05:33 +1000
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> From: Chao Peng <chao.p.peng@linux.intel.com>
>
> Expand set_memory_region_test to exercise various positive and negative
> testcases for private memory.
>
>  - Non-guest_memfd() file descriptor for private memory
>  - guest_memfd() from different VM
>  - Overlapping bindings
>  - Unaligned bindings
>
> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> [sean: trim the testcases to remove duplicate coverage]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 10 ++
>  .../selftests/kvm/set_memory_region_test.c    | 99 +++++++++++++++++++
>  2 files changed, 109 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 334df27a6f43..39b38c75b99c 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -789,6 +789,16 @@ static inline struct kvm_vm *vm_create_barebones(void)
>  	return ____vm_create(VM_SHAPE_DEFAULT);
>  }
>  

> <snip>

> +
> +static void test_add_private_memory_region(void)
> +{
> +	struct kvm_vm *vm, *vm2;
> +	int memfd, i;
> +
> +	pr_info("Testing ADD of KVM_MEM_PRIVATE memory regions\n");
> +
> +	vm = vm_create_barebones_protected_vm();
> +
> +	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
> +	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
> +
> +	memfd = kvm_memfd_alloc(MEM_REGION_SIZE, false);
> +	test_invalid_guest_memfd(vm, vm->fd, 0, "Regular memfd() should fail");

This should be

test_invalid_guest_memfd(vm, memfd, 0, "Regular memfd() should fail");

> +	close(memfd);
> +
> +	vm2 = vm_create_barebones_protected_vm();
> +	memfd = vm_create_guest_memfd(vm2, MEM_REGION_SIZE, 0);
> +	test_invalid_guest_memfd(vm, memfd, 0, "Other VM's guest_memfd() should fail");
> +
> +	vm_set_user_memory_region2(vm2, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
> +				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
> +	close(memfd);
> +	kvm_vm_free(vm2);
> +
> +	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
> +	for (i = 1; i < PAGE_SIZE; i++)
> +		test_invalid_guest_memfd(vm, memfd, i, "Unaligned offset should fail");
> +
> +	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
> +				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
> +	close(memfd);
> +
> +	kvm_vm_free(vm);
> +}
> +

> <snip>
