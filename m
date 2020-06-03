Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 136661ECA51
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 09:16:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cKwM0qdZzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 17:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cKtF4NxBzDqFK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 17:15:01 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49cKt85HRfz9v6Nk;
 Wed,  3 Jun 2020 09:14:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wfpV-77Nyl7Z; Wed,  3 Jun 2020 09:14:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49cKt84TYkz9v6Nh;
 Wed,  3 Jun 2020 09:14:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B127E8B87E;
 Wed,  3 Jun 2020 09:14:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YQ-GH8rdZvz7; Wed,  3 Jun 2020 09:14:57 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 41A288B76A;
 Wed,  3 Jun 2020 09:14:57 +0200 (CEST)
Subject: Re: [PATCH 4/5] powerpc/lib: Add LKDTM accessor for patching addr
To: "Christopher M. Riedl" <cmr@informatik.wtf>,
 linuxppc-dev@lists.ozlabs.org, kernel-hardening@lists.openwall.com
References: <20200603051912.23296-1-cmr@informatik.wtf>
 <20200603051912.23296-5-cmr@informatik.wtf>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a458667c-fb8d-a01f-130b-0fef733dd001@csgroup.eu>
Date: Wed, 3 Jun 2020 09:14:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200603051912.23296-5-cmr@informatik.wtf>
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



Le 03/06/2020 à 07:19, Christopher M. Riedl a écrit :
> When live patching a STRICT_RWX kernel, a mapping is installed at a
> "patching address" with temporary write permissions. Provide a
> LKDTM-only accessor function for this address in preparation for a LKDTM
> test which attempts to "hijack" this mapping by writing to it from
> another CPU.
> 
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>   arch/powerpc/lib/code-patching.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index df0765845204..c23453049116 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -52,6 +52,13 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
>   static struct mm_struct *patching_mm __ro_after_init;
>   static unsigned long patching_addr __ro_after_init;
>   
> +#ifdef CONFIG_LKDTM
> +unsigned long read_cpu_patching_addr(unsigned int cpu)

If this fonction is not static, it means it is intended to be used from 
some other C file, so it should be declared in a .h too.

Christophe

> +{
> +	return patching_addr;
> +}
> +#endif
> +
>   void __init poking_init(void)
>   {
>   	spinlock_t *ptl; /* for protecting pte table */
> 
