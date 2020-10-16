Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5CD290C50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 21:32:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCbs06524zDqpy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 06:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=LtWF4l2z; 
 dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCbnY1y4qzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 06:29:36 +1100 (AEDT)
Received: by mail-ej1-x642.google.com with SMTP id p5so4791603ejj.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRVo2b4ecg4fSLmj2WDTdho466tlop5d3GW1xgN23Yc=;
 b=LtWF4l2zb33bsp8mIFoo0zYwm+TW2Ly3PPuLPnO3A6OUPkIxlrpqhj+yE02ERp9D8e
 0A0I6jUZa/WGIdYT0aSYrO4r6yS7SV3b+44IbPu6gddOdh4PBi/bfl/WzLB9bNZRZpZK
 br4Z/e7aE9SCW3jSJY/PBQYNJS9XMkpaijjNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRVo2b4ecg4fSLmj2WDTdho466tlop5d3GW1xgN23Yc=;
 b=YGf2gao41iyKmFtf6JveBNoyev22qZFg+t9WmGBHXNTpt/yQW4BanLZ8AEY+sa1czV
 1rNEZ3iYPmKTPukrikOF3GUoyC7wgujn/WWj3bDQMwye4bJKZ3hVF1Sg+zgMVLGg2TB0
 Ldy8/8eyoxlw86xW7GhhbevSWQZ526LHR+2cKX6hVCi8hi55J1oG2UuGAjeBdF0z8fk4
 nkwqL1dz9gX5ahfMMdDbQx0xth0k9hFo1TALrr/DvykhrbmSoX53JDY4gY/2QaDG3gaa
 fRpJpnKw4xn5pF2Ah9WId6LJvHfKCyVrQRNP/piMYRhuqPYSeVbxDh4hx9ZlpCUvbLCA
 DALA==
X-Gm-Message-State: AOAM530Dn+kso/MyS09BaznEncbaInjDG9gDrTUDjuWZgZZjk8ANVGE3
 CAhCXxt+6X+FK1moLbUIcfBhlRpNWQXslg==
X-Google-Smtp-Source: ABdhPJzP/owvDhK52eWVWyU9nxEuZpcwHvjCQyOrz+RaVoRSaHjc59n/simPDp1cy2Z3Snz5YRfQpg==
X-Received: by 2002:a17:906:5618:: with SMTP id
 f24mr5292342ejq.86.1602876572810; 
 Fri, 16 Oct 2020 12:29:32 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54])
 by smtp.gmail.com with ESMTPSA id rn10sm2569395ejb.8.2020.10.16.12.29.32
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 12:29:32 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id t9so4193897wrq.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 12:29:32 -0700 (PDT)
X-Received: by 2002:ac2:5f48:: with SMTP id 8mr2066193lfz.344.1602876159691;
 Fri, 16 Oct 2020 12:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <87a6wmzwco.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6wmzwco.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 16 Oct 2020 12:22:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTwLKR1YhVHv5UzvCag5jxBeKVxLLxN9-CoxQYhi_=Kw@mail.gmail.com>
Message-ID: <CAHk-=wjTwLKR1YhVHv5UzvCag5jxBeKVxLLxN9-CoxQYhi_=Kw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.10-1 tag
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: ego@linux.vnet.ibm.com, Stephen Kitt <steve@sk2.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, jniethe5@gmail.com,
 mahesh@linux.ibm.com, liushixin2@huawei.com,
 Oliver O'Halloran <oohall@gmail.com>, fthain@telegraphics.com.au,
 hofrat@osadl.org, Christoph Hellwig <hch@lst.de>, leobras.c@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, wangwensheng4@huawei.com,
 Joel Stanley <joel@jms.id.au>, yangyingliang@huawei.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, mrochs@linux.ibm.com,
 zhengbin <zhengbin13@huawei.com>, nathanl@linux.ibm.com, biwen.li@nxp.com,
 ajd@linux.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 kjain@linux.ibm.com, Nick Piggin <npiggin@gmail.com>, Qian Cai <cai@lca.pw>,
 clg@kaod.org, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, atrajeev@linux.vnet.ibm.com,
 gromero@linux.ibm.com, cheloha@linux.ibm.com, yanaijie@huawei.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Wolfram Sang <wsa@kernel.org>,
 miaoqinglang@huawei.com, fbarrat@linux.ibm.com,
 Colin King <colin.king@canonical.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 8:24 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Just two minor conflicts I'm aware of. The only slight subtlety is the conflict
> in kasan_init() where "int ret" needs to move out of the for_each_mem_range()
> and up to the function scope.

Well, there was also a conflict for the dependencies of OCXL.

I resolved that by ruthlessly simplifying the dependency:

-       depends on PPC_POWERNV && PCI && EEH && HOTPLUG_PCI_POWERNV
 -      depends on PPC_POWERNV && PCI && EEH && PPC_XIVE_NATIVE
++      depends on HOTPLUG_PCI_POWERNV

because all the other dependencies seem to be pointless.

HOTPLUG_PCI_POWERNV already has a

        depends on PPC_POWERNV && EEH

so there's no point in repeating those.

And PPC_XIVE_NATIVE is selected by PPC_POWERNV, so if PPC_POWERNV, we
know PPC_XIVE_NATIVE is set.

Maybe I missed something strange, so I'm just letting you know so you
can blame me if I broke something.

              Linus
