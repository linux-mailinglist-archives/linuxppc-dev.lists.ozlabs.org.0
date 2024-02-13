Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC51853205
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 14:34:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NjW66I/R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ2P56G0Bz30dn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 00:34:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NjW66I/R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ2NK2wl0z3c6Q
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 00:33:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2D0ACE1BCD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 13:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D4AC43609
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707831228;
	bh=19Y5ahn44aBoKaRpMWdk3LKXXQE0FO77x5Y2b3wdKaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NjW66I/RyK5Frul2lsV16RtBUelOEL2efXL0HqOYl4F16m7wLEGAHyV4kBDhXEsiT
	 gAM9cdHcPSKpwelVKU8x0KBBx3UsrmVTKSa1jgCnIy87XFxBbUd0jdRBp85YdpUu0X
	 0MyUq2MKRjgo4BqRtwj16TRwyGe8EifSBGdTKzooV6APrXmVrhhG8N/8SsZL5S2Hk7
	 pCHfsKiZmZJBgKaNtdny7oGew3cHzeUe3G9H32susD2FhAS1sro8Ox9Hfa1B6eBDiL
	 DJ4SXJmH97QizhHKLRswJkmfT482ugHVyyLl8iQxEI+0+bdR+MlxIIUxAFDU9LUL8v
	 1NVgpw3xO/rww==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51181d8f52fso1160797e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:33:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfi46H8rgs66uj86h32WUZ0LZSvC0K6cqYV6fbVPbaqdsl+2TanouvExlKyhWbNPrwKBoSC1oEpH85dR89J1/+N58STn+GLNp7Y+OV9g==
X-Gm-Message-State: AOJu0YyzYx/PSeUxBsWoZotnXIHrrEG7Plzm8UX5m6bfPWVHGZeHjXod
	GfMVNvujzuJUgJc5Bo+q1zOQ4gzz8O4Bjta0QnU2MrvdCj12TV/H+ev+dDZwGQ0KxkhluMCNPRt
	sQXGTJ30f0kR0pXxlIEydBl4rwF0=
X-Google-Smtp-Source: AGHT+IG4e5NfncV3RTrOH8gQhvaJJElu+/4o3kIRvOaccoBXLTJkqtjEBr950PGwXa4lfyB9fWPqF6zsh0CZ/o4MARQ=
X-Received: by 2002:ac2:4318:0:b0:511:7b36:933e with SMTP id
 l24-20020ac24318000000b005117b36933emr5957570lfh.58.1707831226284; Tue, 13
 Feb 2024 05:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com> <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com> <aa232591-e0c8-422d-a641-fa555914c5f0@arm.com>
 <64395ae4-3a7d-45dd-8f1d-ea6b232829c5@arm.com> <d6ce951f-f83b-4a5a-a814-311f2d8b01e4@arm.com>
 <41499621-482f-455b-9f68-b43ea8052557@redhat.com> <1d302d7a-50ab-4ab4-b049-75ed4a71a87d@arm.com>
 <99e2a92c-f2a2-4e1e-8ce2-08caae2cb7e4@redhat.com> <dce5f80d-942f-439c-a549-5290666464ca@arm.com>
In-Reply-To: <dce5f80d-942f-439c-a549-5290666464ca@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 13 Feb 2024 14:33:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEVf1m4hVXORc6t9ytAOb75KZLcW-OJ6999VaKbkVdQ3A@mail.gmail.com>
Message-ID: <CAMj1kXEVf1m4hVXORc6t9ytAOb75KZLcW-OJ6999VaKbkVdQ3A@mail.gmail.com>
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
To: Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Feb 2024 at 14:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 13/02/2024 13:13, David Hildenbrand wrote:
> > On 13.02.24 14:06, Ryan Roberts wrote:
> >> On 13/02/2024 12:19, David Hildenbrand wrote:
> >>> On 13.02.24 13:06, Ryan Roberts wrote:
> >>>> On 12/02/2024 20:38, Ryan Roberts wrote:
> >>>>> [...]
> >>>>>
> >>>>>>>>> +static inline bool mm_is_user(struct mm_struct *mm)
> >>>>>>>>> +{
> >>>>>>>>> +    /*
> >>>>>>>>> +     * Don't attempt to apply the contig bit to kernel mapping=
s, because
> >>>>>>>>> +     * dynamically adding/removing the contig bit can cause pa=
ge faults.
> >>>>>>>>> +     * These racing faults are ok for user space, since they g=
et
> >>>>>>>>> serialized
> >>>>>>>>> +     * on the PTL. But kernel mappings can't tolerate faults.
> >>>>>>>>> +     */
> >>>>>>>>> +    return mm !=3D &init_mm;
> >>>>>>>>> +}
> >>>>>>>>
> >>>>>>>> We also have the efi_mm as a non-user mm, though I don't think w=
e
> >>>>>>>> manipulate
> >>>>>>>> that while it is live, and I'm not sure if that needs any specia=
l handling.
> >>>>>>>
> >>>>>>> Well we never need this function in the hot (order-0 folio) path,=
 so I
