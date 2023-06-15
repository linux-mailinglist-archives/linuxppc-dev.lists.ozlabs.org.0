Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C465731903
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhhbv0ffJz3byP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 22:36:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=leemhuis.info (client-ip=80.237.130.52; helo=wp530.webpack.hosteurope.de; envelope-from=regressions@leemhuis.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 1884 seconds by postgrey-1.37 at boromir; Thu, 15 Jun 2023 22:35:40 AEST
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhhbJ5Kvjz300n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 22:35:40 +1000 (AEST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q9lhx-0006fN-Ca; Thu, 15 Jun 2023 14:04:09 +0200
Message-ID: <824b3be1-adad-7191-a670-dd6290b0f6c3@leemhuis.info>
Date: Thu, 15 Jun 2023 14:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Content-Language: en-US, de-DE
To: Sachin Sant <sachinp@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686832540;bb63030c;
X-HE-SMSGID: 1q9lhx-0006fN-Ca
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
Cc: jarkko@kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 14.06.23 17:12, Sachin Sant wrote:
> Following crash is observed during a kexec operation on 
> IBM Power10 server:
> 
> [ 34.381548] Kernel attempted to read user page (50) - exploit attempt? (uid: 0)
> [ 34.381562] BUG: Kernel NULL pointer dereference on read at 0x00000050
> [ 34.381565] Faulting instruction address: 0xc0000000009db1e4
> [ 34.381569] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 34.381572] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> [ 34.381576] Modules linked in: dm_mod(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) bonding(E) tls(E) rfkill(E) ip_set(E) sunrpc(E) nf_tables(E) nfnetlink(E) pseries_rng(E) aes_gcm_p10_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) libcrc32c(E) sd_mod(E) sr_mod(E) t10_pi(E) crc64_rocksoft_generic(E) cdrom(E) crc64_rocksoft(E) crc64(E) sg(E) ibmvscsi(E) scsi_transport_srp(E) ibmveth(E) vmx_crypto(E) fuse(E)
> [ 34.381613] CPU: 18 PID: 5918 Comm: kexec Kdump: loaded Tainted: G E 6.4.0-rc6-00037-gb6dad5178cea #3
> [ 34.381618] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.20 (NH1030_058) hv:phyp pSeries
> [ 34.381621] NIP: c0000000009db1e4 LR: c0000000009db928 CTR: c0000000009eab60
> [ 34.381625] REGS: c00000009742f780 TRAP: 0300 Tainted: G E (6.4.0-rc6-00037-gb6dad5178cea)
> [ 34.381628] MSR: 800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE> CR: 44488884 XER: 00000001
> [ 34.381638] CFAR: c0000000009db19c DAR: 0000000000000050 DSISR: 40000000 IRQMASK: 0 
> [ 34.381638] GPR00: c0000000009db928 c00000009742fa20 c0000000014a1500 c0000000081d0000 
> [ 34.381638] GPR04: c00000000d842c50 c00000000d842c50 0000000000000025 fffffffffffe0000 
> [ 34.381638] GPR08: 0000000000000000 0000000000000000 0000000000000009 c008000000785280 
> [ 34.381638] GPR12: c0000000009eab60 c00000135fab7f00 0000000000000000 0000000000000000 
> [ 34.381638] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 34.381638] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
> [ 34.381638] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000002e21e08 
> [ 34.381638] GPR28: c00000000d842c48 c000000002a02208 c00000000321c0c0 c0000000081d0000 
> [ 34.381674] NIP [c0000000009db1e4] tpm_amd_is_rng_defective+0x74/0x240
> [ 34.381681] LR [c0000000009db928] tpm_chip_unregister+0x138/0x160
> [ 34.381685] Call Trace:
> [ 34.381686] [c00000009742faa0] [c0000000009db928] tpm_chip_unregister+0x138/0x160
> [ 34.381690] [c00000009742fae0] [c0000000009eab94] tpm_ibmvtpm_remove+0x34/0x130
> [ 34.381695] [c00000009742fb50] [c000000000115738] vio_bus_remove+0x58/0xd0
> [ 34.381701] [c00000009742fb90] [c000000000a01ecc] device_shutdown+0x21c/0x39c
> [ 34.381705] [c00000009742fc20] [c0000000001a2684] kernel_restart_prepare+0x54/0x70
> [ 34.381710] [c00000009742fc40] [c000000000292c48] kernel_kexec+0xa8/0x100
> [ 34.381714] [c00000009742fcb0] [c0000000001a2cd4] __do_sys_reboot+0x214/0x2c0
> [ 34.381718] [c00000009742fe10] [c000000000034adc] system_call_exception+0x13c/0x340
> [ 34.381723] [c00000009742fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> [ 34.381729] --- interrupt: 3000 at 0x7fff9c5459f0
> [ 34.381732] NIP: 00007fff9c5459f0 LR: 0000000000000000 CTR: 0000000000000000
> [ 34.381735] REGS: c00000009742fe80 TRAP: 3000 Tainted: G E (6.4.0-rc6-00037-gb6dad5178cea)
> [ 34.381738] MSR: 800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE> CR: 42422884 XER: 00000000
> [ 34.381747] IRQMASK: 0 
> [ 34.381747] GPR00: 0000000000000058 00007ffffad83d70 000000012fc47f00 fffffffffee1dead 
> [ 34.381747] GPR04: 0000000028121969 0000000045584543 0000000000000000 0000000000000003 
> [ 34.381747] GPR08: 0000000000100000 0000000000000000 0000000000000000 0000000000000000 
> [ 34.381747] GPR12: 0000000000000000 00007fff9c7bb2c0 000000012fc3f598 0000000000000000 
> [ 34.381747] GPR16: ffffffffffffffff 0000000000000000 000000012fc1fcc0 0000000000000000 
> [ 34.381747] GPR20: 0000000000008913 0000000000008914 000000014b891020 0000000000000003 
> [ 34.381747] GPR24: 0000000000000000 0000000000000001 0000000000000003 00007ffffad83ef0 
> [ 34.381747] GPR28: 000000012fc19f10 00007fff9c6419c0 000000014b891080 000000014b891040 
> [ 34.381781] NIP [00007fff9c5459f0] 0x7fff9c5459f0
> [ 34.381784] LR [0000000000000000] 0x0
> [ 34.381786] --- interrupt: 3000
> [ 34.381788] Code: 5463063e 408201c8 38210080 4e800020 60000000 60000000 60000000 7c0802a6 fbe10078 7c7f1b78 f8010090 e9230728 <e9890050> 2c2c0000 41820020 7d8903a6 
> [ 34.381800] ---[ end trace 0000000000000000 ]---
> [ 34.384090] pstore: backend (nvram) writing error (-1)
> 
> Git bisect points to following patch
> 
> commit bd8621ca1510e6e802df9855bdc35a04a3cfa932
>     tpm: Add !tpm_amd_is_rng_defective() to the hwrng_unregister() call site
> 
> Reverting the commit allows a successful kexec operation.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced bd8621ca1510e6e802df9855bdc35a04a3cfa932
#regzbot title tpm/ppc: crash during a kexec
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
