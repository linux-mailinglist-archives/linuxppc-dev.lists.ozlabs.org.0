Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A10781598
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 01:02:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gS9arkhq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSHSx2HJGz3cWG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 09:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=gS9arkhq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3spjfzaykdouzlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSHRz4dNGz2yPq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 09:01:33 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d745094c496so1166723276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 16:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692399688; x=1693004488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=usNReEG1yhZ2OoI1bkcsHZxi8vJT2uNEbLMV9P1BADc=;
        b=gS9arkhq2BQM5wyG90faWG4pywmMu5sfjHEWd04bKy84agcqatheT6YSVqsnMAhJXs
         7Ey6R/IsFpbuJAgflRTfCsGQSeE7z8aCnsHRbxEkKBK/PAH7FMZgZEavx3BeBXM+3P+2
         Plq9VhZaRy5PbOx8EDNA03ytcClkYRB9Plt+OD+UltS53ZO5IOuVPHa/Yt8AOkDtjpGf
         J0ReekJEPtY7ifZaoOCUWVj24ZOCPfNYabKI/jnVy+VGWVTelTn6BvdxHdiQrBc+k/kc
         BoETN+5H+qyvqSzJ4nWEMxKRREF2ybV9p6gaBfB8lx1V/iAPfjWa3WjZDIbTKQp0bm0Z
         IJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692399688; x=1693004488;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=usNReEG1yhZ2OoI1bkcsHZxi8vJT2uNEbLMV9P1BADc=;
        b=il7euFWf5CQNBLqxn3M+KEc5pJmgyE4dRlHoTekm2Ujvxp7rQlbNTBGLSRqd7x58DD
         0FFhZDvdJmE38LXE+p4ZdsIkvW4X34Th68V8Oa04Mhv0LP9ZhH1jgLlzDlEk71MlpM9b
         2SLu1QR8M66wZGmCihk5drxGEExGa1KBWhRCOqRwLpBZ2n2pkUdQ3KS8t/BsIcM5zi9C
         wfwuzWmCwB+lWpUtrEJ3GP+Cv/8nS1LdW2RNDdv+3k69jBz5PEBOx0reE3m0fP/gFzie
         vtRiXes9NZ240hzoY0cDOThchvOqsVDvcK7QrNYnVIVGUrXFMuVZp+lv0AOBAYtpYcAv
         i57g==
X-Gm-Message-State: AOJu0YyDvMbPjxpE3j7UxtulKXYhSzuZdu5R+1d4Z32rzc3laywB8E3D
	IRhT/LMutRyLCH/FVbGRI3emby3Y1fo=
X-Google-Smtp-Source: AGHT+IHoaUgHi5iMS/0Xt5cvUarFzMCVBDWHJfa8lAvVIAai8wyXyMLBOgyLMJxxiXlZfzlnoz9PoDeIZVI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:a8a:b0:d74:347:1e3 with SMTP id
 cd10-20020a0569020a8a00b00d74034701e3mr5755ybb.9.1692399688376; Fri, 18 Aug
 2023 16:01:28 -0700 (PDT)
Date: Fri, 18 Aug 2023 16:01:26 -0700
In-Reply-To: <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
Mime-Version: 1.0
References: <20230718234512.1690985-29-seanjc@google.com> <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <ZN/4RjDsBLf0FB98@google.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 07, 2023, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Add a selftest to verify the basic functionality of guest_memfd():
> >
> > <snip>
> 
> Here's one more test:

First off, thank you!  I greatly appreciate all the selftests work you (and
others!) have been doing.

For v2, can you please post a standalone patch?  My workflow barfs on unrelated,
inlined patches.  I'm guessing I can get b4 to play nice, but it's easier to just
yell at people :-)

> >From 72dc6836f01bdd613d64d4c6a4f2af8f2b777ba2 Mon Sep 17 00:00:00 2001
> From: Ackerley Tng <ackerleytng@google.com>
> Date: Tue, 1 Aug 2023 18:02:50 +0000
> Subject: [PATCH] KVM: selftests: Add tests - invalid inputs for
>  KVM_CREATE_GUEST_MEMFD
> 
> Test that invalid inputs for KVM_CREATE_GUEST_MEMFD, such as
> non-page-aligned page size and invalid flags, are rejected by the
> KVM_CREATE_GUEST_MEMFD with EINVAL
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  tools/testing/selftests/kvm/guest_memfd_test.c  | 17 +++++++++++++++++
>  .../selftests/kvm/include/kvm_util_base.h       | 11 +++++++++--
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> index eb93c608a7e0..ad20f11b2d2c 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -90,6 +90,21 @@ static void test_fallocate(int fd, size_t page_size, size_t total_size)
>  	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
>  }
>  
> +static void test_create_guest_memfd_invalid(struct kvm_vm *vm, size_t page_size)
> +{
> +	int fd;
> +
> +	/* Non-page-aligned page_size */

Instead of adding a comment, use the message from TEST_ASSERT() to communicate
that information to the reader *and* to anyone that encounters failures.

> +	fd = __vm_create_guest_memfd(vm, 1, 0);

ioctls() are fast.  Rather than hardcode one value, iterate over a range of
values, e.g.

	for (size = 0; size < page_size; size++) {
		r = __vm_create_guest_memfd(vm, size, 0);
		TEST_ASSERT(r && errno == EINVAL,
			    "Informative error message...);
	}
		
> +	ASSERT_EQ(errno, EINVAL);
> +
> +	/* Invalid flags */
> +	fd = __vm_create_guest_memfd(vm, page_size, 99);
> +	ASSERT_EQ(fd, -1);
> +	ASSERT_EQ(errno, EINVAL);

And then same thing here.  Then you can use the legal flags to determine what is
and isn't valid, instead of using a completely arbitrary magic number.