> >>>>>>> think I
> >>>>>>> could add a check for efi_mm here with performance implication. I=
t's
> >>>>>>> probably
> >>>>>>> safest to explicitly exclude it? What do you think?
> >>>>>>
> >>>>>> Oops: This should have read "I think I could add a check for efi_m=
m here
> >>>>>> *without* performance implication"
> >>>>>
> >>>>> It turns out that efi_mm is only defined when CONFIG_EFI is enabled=
. I can do
> >>>>> this:
> >>>>>
> >>>>> return mm !=3D &init_mm && (!IS_ENABLED(CONFIG_EFI) || mm !=3D &efi=
_mm);
> >>>>>
> >>>>> Is that acceptable? This is my preference, but nothing else outside=
 of efi
> >>>>> references this symbol currently.
> >>>>>
> >>>>> Or perhaps I can convince myself that its safe to treat efi_mm like=
 userspace.
> >>>>> There are a couple of things that need to be garanteed for it to be=
 safe:
> >>>>>
> >>>>>     - The PFNs of present ptes either need to have an associated st=
ruct
> >>>>> page or
> >>>>>       need to have the PTE_SPECIAL bit set (either pte_mkspecial() =
or
> >>>>>       pte_mkdevmap())
> >>>>>
> >>>>>     - Live mappings must either be static (no changes that could ca=
use
> >>>>> fold/unfold
> >>>>>       while live) or the system must be able to tolerate a temporar=
y fault
> >>>>>
> >>>>> Mark suggests efi_mm is not manipulated while live, so that meets t=
he latter
> >>>>> requirement, but I'm not sure about the former?
> >>>>
> >>>> I've gone through all the efi code, and conclude that, as Mark sugge=
sts, the
> >>>> mappings are indeed static. And additionally, the ptes are populated=
 using only
> >>>> the _private_ ptep API, so there is no issue here. As just discussed=
 with Mark,
> >>>> my prefereence is to not make any changes to code, and just add a co=
mment
> >>>> describing why efi_mm is safe.
> >>>>
> >>>> Details:
> >>>>
> >>>> * Registered with ptdump
> >>>>       * ptep_get_lockless()
> >>>> * efi_create_mapping -> create_pgd_mapping =E2=80=A6 -> init_pte:
> >>>>       * __ptep_get()
> >>>>       * __set_pte()
> >>>> * efi_memattr_apply_permissions -> efi_set_mapping_permissions =E2=
=80=A6 ->
> >>>> set_permissions
> >>>>       * __ptep_get()
> >>>>       * __set_pte()
> >>>
> >>> Sound good. We could add some VM_WARN_ON if we ever get the efi_mm vi=
a the
> >>> "official" APIs.
> >>
> >> We could, but that would lead to the same linkage issue, which I'm try=
ing to
> >> avoid in the first place:
> >>
> >> VM_WARN_ON(IS_ENABLED(CONFIG_EFI) && mm =3D=3D efi_mm);
> >>
> >> This creates new source code dependencies, which I would rather avoid =
if
> >> possible.
> >
> > Just a thought, you could have a is_efi_mm() function that abstracts al=
l that.
> >
> > diff --git a/include/linux/efi.h b/include/linux/efi.h
> > index c74f47711f0b..152f5fa66a2a 100644
> > --- a/include/linux/efi.h
> > +++ b/include/linux/efi.h
> > @@ -692,6 +692,15 @@ extern struct efi {
> >
> >  extern struct mm_struct efi_mm;
> >
> > +static inline void is_efi_mm(struct mm_struct *mm)
> > +{
> > +#ifdef CONFIG_EFI
> > +       return mm =3D=3D &efi_mm;
> > +#else
> > +       return false;
> > +#endif
> > +}
> > +
> >  static inline int
> >  efi_guidcmp (efi_guid_t left, efi_guid_t right)
> >  {
> >
> >
>
> That would definitely work, but in that case, I might as well just check =
for it
> in mm_is_user() (and personally I would change the name to mm_is_efi()):
>
>
> static inline bool mm_is_user(struct mm_struct *mm)
> {
>         return mm !=3D &init_mm && !mm_is_efi(mm);
> }
>
> Any objections?
>

Any reason not to use IS_ENABLED(CONFIG_EFI) in the above? The extern
declaration is visible to the compiler, and any references should
disappear before the linker could notice that efi_mm does not exist.

In any case, feel free to add

Acked-by: Ard Biesheuvel <ardb@kernel.org>

when you roll a patch based on the above, with or without IS_ENABLED().

And as you concluded, efi_mm is indeed set in stone once the runtime
regions described by the firmware have been mapped, although this may
happen in two passes depending on how the runtime regions are
described. But by the time user MMs might exist, efi_mm should
effectively be immutable.
