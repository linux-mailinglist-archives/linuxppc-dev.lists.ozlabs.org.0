Return-Path: <linuxppc-dev+bounces-14575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB223C9E2C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 03 Dec 2025 09:20:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLrDn6NFDz2y5T;
	Wed, 03 Dec 2025 19:20:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764750041;
	cv=none; b=IhSbwulCG0TUY5CHs+vbbjPYcRaBfBzTTOFNGRkfSUmgBIrlFNOyaLJIRHEFKpvH8HlW0ux6OEaQ51+MkdceY/wVH13NVkgHKw6pjSxcIePfsMkv6/RI3TnoMysnCkM1hLBtfHeOlmtCdF18pTOQkdkhv9q2sNUshLad3uyl6jtu0BOto/zSvSvlmwtCWfOgwfqwip5apO9UTzmKxpGHnKUV0gP4SYvtxvAWrmcbX5kC83xLD+BPlEMmWv/IGopLQZcneEJShCPaKjWTgtkwUFoMs1DIhxbfO8ieVjHvM1ttEX6BpUX3m0b3+RC3Dxew7jcDZ+XFgluQmpiNFDW3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764750041; c=relaxed/relaxed;
	bh=Cp4z7wutZSCeud7Jvi6yin8tdaPqdTuvYkfM+RNYv4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m8nn9yhKH8Cpag3oIBmrhcnrCSn+2kUsmo8eaSM7S3mqn68yr8jnjeIPdjlbg6IRNt1zjD+1Q0x9tHLKeWB8BGXIzzOltXNICtMWfiIoTIfCIYwYqoXE7gWlvPrfi1V1dkH3xSlHm2p+0pGKm9wLskyrfcQN4YuIWQkHB0QEPBWvVTF160Dw5FWUDgD2EKGxFbcby8Ah6SWfTfKYi03ov8ll8vH8fFoGJzpE061eNuDceSQqqWLkaqYHKq7Cj0AYD5dFbRqLkSiB+Tfo1Yjo1VMDvRvr80Eu/JFFL17r1WbqfwA7hwASKnIV2RkKqdCWqUFG45DLbj6qtyupzxhzsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dLrDm6KJ5z2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Dec 2025 19:20:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AC81339;
	Wed,  3 Dec 2025 00:19:59 -0800 (PST)
Received: from [10.57.45.92] (unknown [10.57.45.92])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199493F73B;
	Wed,  3 Dec 2025 00:19:58 -0800 (PST)
Message-ID: <eb6fac72-a813-4b01-bbd7-f3961894bf53@arm.com>
Date: Wed, 3 Dec 2025 09:19:56 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-6-kevin.brodsky@arm.com>
 <8d9ed1f1-77da-45af-85b5-78a5da66f1cc@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <8d9ed1f1-77da-45af-85b5-78a5da66f1cc@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01/12/2025 07:21, Anshuman Khandual wrote:
>> +config ARCH_HAS_LAZY_MMU_MODE
>> +	bool
>> +
> Might be worth adding a help description for the new config option.

Sure, would be an occasion to clarify which functions an arch needs to
define.

- Kevin

