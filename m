Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A73731FE1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 18:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhzTF1KTFz3cQ7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 04:43:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HGh6yZ7N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HGh6yZ7N; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhzSq21F4z30Qh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 04:43:23 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0CD564E86
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613756600;
 bh=9ZQwGLaYPkrXOVzuI0VciWU+Uo1DU/xW3whSZ5HINmk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HGh6yZ7NID3XgPMREEF5VIm9wIfDBNDVjiNnRNEgcbH5vxfbBGGdhXZOXFqvEM5rM
 5FUdlSFb730cVAt9R2dLQnRHBR3laNS/SXnaHm5hZorHrUX9YAY8vHi1HFJfaW4le8
 Q3CpRqbxZx4v/PGZM3xfQp+ZCC1in9JvXxVaWAadLoj+6g6kr08XVBwut5Fwr8HHjg
 HamXGa+otHHjkpeB+m2leeF7RtSemwauBlw8Bel8yZUkNk5z0Y6qVv3QU39tt39zfu
 qk1oLp1LJNjcDa3D0M/eZud/pbIFnVGWwYd/FhLxHbQNAOghAQef58hneFpekvF0Kv
 5+xRqS7Dxr6MQ==
Received: by mail-ej1-f41.google.com with SMTP id gg8so3607052ejb.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 09:43:20 -0800 (PST)
X-Gm-Message-State: AOAM532J8wA3pIlF5FoHDt67gRd2vkluIHMr3HsWFzmo3bI7OPvfSenT
 DsqfPODesmXxSC9tAh38BC8xC0Q3FxS36kgHJQ==
X-Google-Smtp-Source: ABdhPJxcICUZYnsBaO17c7tRJIQnUWZUA6Be0xcH29dRH1quw+gMuLN82dHPRL/jX9LwuQrHIGWEzfCQ/A/ze1lYfq4=
X-Received: by 2002:a17:906:d1d0:: with SMTP id
 bs16mr10016386ejb.468.1613756599194; 
 Fri, 19 Feb 2021 09:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20210218223305.2044-1-nramas@linux.microsoft.com>
 <c6490f6a126a2f10e3e3445b51ea552a26f896a9.camel@linux.ibm.com>
 <8b8c0b70-c7ab-33f3-b66c-9ea03388497b@linux.microsoft.com>
 <87k0r4yi4s.fsf@manicouagan.localdomain>
 <3ca0aa87-ca83-8024-4067-c2382a360db9@linux.microsoft.com>
 <CAL_JsqJiRV5xShOgso0PH2pFhv-yozay58i1uGQC0dJCVxkJPA@mail.gmail.com>
 <98a061d1-05ea-eff2-5c5c-a59f491fe924@linux.microsoft.com>
