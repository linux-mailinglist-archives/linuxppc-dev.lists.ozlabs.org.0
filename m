Return-Path: <linuxppc-dev+bounces-5668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF61AA217E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 08:11:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjYGf4Cbyz2yGT;
	Wed, 29 Jan 2025 18:11:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738134666;
	cv=none; b=BMKMYGMCNKK5+JMbfiDbh8Txa0G6mqCD9uj9gGOnRQ6SNa7i6KnoxZnFT6MmHkujL0b3lbSD3CslEmfejxDNA6iNQgv0zQLAt1+ZibNhDKUrfFamDGmx5LzsuSXm/rxTWLLjQu7oq9XdGGqTUo1nqP7ZL2fWzvp+cmZfTzVcA/0sZPBXq9hExdqDKhBwmFEcpy54qJF3ApQm6vody2yPQaOV4obW8YJoPwqQgMFoom+VGRcxQVHPcJGYd5AjaTNSKbnEzQ7I42YJxAWOiRq9D4/g0eGrS8tlBFi1uC8cG+UeoI9gKznpyJAWt4wXIae6ZYuWqT+SsQa3lR14Q/6IqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738134666; c=relaxed/relaxed;
	bh=LXbDEtR3pSx78Av72/d/+qLYZk8aXx7fJOq96yTSBRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9JcP23Y0nvqxeYdXoDfyn4D5qotUnXZz0CAVGPoT1cxI+zKT5gOeuYVkUxVnglbyhYSkqTlKR0G8Z/sF5jRxldCVqkIQjWFEsNbxxDjA2f2N3Z+JF+8LdXhD7dO1KiVvCqb4Vjoz6iTDb88VK6sYswmq3n+vuPYxz6HsSCE/xYHF9lei96msDbHRH8N+zpWgmae5Jlrg4KyVTXGtmRIuKpB31KGgcIAYHCh9ODSZp19mVjwbvz93hE60UO0JMXKTycFPiGdQpct+57WzvtkZ4zrRG2f6BMIOq1mLHAH4th48pD0AuyQxwhnWXSM5OPP/L42OQIfhjb4A3ZbAoizUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=wmHs4BKK; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=wmHs4BKK;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjYGb4WFWz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 18:11:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738134651;
	bh=LXbDEtR3pSx78Av72/d/+qLYZk8aXx7fJOq96yTSBRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmHs4BKKFEVorsZWVC60UVNe4UZ6enR0ItkbC/h/RQAdUI0SE6qNg/lBFn1114ZrW
	 6FeY/XjMCMIsyTcs+Y9AFBx6DtNMVXLDXCtfSWB73RhlBvQVI2bJp+YIEk+MSIYzrE
	 jlJj/JqXLmnkpwpBsAUpOVc6sC0pGi2BHMl4Eqrlfs6kxIQJFxRjeU6RzVlkVv9j+/
	 i59JhcdCcVDkebzxwlC061aC20gWfN6+SI0NdRlSHyKIH4LaCz3C9pbd7dEKhx4Lhh
	 z4DbOVfP3Un+IHktVd8efwQZWLk/Q6abOX9TfFF5OC5rUywmEzXEOzgGPEvW/DcN5g
	 4D4XADfe8wb5A==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjYGM2Cxwz4wc3; Wed, 29 Jan 2025 18:10:51 +1100 (AEDT)
Date: Wed, 29 Jan 2025 17:57:38 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/microwatt: Add SMP support
Message-ID: <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
 <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 04:21:26PM +1000, Nicholas Piggin wrote:
> On Wed Jan 29, 2025 at 8:55 AM AEST, Paul Mackerras wrote:
> > This adds support for Microwatt systems with more than one core, and
> > updates the device tree for a 2-core version.  (This does not prevent
> > the kernel from running on a single-core system.)
> >
> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> 
> Well, I'm impressed you added SMP :)
> 
> What happens with a 1 CPU system? Do we time out waiting for secondaries
> and continue, or is there something more graceful?

There's a field in the SYSCON register which tells you how many cores
there are.  microwatt_init_smp() looks at that field and only starts
the CPUs that are there.

Oops, sorry, I see that I forgot to do 'git add' on
arch/powerpc/platforms/microwatt/smp.c.  Here it is (I'll include it
properly in v2, of course):

// SPDX-License-Identifier: GPL-2.0-or-later

/*
 * SMP support functions for Microwatt
 * Copyright 2025 Paul Mackerras <paulus@ozlabs.org>
 */

#include <linux/kernel.h>
#include <linux/smp.h>
#include <linux/io.h>
#include <asm/early_ioremap.h>
#include <asm/xics.h>

#include "microwatt.h"

static void __init microwatt_smp_probe(void)
{
	xics_smp_probe();
}

static void microwatt_smp_setup_cpu(int cpu)
{
	if (cpu != 0)
		xics_setup_cpu();
}

static struct smp_ops_t microwatt_smp_ops = {
	.probe		= microwatt_smp_probe,
	.message_pass	= NULL,		/* Use smp_muxed_ipi_message_pass */
	.kick_cpu	= smp_generic_kick_cpu,
	.setup_cpu	= microwatt_smp_setup_cpu,
};

/* XXX get from device tree */
#define SYSCON_BASE	0xc0000000

#define SYSCON_CPU_CTRL	0x58

void __init microwatt_init_smp(void)
{
	volatile unsigned char __iomem *syscon;
	int ncpus;
	int timeout;

	syscon = early_ioremap(SYSCON_BASE, 0x100);
	if (syscon == NULL) {
		pr_err("Failed to map SYSCON\n");
		return;
	}
	ncpus = (readl(syscon + SYSCON_CPU_CTRL) >> 8) & 0xff;
	if (ncpus < 2)
		goto out;

	smp_ops = &microwatt_smp_ops;

	/*
	 * Write two instructions at location 0:
	 * mfspr r3, PIR
	 * b __secondary_hold
	 */
	*(unsigned int *)KERNELBASE = 0x7c7ffaa6;
	*(unsigned int *)(KERNELBASE+4) = 0x4800005c;

	/* enable the other CPUs, they start at location 0 */
	writel((1ul << ncpus) - 1, syscon + SYSCON_CPU_CTRL);

	timeout = 10000;
	while (!__secondary_hold_acknowledge) {
		if (--timeout == 0)
			break;
		barrier();
	}

 out:
	early_iounmap((void *)syscon, 0x100);
}

Paul.

