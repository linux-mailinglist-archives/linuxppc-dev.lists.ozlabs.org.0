Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F391D912C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 09:37:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R74d43BqzDqJl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 17:37:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=pN7+ZmJt; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R6Sm6dntzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 17:09:26 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id j21so6202356ejy.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 00:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kh83+i5wB5y2TfXkmhcoF7oKPmPUYzTeTgOonnemCpU=;
 b=pN7+ZmJtXthz51NwK6m+cXBceZzSW8sG8yjk8lz9tZ2AYsaxG7G5SuJU9gcTPwhgF2
 SjBsEkJFw+nwv5D66n6a7vYs1Fm44ovq7EFARvR/L30Q7OvDbNiFqOuKH6yh0qSYaCXD
 4C71DCRRAxm98S6NZmsDUvbqxY2Y2TiyvEpPQGYxLr7E2T/53XMsHzWJ77p2dgQV4UMl
 6FO8hAIZ450ZNMkZsnUDPuZ2ROfV7bCLdgmXPfKqmdjPC+y+E+M03Bq1hhukl82tFPd9
 T+es2PQDXaXYx+CU5Hfv8opcO/Vh58qINekflet+xyOykAlkVmzUW0Yp+bGlDIZaRKkQ
 5Nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kh83+i5wB5y2TfXkmhcoF7oKPmPUYzTeTgOonnemCpU=;
 b=fzv9lwWaRldafGuIgAoz458rNEOsh2ULzKTD8X2nbJ0KZreeKmvwUKpouIdrPgY6kp
 gJ8ifI0u4USJwDxZllNngVPILTOqvpkfYHPqzT2mViHJwpNLuBGy5McA5LcrEMsqJe0S
 LvlkxrSJDLKAUREN1WEM7ssWtq15L/TVMNbxPuAf8k/A2xnKL99PO0/x5RoZXRItfjIx
 TmsPERhYwidGlmEywYUCBzoVRgoqrLNGdvEspjAF3UV1jcrlcv5F7dAWOMEN9unZbYX2
 vDScx8zQi4OpWu56qZxb4KktKQsa4NW85wufRiYJPDkggxKb9ULefFlIipedm8qpCw2Q
 g6rg==
X-Gm-Message-State: AOAM530d1Ej6nc0wTXsRP+WRM4EFC9E3xnwktQ5sKosIhpokj8QyFPAW
 M3fSo6e6Ef6UOXfr/x/ws0n6a3KhJdWkSZr7Ei7m4YML
X-Google-Smtp-Source: ABdhPJyY1+6icu96XuroiXonfBuEVeMr79j7e37fGri7YK7TKCij2SqixO72vqqnp4Yc2n02GlZTqPAoijK4JHeT+rg=
X-Received: by 2002:a17:907:9484:: with SMTP id
 dm4mr8403153ejc.56.1589872162813; 
 Tue, 19 May 2020 00:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200513034705.172983-1-aneesh.kumar@linux.ibm.com>
 <20200513034705.172983-3-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iAdrdMiSzVr1UL9Naya+Rq70WVuKqCCNFHe1C4n+E6Tw@mail.gmail.com>
 <87v9kspk3x.fsf@linux.ibm.com>
In-Reply-To: <87v9kspk3x.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 19 May 2020 00:09:11 -0700
Message-ID: <CAPcyv4g+oE305Q5bYWkNBKFifB9c0TZo6+hqFQnqiFqU5QFrhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] libnvdimm/nvdimm/flush: Allow architecture to
 override the flush barrier
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: alistair@popple.id.au, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 18, 2020 at 10:30 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
>
> Hi Dan,
>
> Apologies for the delay in response. I was waiting for feedback from
> hardware team before responding to this email.
>
>
> Dan Williams <dan.j.williams@intel.com> writes:
>
> > On Tue, May 12, 2020 at 8:47 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> Architectures like ppc64 provide persistent memory specific barriers
> >> that will ensure that all stores for which the modifications are
> >> written to persistent storage by preceding dcbfps and dcbstps
> >> instructions have updated persistent storage before any data
> >> access or data transfer caused by subsequent instructions is initiated.
> >> This is in addition to the ordering done by wmb()
> >>
> >> Update nvdimm core such that architecture can use barriers other than
> >> wmb to ensure all previous writes are architecturally visible for
> >> the platform buffer flush.
> >
> > This seems like an exceedingly bad idea, maybe I'm missing something.
> > This implies that the deployed base of DAX applications using the old
> > instruction sequence are going to regress on new hardware that
> > requires the new instructions to be deployed.
>
>
> pmdk support for ppc64 is still work in progress and there is pull
> request to switch pmdk to use new instruction.

Ok.

>
> https://github.com/tuliom/pmdk/commit/fix-flush
>
> All userspace applications will be switched to use the new
> instructions. The new instructions are designed such that when running on P8
> and P9 they behave as 'dcbf' and 'hwsync'.

Sure, makes sense.

> Applications using new instructions will behave as expected when running
> on P8 and P9. Only future hardware will differentiate between 'dcbf' and
> 'dcbfps'

Right, this is the problem. Applications using new instructions behave
as expected, the kernel has been shipping of_pmem and papr_scm for
several cycles now, you're saying that the DAX applications written
against those platforms are going to be broken on P8 and P9?

> > I'm thinking the kernel
> > should go as far as to disable DAX operation by default on new
> > hardware until userspace asserts that it is prepared to switch to the
> > new implementation. Is there any other way to ensure the forward
> > compatibility of deployed ppc64 DAX applications?
>
> AFAIU there is no released persistent memory hardware on ppc64 platform
> and we need to make sure before applications get enabled to use these
> persistent memory devices, they should switch to use the new
> instruction?

Right, I want the kernel to offer some level of safety here because
everything you are describing sounds like a flag day conversion. Am I
misreading? Is there some other gate that prevents existing users of
of_pmem and papr_scm from having their expectations violated when
running on P8 / P9 hardware? Maybe there's tighter ecosystem control
that I'm just not familiar with, I'm only going off the fact that the
kernel has shipped a non-zero number of NVDIMM drivers that build with
ARCH=ppc64 for several cycles.
