Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1534D38D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 19:29:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDLLl0mXzz3bVy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 05:29:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDLLG5s5Gz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 05:28:35 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDLLB1FRLz9sSh;
 Wed,  9 Mar 2022 19:28:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6yY_gGoke15; Wed,  9 Mar 2022 19:28:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDLLB0Stzz9sSX;
 Wed,  9 Mar 2022 19:28:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F159B8B780;
 Wed,  9 Mar 2022 19:28:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id e7HAkbOtVexE; Wed,  9 Mar 2022 19:28:33 +0100 (CET)
Received: from [192.168.202.27] (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F82D8B763;
 Wed,  9 Mar 2022 19:28:33 +0100 (CET)
Message-ID: <d1efe5f4-c94e-ddd8-5090-3e732552804b@csgroup.eu>
Date: Wed, 9 Mar 2022 19:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] powerpc/kprobes: Use appropriate format specifier for
 printing kernel address
Content-Language: fr-FR
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <cover.1587652966.git.naveen.n.rao@linux.vnet.ibm.com>
 <c66bdfc569c47b965b706dd7f2627d6ada67ff50.1587652966.git.naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <c66bdfc569c47b965b706dd7f2627d6ada67ff50.1587652966.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Balamuruhan S <bala24@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 23/04/2020 à 17:17, Naveen N. Rao a écrit :
> From: Balamuruhan S <bala24@linux.ibm.com>
> 
> Change use of %p to %pK when printing address of the instruction slot so
> that the actual kernel address is visible for privileged users.
> 
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

This series doesn't apply.

Linking it to https://github.com/linuxppc/issues/issues/390

> ---
>   arch/powerpc/kernel/optprobes.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index ef0924b0809d..d5f8c25b7cac 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -247,7 +247,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
>   	/* Setup template */
>   	/* We can optimize this via patch_instruction_window later */
>   	size = (TMPL_END_IDX * sizeof(kprobe_opcode_t)) / sizeof(int);
> -	pr_devel("Copying template to %p, size %lu\n", buff, size);
> +	pr_devel("Copying template to %pK, size %lu\n", (void *)buff, size);
>   	for (i = 0; i < size; i++) {
>   		rc = patch_instruction(buff + i, *(optprobe_template_entry + i));
>   		if (rc) {