In-Reply-To: <98a061d1-05ea-eff2-5c5c-a59f491fe924@linux.microsoft.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 19 Feb 2021 11:43:06 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+R-zOT581_W0Ar5H58rfPnGiWeetoF_b+BaW7er22bPA@mail.gmail.com>
Message-ID: <CAL_Jsq+R-zOT581_W0Ar5H58rfPnGiWeetoF_b+BaW7er22bPA@mail.gmail.com>
Subject: Re: [PATCH] of: error: 'const struct kimage' has no member named
 'arch'
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
Cc: Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, Will Deacon <will@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 19, 2021 at 10:57 AM Lakshmi Ramasubramanian
<nramas@linux.microsoft.com> wrote:
>
> On 2/19/21 6:16 AM, Rob Herring wrote:
> > On Thu, Feb 18, 2021 at 8:53 PM Lakshmi Ramasubramanian
> > <nramas@linux.microsoft.com> wrote:
> >>
> >> On 2/18/21 5:13 PM, Thiago Jung Bauermann wrote:
> >>>
> >>> Lakshmi Ramasubramanian <nramas@linux.microsoft.com> writes:
> >>>
> >>>> On 2/18/21 4:07 PM, Mimi Zohar wrote:
> >>>>
> >>>> Hi Mimi,
> >>>>
> >>>>> On Thu, 2021-02-18 at 14:33 -0800, Lakshmi Ramasubramanian wrote:
> >>>>>> of_kexec_alloc_and_setup_fdt() defined in drivers/of/kexec.c builds
> >>>>>> a new device tree object that includes architecture specific data
> >>>>>> for kexec system call.  This should be defined only if the architecture
> >>>>>> being built defines kexec architecture structure "struct kimage_arch".
> >>>>>>
> >>>>>> Define a new boolean config OF_KEXEC that is enabled if
> >>>>>> CONFIG_KEXEC_FILE and CONFIG_OF_FLATTREE are enabled, and
> >>>>>> the architecture is arm64 or powerpc64.  Build drivers/of/kexec.c
> >>>>>> if CONFIG_OF_KEXEC is enabled.
> >>>>>>
> >>>>>> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> >>>>>> Fixes: 33488dc4d61f ("of: Add a common kexec FDT setup function")
> >>>>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>>>> ---
> >>>>>>     drivers/of/Kconfig  | 6 ++++++
> >>>>>>     drivers/of/Makefile | 7 +------
> >>>>>>     2 files changed, 7 insertions(+), 6 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> >>>>>> index 18450437d5d5..f2e8fa54862a 100644
> >>>>>> --- a/drivers/of/Kconfig
> >>>>>> +++ b/drivers/of/Kconfig
> >>>>>> @@ -100,4 +100,10 @@ config OF_DMA_DEFAULT_COHERENT
> >>>>>>             # arches should select this if DMA is coherent by default for OF devices
> >>>>>>             bool
> >>>>>>     +config OF_KEXEC
> >>>>>> +  bool
> >>>>>> +  depends on KEXEC_FILE
> >>>>>> +  depends on OF_FLATTREE
> >>>>>> +  default y if ARM64 || PPC64
> >>>>>> +
> >>>>>>     endif # OF
> >>>>>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> >>>>>> index c13b982084a3..287579dd1695 100644
> >>>>>> --- a/drivers/of/Makefile
> >>>>>> +++ b/drivers/of/Makefile
> >>>>>> @@ -13,11 +13,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
> >>>>>>     obj-$(CONFIG_OF_RESOLVE)  += resolver.o
> >>>>>>     obj-$(CONFIG_OF_OVERLAY) += overlay.o
> >>>>>>     obj-$(CONFIG_OF_NUMA) += of_numa.o
> >>>>>> -
> >>>>>> -ifdef CONFIG_KEXEC_FILE
> >>>>>> -ifdef CONFIG_OF_FLATTREE
> >>>>>> -obj-y     += kexec.o
> >>>>>> -endif
> >>>>>> -endif
> >>>>>> +obj-$(CONFIG_OF_KEXEC) += kexec.o
> >>>>>>       obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> >>>>> Is it possible to reuse CONFIG_HAVE_IMA_KEXEC here?
> >>>>>
> >>>>
> >>>> For ppc64 CONFIG_HAVE_IMA_KEXEC is selected when CONFIG_KEXEC_FILE is enabled.
> >>>> So I don't see a problem in reusing CONFIG_HAVE_IMA_KEXEC for ppc.
> >>>>
> >>>> But for arm64, CONFIG_HAVE_IMA_KEXEC is enabled in the final patch in the patch
> >>>> set (the one for carrying forward IMA log across kexec for arm64). arm64 calls
> >>>> of_kexec_alloc_and_setup_fdt() prior to enabling CONFIG_HAVE_IMA_KEXEC and hence
> >>>> breaks the build for arm64.
> >>>
> >>> One problem is that I believe that this patch won't placate the robot,
> >>> because IIUC it generates config files at random and this change still
> >>> allows hppa and s390 to enable CONFIG_OF_KEXEC.
> >>
> >> I enabled CONFIG_OF_KEXEC for s390. With my patch applied,
> >> CONFIG_OF_KEXEC is removed. So I think the robot enabling this config
> >> would not be a problem.
> >>
> >>>
> >>> Perhaps a new CONFIG_HAVE_KIMAGE_ARCH option? Not having that option
> >>> would still allow building kexec.o, but would be used inside kexec.c to
> >>> avoid accessing kimage.arch members.
> >>>
> >>
> >> I think this is a good idea - a new CONFIG_HAVE_KIMAGE_ARCH, which will
> >> be selected by arm64 and ppc for now. I tried this, and it fixes the
> >> build issue.
> >>
> >> Although, the name for the new config can be misleading since PARISC,
> >> for instance, also defines "struct kimage_arch". Perhaps,
> >> CONFIG_HAVE_ELF_KIMAGE_ARCH since of_kexec_alloc_and_setup_fdt() is
> >> accessing ELF specific fields in "struct kimage_arch"?
> >>
> >> Rob/Mimi - please let us know which approach you think is better.
> >
> > I'd just move the fields to kimage.
> >
>
> I think Mimi's suggestion to use CONFIG_HAVE_IMA_KEXEC for building
> drivers/of/kexec.c would work and also avoid the bisect issue if we do
> the following:

That seems wrong given only a portion of the file depends on IMA. And
it reduces our compile coverage.

>   - In the patch set for carrying forward the IMA log on kexec, move the
> following patch to a later point in the set
>
> "[PATCH v18 04/11] arm64: Use common of_kexec_alloc_and_setup_fdt()"
>
> and merge the above patch with the following patch
> "[PATCH v18 11/11] arm64: Enable passing IMA log to next kernel on kexec"

If we're doing all that, then I'm dropping all this for 5.12.

Rob
