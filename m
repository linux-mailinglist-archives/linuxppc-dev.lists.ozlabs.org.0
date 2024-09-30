Return-Path: <linuxppc-dev+bounces-1692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC54E98A3A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 14:55:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHLdw5L3Kz2ysb;
	Mon, 30 Sep 2024 22:55:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727700931;
	cv=none; b=YvqETpIa7PsZprV7YlfL0i8P44DLMHXeU5YX8a9uRUKJNRIgp3wBslmCMGMnS7E6sQ41t1pupI9soHNMVRyxE4F0Lo3lmYtmEFdKWtOQFUv/sLjmCrhuyqyU4BwB/mEWzK49m9d43WFyxN7I+LltJCXEeqqcmYtFo3PhJcebixiWG1429QC1l7ihEaCX4VdSSOuhWFipydMVrS5Xo6gZ4n95nRO+T34SlmIN9BioMFbf8/6U2KYU9V/lOXerDUvw1rm7FFrX7iLGxT21oZMaKQBGna1ZSBE3Tk/836YnH0M/U/O8FQ3SnUP3bvRogaj/S5zKvisKhf1oiHPAWeYP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727700931; c=relaxed/relaxed;
	bh=cOdgvaXJUr2scM3z+ssnO26BlcF10nfkej0+ZEZfU68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bwuMX3LTFLDbXKSAb26v4EZFmDrcM4gqnSJummNuUehUj9vP7JJLqyj87zEEFUylTDclgs8RnKmZgbYpyyoKa6Yyg4/rVP8YVt+Yp6n9Vb3ugLm5Mly9Gea4fWCmQTk2N3xZiKd5WKIHql9KRZOsPFWlvopam3309ffopdhTKi1iD93LHUG1dDCgAHCo8G6bFwOMTpRIWZ/Gk67ehh8uAXFPRa57RR2OSUk/tDDHx9n5wZMdMNNU8NMRQYMQ1aP6SoupbXyZbufO7Ms5POHNUcNGMMAVBsPRT+Q0HkUsVXMaXSXj2MK8m612IF5EHhMdSRuVnimN63Y2ategO+Q0sA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mb3fOPMN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mb3fOPMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHLdt5vcDz2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 22:55:30 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so31620615e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727700924; x=1728305724; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOdgvaXJUr2scM3z+ssnO26BlcF10nfkej0+ZEZfU68=;
        b=mb3fOPMNPXh3ZpFElzJNfIEum+t0uyRCtsstoWLXacn0omqdxakNK/ARe3iLqs5aoL
         UAF+ptt1H/4Dci2LHydUmm5bVR/HhR1cVwGseAIM4aZacz90nVxO/EH0r18QJT+hUt7w
         3YDap/b8uyNxrOi3mR/w1hZMkSJ2em8XW+Pqw5H+lKpxFSG2VCuyrSP8aMFyzoXzfnmv
         LAgJ+d1QepyLSIFiC1eGJl4MN815PTPVH7SXn2eceVsmeNtbGLmfzoIa6Fg5Xy6vizHj
         hr783g3PPk+DvBirW30VmK8fc989DsgJJALF+xaBGqu975x8nUXP0koIMPkLj/ySU6zz
         kQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727700924; x=1728305724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOdgvaXJUr2scM3z+ssnO26BlcF10nfkej0+ZEZfU68=;
        b=AyV5v8ziMsWQnfH6wEsOSP4Xv0Em8HP3256sf+AROFVfGbGJRMzEmkZ1Omc4TuRdbZ
         Dt0/mBmBG0vqkAHjolwQNmfPam6XXKpb6mXWYDODw4fLp24MPXJCGMLwM2Bqhk5N6l6K
         q4l3v1JhLn2+5FLokctqcJDOpPAvKgX7sxaaubPqOy4Q8oKJU7Z/qpzTjsuM/9fRoRAA
         U43IWVu8gnAHBXHPfMznW0X+jIPEX+QXiKFDPgYNuuxahM1IEGwvlgA7yI5GIID8iscb
         MxwyhpCgWJUMQoNAk9eXFGH0Yw8bYN7JtUHUq0Xo0fOHO2R7JgLfMIncyAnC/HI+SlE9
         GK0w==
