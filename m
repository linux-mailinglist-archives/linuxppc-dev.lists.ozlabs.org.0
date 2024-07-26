Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFC93D6BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 18:15:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVtBh1kF5z3dRl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:15:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVtBH5rFQz3dHm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 02:14:43 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2C1E1007;
	Fri, 26 Jul 2024 09:14:35 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E7AB3F766;
	Fri, 26 Jul 2024 09:14:07 -0700 (PDT)
Date: Fri, 26 Jul 2024 17:14:01 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 18/29] arm64: add POE signal support
Message-ID: <ZqPLSRjjE+SRoGAQ@e133380.arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-19-joey.gouly@arm.com>
 <229bd367-466e-4bf9-9627-24d2d0821ff4@arm.com>
 <7789da64-34e2-49db-b203-84b80e5831d5@sirena.org.uk>
 <cf7de572-420a-4d59-a8dd-effaff002e12@arm.com>
 <ZqJ2I3f2qdiD2DfP@e133380.arm.com>
 <a13c3d5e-6517-4632-b20d-49ce9f0d8e58@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a13c3d5e-6517-4632-b20d-49ce9f0d8e58@sirena.org.uk>
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, Joey Gouly <joey.gouly@arm.com>, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, Amit Daniel Kachhap <amitdaniel.kachhap@arm.com>, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 07:11:41PM +0100, Mark Brown wrote:
> On Thu, Jul 25, 2024 at 04:58:27PM +0100, Dave Martin wrote:
> 
> > I'll post a draft patch separately, since I think the update could
> > benefit from separate discussion, but my back-of-the-envelope
> > calculation suggests that (before this patch) we are down to 0x90
> > bytes of free space (i.e., over 96% full).
> 
> > I wonder whether it is time to start pushing back on adding a new
> > _foo_context for every individual register, though?
> 
> > Maybe we could add some kind of _misc_context for miscellaneous 64-bit
> > regs.
> 
> That'd have to be a variably sized structure with pairs of sysreg
> ID/value items in it I think which would be a bit of a pain to implement
> but doable.  The per-record header is 64 bits, we'd get maximal saving
> by allocating a byte for the IDs.

Or possibly the regs could be identified positionally, avoiding the
need for IDs.  Space would be at a premium, and we would have to think
carefully about what should and should not be allowed in there.

> It would be very unfortunate timing to start gating things on such a
> change though (I'm particularly worried about GCS here, at this point
> the kernel changes are blocking the entire ecosystem).

For GCS, I wonder whether it should be made a strictly opt-in feature:
i.e., if you use it then you must tolerate large sigframes, and if it
is turned off then its state is neither dumped nor restored.  Since GCS
requires an explict prctl to turn it on, the mechanism seems partly
there already in your series.

I guess the GCS thread is the better place to discuss that, though.

Cheers
---Dave
