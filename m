Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AC4387FD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 20:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl4fR34QQz3bs1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 04:44:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl4f60PNKz2yX4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 04:43:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fl4dw4vn7z9sX3;
 Tue, 18 May 2021 20:43:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6PoU40IGTisj; Tue, 18 May 2021 20:43:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fl4dw3PzFz9sX2;
 Tue, 18 May 2021 20:43:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E9C468B7D7;
 Tue, 18 May 2021 20:43:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KH3a5tPj9yhx; Tue, 18 May 2021 20:43:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EEC28B7C2;
 Tue, 18 May 2021 20:43:47 +0200 (CEST)
Subject: Re: [PATCH v8 27/30] powerpc/kprobes: Don't allow breakpoints on
 suffixes
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-28-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <cda38a1c-a78f-9eb5-8395-ce23caa2c81d@csgroup.eu>
Date: Tue, 18 May 2021 20:43:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20200506034050.24806-28-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/05/2020 à 05:40, Jordan Niethe a écrit :
> Do not allow inserting breakpoints on the suffix of a prefix instruction
> in kprobes.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v8: Add this back from v3
> ---
>   arch/powerpc/kernel/kprobes.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 33d54b091c70..227510df8c55 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -106,7 +106,9 @@ kprobe_opcode_t *kprobe_lookup_name(const char *name, unsigned int offset)
>   int arch_prepare_kprobe(struct kprobe *p)
>   {
>   	int ret = 0;
> +	struct kprobe *prev;
>   	struct ppc_inst insn = ppc_inst_read((struct ppc_inst *)p->addr);
> +	struct ppc_inst prefix = ppc_inst_read((struct ppc_inst *)(p->addr - 1));

What if p->addr is the first word of a page and the previous page is not mapped ?

>   
>   	if ((unsigned long)p->addr & 0x03) {
>   		printk("Attempt to register kprobe at an unaligned address\n");
> @@ -114,6 +116,17 @@ int arch_prepare_kprobe(struct kprobe *p)
>   	} else if (IS_MTMSRD(insn) || IS_RFID(insn) || IS_RFI(insn)) {
>   		printk("Cannot register a kprobe on rfi/rfid or mtmsr[d]\n");
>   		ret = -EINVAL;
> +	} else if (ppc_inst_prefixed(prefix)) {

If p->addr - 2 contains a valid prefixed instruction, then p->addr - 1 contains the suffix of that 
prefixed instruction. Are we sure a suffix can never ever be misinterpreted as the prefix of a 
prefixed instruction ?


> +		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
> +		ret = -EINVAL;
> +	}
> +	preempt_disable();
> +	prev = get_kprobe(p->addr - 1);
> +	preempt_enable_no_resched();
> +	if (prev &&
> +	    ppc_inst_prefixed(ppc_inst_read((struct ppc_inst *)prev->ainsn.insn))) {
> +		printk("Cannot register a kprobe on the second word of prefixed instruction\n");
> +		ret = -EINVAL;
>   	}
>   
>   	/* insn must be on a special executable page on ppc64.  This is
> 
