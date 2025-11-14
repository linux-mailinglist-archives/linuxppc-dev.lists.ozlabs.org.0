Return-Path: <linuxppc-dev+bounces-14185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572D3C5F10C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 20:39:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7SC00wqYz2yx7;
	Sat, 15 Nov 2025 06:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763149180;
	cv=none; b=lIKxkjOqPgPmhlTE2pA/zUqF8h7kctyQ2cH2Tkz/WDkgaoQqz4+uhm6fO5v/WivqWE0mDTq35N7r7OUrJFIDDXIihkgoRgbfcOUmSHnMgquU7PHUGlzN1lFV5L/fzoJ3PoSJ1ooUIgmugfGDgyzB+5pgc/bW8mWdZ3Y1CfblKx6FCht3V8D6WJy7sTIk4zFDZJwOnuedjK/K1BLJHoiMvy4Zr2Uycf3ClNIO1aC1lmi15e6KlcoMPiLCIN9h5NNyyzMj7y1Fj6f9HzPKOksiA1cVOgu07kOU303oodgo1ERxBNnogmSXYn3VqU/As/wysp8vIEPjIkO5GYvh8XfsIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763149180; c=relaxed/relaxed;
	bh=EB6NPeH9aiRCowjoSqWRgo4v8VZsNGNFCmmOKf/qxBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGcWfJXBsxS191Oic7TMdO/CtE+9lgo044/gnojv4D2b3DRN1BT4OrlUid9AjMKuwA7zGLN95pVdi/0OHORMfViA7b1BareeXw9Q0KdKYIn7E9SC8iTAIjFbW5AwoClmUk/HqQdJUwW9TnDD6F6KARqPKpRe4mCzndaQApU5GY7NODbJmCMcHASx+tx47XzbKYD6ppST22uB21KKuCXPmYc/fKaiV/ftK5vMGl23K4TmIuk/l9Zaijjf4BEwFAJpi6V22E6m6m4mDFlXvgeTA3+65B8H9v+A8Ec3oJM9ixDL3/rm8elkuXXzB8iaEpS76yx+rsJPQyV7JwUCTWKFWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qnop2DB+; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qnop2DB+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7SBz139xz2ynH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 06:39:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5BB543766;
	Fri, 14 Nov 2025 19:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93DDC4CEF8;
	Fri, 14 Nov 2025 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763149176;
	bh=54NLBk7Njpf4E6a9gJR3/zpHbL++ajPh9Y+MWKanMgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qnop2DB+z9ZecMETjC2TQD0j7snZXxCyh9BZtRFSL3Vj+nGofDn3vpkjact5FtBlS
	 nHu9Kk8kG5n7Xk740/Z6a0MT1Ju02Z6jQPFIdTIgnZuA7jnpVEXGekwlXEmaEUs7yJ
	 HttHQlQiYtE5ibkAM+78/ptWHgo/VqxpcMgUYqWmeccfxPZWasi2d0MvAv8XU4SYo8
	 UO+mdnxiuQqf4RQhYfW3WJRElizt9RJFz4Fjl+jvaQwksBSUUrh+LKYBGDzUcsVTwB
	 wNTwl58i9PAbsmRr8k7vsZoBaYcKaLkrXI3KWBoE15mCCFi+MJX+YDTXxgfelpASmb
	 NzsyfILQ3/cfw==
Message-ID: <e1345a3f-b5c5-49fd-a1e2-a77926cb9256@kernel.org>
Date: Fri, 14 Nov 2025 20:39:31 +0100
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
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
To: Nathan Chancellor <nathan@kernel.org>,
 Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <202511141140.LrrRrtIv-lkp@intel.com>
 <20251114182956.GD2566209@ax162> <aRd69_c1pULRoKOU@casper.infradead.org>
 <20251114191817.GA1089438@ax162>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251114191817.GA1089438@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 14.11.25 20:18, Nathan Chancellor wrote:
> On Fri, Nov 14, 2025 at 06:54:47PM +0000, Matthew Wilcox wrote:
>> On Fri, Nov 14, 2025 at 11:29:56AM -0700, Nathan Chancellor wrote:
>>>>>> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
>>>>      1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
>>>>           |                       ^~~~~~~~~~~~~~~~~~
>>>>     include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
>>>>      2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
>>>>           |                                         ^~~~~~~~~~~~~~~
>>>>     include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
>>>>      2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
>>>>           |                                 ~~~~~~~~~ ^~~~~~
>>>>     include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
>>>>        56 | #define SZ_16G                          _AC(0x400000000, ULL)
>>>>           |                                         ^~~~~~~~~~~~~~~~~~~~~
>>
>> Clearly this is a 32-bit build, since otherwise a conversion from
>> "unsigned long long" to "unsigned long" is a NOP.  But 32-bit cannot
>> support 16GB folios!
>>
>> I say this is a bug in powerpc32's config.
>>
>> #if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
>> #define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
>> ...
>> #else
>> #define MAX_FOLIO_ORDER         PUD_ORDER
>>
>> (PUD_ORDER is 16GB, so I think this will be what's being picked up)
>>
>> but the only place the mentions ARCH_HAS_GIGANTIC_PAGE is pretty
>> clearly dependent on 64bit ...
>>
>> config PPC_RADIX_MMU
>>          bool "Radix MMU Support"
>>          depends on PPC_BOOK3S_64
>>          select ARCH_HAS_GIGANTIC_PAGE
>>
>> so I'm a bit stuck about how this comes to be.  Adding the PPC people
>> for thoughts.
> 
> Note that the original report is against mm-unstable and flags
> 
>    https://git.kernel.org/akpm/mm/c/c3f81a41ba6f93693d208edde08ce2b0da21c645
>    https://lore.kernel.org/20251112145632.508687-1-david@kernel.org/
> 
> in mm-hotfixes-unstable as the problematic change. This configuration ends up
> with
> 
>    $ rg -N 'HAVE_GIGANTIC|HUGETLB|PPC_8xx' .config
>    # CONFIG_CGROUP_HUGETLB is not set
>    CONFIG_PPC_8xx=y
>    CONFIG_HAVE_GIGANTIC_FOLIOS=y
>    CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
>    CONFIG_HUGETLBFS=y
>    CONFIG_HUGETLB_PAGE=y
> 
>    config PPC_8xx
>        bool "Freescale 8xx"
>        select ARCH_SUPPORTS_HUGETLBFS
>        select FSL_SOC
>        select PPC_KUEP
>        select HAVE_ARCH_VMAP_STACK
>        select HUGETLBFS
> 
> which may indicate a bug in either selecting ARCH_HAS_GIGANTIC_PAGE in
> this case or the logic of HAVE_GIGANTIC_FOLIOS in that change?

God how I HATE that hugetlb crap at this point. So much wasted time.

Likely, for 32bit builds we should cap it at 1 GiB, which I think is the 
32bit maximum hugetlb folios size on ppc actually is.

-- 
Cheers

David

