Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6AD1CA4FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 09:19:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JMCQ3mFxzDr41
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 17:19:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JM9h334DzDqw4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 17:17:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49JM9R6zQkz9txYC;
 Fri,  8 May 2020 09:17:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6Fx4c08ZzVBJ; Fri,  8 May 2020 09:17:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49JM9R66RBz9txX1;
 Fri,  8 May 2020 09:17:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C25E8B77E;
 Fri,  8 May 2020 09:17:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id q-IUiRYO65kV; Fri,  8 May 2020 09:17:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A6ED08B767;
 Fri,  8 May 2020 09:17:47 +0200 (CEST)
Subject: Re: [PATCH v8 11/30] powerpc: Use a datatype for instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200506034050.24806-1-jniethe5@gmail.com>
 <20200506034050.24806-12-jniethe5@gmail.com>
 <CACzsE9qRUk8E+DRMH+zuHjhRfOjV0x-4JF5AEZ93tYV9pp3QuA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <7494f275-da54-d6d8-92a8-aede820bb2a7@csgroup.eu>
Date: Fri, 8 May 2020 09:17:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9qRUk8E+DRMH+zuHjhRfOjV0x-4JF5AEZ93tYV9pp3QuA@mail.gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Balamuruhan S <bala24@linux.ibm.com>,
 naveen.n.rao@linux.vnet.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/05/2020 à 03:51, Jordan Niethe a écrit :
> On Wed, May 6, 2020 at 1:45 PM Jordan Niethe <jniethe5@gmail.com> wrote:
>>
>> Currently unsigned ints are used to represent instructions on powerpc.
>> This has worked well as instructions have always been 4 byte words.
>> However, a future ISA version will introduce some changes to
>> instructions that mean this scheme will no longer work as well. This
>> change is Prefixed Instructions. A prefixed instruction is made up of a
>> word prefix followed by a word suffix to make an 8 byte double word
>> instruction. No matter the endianness of the system the prefix always
>> comes first. Prefixed instructions are only planned for powerpc64.
>>
>> Introduce a ppc_inst type to represent both prefixed and word
>> instructions on powerpc64 while keeping it possible to exclusively have
>> word instructions on powerpc32.
>>
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>> v4: New to series
>> v5: Add to epapr_paravirt.c, kgdb.c
>> v6: - setup_32.c: machine_init(): Use type
>>      - feature-fixups.c: do_final_fixups(): Use type
>>      - optprobes.c: arch_prepare_optimized_kprobe(): change a void * to
>>        struct ppc_inst *
>>      - fault.c: store_updates_sp(): Use type
>>      - Change ppc_inst_equal() implementation from memcpy()
>> v7: - Fix compilation issue in early_init_dt_scan_epapr() and
>>        do_patch_instruction() with CONFIG_STRICT_KERNEL_RWX
>> v8: - style
>>      - Use in crash_dump.c, mpc86xx_smp.c, smp.c
>> ---

[...]

>>
> 
> Hi mpe,
> Could you add this fixup.
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -356,7 +356,7 @@ static void patch_btb_flush_section(long *curr)
>          end = (void *)curr + *(curr + 1);
>          for (; start < end; start++) {
>                  pr_devel("patching dest %lx\n", (unsigned long)start);
> -               patch_instruction(start, ppc_inst(PPC_INST_NOP));
> +               patch_instruction((struct ppc_inst *)start,
> ppc_inst(PPC_INST_NOP));
>          }
>   }
> 

Why not declare stard and end as struct ppc_inst ? Wouldn't it be 
cleaner than a cast ?

Christophe
