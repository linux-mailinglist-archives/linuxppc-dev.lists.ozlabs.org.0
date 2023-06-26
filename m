Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AAA73E336
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 17:24:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jtaWgcjN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqWqL0hHNz30gc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 01:24:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jtaWgcjN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=dave.hansen@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqWpN5tKbz305g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 01:23:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687793037; x=1719329037;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=h8sLHtBTnVZJQ+VK9Mju0L08CrA3iMKmjHrpKD0aiOc=;
  b=jtaWgcjNbbybyHnrBMqrvyMPHFaAd20IsoGmNh0LLyeVbPZuE8A+53wL
   ajYBI9VAlw3VdcSe3VJeQRi7Yvxhn1MbYIqv7RDX+1F5MyK6Vollum0og
   j4pTU792+1f2dk4wQJnJhoWGHLE9TOMQroSHsckv2+DAMggf+Ehv1XcW5
   yvBCbwfJx3fTI2ImpviZ/Jl/hNBMinL0wxBOCHkbheV3YZQDSmfAEL7dK
   hV/G2q4PnNy+Ix16/LFDeaNaYu6HOA5XaqC/JtReRJEm51yqusqXoJqUK
   +Ef+eG+lBYkxFaiLcA33XLpkJJ+3hfTwjfWGXEkdpPmcM9NT+J2DBpM8E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="358796835"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="358796835"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 08:23:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="781476701"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="781476701"
Received: from mshindo-mobl5.amr.corp.intel.com (HELO [10.212.198.145]) ([10.212.198.145])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 08:23:19 -0700
Message-ID: <14f91337-ac7d-52f7-bc86-4091bec4d099@intel.com>
Date: Mon, 26 Jun 2023 08:23:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to MM CPUs
Content-Language: en-US
To: ypodemsk@redhat.com, mtosatti@redhat.com, ppandit@redhat.com,
 david@redhat.com, linux@armlinux.org.uk, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, davem@davemloft.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 keescook@chromium.org, paulmck@kernel.org, frederic@kernel.org,
 will@kernel.org, peterz@infradead.org, ardb@kernel.org,
 samitolvanen@google.com, juerg.haefliger@canonical.com, arnd@arndb.de,
 rmk+kernel@armlinux.org.uk, geert+renesas@glider.be,
 linus.walleij@linaro.org, akpm@linux-foundation.org,
 sebastian.reichel@collabora.com, rppt@kernel.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20230620144618.125703-1-ypodemsk@redhat.com>
 <20230620144618.125703-3-ypodemsk@redhat.com>
 <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
 <79f29f99fa07c46dbaee7b802cdd7b477b2d8dd1.camel@redhat.com>
 <d0ef9148-3c95-87bb-26f9-ea0920a4faa4@intel.com>
 <cccb5351e48b11e6c657bcfa28632f49cb9cc800.camel@redhat.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <cccb5351e48b11e6c657bcfa28632f49cb9cc800.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/26/23 07:36, ypodemsk@redhat.com wrote:
> On Thu, 2023-06-22 at 06:37 -0700, Dave Hansen wrote:
>> On 6/22/23 06:14, ypodemsk@redhat.com wrote:
>>> I will send a new version with the local variable as you suggested
>>> soon.
>>> As for the config name, what about CONFIG_ARCH_HAS_MM_CPUMASK?
>>
>> The confusing part about that name is that mm_cpumask() and
>> mm->cpu_bitmap[] are defined unconditionally.  So, they're *around*
>> unconditionally but just aren't updated.
>>
> I think your right about the config name,
> How about the
> CONFIG_ARCH_USE_MM_CPUMASK?
> This has the right semantic as these archs use the cpumask field of the
> mm struct.

"USE" is still a command.  It should, at worst, be "USES".  But that's
still kinda generic.  How about:

	CONFIG_ARCH_UPDATES_MM_CPUMASK

?

>> BTW, it would also be nice to have _some_ kind of data behind this
>> patch.
>>
>> Fewer IPIs are better I guess, but it would still be nice if you
>> could say:
>>
>> 	Before this patch, /proc/interrupts showed 123 IPIs/hour for an
>> 	isolated CPU.  After the approach here, it was 0.
>>
>> ... or something.
> 
> This is part of an ongoing effort to remove IPIs and this one was found
> via code inspection.

OK, so it should be something more like:

	This was found via code inspection, but fixing it isn't very
	important so we didn't bother to test it any more than just
	making sure the thing still boots when it is applied.

Does that cover it?

