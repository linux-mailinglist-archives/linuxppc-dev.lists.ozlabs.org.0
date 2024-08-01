Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7129450A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 18:32:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZZJG6SVZz3dV9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 02:32:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZZHw0KTPz3dL8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 02:32:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D6FC1007;
	Thu,  1 Aug 2024 09:32:21 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D4A3F5A1;
	Thu,  1 Aug 2024 09:31:52 -0700 (PDT)
Date: Thu, 1 Aug 2024 17:31:50 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v4 10/29] arm64: enable the Permission Overlay Extension
 for EL0
Message-ID: <Zqu4dgB4RSW9MNs1@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-11-joey.gouly@arm.com>
 <ZqJz9EoqJE95Oe7g@e133380.arm.com>
 <20240801160403.GD841837@e124191.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801160403.GD841837@e124191.cambridge.arm.com>
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

On Thu, Aug 01, 2024 at 05:04:03PM +0100, Joey Gouly wrote:
> On Thu, Jul 25, 2024 at 04:49:08PM +0100, Dave Martin wrote:
> > On Fri, May 03, 2024 at 02:01:28PM +0100, Joey Gouly wrote:
> > > Expose a HWCAP and ID_AA64MMFR3_EL1_S1POE to userspace, so they can be used to
> > > check if the CPU supports the feature.
> > > 
> > > Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > ---
> > > 
> > > This takes the last bit of HWCAP2, is this fine? What can we do about more features in the future?
> > > 
> > > 
> > >  Documentation/arch/arm64/elf_hwcaps.rst |  2 ++
> > >  arch/arm64/include/asm/hwcap.h          |  1 +
> > >  arch/arm64/include/uapi/asm/hwcap.h     |  1 +
> > >  arch/arm64/kernel/cpufeature.c          | 14 ++++++++++++++
> > >  arch/arm64/kernel/cpuinfo.c             |  1 +
> > >  5 files changed, 19 insertions(+)
> > > 
> > > diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> > > index 448c1664879b..694f67fa07d1 100644
> > > --- a/Documentation/arch/arm64/elf_hwcaps.rst
> > > +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> > > @@ -365,6 +365,8 @@ HWCAP2_SME_SF8DP2
> > >  HWCAP2_SME_SF8DP4
> > >      Functionality implied by ID_AA64SMFR0_EL1.SF8DP4 == 0b1.
> > >  
> > > +HWCAP2_POE
> > > +    Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
> > 
> > Nit: unintentionally dropped blank line before the section heading?
> 
> Now there's only one blank line, I think
> c1932cac7902a8b0f7355515917dedc5412eb15d unintentionally added 2 blank lines,
> before that it was always 1!

Hmmm, true.  Not a big deal, I guess.

Cheers
---Dave
