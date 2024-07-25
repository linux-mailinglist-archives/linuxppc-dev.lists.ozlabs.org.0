Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB693C6E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 17:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFv22Ncfz3dHK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 01:59:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVFtd28zgz3cY9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 01:59:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22CF21007;
	Thu, 25 Jul 2024 08:58:59 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C07A83F5A1;
	Thu, 25 Jul 2024 08:58:29 -0700 (PDT)
Date: Thu, 25 Jul 2024 16:58:27 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
 <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
 <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, Mark Brown <broonie@kernel.org>, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 03, 2024 at 02:51:46PM +0530, Amit Daniel Kachhap wrote:
> 
> 
> On 5/31/24 22:09, Mark Brown wrote:
> > On Tue, May 28, 2024 at 12:26:54PM +0530, Amit Daniel Kachhap wrote:
> > > On 5/3/24 18:31, Joey Gouly wrote:
> > 
> > > > +#define POE_MAGIC	0x504f4530
> > > > +struct poe_context {
> > > > +	struct _aarch64_ctx head;
> > > > +	__u64 por_el0;
> > > > +};
> > 
> > > There is a comment section in the beginning which mentions the size
> > > of the context frame structure and subsequent reduction in the
> > > reserved range. So this new context description can be added there.
> > > Although looks like it is broken for za, zt and fpmr context.
> > 
> > Could you be more specific about how you think these existing contexts
> > are broken?  The above looks perfectly good and standard and the
> > existing contexts do a reasonable simulation of working.  Note that the
> > ZA and ZT contexts don't generate data payload unless userspace has set
> > PSTATE.ZA.
> 
> Sorry for not being clear on this as I was only referring to the
> comments in file arch/arm64/include/uapi/asm/sigcontext.h and no code
> as such is broken.
> 
>  * Allocation of __reserved[]:
>  * (Note: records do not necessarily occur in the order shown here.)
>  *
>  *      size            description
>  *
>  *      0x210           fpsimd_context
>  *       0x10           esr_context
>  *      0x8a0           sve_context (vl <= 64) (optional)
>  *       0x20           extra_context (optional)
>  *       0x10           terminator (null _aarch64_ctx)
>  *
>  *      0x510           (reserved for future allocation)
> 
> Here I think that optional context like za, zt, fpmr and poe should have
> size mentioned here to make the description consistent.As you said ZA
> and ZT context are enabled by userspace so some extra details can be
> added for them too.

Regarding this, __reserved[] is looking very full now.

I'll post a draft patch separately, since I think the update could
benefit from separate discussion, but my back-of-the-envelope
calculation suggests that (before this patch) we are down to 0x90
bytes of free space (i.e., over 96% full).


I wonder whether it is time to start pushing back on adding a new
_foo_context for every individual register, though?

Maybe we could add some kind of _misc_context for miscellaneous 64-bit
regs.

[...]

Cheers
---Dave
