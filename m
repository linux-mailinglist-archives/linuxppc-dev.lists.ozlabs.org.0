Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 095B069B814
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 05:45:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJbhs5S6Bz3fRR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 15:45:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJbhG6GSWz3c3W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 15:45:01 +1100 (AEDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pTF5j-0000sJ-En; Sat, 18 Feb 2023 05:44:55 +0100
Message-ID: <3ff87754-70f2-079c-d522-2330d0ffb5fd@leemhuis.info>
Date: Sat, 18 Feb 2023 05:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: 6.2-rc7 fails building on Talos II: memory.c:(.text+0x2e14):
 undefined reference to `hash__tlb_flush'
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: "Erhard F." <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
References: <20230216005535.6bff7aa6@yea>
 <e9923ff8-4027-9188-fd04-77d0bbbc6573@leemhuis.info>
In-Reply-To: <e9923ff8-4027-9188-fd04-77d0bbbc6573@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676695503;ca90fb02;
X-HE-SMSGID: 1pTF5j-0000sJ-En
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 16.02.23 11:09, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> On 16.02.23 00:55, Erhard F. wrote:
>> Just noticed a build failure on 6.2-rc7 for my Talos 2 (.config attached):
>>
>>  # make
>>   CALL    scripts/checksyscalls.sh
>>   UPD     include/generated/utsversion.h
>>   CC      init/version-timestamp.o
>>   LD      .tmp_vmlinux.kallsyms1
>> ld: ld: DWARF error: could not find abbrev number 6
>> mm/memory.o: in function `unmap_page_range':
>> memory.c:(.text+0x2e14): undefined reference to `hash__tlb_flush'
>> ld: memory.c:(.text+0x2f8c): undefined reference to `hash__tlb_flush'
>> ld: ld: DWARF error: could not find abbrev number 3117
>> mm/mmu_gather.o: in function `tlb_remove_table':
>> mmu_gather.c:(.text+0x584): undefined reference to `hash__tlb_flush'
>> ld: mmu_gather.c:(.text+0x6c4): undefined reference to `hash__tlb_flush'
>> ld: mm/mmu_gather.o: in function `tlb_flush_mmu':
>> mmu_gather.c:(.text+0x80c): undefined reference to `hash__tlb_flush'
>> ld: mm/mmu_gather.o:mmu_gather.c:(.text+0xbe0): more undefined references to `hash__tlb_flush' follow
>> make[1]: *** [scripts/Makefile.vmlinux:35: vmlinux] Fehler 1
>> make: *** [Makefile:1264: vmlinux] Error 2

#regzbot fix: 4302abc628fc0dc08e5855f21bbfa
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


