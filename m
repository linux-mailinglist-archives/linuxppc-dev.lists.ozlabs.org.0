Return-Path: <linuxppc-dev+bounces-1254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C597548E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 15:51:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3hnZ0RHnz2yZ5;
	Wed, 11 Sep 2024 23:51:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726062706;
	cv=none; b=XG/OK2dRZ3JRCYeI9Q6aj4sjbjrITkCIPHTQZEjEOA9AVcg3vsHKJbJGMQq8IpGOip579MO4KAkRIVadF4b0/s5LCCOeXy232WLbaGG86u54KM2WCGcLw1cGurp/ArEJVPNjhznkNoyn6+tj+BAfsWmUCILLZ8MZYZ8GkM1yG7sGgoj+Q5+n1LgBo21CNBf49b980WFg7LyLveMy6Aj6+cxjJ0LOwuIoLWkRAZEodvO6aa0qYWDWL+99KR3UAQwCnXFUpaPDA6dx8VrrVaahsEuaWEpGIGQfBBBb+/h1abkG9SqUJUEDwfG0pMxzjA+wDPBWkQr3tbegkUHHXKUPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726062706; c=relaxed/relaxed;
	bh=bxYvtT3ZbBySkpF4wPbt0thynaF/fmTsnDLlO7eN+TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VEWILiFWzYpznxghA5o924hTWzxuDyZqDf9cMDXCj6cjEsDmnR3nF9MLQw2WSRAt/hSXOVThMGpxdF08vKkhO+Sgiu9W7EmfDKbLo4HttM3BhWnu9t2egdmDsAg46TiJ4qOugQIZe9fmjymBlgLR7bG0x4iAgrMHBVHbTyaM95PC0w/6+6JfpoxbV+DNeyS/ezfjQyYUAEV6b1Au+9DobfQ56n5MIU6K9SYqzwlc5aRXLFyTN/feRODJbCgDxd8ud1dBXbPRkFySP2KgcAggBTr6U7AtDSfBx+j+p5LW3fBdoxshdJ/mA/GwaNhTKkUTr08dWaGYghAfKmU2EFjKdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NeyCdeiW; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NeyCdeiW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3hnY5MjFz2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 23:51:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C11D15C01C8;
	Wed, 11 Sep 2024 13:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF906C4CEC0;
	Wed, 11 Sep 2024 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726062703;
	bh=esTHwqZQY89z5c47Uj1ctm3mtoh1ZJVRwU7dALV134M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=NeyCdeiWUHf3IhSEPWgn2DkGBpDRb6SsxBs0RlFNx4Fczo9SA+YQUAs7N7MXjnlwH
	 Gyy1v26ZHQEufa0y5X3aD8gjYfMyeELL8qUE+3IT4CaETrivxjLh7SrcITxVwztza/
	 VA8AFfg3ajOY04ThGUNZAC11cVEBrJTzICSAA12u+teMxc4mbJA/QuYMUZvA8W15uv
	 whxc0cB3MSr0cZpm7J0awJF375VohEBUdzt/+7tvxuNOcCOiwPY4NzvlReDT3hx+/W
	 B6u9ooKkI5apaP5bHY5GrIGwL9AX47T3mdgiRO06TIrTHWAd4q8mOybhrqk7+Zjwyv
	 MiK8XtH8RPkVw==
Date: Wed, 11 Sep 2024 08:51:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, vishal.l.verma@intel.com,
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com,
	jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
	will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com
Subject: Re: [PATCH 02/12] pci/p2pdma: Don't initialise page refcount to one
Message-ID: <20240911135141.GA629523@bhelgaas>
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
In-Reply-To: <87r09rgfjj.fsf@nvdebian.thelocal>

On Wed, Sep 11, 2024 at 11:07:51AM +1000, Alistair Popple wrote:
> 
> >> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> >> index 4f47a13..210b9f4 100644
> >> --- a/drivers/pci/p2pdma.c
> >> +++ b/drivers/pci/p2pdma.c
> >> @@ -129,6 +129,12 @@ static int p2pmem_alloc_mmap(struct file *filp, struct kobject *kobj,
> >>  	}
> >>  
> >>  	/*
> >> +	 * Initialise the refcount for the freshly allocated page. As we have
> >> +	 * just allocated the page no one else should be using it.
> >> +	 */
> >> +	set_page_count(virt_to_page(kaddr), 1);
> >
> > No doubt the subject line is true in some overall context, but it does
> > seem to say the opposite of what happens here.
> 
> Fair. It made sense to me from the mm context I was coming from (it was
> being initialised to 1 there) but not overall. Something like "move page
> refcount initialisation to p2pdma driver" would make more sense?

Definitely would, thanks.

