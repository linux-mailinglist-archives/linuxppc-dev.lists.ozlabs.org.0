Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BA1365980
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:06:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPkV05gbPz30Fc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:06:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fl2BhKlm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fl2BhKlm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPkTZ2Yy7z2xfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 23:06:26 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCAB7613C7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618923982;
 bh=CfqZXCjLwBP0f+W+AaxrMRRsIoRAmM/sskwxdAjlPg4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fl2BhKlmGiK4e6nKiiMFrM0Am2XibPm4gRwNRXM4/rt/hVLsNNHFFbLtAts6K6VEA
 XQhRMvgbHpod0W3WZWrsojXlpLOKgoSIS5BkD0c/EchX/hFb6tnL24D0SgSdbzQwfO
 PE7iHjNRHfJoA4SWBbLwKrO/OdAq/qhUxFlMKlF4pNg3j+6+OCdVDc9Bl9IKBk4yV9
 6Y2cWVUsp2pDXunfMJN0Eq9xF2iatkemFq1l0pcEF4RtFGrzQQ1kDs/hseaSw+0qJ2
 1upPGdMSHOXKIbVrDDcyKqSSpORq9yfflO0Brjyf31HjasrYA2GKbRQYYTy0u8dLcw
 FqLX1mHvWq3pg==
Received: by mail-qk1-f174.google.com with SMTP id h13so20489384qka.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 06:06:22 -0700 (PDT)
X-Gm-Message-State: AOAM531SCZ2nwWHZADeJSFlCaTwpDSjNRTxDShYZvc9h+lkmSmyNxApC
 tUwBkOFq6ivuU/NiR87YYt01+kQcKzP0k/P7Zw==
X-Google-Smtp-Source: ABdhPJyxRmeQRtP34kVgJ1VcAt/5/6Rr319QqoBi2Fg/d6DssQfy2PWRrBwLl1DEPzI5MZkaE9xhv2zuR2uj7FpF9lM=
X-Received: by 2002:a05:620a:1118:: with SMTP id
 o24mr9366188qkk.128.1618923981791; 
 Tue, 20 Apr 2021 06:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210415191437.20212-1-nramas@linux.microsoft.com>
 <4edb1433-4d1e-5719-ec9c-fd232b7cf71f@linux.microsoft.com>
 <87eefag241.fsf@linkitivity.dja.id.au> <87tuo6eh0j.fsf@mpe.ellerman.id.au>
 <2817d674-d420-580f-a0c1-b842da915a80@linux.microsoft.com>
 <87pmypdf93.fsf@mpe.ellerman.id.au> <20210420050015.GA1959@kadam>
 <b84c76d6-2be8-77a4-3c0f-ad8657c0e508@linux.microsoft.com>
