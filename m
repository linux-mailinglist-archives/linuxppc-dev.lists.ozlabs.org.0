Return-Path: <linuxppc-dev+bounces-4117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 238919F133B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 18:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8wlx0cPjz3bVl;
	Sat, 14 Dec 2024 04:08:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734109725;
	cv=none; b=YaTOOkT0yFbkEyGpV2QKS+8fzT4tIXwTyfm2EI5xVMYB3DEe+NtcWVp0BaBJhMX2Y+YOwpnjrNNOYJKcMNePyWt8JWvlpBBChRfJk5mbBpf8IGNT4A+KoS7PD6HVFy9ImI2iuxgweT3GSIt9QMZRKgnwYcncu0YCf+AIi9zy2dP0iTdirWyQRb0vWkguPjS5qNo/wwa5wK0eWzi9ieugT57Nz94Xt7id+YrAhQz3CAKxAQm04bhWbCDxBhb3fe6YC2CpRv/lP663TsyoVp5ll6ptwzdykSvEQ/v4RSm1NnN+pX/K/ZZCRXq1zw/WS7vPEGxTWIZYyYhLanaHPZO+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734109725; c=relaxed/relaxed;
	bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=eXOKM5nm/qlDnhKe5FJI8xUYyGl8OP2lsAYUWxz5Cv9xJRsOzG/5hQa8q6rIvHgIu8nuwpKa8TuLvMWF2UlIuhUQLOoLsUWTMbkIIDsJxjHQvmgE3FkeN9OjwAGwXayVlglSfYz0X8rkzDP91M1wmskyTIhlOWPGB5VjCRBL+9VSs4fQ5FE+lbG/8Qsipd7IgwHAPv9WL520jou44KeCrg4SDtLIDVyfe4rInmeGx6BYoYbEOHw3RgtgRcrC3PYSvlkwNSg72tOepTT2qewsf0jA5qPZgSJ8aUbvFdNzSfWavBV3fxBnMe+jA85iah21TpuXU6WaVCeKEah6+1YBtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aCkaUOEM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aCkaUOEM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=kaleshsingh@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8wlv12mvz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 04:08:42 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so10820a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 09:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734109715; x=1734714515; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=aCkaUOEM5MUCloV3xfBmsvMZtvIzvABYl+rxZPSS7chSuMOdcUovpaLWKb2tjrhGwm
         EEPeHwB9Y7M1Te4weJoAcqRF8HQODEFlIffkiN9ySWVKWudVCRuuOyGJ7QJ1D6HxX59u
         Ba8d1B1jBpMwlUQI8UWmwRY/ZXXgHJnCdWxnOALlzncyjxajIHF1+4Dg7BMt+hKX59Zk
         mFsvxKOBvTKG8TtfjqiSUTJBdXy7vylsqEEDoocKusM7FLtDXjwc3qnsrPUNbDLJJoRD
         Z+GK81Cj/VKrHBz1oV2iMNIJfDmJg75iC+CH0suC1U4o21u8dSoMJFq+ytRCQC+Ih3Zy
         GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109715; x=1734714515;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7A4zwHQX+g8AxxOfbgXufhzVAB4FWsc6ZChZM+91J+Q=;
        b=RKnBjMSxVhhHBkbxcWYTqJtfcZ3pLUJCDv1qhBi+BIpxnWmkU8TiOu460PZLLk3mWj
         6ByKvmvdVLV5enkFG8ir+JptFUFzkSkZEGyX8N1nDMyXVl77zY+oLwjV4Z1+sqiOLK5F
         fhXIzrzUiFx1dfcAkhl7kyGqik/H/kK4pKOW19xnmnAfbv0DJtYsFHyC76ct8DQ43P4Q
         QQYIlyoBvU9zWCn58TmcsaSFcCf3JYr1ZCl+bCuaPsV0hX+PcO7qEpI3iA2kPhoPrDNf
         K0v6xeg/0CqgQtdKKHfe4CezYj2G9KJw4iZZ7/QypWnBKmTW43hI8rPbnqwBxAwlYAB1
         bL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMTQv9G1clXVnrUA9CMoGvfiweY1PLnz+BKlls/+dvPZwfiUJbeSbbHP26VUawZk5GUyXAoyAGAm8QyPY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywi7j/Mbx2huC/NoYQf7bnGxw2MXairIEJMuEsx2ytgrah3idzf
	MgjDtVJAKqpk7uii6TSVs6w0SA4mA31dnl5RanLCgS4ucuzVdc9/F+BDK5bF4bygG2pS1tO9WXH
	JbeqmnIc6R1is6x9fSLucGKsnt3r+7YwmFC4F