X-Gm-Message-State: AOJu0YzxVOP5CVr+7Pb5NdJL0CKvcSZBatCe9m0L2VAVADuZ2Ngv5Lfv
	iEX+DAYP4OOFP3avyuGnLPBJtNyoGTftyEYVBIsIYCa2RSVQCEX6QYqRjpeZGDvDhjCmcaIKM7/
	Pqj/6Rn4fSc/kICL46GxoFrhu3Vs=
X-Google-Smtp-Source: AGHT+IHymJjkPXI8wOmPdK0T7Ia8AkydMnY3GRDEvq8x/rrmB/r7QHqVuIQcCxZGJgE+W0IpzTVVD77B8tn93lNQMW8=
X-Received: by 2002:adf:e881:0:b0:37c:ce26:95eb with SMTP id
 ffacd0b85a97d-37cd5aaf848mr5807426f8f.2.1727700923809; Mon, 30 Sep 2024
 05:55:23 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-18-hbathini@linux.ibm.com> <CAADnVQL60XXW95tgwKn3kVgSQAN7gr1STy=APuO1xQD7mz-aXA@mail.gmail.com>
 <32249e74-633d-4757-8931-742b682a63d3@linux.ibm.com>
In-Reply-To: <32249e74-633d-4757-8931-742b682a63d3@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Sep 2024 05:55:12 -0700
Message-ID: <CAADnVQKfSH_zkP0-TwOB_BLxCBH9efot9mk03uRuooCTMmWnWA@mail.gmail.com>
Subject: Re: [PATCH v5 17/17] powerpc64/bpf: Add support for bpf trampolines
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf <bpf@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Sep 29, 2024 at 10:33=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
>
>
> On 17/09/24 1:20 pm, Alexei Starovoitov wrote:
> > On Sun, Sep 15, 2024 at 10:58=E2=80=AFPM Hari Bathini <hbathini@linux.i=
bm.com> wrote:
> >>
> >> +
> >> +       /*
> >> +        * Generated stack layout:
> >> +        *
> >> +        * func prev back chain         [ back chain        ]
> >> +        *                              [                   ]
> >> +        * bpf prog redzone/tailcallcnt [ ...               ] 64 bytes=
 (64-bit powerpc)
> >> +        *                              [                   ] --
> > ...
> >> +
> >> +       /* Dummy frame size for proper unwind - includes 64-bytes red =
zone for 64-bit powerpc */
> >> +       bpf_dummy_frame_size =3D STACK_FRAME_MIN_SIZE + 64;
> >
> > What is the goal of such a large "red zone" ?
> > The kernel stack is a limited resource.
> > Why reserve 64 bytes ?
> > tail call cnt can probably be optional as well.
>
> Hi Alexei, thanks for reviewing.
> FWIW, the redzone on ppc64 is 288 bytes. BPF JIT for ppc64 was using
> a redzone of 80 bytes since tailcall support was introduced [1].
> It came down to 64 bytes thanks to [2]. The red zone is being used
> to save NVRs and tail call count when a stack is not setup. I do
> agree that we should look at optimizing it further. Do you think
> the optimization should go as part of PPC64 trampoline enablement
> being done here or should that be taken up as a separate item, maybe?

The follow up is fine.
It just odd to me that we currently have:

[   unused red zone ] 208 bytes protected

I simply don't understand why we need to waste this much stack space.
Why can't it be zero today ?

> [1]
> https://lore.kernel.org/all/40b65ab2bb3a48837ab047a70887de3ccd70c56b.1474=
661927.git.naveen.n.rao@linux.vnet.ibm.com/
> [2] https://lore.kernel.org/all/20180503230824.3462-11-daniel@iogearbox.n=
et/
>
> Thanks
> Hari

