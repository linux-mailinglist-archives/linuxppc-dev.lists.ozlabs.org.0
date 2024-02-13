Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C63738532AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 15:09:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tu/LiHhQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ39Y4v1Rz3dXM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 01:09:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tu/LiHhQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZ38m73RHz2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 01:08:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE983CE1BC6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 14:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF24C43601
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707833332;
	bh=TsHGewO4d1sZ/2Wke7Alzolt9Fz7V7TAkLcK4gqK7t4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tu/LiHhQ1ASQkknxYy5I2zbpBLo3Lke7GhTHufl7uofAXbgbEe1jZcVkcpsWcXG2f
	 yRo4KTwjF0w0rUA57dPszbcC/4sDiwAtBb3k5omG8X2jUt5bVmzr6WXIxc69HK4IAh
	 4GBvbrLwnELnRYURYkRQ83RxSnTzgS90NWsYF3YxAX8/IIGbMzXnzd1QvwA62+kk+T
	 tHOIU4Zy1ByBI3P71eRSNYhBol4KDImVoeQleaAwtHsB6F8Mfrjm+EMM3/EzF2piKO
	 aE57OkljvhTV+9P73w0F7bFWZ/mjd9kJrufdcOsgKtH9g2zvdniF1QDKv8tCLb2Ssv
	 WR+UMWaBwATzg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5114fa38434so4824797e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 06:08:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/W/e2qnAJVK8Lk8d2W2Mf7IFKXjo6dNYPk1W4Ae3JnkTtspDYeStyuWhjzWoVRRHjvG3HK2rW0GINgOXbLiJhOvR2vsIZKiEdTPqeqw==
X-Gm-Message-State: AOJu0YzNHSrRrgmGEfxlNf4sYotE1nCYdAUAQuLeJrxKXn42/IHUogDl
	sr0BxIjkEmBd+8+rgBconQhm5zKdJue/NIeyacw4fNPt6sYVjlwtXwyAstQy6vCNcGC52AyFKW8
	GCJc9R5gmOqCrfh6ZjQXCLASYU0o=
X-Google-Smtp-Source: AGHT+IERJ2V7pHlFw7AMG1Pn749RuDSeXLXoZ89U8U4kBT5ImaY5HxngrTnEeqgTjll4w3fZWaJ2CtEbeq0i1i4Nh6M=
X-Received: by 2002:ac2:46da:0:b0:511:96d0:5ae1 with SMTP id
 p26-20020ac246da000000b0051196d05ae1mr1799024lfo.40.1707833330972; Tue, 13
 Feb 2024 06:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com> <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
 <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com> <aa232591-e0c8-422d-a641-fa555914c5f0@arm.com>
 <64395ae4-3a7d-45dd-8f1d-ea6b232829c5@arm.com> <d6ce951f-f83b-4a5a-a814-311f2d8b01e4@arm.com>
 <41499621-482f-455b-9f68-b43ea8052557@redhat.com> <1d302d7a-50ab-4ab4-b049-75ed4a71a87d@arm.com>
 <99e2a92c-f2a2-4e1e-8ce2-08caae2cb7e4@redhat.com> <dce5f80d-942f-439c-a549-5290666464ca@arm.com>
 <CAMj1kXEVf1m4hVXORc6t9ytAOb75KZLcW-OJ6999VaKbkVdQ3A@mail.gmail.com>
 <64b872bd-4b12-4dbd-b043-1ad11aeaa19a@redhat.com> <3de2130b-9f0f-4a11-ac06-7bf814de641c@arm.com>
 <f93e5552-5e46-4f49-918a-21b63156eb32@redhat.com>
In-Reply-To: <f93e5552-5e46-4f49-918a-21b63156eb32@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 13 Feb 2024 15:08:39 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEK6wiHkO9sJ5h6D3L88dR=2UndEqGeQjv=TftZ3PnN9w@mail.gmail.com>
Message-ID: <CAMj1kXEK6wiHkO9sJ5h6D3L88dR=2UndEqGeQjv=TftZ3PnN9w@mail.gmail.com>
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
To: David Hildenbrand <david@redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Ryan Roberts <ryan.roberts@arm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Feb 2024 at 15:05, David Hildenbrand <david@redhat.com> wrote:
>
> On 13.02.24 15:02, Ryan Roberts wrote:
> > On 13/02/2024 13:45, David Hildenbrand wrote:
> >> On 13.02.24 14:33, Ard Biesheuvel wrote:
> >>> On Tue, 13 Feb 2024 at 14:21, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>
> >>>> On 13/02/2024 13:13, David Hildenbrand wrote:
...
> >>>>> Just a thought, you could have a is_efi_mm() function that abstracts all that.
> >>>>>
> >>>>> diff --git a/include/linux/efi.h b/include/linux/efi.h
> >>>>> index c74f47711f0b..152f5fa66a2a 100644
> >>>>> --- a/include/linux/efi.h
> >>>>> +++ b/include/linux/efi.h
> >>>>> @@ -692,6 +692,15 @@ extern struct efi {
> >>>>>
> >>>>>    extern struct mm_struct efi_mm;
> >>>>>
> >>>>> +static inline void is_efi_mm(struct mm_struct *mm)
> >>>>> +{
> >>>>> +#ifdef CONFIG_EFI
> >>>>> +       return mm == &efi_mm;
> >>>>> +#else
> >>>>> +       return false;
> >>>>> +#endif
> >>>>> +}
> >>>>> +
> >>>>>    static inline int
> >>>>>    efi_guidcmp (efi_guid_t left, efi_guid_t right)
> >>>>>    {
> >>>>>
> >>>>>
> >>>>
> >>>> That would definitely work, but in that case, I might as well just check for it
> >>>> in mm_is_user() (and personally I would change the name to mm_is_efi()):
> >>>>
> >>>>
> >>>> static inline bool mm_is_user(struct mm_struct *mm)
> >>>> {
> >>>>           return mm != &init_mm && !mm_is_efi(mm);
> >>>> }
> >>>>
> >>>> Any objections?
> >>>>
> >>>
> >>> Any reason not to use IS_ENABLED(CONFIG_EFI) in the above? The extern
> >>> declaration is visible to the compiler, and any references should
> >>> disappear before the linker could notice that efi_mm does not exist.
> >>>
> >>
> >> Sure, as long as the linker is happy why not. I'll let Ryan mess with that :)
> >
> > I'm not sure if you are suggesting dropping the mm_is_efi() helper and just use
> > IS_ENABLED(CONFIG_EFI) in mm_is_user() to guard efi_mm, or if you are suggesting
> > using IS_ENABLED(CONFIG_EFI) in mm_is_efi() instead of the ifdefery?
> >
> > The former was what I did initially; It works great, but I didn't like that I
> > was introducing a new code dependecy between efi and arm64 (nothing else outside
> > of efi references efi_mm).
> >
> > So then concluded that it is safe to not worry about efi_mm (thanks for your
> > confirmation). But then David wanted a VM_WARN check, which reintroduces the
> > code dependency. So he suggested the mm_is_efi() helper to hide that... This is
> > all starting to feel circular...
>
> I think Ard meant that inside mm_is_efi(), we could avoid the #ifdef and
> simply use IS_ENABLED().
>

Yes.

static inline void mm_is_efi(struct mm_struct *mm)
{
    return IS_ENABLED(CONFIG_EFI) && mm == &efi_mm;
}