X-Gm-Gg: ASbGnctc0vt47Gvh4Pj9neTQaOIlzOoFv3W6dVHngwFkkYR7MD+VopUJarxBmhUxbUd
	nGYsYsRqayybPbxmJOhJ16SO1oJXOIGADNXGvkQ==
X-Google-Smtp-Source: AGHT+IE0pzRAvhpWcDoHVTc25a7VJDPqOoxFfUFUvV3kZNJPG0d3Y6hVFQO+pd+M5jbFDlDiTJn/R0kKY+NzL+UHXcQ=
X-Received: by 2002:a05:6402:1517:b0:5d0:b20c:2063 with SMTP id
 4fb4d7f45d1cf-5d63c09e36emr92135a12.7.1734109713373; Fri, 13 Dec 2024
 09:08:33 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local> <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
 <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local> <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
In-Reply-To: <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 12:08:18 -0500
Message-ID: <CAC_TJvdZxQ0-O3Y1bzH0-XdjQYuJPkkpn-umVan--Z6As-tSow@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024 at 11:45=E2=80=AFAM 'Liam R. Howlett' via kernel-team
<kernel-team@android.com> wrote:
>
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [241213 10:16]:
> > On Fri, Dec 13, 2024 at 10:06:55AM -0500, Kalesh Singh wrote:
> > > On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
>
> ...
>
> > >
> > > On the technical side, Liam is right that the copy-pasted arch code
> > > has inconsistencies (missing checks, order of checks, ...). I agree
> > > there=E2=80=99s room for further consolidation. I=E2=80=99ll take ano=
ther stab at it
> > > and resend it as an RFC with an updated cover letter, as Lorenzo and
> > > others suggested.
>
> Thanks.  Can you please include what platforms you have tested in your
> cover letter (and level of testing - booting, running something, etc).
>
> If you have not tested them, then it might be worth it to have it as an
> RFC to point this out - at least initially.  Some of these are very
> difficult to set up for testing, but it is also possible that you did
> that and the maintainers/people who usually test these things will
> assume it's fine if you don't spell out what's going on.
>

I build-tested most of these except (csky and loongarch) and ran
android runtime (ART) tests on arm64 and x86. I can try to spin up a
few of the others and will add it to the description.

> >
> > The most useful thing here as well to help us understand would be to wr=
ite
> > more in the cover letter to expand on what it is you ultimately what to
> > achieve here - it seems like an extension on the existing THP work on a
> > per-arch basis (I may be wrong)? So adding more detail would be super
> > useful here! :)
> >
> > We do hope to avoid arch hooks if at all possible explicitly for the re=
ason
> > that they can be applied at unfortunate times in terms of locking/wheth=
er
> > the objects in question are fully/partially instantiated, VMA visibilit=
y
> > etc. etc. based on having had issues in these areas before.
> >
> > Also if a hook means 'anything' can happen at a certain point, it means=
 we
> > can't make any assumptions about what has/hasn't and have to account fo=
r
> > anything which seriously complicates things.
> >
> > Ideally we'd find a means to achieve the same thing while also exposing=
 us
> > as little as possible to what may be mutated.
>
>
> Yes, I'm not sure of what your plans are, but I would like to see all of
> these custom functions removed, if at all possible.

Initially I think we can remove the mmap hint portion of the logic;
and follow up with removing arch_get_unmapped_area[_topdown](). Some
of those may not make sense to consolidate e.g. powerpc's
slice_get_unmapped_area() which doesn't share much in common with the
rest.

Thanks,
Kalesh

>
> Thanks,
> Liam
>
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>

