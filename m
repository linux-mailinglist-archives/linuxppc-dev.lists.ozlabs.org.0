Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4324440D66A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 11:41:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9BtG0bpTz2xYR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 19:41:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jPcF0P+c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131;
 helo=mail-lf1-x131.google.com; envelope-from=rm.skakun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jPcF0P+c; dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9BsX2f3Xz2xfD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 19:40:47 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id c8so16149223lfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 02:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f4r5L82T8lVgmjDxktA/sisuupFmx7x30+6IlhMnYag=;
 b=jPcF0P+cHfyIuFllT9s+XQDbpTKL/DP/WZ12xBmDnC0LZJsbJeGpydQ+nj1jG3vyhQ
 MXkF+s9f9DZe82C3OUmuCqssXSW6Xy1D8PFT7XMOVkyU74aEXJL7HBQJL//WLAcHnHlT
 6JAWY0XBjZ7XwV9xpdiHpNmVxyHHj5cWcQPRN6QHBZx1dqJ5C5ttXeA+io6IcnyWEI1q
 dTKH6A8fDq2gQ2GNoUTTZGZkVAhST9ZUJ+pdKy05GPpnzXG3EkGwi93ZGAuCS4fkFkql
 PEeqVQZUULvnCU7rK1P4+9aDwbpW2w/MkOtNecCIBYtcqqkOy4RB/4LhCrlLfobSeeON
 wc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f4r5L82T8lVgmjDxktA/sisuupFmx7x30+6IlhMnYag=;
 b=bNFZSb59s+ZpSzrJW7KNdjCiPQ/dfcmInx1B1kmBtV5A29i2NgLaGwfNlXez2jQjz+
 Fx0iooFUrsq1dqioky/8YGEj4T+XnJzD2UVEmL+aHE3jYldGCFSnRxOSnus/IfPBfqM8
 KFW/vFbFNjQc2o715+aRWDz72UpCNOHIEGv3RPy4hT+9a0nSfEkssisQ/U5SoIOuIKUJ
 v5cRey/8n4Z+YQx4+eqMEEDNSbv96rt2RK+L69h4GTC+AkLNEk/sQG/P1KQCKMb8XiJz
 qLW5/eLc3m8XNgWHXM+8XvfmWYv6fzqcPZuP6UUwP4jOnB6i+4o1Xl7rhOmh9uZqBHPg
 GBcA==
X-Gm-Message-State: AOAM533wBnRCs5BsLmtCVqUBj1cIsCWgqiSr8412qsosnfRVT/tkELhW
 3kY+4si58Ri/Xe0myrPGri26HZConHKUnCfKbwA=
X-Google-Smtp-Source: ABdhPJyIIyf4A7fhfDx7l6dTfpk1Ec/zzEqy4u9mdnznrZCiaqfyA9V5XQj08EEuePeq9U7P318zvMYzkOuwjxToNGM=
X-Received: by 2002:a2e:1508:: with SMTP id s8mr3587923ljd.240.1631785239506; 
 Thu, 16 Sep 2021 02:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com> <20210914153046.GB815@lst.de>
 <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141838290.21985@sstabellini-ThinkPad-T480s>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Thu, 16 Sep 2021 12:40:28 +0300
Message-ID: <CADu_u-OjpYB0-B=tLKYsZH=auvQF-o7PJb-11W=1emY8jaA-mg@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
To: Stefano Stabellini <sstabellini@kernel.org>
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
 Paul Mackerras <paulus@samba.org>, Jan Beulich <jbeulich@suse.com>,
 Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 iommu <iommu@lists.linux-foundation.org>, Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stefano,

> Also, Option 1 listed in the webpage seems to be a lot better. Any
> reason you can't do that? Because that option both solves the problem
> and increases performance.

Yes, Option 1 is probably more efficient.
But I use another platform under Xen without DMA adjustment functionality.
I pinned this webpage only for example to describe the similar problem I ha=
d.

Cheers,
Roman

=D1=81=D1=80, 15 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 04:51, Stefa=
no Stabellini <sstabellini@kernel.org>:

>
> On Tue, 14 Sep 2021, Christoph Hellwig wrote:
> > On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> > > I'm not convinced the swiotlb use describe there falls under "intende=
d
> > > use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside=
,
> > > the bottom of this page is also confusing, as following "Then we can
> > > confirm the modified swiotlb size in the boot log:" there is a log
> > > fragment showing the same original size of 64Mb.
> >
> > It doesn't.  We also do not add hacks to the kernel for whacky out
> > of tree modules.
>
> Also, Option 1 listed in the webpage seems to be a lot better. Any
> reason you can't do that? Because that option both solves the problem
> and increases performance.



--
Best Regards, Roman.
