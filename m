Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46092D91E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 21:28:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=MInBkEmP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK7FX6kXCz3dTC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 05:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=MInBkEmP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=dima@arista.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK7DR32n9z3cZ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 05:27:50 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2c98660fc91so128015a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1720639666; x=1721244466; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDX0XdF8xtUi8gY57mjJHI/aPqtEadEtWnhLks81CaM=;
        b=MInBkEmP4g+l29YlA0/lrTineHB3aggxIIUry/t+HNMbLk96uNKhW8aFkodVQP2lcn
         +xxZG/Ysr36nvplSPRguDl244q70l5g+4USOZSznodWzlmAOBc8/0b5/+mxxSTaxFgrE
         jNpL1708ZdIlwE1S/fxuNFzXAAWZ01hUSrBsAvKUYz/w8sY1NH0SA9ITAM+RgbtI8wcu
         +Hz/bdh/0IpuGNOVMZPXPA+CLNQRtGI/9ezRTra/ggarUlbqvLHc3h6j8Ywq8WtOO4hW
         Lje2CqejZcy1FqyeWME3js8OalhistFClaWtb9cksWyBt1/n8q0ssv49yyplzIpjoO2T
         mkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720639666; x=1721244466;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDX0XdF8xtUi8gY57mjJHI/aPqtEadEtWnhLks81CaM=;
        b=XV2jldEI/wTa3P+MAHylGk0oKLqpxAooZpy6T23V1gOjZ+PXVU5U9HsH+kJksjVgD+
         Bcn9HcegnJgzhg76wPiIVJ73XICN3hTdtDRvYIvArM1BxYcqwGnzS1Xpark36GqixNls
         c+Qt5RxfSY+h6aeldZMWxHRARspuHmvMhEnAYravwHWdsxGVwrierfk56zNSKW8G/05n
         8+HBdEiP76TS61jSJr00o3hx3m4XEkwsCgZPt06ze6JMsUXLS+1TFEmdWPqoiUrX60Vc
         v8pSazna3EoEgNETEDRpZPSOyYYvJT0Y4BcoONIFDMWEQsiWWwh56T/Of6odncPJCjJh
         4owA==
X-Forwarded-Encrypted: i=1; AJvYcCVmrhHwDK/6ypRBf5D4f/6I6dtdhJ4JEHsCPn1Pn2LEeKbzyXK5RjKByVpodGduGTeqmc1XDev0Cny6RiTJBe79sts+wsZmZY58dwyzfg==
X-Gm-Message-State: AOJu0YyexdGuYkDL88xd1vFBGU7UzxQRvB0C+g+0r6obbbCClIPPCWgz
	HF+GRMLyRx4FaDvS3syK50QgCZrujnrdY73bPFu8woVLKfsZSVOZMpwFtLKPGDbS9HxXHFAGxbP
	J8x7AFpIuEg3tUAmeFqz6Ye7U+TlL9bGdnCy1sGFz4eF4QLU=
X-Google-Smtp-Source: AGHT+IFevCQuz+QUBppsNr3ykaDTOUJGvGoxbbyyoYnSvNNxylRM8YDW9XfsPb9VBk0DCwpi4bmqsSw+rxSkjF9wNFU=
X-Received: by 2002:a17:90a:71cb:b0:2c9:9b65:af4d with SMTP id
 98e67ed59e1d1-2ca35bdffd5mr5203439a91.7.1720639665835; Wed, 10 Jul 2024
 12:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240704182718.2653918-1-Liam.Howlett@oracle.com>
 <20240704182718.2653918-17-Liam.Howlett@oracle.com> <8fbb424d-a781-4e61-af7a-904e281eba8c@lucifer.local>
 <e5ldsusdn3som7wn2rw76wtrhnlrxk3vkyk3iyimh6qv3ptvwu@24zfmamllev6>
 <0998f05b-9d5f-4b24-9030-22421e1dd859@lucifer.local> <874j8x5t4e.fsf@mail.lhotse>
 <92ce2025-51c3-423a-902e-dbd19d5d7850@lucifer.local> <7161cef3-49e4-4057-8a66-ec1ad6eb3f9e@cs-soprasteria.com>
 <zu7c7h7apzzo3amki5vz32v77bnkj46h54k4662tn5naciv5i6@d4uo4rdaoxlk>
