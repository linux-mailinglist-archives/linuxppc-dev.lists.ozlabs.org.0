Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A889623930
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 02:51:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N74ZZ29k2z3cRW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 12:51:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j13lNmJl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j13lNmJl;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N74Yb0ql6z3c6k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 12:50:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1358561D43
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 01:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FD5C43144
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668045053;
	bh=TaZJ8YD2UBYOjpacFdfcE5S0ffWUIE6L7jzBu6Vnfqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j13lNmJlqwxToRDAW14JsR8J58WlFNfEwviwFClBWDnGwjEnxEpIdRGZtJgmsrdVw
	 HIIUUbTUlQVAJKXKxedPDu8A52FM0kelBgxzOHGgf0cpcXDgivhSj6b5nhbTzLNncA
	 LFIZq9obz+OF15XV3njj4fsaZy/2FgTt8LdR5d6Wnu1HrcSRfZqB62h9vTKZDq5Rd8
	 23cQN5Qd1xbuygvUBF7WKKx/cqvnd7w7RiVDjmEm4kMkJhRVpngEG+XAfrxxyAA6d4
	 f+FUx9ND6oQFP6B/qm2YjoJ6BWTVkkWFZ+NlHhYty3QUPyxZiWQFwnky6OyNfBYUdz
	 Zal0+zeivKZ5w==
Received: by mail-ej1-f41.google.com with SMTP id f27so1559317eje.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 17:50:53 -0800 (PST)
X-Gm-Message-State: ANoB5pkBHmvDPskaiyPOn5VEJSdPUriKxN1uewLvDGLfJ3P1mr+p2oIJ
	tYeYZkPevxQa4G2pueF3GhtYGlNCWgFz3Mdztw8=
X-Google-Smtp-Source: AA0mqf6YrN4AU+pP8A/AKXrG57m1y7nec0O3F6+K15aS8pMvGdF3Yx7YPJTjORr/HgSCUmq0cUpuhA2myaJdFMgvbyw=
X-Received: by 2002:a17:907:2995:b0:7ae:8956:ab56 with SMTP id
 eu21-20020a170907299500b007ae8956ab56mr4781923ejc.719.1668045051958; Wed, 09
 Nov 2022 17:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20221107223921.3451913-1-song@kernel.org> <Y2o9Iz30A3Nruqs4@kernel.org>
 <9e59a4e8b6f071cf380b9843cdf1e9160f798255.camel@intel.com>
 <Y2uMWvmiPlaNXlZz@kernel.org> <CAPhsuW5e8rBnu73DYkyc1L6gC-WBxjTZVwdFC_L12GVyzROR1w@mail.gmail.com>
 <d60266dc-6a10-b234-954c-a899a7ad054f@csgroup.eu>
In-Reply-To: <d60266dc-6a10-b234-954c-a899a7ad054f@csgroup.eu>
From: Song Liu <song@kernel.org>
Date: Wed, 9 Nov 2022 17:50:39 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5wtWQHMhjvi4hmOsVDZF-kosr7Eb8Gj2Jo4R5LFqE-qA@mail.gmail.com>
Message-ID: <CAPhsuW5wtWQHMhjvi4hmOsVDZF-kosr7Eb8Gj2Jo4R5LFqE-qA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/5] execmem_alloc for BPF programs
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "Lu, Aaron" <aaron.lu@intel.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "peterz@infradead.org" <peterz@infradead.org>, "x86@kernel.org" <x86@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "hch@lst.de" <hch@lst.de>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 9, 2022 at 1:24 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> + linuxppc-dev list as we start mentioning powerpc.
>
> Le 09/11/2022 =C3=A0 18:43, Song Liu a =C3=A9crit :
> > On Wed, Nov 9, 2022 at 3:18 AM Mike Rapoport <rppt@kernel.org> wrote:
> >>
> > [...]
> >
> >>>>
> >>>> The proposed execmem_alloc() looks to me very much tailored for x86
> >>>> to be
> >>>> used as a replacement for module_alloc(). Some architectures have
> >>>> module_alloc() that is quite different from the default or x86
> >>>> version, so
> >>>> I'd expect at least some explanation how modules etc can use execmem=
_
> >>>> APIs
> >>>> without breaking !x86 architectures.
> >>>
> >>> I think this is fair, but I think we should ask ask ourselves - how
> >>> much should we do in one step?
> >>
> >> I think that at least we need an evidence that execmem_alloc() etc can=
 be
