Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20018FAB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:01:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mLJQ6365zDr6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 04:01:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=LlWOuVZe; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mLG24L5WzDr5T
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 03:59:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mLFq4vgkz9v1v9;
 Mon, 23 Mar 2020 17:59:27 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=LlWOuVZe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YdpqkzH_fGqC; Mon, 23 Mar 2020 17:59:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mLFq2Wn1z9v1tl;
 Mon, 23 Mar 2020 17:59:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584982767; bh=LCTdnMVn2Kd1JNnKjHZIi+NfCagOB2hTNDbBx+wtqdo=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=LlWOuVZeh4fAvYUbUQHXIqXW0VrgXiB5MoT756iel92DQgmQDVvyZ6X3NK4b1jrt6
 NLT8zFQLeKU222WqDfvsf8zc4/l0N4L2YpbOBqhHnsfQiU4Ebh2KI7YgyJXqf2o1St
 DV0tnIf7/iyRqVlYVH4H5lMCTmhAPVWbMDpTbIsA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AD8B68B785;
 Mon, 23 Mar 2020 17:59:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nOcdPQ_ChSCQ; Mon, 23 Mar 2020 17:59:32 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A54E8B752;
 Mon, 23 Mar 2020 17:59:32 +0100 (CET)
Subject: Re: [RFC PATCH 0/3] Use per-CPU temporary mappings for patching
To: Christopher M Riedl <cmr@informatik.wtf>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <173d34a7-a178-ed52-df92-eac8e47d347c@c-s.fr>
 <3bfcb682-a33a-b41c-74c6-4bae0d277ddf@c-s.fr>
 <738663735.45060.1584982175261@privateemail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <98ef0ce2-e0e1-b995-3251-caeb2d2c59e2@c-s.fr>
Date: Mon, 23 Mar 2020 17:59:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <738663735.45060.1584982175261@privateemail.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2020 à 17:49, Christopher M Riedl a écrit :
> 
>> On March 23, 2020 9:04 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
>>
>>   
>> On 03/23/2020 11:30 AM, Christophe Leroy wrote:
>>>
>>>
>>> On 03/23/2020 04:52 AM, Christopher M. Riedl wrote:
>>>> When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
>>>> temporary mappings when patching itself. These mappings temporarily
>>>> override the strict RWX text protections to permit a write. Currently,
>>>> powerpc allocates a per-CPU VM area for patching. Patching occurs as
>>>> follows:
>>>>
>>>>      1. Map page of text to be patched to per-CPU VM area w/
>>>>         PAGE_KERNEL protection
>>>>      2. Patch text
>>>>      3. Remove the temporary mapping
>>>>
>>>> While the VM area is per-CPU, the mapping is actually inserted into the
>>>> kernel page tables. Presumably, this could allow another CPU to access
>>>> the normally write-protected text - either malicously or accidentally -
>>>> via this same mapping if the address of the VM area is known. Ideally,
>>>> the mapping should be kept local to the CPU doing the patching (or any
>>>> other sensitive operations requiring temporarily overriding memory
>>>> protections) [0].
>>>>
>>>> x86 introduced "temporary mm" structs which allow the creation of
>>>> mappings local to a particular CPU [1]. This series intends to bring the
>>>> notion of a temporary mm to powerpc and harden powerpc by using such a
>>>> mapping for patching a kernel with strict RWX permissions.
>>>>
>>>> The first patch introduces the temporary mm struct and API for powerpc
>>>> along with a new function to retrieve a current hw breakpoint.
>>>>
>>>> The second patch uses the `poking_init` init hook added by the x86
>>>> patches to initialize a temporary mm and patching address. The patching
>>>> address is randomized between 0 and DEFAULT_MAP_WINDOW-PAGE_SIZE. The
>>>> upper limit is necessary due to how the hash MMU operates - by default
>>>> the space above DEFAULT_MAP_WINDOW is not available. For now, both hash
>>>> and radix randomize inside this range. The number of possible random
>>>> addresses is dependent on PAGE_SIZE and limited by DEFAULT_MAP_WINDOW.
>>>>
>>>> Bits of entropy with 64K page size on BOOK3S_64:
>>>>
>>>>      bits-o-entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
>>>>
>>>>      PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
>>>>      bits-o-entropy = log2(128TB / 64K)
>>>>      bits-o-entropy = 31
>>>>
>>>> Currently, randomization occurs only once during initialization at boot.
>>>>
>>>> The third patch replaces the VM area with the temporary mm in the
>>>> patching code. The page for patching has to be mapped PAGE_SHARED with
>>>> the hash MMU since hash prevents the kernel from accessing userspace
>>>> pages with PAGE_PRIVILEGED bit set. There is on-going work on my side to
>>>> explore if this is actually necessary in the hash codepath.
>>>>
>>>> Testing so far is limited to booting on QEMU (power8 and power9 targets)
>>>> and a POWER8 VM along with setting some simple xmon breakpoints (which
>>>> makes use of code-patching). A POC lkdtm test is in-progress to actually
>>>> exploit the existing vulnerability (ie. the mapping during patching is
>>>> exposed in kernel page tables and accessible by other CPUS) - this will
>>>> accompany a future v1 of this series.
>>>
>>> Got following failures on an 8xx. Note that "fault blocked by AP
>>> register !" means an unauthorised access from Kernel to Userspace.
>>>
> 
> So I am pretty ignorant on 8xx. Can you share a config I can build?
> Can I test this on my end w/ QEMU? I suspect there are some subtleties
> in the 8xx MMU I did not consider.
> 
> 

As config you can take mpc885_ads_defconfig

Unfortunately the 8xx is not supported by QEMU AFAIK.

By the way, first point is you are using userspace for the mapping, this 
means you have to modify the patching code to use put_user(), otherwise 
accesses are blocked when CONFIG_PPC_KUAP is set. That should also be 
the case on power9 with Radix.

Christophe
