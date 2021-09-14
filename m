Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D5840B284
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 17:07:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H86CD4TBnz3035
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 01:07:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QyiBaTXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=QyiBaTXq; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H86BV0dKrz2xtS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 01:06:40 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id k13so29501560lfv.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 08:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EzJJglIKGC48QdUN7q/bO92tR/bPSNOmcPTOelyHSLI=;
 b=QyiBaTXqJT3tfSj4FPnn3N5NJbOe8F+Cu+G+6IjAqi1mR6mzzmZRvnorZfNh67EhgA
 E0kmmFugaVyuhHWBDxX1l7I+O8WXBOV2L4Z+uUWbE6+aB3Aglp62OhtimUbqhHFm7JEG
 OFKxbo3qvCrdOzHN6gHAlI/xSVf+/qxXpALTbxz9eU9/8C6R0mH80f4oTEibxIdtjGJX
 SuAtDKyMruCYj438VU1jDvmCVcoomgJSNJEuCINoVMe5TJNmefdcbBT02IEPDGYSQPjC
 7mUJMxirCuXltF2UDOy3ZJMzjVcmfCpiIE/AJAmNQKpi5iQLyoGI9yHg4VL5Gz974KeL
 WAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EzJJglIKGC48QdUN7q/bO92tR/bPSNOmcPTOelyHSLI=;
 b=nT7mJeUA7B73MCNoxOi0Fq1OkSph9nU3sMKLxcO7CuqTnkE4lPI2XQQkF7T1hsbOhZ
 Nholpy7/vClhpVhwdCZeEWWwAXc6YJF7XXaDSYoMWC663RhswW1Nk5WRHs5BjH64Va/i
 bI+/kiHhwMESD6Yuawwr8Z7FUWdhinhFykHXgtOyKKVjBkc2rHenBur/0HdHOEcDeGwb
 M2MRtAVXq/j1Gkro+93pZEAhMnMUDxY7QAGedv/Gir668w3hW16nbGsaEAzyM+aQQt1A
 saidO51Dbo2+7JsusU06K33KZWtoDlIRpGg8hOL+b86ELhPezDi6FVQDQU4ckrWDtc/D
 4OQg==
X-Gm-Message-State: AOAM530VWLuROxCvYAuOz/Dhlapuvmp/W6sVfrsIwfu1nCtbHgh0zSh8
 oNTubsueWPKGg/6RnR0lj82MxbEGSu6NjluEx7fcow==
X-Google-Smtp-Source: ABdhPJyfzYJNUVcid0Mv8SrxwCc8R0D2eUc9I9Ak+tqlBDDyuc1xrf0IHGsLNaiPxPe8a7FMvUdpMXF8J8LcpwRWLp4=
X-Received: by 2002:a05:6512:14f:: with SMTP id
 m15mr8378352lfo.82.1631631994438; 
 Tue, 14 Sep 2021 08:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <50a91600-173f-ae8f-e194-4649a9f8176b@linux.vnet.ibm.com>
 <20210914162223.363dd7c2@canb.auug.org.au>
In-Reply-To: <20210914162223.363dd7c2@canb.auug.org.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 14 Sep 2021 08:06:22 -0700
Message-ID: <CAKwvOdmHH-tOkCPGX-Si7gSujKj-CV3O5UjZD7BNtsTKwMmkeA@mail.gmail.com>
Subject: Re: [5.15-rc1][PPC][bisected 6d2ef226] mainline build breaks at
 ./include/linux/compiler_attributes.h:62:5: warning: "__has_attribute"
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>, ojeda@kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021 at 11:22 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Abdul,
>
> On Tue, 14 Sep 2021 11:39:44 +0530 Abdul Haleem <abdhalee@linux.vnet.ibm.com> wrote:
> >
> > Today's mainline kernel fails to compile on my powerpc box with below errors
> >
> > ././include/linux/compiler_attributes.h:62:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
> >   #if __has_attribute(__assume_aligned__)
> >       ^~~~~~~~~~~~~~~
> > ././include/linux/compiler_attributes.h:62:20: error: missing binary operator before token "("
> >   #if __has_attribute(__assume_aligned__)
> >                      ^
> > ././include/linux/compiler_attributes.h:88:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
> >   #if __has_attribute(__copy__)
> >       ^~~~~~~~~~~~~~~
> > ././include/linux/compiler_attributes.h:88:20: error: missing binary operator before token "("
> >   #if __has_attribute(__copy__)
> >
> > Kernel builds fine when below patch is reverted
> >
> > commit 6d2ef22 : compiler_attributes.h: drop __has_attribute() support for gcc4
>
> Thanks for your report.
>
> This is known and being addressed.

Thanks for the report. Support for GCC 4.X has been dropped.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=76ae847497bc5207c479de5e2ac487270008b19b
-- 
Thanks,
~Nick Desaulniers
