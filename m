Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99289B1279
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 17:54:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tjxp6WqjzF4jB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 01:54:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Xve/r2+a"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Tjvl0DWNzF4fp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 01:52:35 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Tjvd4mf5z9v01v;
 Thu, 12 Sep 2019 17:52:29 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Xve/r2+a; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A0Kfupm1sMQP; Thu, 12 Sep 2019 17:52:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Tjvd3M1wzB09bN;
 Thu, 12 Sep 2019 17:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568303549; bh=8yNeYzD4hyXGy/cp3pkfdaOEeCFKo8dkfUfa1uQQNdw=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=Xve/r2+abfDHfuK0WIskaBB17UKxFk/oCvwXkkUF5Yo4BLlxGU81bDiG5ke88fbye
 BE8P5FDH9S654EK1eo6Y8b6n1X7xstmolnKTrzECKOGoc5E7ZdJ0fsFaCrbfijNknG
 8RziH8EmMIWjiObqTYaXwtz8qoLghxzrvqE5L7qA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ED6B8B945;
 Thu, 12 Sep 2019 17:52:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pajkW6Q7ywER; Thu, 12 Sep 2019 17:52:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 812188B941;
 Thu, 12 Sep 2019 17:52:22 +0200 (CEST)
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <4cf31ca9-39e4-87e4-7eef-a6f3f0ea7576@c-s.fr>
 <31aa6043-3b11-a936-bf35-6ed84bff9304@c-s.fr>
Message-ID: <600a7c62-eea9-e26f-f7cf-f2103b7c228c@c-s.fr>
Date: Thu, 12 Sep 2019 17:52:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <31aa6043-3b11-a936-bf35-6ed84bff9304@c-s.fr>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/09/2019 à 17:36, Christophe Leroy a écrit :
> 
> 
> Le 12/09/2019 à 17:00, Christophe Leroy a écrit :
>>
>>
>> On 09/12/2019 06:02 AM, Anshuman Khandual wrote:
>>> This adds a test module which will validate architecture page table 
>>> helpers
>>> and accessors regarding compliance with generic MM semantics 
>>> expectations.
>>> This will help various architectures in validating changes to the 
>>> existing
>>> page table helpers or addition of new ones.
>>>
>>> Test page table and memory pages creating it's entries at various 
>>> level are
>>> all allocated from system memory with required alignments. If memory 
>>> pages
>>> with required size and alignment could not be allocated, then all 
>>> depending
>>> individual tests are skipped.
>>
>> Build failure on powerpc book3s/32. This is because asm/highmem.h is 
>> missing. It can't be included from asm/book3s/32/pgtable.h because it 
>> creates circular dependency. So it has to be included from 
>> mm/arch_pgtable_test.c
> 
> In fact it is <linux/highmem.h> that needs to be added, adding 
> <asm/highmem.h> directly provokes build failure at link time.
> 

I get the following failure,

[    0.704685] ------------[ cut here ]------------
[    0.709239] initcall arch_pgtable_tests_init+0x0/0x228 returned with 
preemption imbalance
[    0.717539] WARNING: CPU: 0 PID: 1 at init/main.c:952 
do_one_initcall+0x18c/0x1d4
[    0.724922] CPU: 0 PID: 1 Comm: swapper Not tainted 
5.3.0-rc7-s3k-dev-00880-g28fd02a838e5-dirty #2307
[    0.734070] NIP:  c070e674 LR: c070e674 CTR: c001292c
[    0.739084] REGS: df4a5dd0 TRAP: 0700   Not tainted 
(5.3.0-rc7-s3k-dev-00880-g28fd02a838e5-dirty)
[    0.747975] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 28000222  XER: 00000000
[    0.754628]
[    0.754628] GPR00: c070e674 df4a5e88 df4a0000 0000004e 0000000a 
00000000 000000ca 38207265
[    0.754628] GPR08: 00001032 00000800 00000000 00000000 22000422 
00000000 c0004a7c 00000000
[    0.754628] GPR16: 00000000 00000000 00000000 00000000 00000000 
c0810000 c0800000 c0816f30
[    0.754628] GPR24: c070dc20 c074702c 00000006 0000009c 00000000 
c0724494 c074e140 00000000
[    0.789339] NIP [c070e674] do_one_initcall+0x18c/0x1d4
[    0.794435] LR [c070e674] do_one_initcall+0x18c/0x1d4
[    0.799437] Call Trace:
[    0.801867] [df4a5e88] [c070e674] do_one_initcall+0x18c/0x1d4 
(unreliable)
[    0.808694] [df4a5ee8] [c070e8c0] kernel_init_freeable+0x204/0x2dc
[    0.814830] [df4a5f28] [c0004a94] kernel_init+0x18/0x110
[    0.820107] [df4a5f38] [c00122ac] ret_from_kernel_thread+0x14/0x1c
[    0.826220] Instruction dump:
[    0.829161] 4beb1069 7d2000a6 61298000 7d200124 89210008 2f890000 
41be0048 3c60c06a
[    0.836849] 38a10008 7fa4eb78 3863cacc 4b915115 <0fe00000> 4800002c 
81220070 712a0004
[    0.844723] ---[ end trace 969d686308d40b33 ]---

Then starting init fails:

[    3.894074] Run /init as init process
[    3.898403] Failed to execute /init (error -14)
[    3.903009] Run /sbin/init as init process
[    3.907172] Run /etc/init as init process
[    3.911251] Run /bin/init as init process
[    3.915513] Run /bin/sh as init process
[    3.919471] Starting init: /bin/sh exists but couldn't execute it 
(error -14)
[    3.926732] Kernel panic - not syncing: No working init found.  Try 
passing init= option to kernel. See Linux 
Documentation/admin-guide/init.rst for guidance.
[    3.940864] CPU: 0 PID: 1 Comm: init Tainted: G        W 
5.3.0-rc7-s3k-dev-00880-g28fd02a838e5-dirty #2307
[    3.951165] Call Trace:
[    3.953617] [df4a5ec8] [c002392c] panic+0x12c/0x320 (unreliable)
[    3.959621] [df4a5f28] [c0004b8c] rootfs_mount+0x0/0x2c
[    3.964849] [df4a5f38] [c00122ac] ret_from_kernel_thread+0x14/0x1c


Christophe
