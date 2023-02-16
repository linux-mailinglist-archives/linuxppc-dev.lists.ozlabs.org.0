Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A36990BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 11:09:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHW042PjBz3fFV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 21:09:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=<UNKNOWN>)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHVzQ1jLqz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 21:09:21 +1100 (AEDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pSbCX-0003iE-2L; Thu, 16 Feb 2023 11:09:17 +0100
Message-ID: <e9923ff8-4027-9188-fd04-77d0bbbc6573@leemhuis.info>
Date: Thu, 16 Feb 2023 11:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: 6.2-rc7 fails building on Talos II: memory.c:(.text+0x2e14):
 undefined reference to `hash__tlb_flush'
Content-Language: en-US, de-DE
To: "Erhard F." <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org
References: <20230216005535.6bff7aa6@yea>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20230216005535.6bff7aa6@yea>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676542162;ca5e8a4b;
X-HE-SMSGID: 1pSbCX-0003iE-2L
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

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

On 16.02.23 00:55, Erhard F. wrote:
> Just noticed a build failure on 6.2-rc7 for my Talos 2 (.config attached):
> 
>  # make
>   CALL    scripts/checksyscalls.sh
>   UPD     include/generated/utsversion.h
>   CC      init/version-timestamp.o
>   LD      .tmp_vmlinux.kallsyms1
> ld: ld: DWARF error: could not find abbrev number 6
> mm/memory.o: in function `unmap_page_range':
> memory.c:(.text+0x2e14): undefined reference to `hash__tlb_flush'
> ld: memory.c:(.text+0x2f8c): undefined reference to `hash__tlb_flush'
> ld: ld: DWARF error: could not find abbrev number 3117
> mm/mmu_gather.o: in function `tlb_remove_table':
> mmu_gather.c:(.text+0x584): undefined reference to `hash__tlb_flush'
> ld: mmu_gather.c:(.text+0x6c4): undefined reference to `hash__tlb_flush'
> ld: mm/mmu_gather.o: in function `tlb_flush_mmu':
> mmu_gather.c:(.text+0x80c): undefined reference to `hash__tlb_flush'
> ld: mm/mmu_gather.o:mmu_gather.c:(.text+0xbe0): more undefined references to `hash__tlb_flush' follow
> make[1]: *** [scripts/Makefile.vmlinux:35: vmlinux] Fehler 1
> make: *** [Makefile:1264: vmlinux] Error 2
> 
> As 6.2-rc6 was good on this machine I did a quick bisect which revealed this commit:
> 
>  # git bisect bad
> 1665c027afb225882a5a0b014c45e84290b826c2 is the first bad commit
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 1665c027afb225
#regzbot title powerpc: 6.2-rc7 fails building on Talos II
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
