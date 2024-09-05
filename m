Return-Path: <linuxppc-dev+bounces-1047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9496D631
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 12:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzwlL6DlQz2xJ5;
	Thu,  5 Sep 2024 20:36:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725532606;
	cv=none; b=OthmPjhme5/VA8tc/MS5qG4feMfqgDXfYa30FiJZ/XNSQUdUUG55d+DK0WpXhHIWTckZOegvW96BEJ0FU5vCW8w5ik0y9oAPp3KiBq2caP2CSk/G0uKJj4cHjALf1Yxkq8KbKFVLsei29udZ/C0TIEj2FWD7haBtHn2sfRWAg//az1MaAxfK2+n6VnY9hc2SdSbgcjC/9qb1oSOr/wHFuGkrS64sBQmIEJq+KhreMM7OlbR4sga16VKbjLv/uh8zNXXrPHlF+57HLMCghXx6oVXBCKKk6GZr+A8w/8fIwFzrqQVLFFH6WbP6Cdb9+6s+uYb8MmLFhJwIiShw1CTSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725532606; c=relaxed/relaxed;
	bh=L5pSH3MV3akZj9vAODkthPSwZUhi1r5WiwKkj5V7qJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhnbPhzxyFR72C1DS50JEE+z4I6qVHX6Pri6Zakb5lYPtGg99wOX78KfLnwTBo/BHekaEREetsTSI7zjCeol19ohfoeMVuS5cJhu5qewv722KxENyJ+sXzssrcK4OWD2kMj6JOXSVRg93lDdMPUpWvis8P9vCJwMw6oL6i2QWRbXwj7oCpiBjsEHpqerq4HkFc50RUe0NLFH+v3oBbxHTvZswahBxhy9CwM38ra1ArzWaFKnfKytvMMyJklLMbQO9xNcWZivpF12ALlZzzS2PNzztF6I3En+HhOx6qbNHgSyN04+tAQIdRd0s+eO+vInqgLQ5DeR3zdYpRDQGJ4TBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzwlL4c8gz2xGs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 20:36:46 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBFABFEC;
	Thu,  5 Sep 2024 03:36:41 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40AB93F73F;
	Thu,  5 Sep 2024 03:36:11 -0700 (PDT)
Date: Thu, 5 Sep 2024 11:36:06 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, nd@arm.com,
	akpm@linux-foundation.org, aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
	broonie@kernel.org, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, x86@kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
Message-ID: <20240905103606.GA4063653@e124191.cambridge.arm.com>
References: <20240823170835.GA1181@willie-the-truck>
 <ZsjXtE7Kg0LQwNAL@arm.com>
 <20240827113803.GB4318@willie-the-truck>
 <ZtYNGBrcE-j35fpw@arm.com>
 <20240903145413.GB3669886@e124191.cambridge.arm.com>
 <20240904102254.GA13280@willie-the-truck>
 <20240904113221.GA3891700@e124191.cambridge.arm.com>
 <20240904114301.GA13550@willie-the-truck>
 <20240904125503.GA3901671@e124191.cambridge.arm.com>
 <20240904161758.GA14323@willie-the-truck>
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
In-Reply-To: <20240904161758.GA14323@willie-the-truck>

On Wed, Sep 04, 2024 at 05:17:58PM +0100, Will Deacon wrote:
> On Wed, Sep 04, 2024 at 01:55:03PM +0100, Joey Gouly wrote:
> > On Wed, Sep 04, 2024 at 12:43:02PM +0100, Will Deacon wrote:
> > > Right, there's quite a lot I need to do:
> > > 
> > > - Uncorrupt your patches
> > > - Fix the conflict in the kvm selftests
> > > - Drop the unnecessary ISBs
> > > - Fix the ESR checking
> > > - Fix the el2_setup labels
> > > - Reorder the patches
> > > - Drop the patch that is already in kvmarm
> > > 
> > > Working on it...
> > 
> > Sorry! I'm happy to rebase onto some arm64 branch if that will help, just let me know.
> 
> Please have a look at for-next/poe (also merged into for-next/core and
> for-kernelci) and let me know what I got wrong!

I pulled for-next/poe and ran the test and it works fine. Also looked at the
diff of my branch against your branch, and it looks fine too.

Thanks for your work to get this merged!

> 
> For Marc: I reordered the series so the KVM bits (and deps) are all the
> beginning, should you need them. The branch is based on a merge of the
> shared branch you created previously.
> 
> Cheers,
> 
> Will
> 

