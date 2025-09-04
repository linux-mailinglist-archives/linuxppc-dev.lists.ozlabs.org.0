Return-Path: <linuxppc-dev+bounces-11702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CF5B43491
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 09:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHWqd4jrsz2yrZ;
	Thu,  4 Sep 2025 17:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756972237;
	cv=none; b=kCQSdDIhMnrvdOvO5CSFLr41foxpPB7vpNAmqlZ0eW1/l1aeFbzFjie6Ro5T8nN+hxQZ1r8HfefanPhV7Vl3NmKDXRjqjEJlGYtlWNcvlX2YOH3wouEnIAWx/OtRHdQm+kInpZnPIamRE+erroMVFAGRmLqVZB72u7VF2VOc8IFoHV+W4xe1rlFReZJatM+Uh16jVlDt+58V0ZnAIsvwinRcj4Ytph3KiAKSrQz9K1fEudVulvcczB6i4LWyJ9NgZTBw1T2XWyjQK4+kmKijycDSJC+BC2qIDG1y9yNJ6u/kesUvIr8gOCUvuKjL7S7o0SYkEooc8AfMpPC0UPaVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756972237; c=relaxed/relaxed;
	bh=WB1C0osQu7DLcHLEYW1ZxXc5VdIgByVTbwxbGeB/nRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8Jnrqkj1LFVEN/+4uKqUsCC257YP7W+6PeyiDNip74bo5p/TzKf92tZZHC7U6gwlZdgoSV3aaWn9xQBhTXo5LuBch/lqGgaGzaQt8WGnO15Z1DMp1YHNktE1zfWLMGBb/9GSKIQmixagDE6Ixj0D8UqSZrdW+htkcXgS8yq26ZFa/WFu3DifbwrJJyBsFZ7HiqokWjYCHqChArNkYbVZj5lgOFtgXDIVsiyguOzxpz9Y5s/blpwJS9nFKSOq/QTXAvu7o6py9d486xkx2x2c0Pjc4yzvJg7hKiKSYH6JizEa8tN/zOlgMQ586VZaYSul9clT5xZuw+T06sUVKyMpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHWqc6dcBz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 17:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHWPY4mRsz9sS8;
	Thu,  4 Sep 2025 09:31:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsFBZzork0mm; Thu,  4 Sep 2025 09:31:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHWPY443xz9sRy;
	Thu,  4 Sep 2025 09:31:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 77E798B764;
	Thu,  4 Sep 2025 09:31:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XT6Ainz9sVSu; Thu,  4 Sep 2025 09:31:29 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 530778B763;
	Thu,  4 Sep 2025 09:31:29 +0200 (CEST)
Message-ID: <98dbafee-aad3-439b-9efb-76f80c6668fd@csgroup.eu>
Date: Thu, 4 Sep 2025 09:31:29 +0200
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
Subject: Re: Kernel v6.17-rc4 with STATIC_CALL_SELFTEST=y enabled fails to
 boot at early stage (PowerMac G4 DP)
To: Erhard Furtner <erhard_f@mailbox.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Erhard,

Le 04/09/2025 à 00:44, Erhard Furtner a écrit :
> Greetings!
> 
> In a conversation with Andrew about his page table check code for 
> PowerPC he found out there seems to be a general problem of the code 
> patching code on ppc:
> 
>  > I note that STATIC_CALL_SELFTEST seems to fail, which could be but isn't
>  > necessarily related.
> 
>  > Specifically, it looks like code patching fails if the instruction 
> being patched
>  > is in an __init function, and in this case, that occurs due to
>  > page_table_check_pte_clear() being inlined into ptep_clear(), which 
> is in turn
>  > inlined into pte_clear_tests() in debug_vm_pgtable.c which is marked 
> __init.
>  > Very curious!
> 
> Indeed, when I enable STATIC_CALL_SELFTEST=y on my G4 the kernel fails 
> to boot at an early stage, the OpenFirmware console showing only:
> 
> done
> found display   : /pci@f0000000/ATY,AlteracParent@10/ATY,Alterac_B@1, 
> opening...
> 
> Without STATIC_CALL_SELFTEST the kernel boots just fine.
> 
> Kernel .config attached.

With your .config, on QEMU I get the following. I will investigate.

[    0.000000] Kernel panic - not syncing: arch_static_call_transform: 
patching failed func_a+0x0/0x10 at 0x0
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 
6.17.0-rc4-PMacG4+ #1628 PREEMPTLAZY
[    0.000000] Hardware name: PowerMac3,1 7400 0xc0209 PowerMac
[    0.000000] Call Trace:
[    0.000000] [c0dd7e60] [c0810e54] dump_stack_lvl+0x70/0x8c (unreliable)
[    0.000000] [c0dd7e80] [c004b220] vpanic+0x114/0x2e4
[    0.000000] [c0dd7eb0] [c004b45c] arch_set_bit+0x0/0x38
[    0.000000] [c0dd7f00] [c00155fc] arch_static_call_transform+0xec/0x1e8
[    0.000000] [c0dd7f30] [c0176944] __static_call_init+0x110/0x288
[    0.000000] [c0dd7f80] [c0c19ab0] static_call_init+0x4c/0x9c
[    0.000000] [c0dd7fa0] [c0c02e00] start_kernel+0x7c/0x664
[    0.000000] [c0dd7ff0] [000035d0] 0x35d0
[    0.000000] Rebooting in 40 seconds..

Christophe

