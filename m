Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AA2613177
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 09:07:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N15N867rfz3c69
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 19:07:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=LYy0CICI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=LYy0CICI;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N15MB5xwJz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 19:06:12 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id bj12so27297247ejb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=poxA0LEev9jPrhZnkwyY7vsWe/HDoG5TgR6taboptUU=;
        b=LYy0CICIyprTOFQXJbmxldQgszdggru36ppt8BlYlS/6Fadz4lG7+PvpBInXK3sEwl
         9c19coxXN6zfPF621QDiLFySz9+w3De89yPYhIqd1pl1g1LL2OTgeS0IT7F60LNAXCBj
         TF4jCAkyzHckAHw+4NbUXCJlkXC8jqinNwGBAo650tUVkm4qOCdpQOyA6+CxyIo6oVJI
         KHTpD5kEOyKveHPx/t7FAd8yS3EE8MPg+seA2KF22Fmhl2l8FspTrr8RgWX++cf2eZMF
         xm3SjqbAjsK1sVWszFcL2x0alWobxfqRnsQgl+JbUXYc2ZUSVa7+sfBfsb+bIQSHYlqq
         KjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poxA0LEev9jPrhZnkwyY7vsWe/HDoG5TgR6taboptUU=;
        b=wMecSJD4dX6f3SZPysEeR+VO7MRbpd7+b0ev2b3dOv7JRiHzkf9mkUQJTGcBYDSymg
         /HyLOEdfFwlbCNeo7fx71mGHO8JGa8vv9bL4kSm9sepCrcg8Z+2lu+aeagZlktxW20s/
         cuDucGOXI7BeFpnmbZKCsWPrU+A6iMfQ+fGat4K4nSPkVOmcvoxfJ4Un3m+pEMSwHfu3
         8Twbu3b0k//sU9bLl09/7Vziny3GpM7nL1NFAI23rUG1Mgm1Rck7kwYwRQ305B1+QHX5
         GVMxYyLDnI8FezxsQTZnLrUBbEXtInGCYSTemxPeHSghAcBowxSklOVXZL9JeneZbaRd
         mZiQ==
X-Gm-Message-State: ACrzQf2tOI7hTCfx8bNb5sFh/OA9IfckLNSUMeLLCpcnHS/ERoiEIpjl
	s147bN2zV9LuBNBLkQ5umAAgXw==
X-Google-Smtp-Source: AMsMyM5muTvUIOECduCaxj0EnA1GyAIhvxzQvG2kLFyGrfnTCKJuYOT5siPGSm+xWiTGjY/PqNGVtg==
X-Received: by 2002:a17:907:80b:b0:77a:86a1:db52 with SMTP id wv11-20020a170907080b00b0077a86a1db52mr11721653ejb.294.1667203565981;
        Mon, 31 Oct 2022 01:06:05 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id kz4-20020a17090777c400b0077b523d309asm2663665ejc.185.2022.10.31.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 01:06:05 -0700 (PDT)
Date: Mon, 31 Oct 2022 09:06:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221031080604.6xei6c4e3ckhsvmy@kamzik>
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com>
 <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1v+Ed6mRN9gisJS@zn.tnic>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 06:06:41PM +0200, Borislav Petkov wrote:
> On Fri, Oct 28, 2022 at 10:13:28AM -0500, Yury Norov wrote:
> > Because it's related to bitmap API usage and has been revealed after
> > some work in bitmaps.
> 
> So first of all, that "fix" needs to explain what exactly it is fixing.
> Not "it fixes this and that warning" but why the input arg to
> cpumask_next() cannot be nr_cpu_ids because... yadda yadda...

Hi Boris,

I didn't realize you were still looking for improvements to the commit
message for this patch. I could add something like,

 The valid cpumask range is [0, nr_cpu_ids) and cpumask_next() always
 returns a CPU ID greater than its input, which results in its input
 range being [-1, nr_cpu_ids - 1). Ensure showing CPU info avoids
 triggering error conditions in cpumask_next() by stopping its loop
 over CPUs when its input would be invalid.

Thanks,
drew

> 
> > And because nobody else cares.
> 
> Why do you assume that?
> 
> > If you're willing to move it yourself please go ahead.
> 
> If it fixes a real issue, we are taking it. And pls note that x86
> patches go through the tip tree.
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
