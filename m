Return-Path: <linuxppc-dev+bounces-13803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A261C36052
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 15:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1nXS0Ls9z2yjp;
	Thu,  6 Nov 2025 01:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762352407;
	cv=none; b=mvv4Y5DSFIa/rMLDXnTpD2ak9v1zpJkp1eQO+vnYMR5HAZFepNMHGFbnfS9Yx88yvNy/OiwRPsGFRFNw+x0s4CrFmsBFLLd6qYtB6MHxDxTKp+cKTNe9LvluY8L1BdsZLYOIJFl7E+Qcln7aH/9TQgaNs1VziljH5U6BG8ARync45Z7dTQBPE3fBkfpC/yD1E2sehcORX98KUcQN0tloRz6xcmePHw6geEecBQLD87MgxACr+khN6W7RVI3t25E2xmEwGVLee/zHn6Ncta95jiQCWSIv7rRrfdMyKnEf48A2Xq6wmL9708/9SjisTm7pyp8BLe3P8tRhb/cEBj+Ukw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762352407; c=relaxed/relaxed;
	bh=jWSlozvJUflZmvqBOaD1IRfkpn4o+54VCvLisTp1Fp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a5HKOfyhmXkAcrbRaHkSBsFTBbJTydD9bg97kcEtuZFbAd3vQjQbkNAsyW+JYs0n9568wu3z+uoijXADi7+1fZYhsjeGO24DqciFGjfCgmHAmNTxcmTy+gLG86hswf61vwvb0dUetZoIlwfEhsVxQbymHS8qT8TCX8RWeFohctdAyqotYaS4C54G0No2uAlvnDwY6FnyKFY+2YJOINNjKFDSOx3CauuToQP/JFWD0ZsPcfCtwymqv6ALNtHt5VdUccIF26RIznEWJMwmBdFN8m12mvN6jBO3Ylsyz2UZsPzCHBmeNHz/SYNFdoeARMfC37+KirhiRZ/IEqq9HeEwXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1nXR1FGSz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 01:20:06 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d1mmj0Ysfz9sRy;
	Wed,  5 Nov 2025 14:45:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lCEyzqt3JgUV; Wed,  5 Nov 2025 14:45:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d1mmh6Whcz9sRh;
	Wed,  5 Nov 2025 14:45:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE11D8B76E;
	Wed,  5 Nov 2025 14:45:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uCc9lE3z-fx3; Wed,  5 Nov 2025 14:45:40 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 86D2A8B76D;
	Wed,  5 Nov 2025 14:45:40 +0100 (CET)
Message-ID: <18dd8200-6a8c-449e-9fb8-56874342defb@csgroup.eu>
Date: Wed, 5 Nov 2025 14:45:40 +0100
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
Subject: Re: [mainline] Kernel OOPs while running powerpc/mce/ selftest
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>
References: <4b107285-57d7-482d-9fdf-8499e5fdbebb@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <4b107285-57d7-482d-9fdf-8499e5fdbebb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 23/10/2025 à 06:54, Venkat Rao Bagalkote a écrit :
> Greetings!!!
> 
> 
> IBM CI has reported a kernel crash while running mce selftests on 
> mainline kernel, from tools/testing/selftests/powerpc/mce/.
> 
> 
> This issue is hit when CONFIG_KASAN is enabled. If its disabled, test 
> passes.
> 
> 
> Traces:
> 
> 
> [ 8041.225432] BUG: Unable to handle kernel data access on read at 
> 0xc00e0001a1ad6103
> [ 8041.225453] Faulting instruction address: 0xc0000000008c54d8
> [ 8041.225461] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 8041.225467] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
> [ 8041.225475] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 
> nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
> nft_chain_nat nf_nat nf_conntrack bonding tls nf_defrag_ipv6 
> nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink pseries_rng vmx_crypto 
> dax_pmem fuse ext4 crc16 mbcache jbd2 nd_pmem papr_scm sd_mod libnvdimm 
> sg ibmvscsi ibmveth scsi_transport_srp pseries_wdt
> [ 8041.225558] CPU: 17 UID: 0 PID: 877869 Comm: inject-ra-err Kdump: 
> loaded Not tainted 6.18.0-rc2+ #1 VOLUNTARY
> [ 8041.225569] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [ 8041.225576] NIP:  c0000000008c54d8 LR: c00000000004e464 CTR: 
> 0000000000000000
> [ 8041.225583] REGS: c0000000fff778d0 TRAP: 0300   Not tainted (6.18.0- 
> rc2+)
> [ 8041.225590] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 48002828  XER: 
> 00000000
> [ 8041.225607] CFAR: c00000000004e460 DAR: c00e0001a1ad6103 DSISR: 
> 40000000 IRQMASK: 3
> [ 8041.225607] GPR00: c0000000019d0598 c0000000fff77b70 c00000000244a400 
> c000000d0d6b0818
> [ 8041.225607] GPR04: 0000000000004d43 0000000000000008 c00000000004e464 
> 004d424900000000
> [ 8041.225607] GPR08: 0000000000000001 18000001a1ad6103 a80e000000000000 
> 0000000003000048
> [ 8041.225607] GPR12: 0000000000000000 c000000d0ddf3300 0000000000000000 
> 0000000000000000
> [ 8041.225607] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [ 8041.225607] GPR20: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [ 8041.225607] GPR24: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [ 8041.225607] GPR28: c000000d0d6b0888 c000000d0d6b0800 0000000000004d43 
> c000000d0d6b0818
> [ 8041.225701] NIP [c0000000008c54d8] __asan_load2+0x54/0xd8
> [ 8041.225712] LR [c00000000004e464] pseries_errorlog_id+0x20/0x3c
> [ 8041.225722] Call Trace:
> [ 8041.225726] [c0000000fff77b90] [c0000000001f8748] 
> fwnmi_get_errinfo+0xd4/0x104
> [ 8041.225738] [c0000000fff77bc0] [c0000000019d0598] 
> get_pseries_errorlog+0xa8/0x110
> [ 8041.225750] [c0000000fff77c00] [c0000000001f8f68] 
> pseries_machine_check_realmode+0x11c/0x214
> [ 8041.225762] [c0000000fff77ce0] [c000000000049ca4] 
> machine_check_early+0x74/0xc0
> [ 8041.225771] [c0000000fff77d30] [c0000000000084a4] 
> machine_check_early_common+0x1b4/0x2c0

Is it a new problem or has it always been there ?

The problem is because KASAN is not compatible with realmode (MMU 
translation is OFF).

pseries_machine_check_realmode() is located in 
arch/powerpc/platforms/pseries/ras.c built with KASAN_SANITIZE_ras.o := n

But pseries_machine_check_realmode() calls mce_handle_error() which 
calls get_pseries_errorlog().

get_pseries_errorlog() is in arch/powerpc/kernel/rtas.c which is _not_ 
built with KASAN_SANITIZE disabled hence the Oops.

Unrelated, but it looks like there is also a problem with commit 
cc15ff327569 ("powerpc/mce: Avoid using irq_work_queue() in realmode"), 
which removed the re-enabling of translation but left the call to 
mce_handle_err_virtmode().

Christophe

