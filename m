Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88740F64E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 12:53:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9rRR5SKxz2ypk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 20:53:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WPqhGp7Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=rm.skakun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WPqhGp7Y; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9rQm6pYzz2xh1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 20:53:19 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id i25so31509009lfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 03:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GwPKvHPa7SWPdAxFNaWPHxr/qhyv9zoje0np7fedQKE=;
 b=WPqhGp7YFJx9AUCevICXrAodjCpr6nIpm2Ih1DUPRgTO2JIO4D88GB1S962YfHO9vm
 DRezWJVTxjj9rs0AZRWxJOWrvy9r+qKMeskCPE927IzPuRXFDgRa2iadYLcTMOd/64+4
 nzSruXNpaJKUZ/QJMboU8PnvfhM3HxH1/+n2Hxdlkx7TK9deyd8BenrLblqAQ+bMgzVD
 B6WKlUg0EoDvkkaNdaR+KyTdmSq6OG0BlpLoAPZbqIl9QPO8MWAsO5TjFbpFLhkwDdr4
 XYe66QAT2Ou7DTn+qqH8GubuMGhG8e16UInR2xW2MYta03lHYWn05LHNPgYs5vhLU3q9
 bpYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GwPKvHPa7SWPdAxFNaWPHxr/qhyv9zoje0np7fedQKE=;
 b=rXoznE3QmN5ygXsp1dEwki156x/qauqHR05fozJBNzE0GI8LkGQ406hesECfVTH+0g
 P2zD5NoDOsAVJ/7498SwhdGZOwhr7SkPdIpJYIzp9XtQvNhud87B3v/qx0QA/TVwfdz8
 NU7eDRCWtJ0keftnp2g1iqeZFKZxu+CYumZHQrW4kJ7HOM3omvNmz7QmsG8JNyS8ATaM
 Tzf9p+kXrs8nFQq0J22b/NwuZLbYOs1chUSPvNYxFgrdSXmLwWJoN6Uwdtd2R30jgasD
 BB4IDKcrL8scIonBIoZQMFbtdEG7R+pn2CYld4ALIJJlm75qrONS6giZKFDZu4VzYfQk
 PEOA==
X-Gm-Message-State: AOAM530OSbGUaxCN34I/pAaodyZCbJsXMofC4dRlM1l/73LAZVu3PWLD
 muiUlYayG9jy/9l6CaW0uAvbgId9HQluR7n6os8=
X-Google-Smtp-Source: ABdhPJxECw0V3jWNF/BA8gW1zDMxBYDkGOJs8qFL3/XqUc3j9ICvKltI4RP4oRxJGpZWee5/Y+mW8GOAZO8FS/BZnHE=
X-Received: by 2002:ac2:5310:: with SMTP id c16mr7346042lfh.393.1631875996413; 
 Fri, 17 Sep 2021 03:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
 <CADu_u-Ou08tMFm5xU871ae8ct+2YOuvn4rQ=83CMTbg2bx87Pg@mail.gmail.com>
 <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
In-Reply-To: <84ef7ff7-2c9c-113a-4a2c-cef54a6ded51@suse.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Fri, 17 Sep 2021 13:53:05 +0300
Message-ID: <CADu_u-NvDrKkYJXoPSH8BL2GzKmCUNtsSz=6mn1yA+pPcUMpLA@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Jan Beulich <jbeulich@suse.com>
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 iommu <iommu@lists.linux-foundation.org>, Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Rapoport <rppt@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jan,

>>>  In order to be sure to catch all uses like this one (including ones
>>>  which make it upstream in parallel to yours), I think you will want
>>>  to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.
>>
>> I don't understand your point. Can you clarify this?
>
> There's a concrete present example: I have a patch pending adding
> another use of IO_TLB_SEGSIZE. This use would need to be replaced
> like you do here in several places. The need for the additional
> replacement would be quite obvious (from a build failure) if you
> renamed the manifest constant. Without renaming, it'll take
> someone running into an issue on a live system, which I consider
> far worse. This is because a simple re-basing of one of the
> patches on top of the other will not point out the need for the
> extra replacement, nor would a test build (with both patches in
> place).

It's reasonable.
I will change the original IO_TLB_SEGSIZE to IO_TLB_DEFAULT_SEGSIZE in the
next patch series.

Thanks.

=D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 16:50, Jan B=
eulich <jbeulich@suse.com>:
>
> On 15.09.2021 15:37, Roman Skakun wrote:
> >>> From: Roman Skakun <roman_skakun@epam.com>
> >>>
> >>> It is possible when default IO TLB size is not
> >>> enough to fit a long buffers as described here [1].
> >>>
> >>> This patch makes a way to set this parameter
> >>> using cmdline instead of recompiling a kernel.
> >>>
> >>> [1] https://www.xilinx.com/support/answers/72694.html
> >>
> >>  I'm not convinced the swiotlb use describe there falls under "intende=
d
> >>  use" - mapping a 1280x720 framebuffer in a single chunk?
> >
> > I had the same issue while mapping DMA chuck ~4MB for gem fb when
> > using xen vdispl.
> > I got the next log:
> > [ 142.030421] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz:
> > 3686400 bytes), total 32768 (slots), used 32 (slots)
> >
> > It happened when I tried to map bounce buffer, which has a large size.
> > The default size if 128(IO_TLB_SEGSIZE) * 2048(IO_TLB_SHIFT) =3D 262144
> > bytes, but we requested 3686400 bytes.
> > When I change IO_TLB_SEGSIZE to 2048. (2048(IO_TLB_SEGSIZE)  *
> > 2048(IO_TLB_SHIFT) =3D 4194304bytes).
> > It makes possible to retrieve a bounce buffer for requested size.
> > After changing this value, the problem is gone.
>
> But the question remains: Why does the framebuffer need to be mapped
> in a single giant chunk?
>
> >>  In order to be sure to catch all uses like this one (including ones
> >>  which make it upstream in parallel to yours), I think you will want
> >>  to rename the original IO_TLB_SEGSIZE to e.g. IO_TLB_DEFAULT_SEGSIZE.
> >
> > I don't understand your point. Can you clarify this?
>
> There's a concrete present example: I have a patch pending adding
> another use of IO_TLB_SEGSIZE. This use would need to be replaced
> like you do here in several places. The need for the additional
> replacement would be quite obvious (from a build failure) if you
> renamed the manifest constant. Without renaming, it'll take
> someone running into an issue on a live system, which I consider
> far worse. This is because a simple re-basing of one of the
> patches on top of the other will not point out the need for the
> extra replacement, nor would a test build (with both patches in
> place).
>
> Jan
>


--=20
Best Regards, Roman.
