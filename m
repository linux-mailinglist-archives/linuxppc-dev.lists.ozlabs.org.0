Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B56182F8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 16:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N379m5vxBz3ccn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 02:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=IMzxLKhz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=ajones@ventanamicro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=IMzxLKhz;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N378p5GDLz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 02:34:16 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id f5so6292727ejc.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 08:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nyiqtS+4bjeBqC2j1CWjrUOou5+X6yWUKBJ7APuUG8=;
        b=IMzxLKhzewPSr953ozKcvA7MJkFz5aBGxh8wYt4YDDFNkFIw3w1GbuIjjEYSijrvZN
         vrsCGUFhvMNDOgPyJH44HqqAB1ZCby8RagmeEdamwIzh7rWeGkXUJabTgCCG9GgR49p8
         eM1itnPR9VBPRPpXfufcFcUxykqWRbKSPPJgqNhWqyIczmyjaQ6yxBg5KqRewZ7TYZcy
         yquj8IvH/AQtJnsWm9yePrvX+uUI5XSresCTCa3CObXmVX+CRvt3amiWYtwztltaW2u/
         K2vNjxe8ke2YRetylyiUkj+eMGGsypPmIL4gqhk0ENvCLYBb5PdSkY7ojDfwYsl+jzEo
         D12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nyiqtS+4bjeBqC2j1CWjrUOou5+X6yWUKBJ7APuUG8=;
        b=bVnFNiSDz9Rp3X8S7KoWSboljRwQpvl2n/FxvnP4oTBMdhFQEXLrK17bWTt+CrBiSr
         vfcNsuuzm5EliUwqoFabMyTxOVvFdY8Vv29Luaicanlzr++tI9AGbAa1ZoELdZ7sdp4m
         7yrQmMZIs+2/McmfDAv9YIRgi6LAfciHJns0DsBP4BSttebCaVeVULWHxxPuPsKba6JE
         /OjUcYY2e/4X7KhOaWzPXeEWjzU8YwDBqvf7pNNHbCgEPwR8V7t9Jj5ZGRkzfBPa/7Rl
         T+KetUv4N+x0HAwrJoUgjCRqslJPx486AKUX7r3oAv6DwjyXVB9NEU9NbIHP86RD2rk8
         RgIA==
X-Gm-Message-State: ACrzQf1bkho9FN+s1yduJzsaQrsLFUgiap2B2XSLu/FLSsBBHBHFZC4B
	yGra60rTujvxVULbQIeij3tVMg==
X-Google-Smtp-Source: AMsMyM7fW4+lX3GNb3JnmyhpDtENiHSDLEpmcsIq/zZQ8gPf3Wg1SImlQR44FmCt0HiSs2WLUbDJOQ==
X-Received: by 2002:a17:907:6e1a:b0:7ad:ba0b:538c with SMTP id sd26-20020a1709076e1a00b007adba0b538cmr26868184ejc.111.1667489645948;
        Thu, 03 Nov 2022 08:34:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id r5-20020a170906a20500b00787f91a6b16sm627228ejy.26.2022.11.03.08.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 08:34:05 -0700 (PDT)
Date: Thu, 3 Nov 2022 16:34:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <20221103153404.uh77nrdkowrxj6cr@kamzik>
References: <Y1vrMMtRwb0Lekl0@yury-laptop>
 <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2PX9GfxWYh6+XGT@zn.tnic>
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

On Thu, Nov 03, 2022 at 04:02:12PM +0100, Borislav Petkov wrote:
> On Thu, Nov 03, 2022 at 01:59:45PM +0100, Andrew Jones wrote:
> > The patch I'm proposing ensures cpumask_next()'s range, which is actually
> > [-1, nr_cpus_ids - 1),
> 
> Lemme make sure I understand it correctly: on the upper boundary, if you
> supply for n the value nr_cpu_ids - 2, then it will return potentially
> the last bit if the mask is set, i.e., the one at position (nr_cpu_ids - 1).
> 
> If you supply nr_cpus_ids - 1, then it'll return nr_cpu_ids to signal no
> further bits set.
> 
> Yes, no?

Yes

> 
> > I'll send a v4 with another stab at the commit message.
> 
> Yes, and it is still an unreadable mess: "A kernel compiled with commit
> ... but not its revert... " Nope.
> 
> First make sure cpumask_next()'s valid accepted range has been settled
> upon, has been explicitly documented in a comment above it and then I'll
> take a patch that fixes whatever is there to fix.

That's fair, but I'll leave that to Yury.

> 
> Callers should not have to filter values before passing them in - the
> function either returns an error or returns the next bit in the mask.

That's reasonable, but cpumask folk probably need to discuss it because
not all cpumask functions have a return value where an error may be
placed.

> 
> This thing:
> 
> 	if (*pos == nr_cpu_ids)
> 
> but then to pass in pos - 1:
> 
> 	*pos = cpumask_next(*pos - 1
> 
> looks to me like the interface needs more cooking.

Indeed, but that's less of an issue with cpumask_next() than with
the way cpuinfo implements its start and next seq ops (next
unconditionally increments *pos and then calls start and start
must use *pos - 1 since the first time its called it needs to use
-1).

Thanks,
drew
