Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED93A2EA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 16:50:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G16NX6W0Rz3c1V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 00:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G16N33mNfz307n
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 00:50:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G16Mt6NybzBBTQ;
 Thu, 10 Jun 2021 16:50:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IgLzEJiZ-597; Thu, 10 Jun 2021 16:50:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G16Mt5QJzzBB9r;
 Thu, 10 Jun 2021 16:50:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 375368B81B;
 Thu, 10 Jun 2021 16:50:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DzO9RJN6YzIB; Thu, 10 Jun 2021 16:50:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B07968B80F;
 Thu, 10 Jun 2021 16:50:17 +0200 (CEST)
Subject: Re: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
To: Chris Mason <clm@fb.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cdadf66e-0a6e-4efe-0326-7236c43b2735@csgroup.eu>
Date: Thu, 10 Jun 2021 16:50:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/06/2021 à 15:54, Chris Mason a écrit :
> 
>> On Jun 10, 2021, at 1:23 AM, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>
>> With a config having PAGE_SIZE set to 256K, BTRFS build fails
>> with the following message
>>
>> include/linux/compiler_types.h:326:38: error: call to '__compiletime_assert_791' declared with attribute error: BUILD_BUG_ON failed: (BTRFS_MAX_COMPRESSED % PAGE_SIZE) != 0
>>
>> BTRFS_MAX_COMPRESSED being 128K, BTRFS cannot support platforms with
>> 256K pages at the time being.
>>
>> There are two platforms that can select 256K pages:
>> - hexagon
>> - powerpc
>>
>> Disable BTRFS when 256K page size is selected.
>>
> 
> We’ll have other subpage blocksize concerns with 256K pages, but this BTRFS_MAX_COMPRESSED #define is arbitrary.  It’s just trying to have an upper bound on the amount of memory we’ll need to uncompress a single page’s worth of random reads.
> 
> We could change it to max(PAGE_SIZE, 128K) or just bump to 256K.
> 

But if 256K is problematic in other ways, is it worth bumping BTRFS_MAX_COMPRESSED to 256K ?

David, in below mail, said that 256K support would require deaper changes. So disabling BTRFS 
support seems the easiest solution for the time being, at least for Stable (I forgot the Fixes: tag 
and the CC: to stable).

On powerpc, 256k pages is a corner case, it requires customised binutils, so I don't think disabling 
BTRFS is a issue there. For hexagon I don't know.


https://lkml.org/lkml/2021/6/9/978

Le 09/06/2021 à 17:22, David Sterba a écrit :
 > On Wed, Jun 09, 2021 at 04:01:20PM +0200, Christophe Leroy wrote:
 >> Le 09/06/2021 à 15:55, kernel test robot a écrit :
 >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
 >>> head:   368094df48e680fa51cedb68537408cfa64b788e
 >>> commit: 4eeef098b43242ed145c83fba9989d586d707589 powerpc/44x: Remove STDBINUTILS kconfig option
 >>> date:   4 months ago
 >>> config: powerpc-randconfig-r012-20210609 (attached as .config)
 >>> compiler: powerpc-linux-gcc (GCC) 9.3.0
 >>
 >> That's a BTRFS issue, and not directly linked to the above mentioned commit. Before that commit the
 >> problem was already present.
 >>
 >> Problem is that with 256k PAGE_SIZE, following BUILD_BUG() pops up:
 >>
 >> BUILD_BUG_ON((BTRFS_MAX_COMPRESSED % PAGE_SIZE) != 0)
 >
 > A 256K page is a problem for btrfs, until now I was not even aware
 > there's an architecture supporting that so. That the build fails is
 > probably best thing. Maximum metadata nodesize supported is 64K and
 > having that on a 256K page would need deeper changes, no top of the
 > currently developed subpage changes (that do 4K blocks on 64K pages).
 >
