Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F948D65A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 17:22:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrRh21qtLz3frd
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 01:22:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrRgd3n0Yz3fm1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 01:22:20 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D4BD1424;
	Fri, 31 May 2024 08:22:11 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31AA63F641;
	Fri, 31 May 2024 08:21:44 -0700 (PDT)
Date: Fri, 31 May 2024 16:21:38 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Szabolcs Nagy <szabolcs.nagy@arm.com>, dave.hansen@linux.intel.com
Subject: Re: [PATCH v4 17/29] arm64: implement PKEYS support
Message-ID: <20240531152138.GA1805682@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-18-joey.gouly@arm.com>
 <ZlnlQ/avUAuSum5R@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlnlQ/avUAuSum5R@arm.com>
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
Cc: catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Szabolcs,

On Fri, May 31, 2024 at 03:57:07PM +0100, Szabolcs Nagy wrote:
> The 05/03/2024 14:01, Joey Gouly wrote:
> > Implement the PKEYS interface, using the Permission Overlay Extension.
> ...
> > +#ifdef CONFIG_ARCH_HAS_PKEYS
> > +int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
> > +{
> > +	u64 new_por = POE_RXW;
> > +	u64 old_por;
> > +	u64 pkey_shift;
> > +
> > +	if (!arch_pkeys_enabled())
> > +		return -ENOSPC;
> > +
> > +	/*
> > +	 * This code should only be called with valid 'pkey'
> > +	 * values originating from in-kernel users.  Complain
> > +	 * if a bad value is observed.
> > +	 */
> > +	if (WARN_ON_ONCE(pkey >= arch_max_pkey()))
> > +		return -EINVAL;
> > +
> > +	/* Set the bits we need in POR:  */
> > +	if (init_val & PKEY_DISABLE_ACCESS)
> > +		new_por = POE_X;
> > +	else if (init_val & PKEY_DISABLE_WRITE)
> > +		new_por = POE_RX;
> > +
> 
> given that the architecture allows r,w,x permissions to be
> set independently, should we have a 'PKEY_DISABLE_EXEC' or
> similar api flag?
> 
> (on other targets it can be some invalid value that fails)

I didn't think about the best way to do that yet. PowerPC has a PKEY_DISABLE_EXECUTE.

We could either make that generic, and X86 has to error if it sees that bit, or
we add a arch-specific PKEY_DISABLE_EXECUTE like PowerPC.

A user can still set it by interacting with the register directly, but I guess
we want something for the glibc interface..

Dave, any thoughts here?

> 
> > +	/* Shift the bits in to the correct place in POR for pkey: */
> > +	pkey_shift = pkey * POR_BITS_PER_PKEY;
> > +	new_por <<= pkey_shift;
> > +
> > +	/* Get old POR and mask off any old bits in place: */
> > +	old_por = read_sysreg_s(SYS_POR_EL0);
> > +	old_por &= ~(POE_MASK << pkey_shift);
> > +
> > +	/* Write old part along with new part: */
> > +	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
> > +
> > +	return 0;
> > +}
> > +#endif

Thanks,
Joey