In-Reply-To: <zu7c7h7apzzo3amki5vz32v77bnkj46h54k4662tn5naciv5i6@d4uo4rdaoxlk>
From: Dmitry Safonov <dima@arista.com>
Date: Wed, 10 Jul 2024 20:27:34 +0100
Message-ID: <CAGrbwDSL0NTxBRfkPYR7OLJHW=dU=+uXVshe4ykubgF_JaczhA@mail.gmail.com>
Subject: Re: [PATCH v3 16/16] mm/mmap: Move may_expand_vm() check in mmap_region()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>, 
	"sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Bert Karwatzki <spasswolf@web.de>, Jiri Olsa <olsajiri@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Safonov <dima@arista.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Liam,

On Wed, Jul 10, 2024 at 5:09=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * LEROY Christophe <christophe.leroy2@cs-soprasteria.com> [240710 08:59]:
> >
> ...
> > >>>>
> > >>>> Assuming the removal of the vdso does not cause the application to=
 seg
> > >>>> fault, then the user visible change is that any vdso call after a =
failed
> > >>>> mmap(MAP_FIXED) call would result in a seg fault.  The only reason=
 it
> > >>>> would fail is if the mapping process was attempting to map a large
> > >>>> enough area over the vdso (which is accounted and in the vma tree,
> > >>>> afaict) and ran out of memory. Note that this situation could aris=
e
> > >>>> already since we could run out of memory (not accounting) after th=
e
> > >>>> arch_unmap() call within the kernel.
> > >>>>
> > >>>> The code today can suffer the same fate, but not by the accounting
> > >>>> failure.  It can happen due to failure to allocate a new vma,
> > >>>> do_vmi_munmap() failure after the arch_unmap() call, or any of the=
 other
> > >>>> failure scenarios later in the mmap_region() function.
> > >>>>
> > >>>> At the very least, this requires an expanded change log.
> > >>>
> ...
>
> > >>> I mean why are they unmapping the VDSO, why is that valid, why does=
 it need
> > >>> that field to be set to NULL, is it possible to signify that in som=
e other
> > >>> way etc.?
> > >>
> > >> It was originally for CRIU. So a niche workload on a niche architect=
ure.
> > >>
> > >> But from the commit that added it, it sounds like CRIU was using mre=
map,
> > >> which should be handled these days by vdso_mremap(). So it could be =
that
> > >> arch_unmap() is not actually needed for CRIU anymore.
> > >
> > > Oh that's interesting!
> > >
> > >>
> > >> Then I guess we have to decide if removing our arch_unmap() would be=
 an
> > >> ABI break, regardless of whether CRIU needs it or not.
> > >
> > > Seems to me like an internal implementation detail that should hopefu=
lly
> > > not result in anything that should have visible ABI impact?
> > >
> > > I guess this is something we ought to assess. It would be useful to
> > > eliminate hooks where we can so we can better control VMA behaviour w=
ithout
> > > having to worry about an arch being able to do arbitrary things at
> > > unexpected times, especially pertinent where we change the order of t=
hings.
> > >
> >
> > I see you are talking about arch_unmap(). I didn't follow the entire
> > discussion but we have some related stuff here:
> > https://github.com/linuxppc/issues/issues/241
> >
> > If I remember correctly arch_unmap() should have gone away we Dmitry's
> > series
> > https://lore.kernel.org/lkml/20210611180242.711399-1-dima@arista.com/#r
> > but it hasn't been applied yet.
> >
>
> That is good news!
>
> To review, ppc is the only arch using this now and it sounds like you
> want to remove it too.
>
> Considering the age of that thread and the possibility of conflict with
> my series, can I drop the entire arch_unmap() function instead of
> modifying the handling in core mm?  I'm going to assume that's okay and
> start working on this for v4 (because there hasn't been a public reply
> for v4 since 2023/10/11).

Yeah, this kind of felt through the cracks. I meant to find time to
push v4, but from my job side I got motivated to do core networking
changes that were required by customers, from the other side I got
demotivated a bit by slight pushback for v3 with "justify why is it
needed at all?". For changes that are mostly cleanups and refactoring.

So, usually I don't give up on patches sets that yet make sense to me,
but priorities+motivation changed and the set moved lower on my todo
list.

If you have time and urge to finish this patch set, you are more than
welcome to adopt it :-)
Otherwise, I'll try to find time for them, but not in near short-term
as at this moment I cook tcp & selftests changes that I'd love to see
upstream.

> This would mean less arch-specific hooks and that's always a good idea.

Thanks,
           Dmitry
