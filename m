Return-Path: <linuxppc-dev+bounces-917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF9796A12D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 16:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WypV96J6cz2y83;
	Wed,  4 Sep 2024 00:51:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725375089;
	cv=none; b=fzoCH7zccz8umneiUBFUpNyuDApfC6yqOKlHus0K4E2p3D5n4Np/4tuAX4qxtJfszE2tlkvo9KXGQt197NaYfOAtINfePyYWBecnx8eVcor/bDV+09D1l7blcoKOHYtgxgxBUSYZvjdMW0N0/rjEbzjmPNeXo+JF1+fZ4cUJtci1dHgZ7FFjLGdWzR0kB7AkNUxcC/spp1tpYvti2sgxXWzh594bFElS0UBI1tn79mG1FhsVTmoou/1IePR89a1BSBkKyopWgxbRdknkJDRGTsZPffmKUDDDKdTKuQp9l+Yfm6F7azy94pbp08QFYT9IVk2ISxwrtk4yLdxrK351Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725375089; c=relaxed/relaxed;
	bh=bDqnEweAQ91ZaX2BP7Rb9KWNWhs+lCN9D8yckPy3xkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGWXnwW5y/M9TuLgsYzCeUlDmAQiRIby8w5vEEwJ2X5Um67q9lmMLR6V5Lt9asIA5YMvzWquUsbPaU+o8psss6NVFg56hTiUq5zmC4RYhmGOTKB/VroMJeZRjXxxqM29gXerWNojQo7p/2DVAX3W4dEqfUV/aMbtqSOpPXVXjjCJT4fLdJkdaSTn3qRJhTZyHtOg+84AGgtmWWVGgOqHTlIwXLRs4Tgxd4PmxyjNGr5sjA6h0GDhHMwU7ytLPS5GGaOOerQwZCAydR+0wxJCPbsXcx/DA+cgfw/COcKEE0e/R+Gyo7yAN9eK+l8PcowuGeBnofE7Y1W3bpbDKeImuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WypV91ybpz2y3Z
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 00:51:27 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16944FEC;
	Tue,  3 Sep 2024 07:51:21 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54B823F66E;
	Tue,  3 Sep 2024 07:50:51 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:50:46 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, will@kernel.org,
	x86@kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 16/30] arm64: handle PKEY/POE faults
Message-ID: <20240903144823.GA3669886@e124191.cambridge.arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-17-joey.gouly@arm.com>
 <40600b75-68eb-421a-a122-256bd20afb89@sirena.org.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40600b75-68eb-421a-a122-256bd20afb89@sirena.org.uk>

On Thu, Aug 29, 2024 at 06:55:07PM +0100, Mark Brown wrote:
> On Thu, Aug 22, 2024 at 04:10:59PM +0100, Joey Gouly wrote:
> 
> > +static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
> > +			unsigned int mm_flags)
> > +{
> > +	unsigned long iss2 = ESR_ELx_ISS2(esr);
> > +
> > +	if (!system_supports_poe())
> > +		return false;
> > +
> > +	if (iss2 & ESR_ELx_Overlay)
> > +		return true;
> 
> Does this need an is_data_abort() && is_instruction_abort() check?
> Overlay doesn't appear to be defined for all exception types and it
> wasn't clear enough to me that the callers have done this check.

The only callers are in do_page_fault(), which should only be data or
instruction aborts. I talked with Catalin and he said it's fine to not check
again here.

I can add a permissions check though:

commit 033270f5a9462e998b4dee11fc91b43ac7929756
Author: Joey Gouly <joey.gouly@arm.com>
Date:   Tue Sep 3 15:45:59 2024 +0100

    fixup! arm64: handle PKEY/POE faults

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index a68055150950..f651553a8ab8 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -495,6 +495,9 @@ static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
        if (!system_supports_poe())
                return false;
 
+       if (!esr_fsc_is_permission_fault(esr))
+               return false;
+
        if (iss2 & ESR_ELx_Overlay)
                return true;
 


Since the ESR_EL1 documentation says:
	If a memory access generates a Data Abort for a Permission fault, then this field holds information
	about the fault.

Thanks,
Joey

