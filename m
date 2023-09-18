Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4D7A4BC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 17:22:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gokl6aZJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq7nM64fPz3cBQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 01:21:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=gokl6aZJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq7mW1Cwtz2xYt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 01:21:14 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-770ef353b8fso303547385a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050472; x=1695655272; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9iwt12QdmH2nPtcjR0iEq1G+1D18erLjJ1cQj58qe4I=;
        b=gokl6aZJHrZbgwGn3j4S99udvVzgCSmXlZZMuowHefRT3W4rYOulbPLEYBXpSmIUhU
         eAzTCaPIopPjYcv4OKcapGfM3AhS1INaVIRzkOb8jXq4hDCYEyiQLd9C5jXjoFU/OvyA
         i1L4/sPf97WAYO50GikGK0luY+jw5tkh0p2RXC4t3vLBj5WerThx2qP20mH9nR2cgOjt
         dtpNpLrcpps0utCOlic6NPjKOIDkJgHwyZGUYHAwqmgN1T/j6eIsb85HsSzoSLekaiDO
         WJfyO4BqwwxL7PxOh0n72doHDAB58+sV6wurutxsvFE6CoCPy5B9I9LeADWrCXj0c74Z
         iUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050472; x=1695655272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iwt12QdmH2nPtcjR0iEq1G+1D18erLjJ1cQj58qe4I=;
        b=X8Z0NEFYNEX1iIqm5vPcrZoNuGHGhOtb6X5rV7AaBabRfHqLMCKR6qxMBEP/z0qQb2
         G/7unM2c5zQrz7KWXegSb41IvTfCsPkMnu5PnkjBDxSzuTvEygz/Sb2dOFPQuGKrgC6F
         d2ottEjkkYrP1ntbqJLYidDwLysg4IcYPV10X5RTfHk3oR03JupOPSx4hVBjXT1uGIYR
         EPZ2W6QGzV5+ItblIypjsK7egPkYGfHe165F5LB6YztBk2cPb7n99AqGP7/1xDl//THv
         nAUehs4KACpadCvKWARtzbTea43KDFSSCAIBVnl0zul4Pohvjle8/d+l4gg9j2c3Bu1H
         pScA==
X-Gm-Message-State: AOJu0Yyt+L4ZAF2TLMQwUMuu+aI2HN1Rg3Ph6rYvNjrSdZsb1T3xd4nr
	NSkKhFgQUlr02ClZ7BSK7Ojucw==
X-Google-Smtp-Source: AGHT+IEUJFa3aXEX1YodKfdMrwJPEEuzBhbA2hgycHy86i8DANtxQ0UmL29SlN96YZ1Wg+zGpbaj/w==
X-Received: by 2002:a05:620a:31a8:b0:76d:a110:856d with SMTP id bi40-20020a05620a31a800b0076da110856dmr11089993qkb.0.1695050471902;
        Mon, 18 Sep 2023 08:21:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id i20-20020a05620a145400b0076f18be9a64sm3220186qkl.81.2023.09.18.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:21:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiG3i-0005PK-IY;
	Mon, 18 Sep 2023 12:21:10 -0300
Date: Mon, 18 Sep 2023 12:21:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
Message-ID: <20230918152110.GI13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-6-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-6-seanjc@google.com>
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
Cc: x86@kernel.org, kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Andrew Thornton <andrewth@google.com>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Venkatesh Srinivas <venkateshs@chromium.org>, Heiko Carstens <hca@linux.ibm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>, And
 y Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Krowiak <akrowiak@linux.ibm.com>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-perf-users@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 05:30:57PM -0700, Sean Christopherson wrote:
> Explicitly pass KVM's get/put helpers to VFIO when attaching a VM to
> VFIO instead of having VFIO do a symbol lookup back into KVM.  Having both
> KVM and VFIO do symbol lookups increases the overall complexity and places
> an unnecessary dependency on KVM (from VFIO) without adding any value.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio.h      |  2 ++
>  drivers/vfio/vfio_main.c | 74 +++++++++++++++++++---------------------
>  include/linux/vfio.h     |  4 ++-
>  virt/kvm/vfio.c          |  9 +++--
>  4 files changed, 47 insertions(+), 42 deletions(-)

I don't mind this, but Christoph had disliked my prior attempt to do
this with function pointers..

The get can be inlined, IIRC, what about putting a pointer to the put
inside the kvm struct?

The the normal kvm get/put don't have to exported symbols at all?

Jason
