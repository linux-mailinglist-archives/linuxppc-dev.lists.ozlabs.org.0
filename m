Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8D9CB37B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 05:29:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kwNH6z40zDqcS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 13:29:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kwLK2cZ8zDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 13:27:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="pK3CJJg5"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46kwLJ3y35z9sPv; Fri,  4 Oct 2019 13:27:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46kwLJ0dyWz9sPq;
 Fri,  4 Oct 2019 13:27:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1570159672; bh=TcbKMW5KH27R1xtA9D4Gjb+DmQsJsuiNBmb43VsXBBY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pK3CJJg5Iz26eZzXO6aDT4OO1pSbBNtg0MaiclYPM8CXAZQMmy81Q6LfTGMYk21rJ
 OiyF7aE37uI26NHUZeBZtQuMm3Q5fn0eZvwtW7EuxCBkWR/PJRdGTI2SpJmKegoHr0
 qvyQZCNduvJYL/7SKVYzWWQ+JOoOflF2ZcGBjAcTO/3wjaniU6P8Vx4kWMl18YLD2q
 Rt0V90CqKPSe6iaIZLq1hmhATl6nwOVnUmE+QmYqyldwfrk8zOEqKY1PN7gEq0d879
 v1rgwQoaQbZhajPq21GU52W+Icn07sZ4mdZBZj/doh25o5xtzmO14NJaOgp9CvGuX5
 YbVzqUnmEOcYQ==
Subject: Re: [PATCH] powerpc/powernv/prd: Validate whether address to be
 mapped is part of system RAM
To: svaidy@linux.ibm.com
References: <20191002074856.15014-1-hegdevasant@linux.vnet.ibm.com>
 <2bb75b409a1159d5524be2d661e548e32fed152e.camel@ozlabs.org>
 <0e8a4057-fbe7-9b1a-6613-ad500ebe8b67@linux.vnet.ibm.com>
 <049794f6a16f548bcb418d31fecf268cb4a335e5.camel@ozlabs.org>
 <9b9b529d-cad7-0ace-acf6-e07d0dea5670@linux.vnet.ibm.com>
 <452718dfe591c4718498aab6b5c7b68a95cf6c5a.camel@ozlabs.org>
 <20191003102940.GC3181@drishya.in.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <0b130833-6521-17eb-c693-8de4b6ef4d95@ozlabs.org>
Date: Fri, 4 Oct 2019 11:27:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20191003102940.GC3181@drishya.in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vaidy,

> The current topic is who owns setting up the ATT bits for that piece
> of memory.  It is the kernel today.  Kernel decides to set this up as
> normal memory or I/O memory and sets the bits in page table entry.
> 
>> Or, what if there's a range of address-space that isn't backed by system
>> RAM (say, some MMIO-mapped hardware) that we want to expose to a future
>> HBRT implementation? This change will block that.
>> 
>> The kernel doesn't know what is and is not valid for a HBRT mapping, so
>> it has no reason to override what's specified in the device tree. We've
>> designed this so that the kernel provides the mechanism for mapping
>> pages, and not the policy of which pages can be mapped.
> 
> The features altered are cache inhibit and guarding which affects
> ability to fetch instructions.  If we allow HBRT to reside in an I/O
> memory, the we need to tell kernel that it is ok to allow caching and
> instruction execution in that region and accordingly change the ATT
> bits.

But this isn't only about the HBRT range itself (ie., the memory 
containing the HBRT binary). Everything that HBRT needs to map will come 
through this path. We may not need to fetch instructions from those ranges.

> This patch does not block a working function, but actually makes
> debugging a failed case easier.  The failing scenario without this
> check is such that HBRT cannot fetch from the region of memory and
> loops in minor page faults doing nothing.

Yep, that's not great, but the alternative means applying this kernel 
policy, which we can't guarantee is correct.

That is, unless the page protection bits mean that this won't work 
anyway, but we can probably fix that without a kernel policy, by 
applying the appropriate pgprot_t, perhaps.

> As Vasant mentioned hostboot team will add code to relocate the HBRT
> to the right place.  Addressing your concern, if we end up allowing
> HBRT in non system-RAM area

Not just HBRT, but anything that HBRT maps too.

> we need to add some more flags in device
> tree to instruct the driver to force change the page protection bits
> as page_prot = pgprot_cached(page_prot);

Doesn't phys_mem_access_prot() handle that for us? Or do I have my 
_noncached/_cached logic inverted?

Cheers,


Jeremy
