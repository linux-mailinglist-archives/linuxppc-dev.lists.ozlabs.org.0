Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6A83B03B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 18:42:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ym3oj3aL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKrr153kHz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 04:42:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ym3oj3aL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TKrqB1PJYz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 04:41:25 +1100 (AEDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5f254d1a6daso60002057b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 09:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706118080; x=1706722880; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HrKSWjAPLury0l0O07YwABLahdqYSfqu/vkyFWYooQ8=;
        b=Ym3oj3aLehX5s/uyltabOGLXGs/sSeBuhe2awRHExIYPIazPLtQLrw1jRMlmBKRwu/
         LNQ0G0gSTgLKYoxL2u/+994EfqqUw9QkdkKN2igQi8F5spf1ShV9I87LdA6rz+R85ZBS
         gws5bmZGBal23z4Q7RdaOi53SrAkJSBZDDOlExBYcrQdG4pRlEhXFpnadmFILtTbChub
         +m9jEYSpXurAlyvKVr2cGsW9capB2vBVfVTDV1etg2xFiUKRIQecRfZr/zLnCKiEQwMx
         vc/lM7pPMMe1qahrSF4z1YYigY8D4P3bV4oJWsa1Xou5jdpvhwb8ddN/zW3X7Z/FsLSh
         EiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706118080; x=1706722880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrKSWjAPLury0l0O07YwABLahdqYSfqu/vkyFWYooQ8=;
        b=X21iZWBTk3U70MpRD3OfFNv+0AUShhD3SC/bR72CeTIpTv6nEhCyZko52Is1040/Gw
         R8+9aI8RCEiKNask1y8ny37vz8l3uX/IszgX1bM1TUguEkVXbncW1Q6eKTRCQ/WWC7yz
         f/hkifL4vxE8DVylmoHcHndR2T0zTfBx39Umz9lpOsXT2qG83Q3JeHHtW22W4mvGsiAM
         Snpfo1Zju2aeB13GnYFXEORz2xnn7Pv1jzYZ7SEMH+e9a9UngAhRcLdH6TJ/2G4faixY
         h6XRtVEe1WS9vyJhG40ysuOyCgnz76NdsY/xMF1tBdNfKnmXAX01FHzdaXTn93m2RMBi
         WK1w==
X-Gm-Message-State: AOJu0Yx6wAhHiTeWqv5dulic52SCyQT6ij49ua0jzcOw8kMYoL08ahz/
	orb+WS+YF71scOpoNXhRb/w6APxHrEZ2ieD0Zf6HIjG2vdMladae
X-Google-Smtp-Source: AGHT+IG8FJ68JYgvol2vsYmkZB9x7Cw6vyk82+V1soudJ0xN7Bq1azDGVFF6zVhVo1ZMyf65R6wE/A==
X-Received: by 2002:a0d:d70b:0:b0:5ff:9f2c:1299 with SMTP id z11-20020a0dd70b000000b005ff9f2c1299mr1077412ywd.65.1706118079707;
        Wed, 24 Jan 2024 09:41:19 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:abdb:7236:6977:9ab5])
        by smtp.gmail.com with ESMTPSA id t140-20020a0dea92000000b005ffb2815960sm77564ywe.45.2024.01.24.09.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 09:41:19 -0800 (PST)
Date: Wed, 24 Jan 2024 09:41:18 -0800
From: Yury Norov <yury.norov@gmail.com>
To: "Lameter, Christopher" <cl@os.amperecomputing.com>
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <ZbFLvnMQ3wsQ0pIF@yury-ThinkPad>
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
 <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
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
Cc: mark.rutland@arm.com, rafael@kernel.org, catalin.marinas@arm.com, jiaxun.yang@flygoat.com, mikelley@microsoft.com, linux-riscv@lists.infradead.org, will@kernel.org, mingo@kernel.org, vschneid@redhat.com, chenhuacai@kernel.org, vbabka@suse.cz, kuba@kernel.org, patches@amperecomputing.com, linux-mips@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de, paul.walmsley@sifive.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, palmer@dabbelt.com, mhiramat@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 24, 2024 at 09:19:00AM -0800, Lameter, Christopher wrote:
> On Tue, 23 Jan 2024, Huang Shijie wrote:
> 
> > During the kernel booting, the generic cpu_to_node() is called too early in
> > arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> > 
> > For arm64/powerpc/riscv, there are at least four places in the common code
> > where the generic cpu_to_node() is called before it is initialized:
> > 	   1.) early_trace_init()         in kernel/trace/trace.c
> > 	   2.) sched_init()               in kernel/sched/core.c
> > 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> > 	   4.) workqueue_init_early()     in kernel/workqueue.c
> > 
> > In order to fix the bug, the patch changes generic cpu_to_node to
> > function pointer, and export it for kernel modules.
> > Introduce smp_prepare_boot_cpu_start() to wrap the original
> > smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> > Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> > and set the cpu_to_node to formal _cpu_to_node().
> 
> Would  you please fix this cleanly without a function pointer?
> 
> What I think needs to be done is a patch series.
> 
> 1. Instrument cpu_to_node so that some warning is issued if it is used too
> early. Preloading the array with NUMA_NO_NODE would allow us to do that.

By preloading do you mean compile-time initialization?
 
> 2. Implement early_cpu_to_node on platforms that currently do not have it.
> 
> 3. A series of patches that fix each place where cpu_to_node is used too
> early.

Agree. This is the right way to go. And pretty well all of it was discussed
in v1, isn't?

Thanks,
Yury