In-Reply-To: <b84c76d6-2be8-77a4-3c0f-ad8657c0e508@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Apr 2021 08:06:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLS9Wu_+_S-2wwMb3Chd_8RYAtFe_uLh5tjj_sAkTgRJA@mail.gmail.com>
Message-ID: <CAL_JsqLS9Wu_+_S-2wwMb3Chd_8RYAtFe_uLh5tjj_sAkTgRJA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: Initialize local variable fdt to NULL in
 elf64_load()
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 20, 2021 at 12:20 AM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On 4/19/21 10:00 PM, Dan Carpenter wrote:
> > On Tue, Apr 20, 2021 at 09:30:16AM +1000, Michael Ellerman wrote:
> >> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> >>> On 4/16/21 2:05 AM, Michael Ellerman wrote:
> >>>
> >>>> Daniel Axtens <dja@axtens.net> writes:
> >>>>>> On 4/15/21 12:14 PM, Lakshmi Ramasubramanian wrote:
> >>>>>>
> >>>>>> Sorry - missed copying device-tree and powerpc mailing lists.
> >>>>>>
> >>>>>>> There are a few "goto out;" statements before the local variable "fdt"
> >>>>>>> is initialized through the call to of_kexec_alloc_and_setup_fdt() in
> >>>>>>> elf64_load(). This will result in an uninitialized "fdt" being passed
> >>>>>>> to kvfree() in this function if there is an error before the call to
> >>>>>>> of_kexec_alloc_and_setup_fdt().
> >>>>>>>
> >>>>>>> Initialize the local variable "fdt" to NULL.
> >>>>>>>
> >>>>> I'm a huge fan of initialising local variables! But I'm struggling to
> >>>>> find the code path that will lead to an uninit fdt being returned...
> >>>>>
> >>>>> The out label reads in part:
> >>>>>
> >>>>>   /* Make kimage_file_post_load_cleanup free the fdt buffer for us. */
> >>>>>   return ret ? ERR_PTR(ret) : fdt;
> >>>>>
> >>>>> As far as I can tell, any time we get a non-zero ret, we're going to
> >>>>> return an error pointer rather than the uninitialised value...
> >>>
> >>> As Dan pointed out, the new code is in linux-next.
> >>>
> >>> I have copied the new one below - the function doesn't return fdt, but
> >>> instead sets it in the arch specific field (please see the link to the
> >>> updated elf_64.c below).
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/tree/arch/powerpc/kexec/elf_64.c?h=for-next
> >>>
> >>>>>
> >>>>> (btw, it does look like we might leak fdt if we have an error after we
> >>>>> successfully kmalloc it.)
> >>>>>
> >>>>> Am I missing something? Can you link to the report for the kernel test
> >>>>> robot or from Dan?
> >>>
> >>> /*
> >>>            * Once FDT buffer has been successfully passed to
> >>> kexec_add_buffer(),
> >>>            * the FDT buffer address is saved in image->arch.fdt. In that
> >>> case,
> >>>            * the memory cannot be freed here in case of any other error.
> >>>            */
> >>>           if (ret && !image->arch.fdt)
> >>>                   kvfree(fdt);
> >>>
> >>>           return ret ? ERR_PTR(ret) : NULL;
> >>>
> >>> In case of an error, the memory allocated for fdt is freed unless it has
> >>> already been passed to kexec_add_buffer().
> >>
> >> It feels like the root of the problem is that the kvfree of fdt is in
> >> the wrong place. It's only allocated later in the function, so the error
> >> path should reflect that. Something like the patch below.
> >>
> >> cheers
> >>
> >>
> >> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> >> index 5a569bb51349..02662e72c53d 100644
> >> --- a/arch/powerpc/kexec/elf_64.c
> >> +++ b/arch/powerpc/kexec/elf_64.c
> >> @@ -114,7 +114,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
> >>      ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
> >>                                initrd_len, cmdline);
> >>      if (ret)
> >> -            goto out;
> >> +            goto out_free_fdt;
> >>
> >>      fdt_pack(fdt);
> >>
> >> @@ -125,7 +125,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
> >>      kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> >>      ret = kexec_add_buffer(&kbuf);
> >>      if (ret)
> >> -            goto out;
> >> +            goto out_free_fdt;
> >>
> >>      /* FDT will be freed in arch_kimage_file_post_load_cleanup */
> >>      image->arch.fdt = fdt;
> >> @@ -140,18 +140,14 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
> >>      if (ret)
> >>              pr_err("Error setting up the purgatory.\n");
> >>
> >> +    goto out;
> >
> > This will leak.  It would need to be something like:
> >
> >       if (ret) {
> >               pr_err("Error setting up the purgatory.\n");
> >               goto out_free_fdt;
> >       }
> Once "fdt" buffer is successfully passed to kexec_add_buffer() it cannot
> be freed here - it will be freed when the kexec cleanup function is called.

That may be the case currently, but really if a function returns an
error it should have undone anything it did like memory allocations. I
don't think you should do that to fix this issue, but it would be a
good clean-up.

Rob