> >> actually used by modules/ftrace/kprobes. Luis said that RFC v2 didn't =
work
> >> for him at all, so having a core MM API for code allocation that only =
works
> >> with BPF on x86 seems not right to me.
> >
> > While using execmem_alloc() et. al. in module support is difficult, fol=
ks are
> > making progress with it. For example, the prototype would be more diffi=
cult
> > before CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > (introduced by Christophe).
>
> By the way, the motivation for CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> was completely different: This was because on powerpc book3s/32, no-exec
> flaggin is per segment of size 256 Mbytes, so in order to provide
> STRICT_MODULES_RWX it was necessary to put data outside of the segment
> that holds module text in order to be able to flag RW data as no-exec.

Yeah, I only noticed the actual motivation of this work earlier today. :)

>
> But I'm happy if it can also serve other purposes.
>
> >
> > We also have other users that we can onboard soon: BPF trampoline on
> > x86_64, BPF jit and trampoline on arm64, and maybe also on powerpc and
> > s390.
> >
> >>
> >>> For non-text_poke() architectures, the way you can make it work is ha=
ve
> >>> the API look like:
> >>> execmem_alloc()  <- Does the allocation, but necessarily usable yet
> >>> execmem_write()  <- Loads the mapping, doesn't work after finish()
> >>> execmem_finish() <- Makes the mapping live (loaded, executable, ready=
)
> >>>
> >>> So for text_poke():
> >>> execmem_alloc()  <- reserves the mapping
> >>> execmem_write()  <- text_pokes() to the mapping
> >>> execmem_finish() <- does nothing
> >>>
> >>> And non-text_poke():
> >>> execmem_alloc()  <- Allocates a regular RW vmalloc allocation
> >>> execmem_write()  <- Writes normally to it
> >>> execmem_finish() <- does set_memory_ro()/set_memory_x() on it
> >>>
> >>> Non-text_poke() only gets the benefits of centralized logic, but the
> >>> interface works for both. This is pretty much what the perm_alloc() R=
FC
> >>> did to make it work with other arch's and modules. But to fit with th=
e
> >>> existing modules code (which is actually spread all over) and also
> >>> handle RO sections, it also needed some additional bells and whistles=
.
> >>
> >> I'm less concerned about non-text_poke() part, but rather about
> >> restrictions where code and data can live on different architectures a=
nd
> >> whether these restrictions won't lead to inability to use the centrali=
zed
> >> logic on, say, arm64 and powerpc.
>
> Until recently, powerpc CPU didn't implement PC-relative data access.
> Only very recent powerpc CPUs (power10 only ?) have capability to do
> PC-relative accesses, but the kernel doesn't use it yet. So there's no
> constraint about distance between text and data. What matters is the
> distance between core kernel text and module text to avoid trampolines.

Ah, this is great. I guess this means powerpc can benefit from this work
with much less effort than x86_64.

>
> >>
> >> For instance, if we use execmem_alloc() for modules, it means that dat=
a
> >> sections should be allocated separately with plain vmalloc(). Will thi=
s
> >> work universally? Or this will require special care with additional
> >> complexity in the modules code?
> >>
> >>> So the question I'm trying to ask is, how much should we target for t=
he
> >>> next step? I first thought that this functionality was so intertwined=
,
> >>> it would be too hard to do iteratively. So if we want to try
> >>> iteratively, I'm ok if it doesn't solve everything.
> >>
> >> With execmem_alloc() as the first step I'm failing to see the large
> >> picture. If we want to use it for modules, how will we allocate RO dat=
a?
> >> with similar rodata_alloc() that uses yet another tree in vmalloc?
> >> How the caching of large pages in vmalloc can be made useful for use c=
ases
> >> like secretmem and PKS?
> >
> > If RO data causes problems with direct map fragmentation, we can use
> > similar logic. I think we will need another tree in vmalloc for this ca=
se.
> > Since the logic will be mostly identical, I personally don't think addi=
ng
> > another tree is a big overhead.
>
> On powerpc, kernel core RAM is not mapped by pages but is mapped by
> blocks. There are only two blocks: One ROX block which contains both
> text and rodata, and one RW block that contains everything else. Maybe
> the same can be done for modules. What matters is to be sure you never
> have WX memory. Having ROX rodata is not an issue.

Got it. Thanks!

Song
