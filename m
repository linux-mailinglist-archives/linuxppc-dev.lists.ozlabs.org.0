Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315F19159B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 17:05:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mx0y23WBzDqZl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mwyQ1cn4zDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:03:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=I7vnyVL5; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48mwyP20XHz8tR6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 03:03:09 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48mwyP1J37z9sRf; Wed, 25 Mar 2020 03:03:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=I7vnyVL5; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48mwyL5nmLz9sQt
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Mar 2020 03:03:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48mwy31GqMz9tycq;
 Tue, 24 Mar 2020 17:02:51 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=I7vnyVL5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id noBNMH7MUtD0; Tue, 24 Mar 2020 17:02:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48mwy30CTvz9tyW4;
 Tue, 24 Mar 2020 17:02:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585065771; bh=KWvMviGFy2qVCJQ3bXRiH5D7DZW9JBN0t2+Sa7s46vg=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=I7vnyVL5vVTTWiNQoLlZs6uyJSoIy5M0lWk0Q3GiY9qONZ/dXy1rzWlRI6MOq0VLN
 71B7FuoWvICaf5oU+RvSAHqpd/jvRGoRXatbm6ZmIswPbWlMPL0UtyGcIzXXA3AJoN
 cQJzwzw8ecisHF4DCh3w+OP3EObd09Axx5G5PW1o=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F93C8B7A8;
 Tue, 24 Mar 2020 17:02:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ogsu1uscDhqi; Tue, 24 Mar 2020 17:02:52 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 708D48B7AD;
 Tue, 24 Mar 2020 17:02:51 +0100 (CET)
Subject: Re: [RFC PATCH 0/3] Use per-CPU temporary mappings for patching
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <173d34a7-a178-ed52-df92-eac8e47d347c@c-s.fr>
 <3bfcb682-a33a-b41c-74c6-4bae0d277ddf@c-s.fr>
Message-ID: <24089295-1f43-1418-0cd7-1c477a570031@c-s.fr>
Date: Tue, 24 Mar 2020 17:02:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3bfcb682-a33a-b41c-74c6-4bae0d277ddf@c-s.fr>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/03/2020 à 15:04, Christophe Leroy a écrit :
> 
> 
> On 03/23/2020 11:30 AM, Christophe Leroy wrote:
>>
>>
>> On 03/23/2020 04:52 AM, Christopher M. Riedl wrote:
>>> When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
>>> temporary mappings when patching itself. These mappings temporarily
>>> override the strict RWX text protections to permit a write. Currently,
>>> powerpc allocates a per-CPU VM area for patching. Patching occurs as
>>> follows:
>>>
>>>     1. Map page of text to be patched to per-CPU VM area w/
>>>        PAGE_KERNEL protection
>>>     2. Patch text
>>>     3. Remove the temporary mapping
>>>
>>> While the VM area is per-CPU, the mapping is actually inserted into the
>>> kernel page tables. Presumably, this could allow another CPU to access
>>> the normally write-protected text - either malicously or accidentally -
>>> via this same mapping if the address of the VM area is known. Ideally,
>>> the mapping should be kept local to the CPU doing the patching (or any
>>> other sensitive operations requiring temporarily overriding memory
>>> protections) [0].
>>>
>>> x86 introduced "temporary mm" structs which allow the creation of
>>> mappings local to a particular CPU [1]. This series intends to bring the
>>> notion of a temporary mm to powerpc and harden powerpc by using such a
>>> mapping for patching a kernel with strict RWX permissions.
>>>
>>> The first patch introduces the temporary mm struct and API for powerpc
>>> along with a new function to retrieve a current hw breakpoint.
>>>
>>> The second patch uses the `poking_init` init hook added by the x86
>>> patches to initialize a temporary mm and patching address. The patching
>>> address is randomized between 0 and DEFAULT_MAP_WINDOW-PAGE_SIZE. The
>>> upper limit is necessary due to how the hash MMU operates - by default
>>> the space above DEFAULT_MAP_WINDOW is not available. For now, both hash
>>> and radix randomize inside this range. The number of possible random
>>> addresses is dependent on PAGE_SIZE and limited by DEFAULT_MAP_WINDOW.
>>>
>>> Bits of entropy with 64K page size on BOOK3S_64:
>>>
>>>     bits-o-entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
>>>
>>>     PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
>>>     bits-o-entropy = log2(128TB / 64K)
>>>     bits-o-entropy = 31
>>>
>>> Currently, randomization occurs only once during initialization at boot.
>>>
>>> The third patch replaces the VM area with the temporary mm in the
>>> patching code. The page for patching has to be mapped PAGE_SHARED with
>>> the hash MMU since hash prevents the kernel from accessing userspace
>>> pages with PAGE_PRIVILEGED bit set. There is on-going work on my side to
>>> explore if this is actually necessary in the hash codepath.
>>>
>>> Testing so far is limited to booting on QEMU (power8 and power9 targets)
>>> and a POWER8 VM along with setting some simple xmon breakpoints (which
>>> makes use of code-patching). A POC lkdtm test is in-progress to actually
>>> exploit the existing vulnerability (ie. the mapping during patching is
>>> exposed in kernel page tables and accessible by other CPUS) - this will
>>> accompany a future v1 of this series.
>>
>> Got following failures on an 8xx. Note that "fault blocked by AP 
>> register !" means an unauthorised access from Kernel to Userspace.
>>
> 
> Still a problem even without CONFIG_PPC_KUAP:
> 

I've been able to dig into the problem.

With CONFIG_PPC_KUAP, it can definitely not work. See why in commit 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=ef296729b735e083d8919e76ac213b8ff237eb78

Without CONFIG_PPC_KUAP, on the 8xx, __put_user_asm() in 
__patch_instruction() returns -EFAULT. That's because _PAGE_DIRTY is not 
set on the page. Normally it should be a minor fault and the fault 
handler should set the _PAGE_DIRTY flag. It must be something in the way 
the page is allocated and mapped which prevents that. If I forge 
_PAGE_DIRTY in addition to PAGE_SHARED, it works. But I don't think it 
is valid approach to solve the issue.

Christophe
