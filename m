Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A270678EE8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 04:17:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1Bwv3DQkz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 14:17:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=irnAgSyk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=irnAgSyk;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1Bvw54bPz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 14:16:43 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso17217997pjg.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 19:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGZG93eiXRk22TOPDmFZGXGIOl8nFjO4bOBcCBu5uW8=;
        b=irnAgSykIWbmg9WdpxuRyMCuC9r6EUakDFGK2nhjUH6ns5CB7glOvHSr+w8WdAmM74
         d4VSceT9xSlPEdFgWxtfyT4x81AG5eDXp8YSQSRMxmMvd+0gHAWp9hwb3v6K2I6O8LHx
         +xS/v2NL+vLtzBZaF7XFRPnR598DoWxZIRk95P8lWODo91fsUYHmTkuEnx+mbpHZzRiX
         RmFt/pZPihavSWUDUJvkUs2DVsuNAb7Ao7kog/4VqsKUo9i4zW/9NuCtEkr3W6gAJiIU
         b226eHn4FvJCFMMMySsSGi6Enl3ZscnElE1NS9TjLXundxfkTXoNQsKAzsitrOMN6Q00
         +e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bGZG93eiXRk22TOPDmFZGXGIOl8nFjO4bOBcCBu5uW8=;
        b=itomIh45w8DSd+ouTqQrSpwoyjnZrFLK33mAAqNOa6o8fnnKE2vK/JrmmpHwgujfC5
         4rhhiO4zcFaMFTshPvMW6F1s9sUs92i75STNhwdPNHIAWLkBGdyMH1RxQWF6wvBPNSNw
         fPiqU/7tqVjeYKDousqiRNGXOvdAe59l2Ay3FFr3cXFk3BWR4cCFa0EyoqESOC8uzYxp
         g1webH70m/plChJw75eD6o4zaPPDkNHNCMMP0E+UDwE5lxFY/MgBD6DB+5vn/owkO3O8
         +KYHPHkRCuI9GO76b6HGLLiEaNC9SeR9EnLcsBTYRzxF+1qWxSkNkDgksdomQXaC11sj
         iRvg==
X-Gm-Message-State: AFqh2kpaIp72XpoRtdj9urWUxuVfjZSwJCkgQqVwLkedkp0RBXmknDd3
	ncfa7KLts41RZMnTjrxz9jI=
X-Google-Smtp-Source: AMrXdXskD2W7zrNiaiZ6X+Pl5+Tp/VgiW0zZf5Jhb6BD28XXzBRcQy84AtLhiISjIw0wPIJMdQLWJA==
X-Received: by 2002:a05:6a21:9101:b0:ad:db18:6d0d with SMTP id tn1-20020a056a21910100b000addb186d0dmr27460888pzb.59.1674530200792;
        Mon, 23 Jan 2023 19:16:40 -0800 (PST)
Received: from localhost (121-44-64-35.tpgi.com.au. [121.44.64.35])
        by smtp.gmail.com with ESMTPSA id p5-20020a170903248500b00189a50d2a3esm419719plw.241.2023.01.23.19.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 19:16:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 13:16:34 +1000
Message-Id: <CQ03EVK32Y3F.3QPL2RUNVGILM@bobo>
Subject: Re: [PATCH v6 3/5] lazy tlb: shoot lazies, non-refcounting lazy tlb
 mm reference handling scheme
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nadav Amit" <nadav.amit@gmail.com>
X-Mailer: aerc 0.13.0
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-4-npiggin@gmail.com>
 <5F3590B8-3F25-4EFB-BE3A-D32AAAC0B2F4@gmail.com>
 <CPVVOWQ6SE2S.NQ3R9R77MFKI@bobo>
 <e8fac6e0-487f-37c3-5be4-19518ffa845e@gmail.com>
In-Reply-To: <e8fac6e0-487f-37c3-5be4-19518ffa845e@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jan 23, 2023 at 6:16 PM AEST, Nadav Amit wrote:
>
>
> On 1/19/23 6:22 AM, Nicholas Piggin wrote:
> > On Thu Jan 19, 2023 at 8:22 AM AEST, Nadav Amit wrote:
> >>
> >>
> >>> On Jan 18, 2023, at 12:00 AM, Nicholas Piggin <npiggin@gmail.com> wro=
te:
> >>>
> >>> +static void do_shoot_lazy_tlb(void *arg)
> >>> +{
> >>> +	struct mm_struct *mm =3D arg;
> >>> +
> >>> + 	if (current->active_mm =3D=3D mm) {
> >>> + 		WARN_ON_ONCE(current->mm);
> >>> + 		current->active_mm =3D &init_mm;
> >>> + 		switch_mm(mm, &init_mm, current);
> >>> + 	}
> >>> +}
> >>
> >> I might be out of touch - doesn=E2=80=99t a flush already take place w=
hen we free
> >> the page-tables, at least on common cases on x86?
> >>
> >> IIUC exit_mmap() would free page-tables, and whenever page-tables are
> >> freed, on x86, we do shootdown regardless to whether the target CPU TL=
B state
> >> marks is_lazy. Then, flush_tlb_func() should call switch_mm_irqs_off()=
 and
> >> everything should be fine, no?
> >>
> >> [ I understand you care about powerpc, just wondering on the effect on=
 x86 ]
> >=20
> > Now I come to think of it, Rik had done this for x86 a while back.
> >=20
> > https://lore.kernel.org/all/20180728215357.3249-10-riel@surriel.com/
> >=20
> > I didn't know about it when I wrote this, so I never dug into why it
> > didn't get merged. It might have missed the final __mmdrop races but
> > I'm not not sure, x86 lazy tlb mode is too complicated to know at a
> > glance. I would check with him though.
>
> My point was that naturally (i.e., as done today), when exit_mmap() is=20
> done, you release the page tables (not just the pages). On x86 it means=
=20
> that you also send shootdown IPI to all the *lazy* CPUs to perform a=20
> flush, so they would exit the lazy mode.
>
> [ this should be true for 99% of the cases, excluding cases where there
>    were not page-tables, for instance ]
>
> So the patch of Rik, I think, does not help in the common cases,=20
> although it may perhaps make implicit actions more explicit in the code.

If that's what it does, then sure. IIRC x86 didn't used to work that way
long ago, but you would know what it does today. You might find it
doesn't need much arch change to work. OTOH Andy has major problems with
active_mm and some other x86 use-after-free weirdness that that I wasn't
able to comprehend. He'll be naking x86 implementation until that's all
cleaned up so better try to understand what's going on with that first.

Thanks,
Nick
