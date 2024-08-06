Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70251948C91
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 12:05:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdTSp38Msz3cbF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 20:05:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdTSQ03cqz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 20:04:50 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D53DA7;
	Tue,  6 Aug 2024 03:04:44 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C837F3F6A8;
	Tue,  6 Aug 2024 03:04:15 -0700 (PDT)
Date: Tue, 6 Aug 2024 11:04:13 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH v4 04/29] arm64: disable trapping of POR_EL0 to EL2
Message-ID: <20240806100413.GE841837@e124191.cambridge.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-5-joey.gouly@arm.com>
 <ZqJyzZB8Y8GLzYIA@e133380.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqJyzZB8Y8GLzYIA@e133380.arm.com>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, broonie@kernel.org, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 04:44:13PM +0100, Dave Martin wrote:
> Hi,
> 
> On Fri, May 03, 2024 at 02:01:22PM +0100, Joey Gouly wrote:
> > Allow EL0 or EL1 to access POR_EL0 without being trapped to EL2.
> > 
> > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> > ---
> >  arch/arm64/include/asm/el2_setup.h | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> > index b7afaa026842..df5614be4b70 100644
> > --- a/arch/arm64/include/asm/el2_setup.h
> > +++ b/arch/arm64/include/asm/el2_setup.h
> > @@ -184,12 +184,20 @@
> >  .Lset_pie_fgt_\@:
> >  	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> >  	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1PIE_SHIFT, #4
> > -	cbz	x1, .Lset_fgt_\@
> > +	cbz	x1, .Lset_poe_fgt_\@
> >  
> >  	/* Disable trapping of PIR_EL1 / PIRE0_EL1 */
> >  	orr	x0, x0, #HFGxTR_EL2_nPIR_EL1
> >  	orr	x0, x0, #HFGxTR_EL2_nPIRE0_EL1
> >  
> > +.Lset_poe_fgt_\@:
> > +	mrs_s	x1, SYS_ID_AA64MMFR3_EL1
> > +	ubfx	x1, x1, #ID_AA64MMFR3_EL1_S1POE_SHIFT, #4
> > +	cbz	x1, .Lset_fgt_\@
> > +
> > +	/* Disable trapping of POR_EL0 */
> > +	orr	x0, x0, #HFGxTR_EL2_nPOR_EL0
> 
> Do I understand correctly that this is just to allow the host to access
> its own POR_EL0, before (or unless) KVM starts up?

Yup.

> 
> KVM always overrides all the EL2 trap controls while running a guest,
> right?  We don't want this bit still set when running in a guest just
> because KVM doesn't know about POE yet.

KVM currently unconditionally traps POE regs currently, this series makes that
conditional.

> 
> (Hopefully this follows naturally from the way the KVM code works, but
> my KVM-fu is a bit rusty.)
> 
> Also, what about POR_EL1?  Do we have to reset that to something sane
> (and so untrap it here), or it is sufficient if we never turn on POE
> support in the host, via TCR2_EL1.POE?

Since the host isn't using it, we don't need to reset it. It will be reset to an unknown value for guests.

In patch 7:

+	{ SYS_DESC(SYS_POR_EL1), NULL, reset_unknown, POR_EL1 },

> 
> [...]
> 
> Cheers
> ---Dave

Thanks,
Joey
