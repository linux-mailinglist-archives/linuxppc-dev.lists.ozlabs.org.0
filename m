Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FB224B38
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 14:48:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B878d1lKTzDrNN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 22:48:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B876n3vkLzDr0X
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 22:47:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=S4SYiKpJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B876m6Nz5z9sRR;
 Sat, 18 Jul 2020 22:47:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595076433;
 bh=O7R98i6gZcdrCHkhC5uzFmHX9/DBfJrQvXuy2jwa//4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=S4SYiKpJKxvs7gRAzzSXdQTc10SuGvLeNhcRF+StW4GYyHP90m83Csaw7KGCbBhHS
 KKClqbhdLLkuneu/NylN1VBllOOMuH+oDyLUuVvH9NGL+myEtCbANJXJnEOd64PFB5
 CAKmbtbN3NTCCLHdGQw77kKwBIPFC5EcttdAPUBfDQiefN6mI5VWhGQLEGifB7oWqH
 wdCK3pu6ia3jP6vlw4BwN5LXGbziJCA7NPfZwJ+k6DoXwndIqK744cr+Z4HTRwguO7
 GdZLBx6BeAfN5ofNzdUOiy3eBxGg3pG02dMd8i8nfGogj/vRZTsrYua1G3o3LdMv4A
 rtB2AdOAf6vwA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [powerpc:next-test 125/127]
 arch/powerpc/mm/book3s64/pkeys.c:392:7: error: implicit declaration of
 function 'is_pkey_enabled'; did you mean
In-Reply-To: <4afe08ee-d039-dec6-70c3-383497e52440@linux.ibm.com>
References: <202007170943.BGjGSyKg%lkp@intel.com>
 <4afe08ee-d039-dec6-70c3-383497e52440@linux.ibm.com>
Date: Sat, 18 Jul 2020 22:47:12 +1000
Message-ID: <87mu3xt2gf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> On 7/17/20 7:29 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
>> head:   0fbd1eb4df96e1cbd039e0b95fdf62cf65a7faf9
>> commit: ed411c66eea2ccf93a634ae661a1f79c2bc63d88 [125/127] powerpc/book3s64/pkeys: Remove is_pkey_enabled()
>> config: powerpc-allmodconfig (attached as .config)
>> compiler: powerpc64-linux-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          git checkout ed411c66eea2ccf93a634ae661a1f79c2bc63d88
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
>> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> 
>> All errors (new ones prefixed by >>):
>> 
>>     arch/powerpc/mm/book3s64/pkeys.c: In function 'pkey_access_permitted':
>>>> arch/powerpc/mm/book3s64/pkeys.c:392:7: error: implicit declaration of function 'is_pkey_enabled'; did you mean 'arch_pkeys_enabled'? [-Werror=implicit-function-declaration]
>>       392 |  if (!is_pkey_enabled(pkey))
>>           |       ^~~~~~~~~~~~~~~
>>           |       arch_pkeys_enabled
>>     cc1: some warnings being treated as errors
>> 
>> vim +392 arch/powerpc/mm/book3s64/pkeys.c
>> 
>
>
> We removed that upstream in
>
> 19ab500edb5d6020010caba48ce3b4ce4182ab63     powerpc/mm/pkeys: Make pkey 
> access check work on execute_only_key
>
> next-test need to be rebased?

I don't rebase next onto master.

I'll merge fixes prior to applying your series.

cheers
