Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92ED68A8F4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P859m5J5hz3fBc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 19:22:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BP2ASTZR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BP2ASTZR;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P858s3vHDz3cF8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 19:21:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xvdrc1f2xNC5JFaKM2eQIjdjQ1fxtuWULCSS0Ot65Aw=; b=BP2ASTZR/YiKvdPu14+IyxTtJu
	W52Ki6z3vITm6dMrdjjU2EVDe2q5zqbFe5HAXj5/LdY4FyMXlqcKqACnSwrOYvlnLBrRIEuRXzf8W
	TulqhsLKRL0QTRgq0R7HqFuWzfjyTuSOnk6B9fdRtmyJ+rQ6BNxlIdy1e1l6F3p58BW6c/jz4NcgU
	hcqIT87YQb5QLwjh0yUMFIiWI225jBW7pLxlGpvttk7DCSTToFF9yQqRLrkDT+T0JpFTx2om1Sk2k
	BtysTxa7fyXRRLP51DJDRUMti/g7c+kLN/thjIC1+D+lQy+mWEaTBRXLgcHb8YSN6Klnj091ZQxqm
	ansC96og==;
Received: from [2601:1c2:d00:6a60::9526]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pODnt-004ict-1G; Sat, 04 Feb 2023 08:21:45 +0000
Message-ID: <756321f5-9417-2d78-679a-1847fa18ff8a@infradead.org>
Date: Sat, 4 Feb 2023 00:21:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 15/16] objtool/powerpc: Enable objtool to be built on
 ppc
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-16-sv@linux.ibm.com>
 <33924523-5437-eb9a-116a-8e249ce99bd2@csgroup.eu>
 <b1079e99-c7ae-71f1-d578-80270adf44e7@infradead.org>
In-Reply-To: <b1079e99-c7ae-71f1-d578-80270adf44e7@infradead.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "Elliott, Robert \(Servers\)" <elliott@hpe.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/4/23 00:19, Randy Dunlap wrote:
> Hi--
> 
> On 8/29/22 23:41, Christophe Leroy wrote:
>>
>>
>> Le 29/08/2022 à 07:52, Sathvika Vasireddy a écrit :
>>> This patch adds [stub] implementations for required
>>> functions, inorder to enable objtool build on powerpc.
>>
>> Not all powerpc it seems, see below
>>
> 
> When cross-compiling PPC32 (on x86_64), I get 3600+ of these:
> 
> /bin/sh: line 1: ./tools/objtool/objtool: No such file or directory
> /bin/sh: line 1: ./tools/objtool/objtool: No such file or directory
> /bin/sh: line 1: ./tools/objtool/objtool: No such file or directory
> 
> Is there some way that objtool should work when cross-compiling?
> 

Oops. Its build failed. I seem to be missing header file(s)
and possibly a library.
I'll check on those...

Cheers.

> 
>>>
>>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>>> [Christophe Leroy: powerpc: Add missing asm/asm.h for objtool]
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/Kconfig                          |  1 +
>>>   arch/powerpc/include/asm/asm.h                |  7 ++
>>>   tools/objtool/arch/powerpc/Build              |  2 +
>>>   tools/objtool/arch/powerpc/decode.c           | 74 +++++++++++++++++++
>>>   .../arch/powerpc/include/arch/cfi_regs.h      | 11 +++
>>>   tools/objtool/arch/powerpc/include/arch/elf.h |  8 ++
>>>   .../arch/powerpc/include/arch/special.h       | 21 ++++++
>>>   tools/objtool/arch/powerpc/special.c          | 19 +++++
>>>   8 files changed, 143 insertions(+)
>>>   create mode 100644 arch/powerpc/include/asm/asm.h
>>>   create mode 100644 tools/objtool/arch/powerpc/Build
>>>   create mode 100644 tools/objtool/arch/powerpc/decode.c
>>>   create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
>>>   create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h
>>>   create mode 100644 tools/objtool/arch/powerpc/include/arch/special.h
>>>   create mode 100644 tools/objtool/arch/powerpc/special.c
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 4c466acdc70d..dc05cd23c233 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -237,6 +237,7 @@ config PPC
>>>   	select HAVE_MOD_ARCH_SPECIFIC
>>>   	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>>>   	select HAVE_OPTPROBES
>>> +	select HAVE_OBJTOOL			if PPC32 || MPROFILE_KERNEL
>>
>> Why restrict it to MPROFILE_KERNEL ? In your RFC it was for all PPC64.
>>
>> Recent discussion on the list shows new problem with recordmcount, see 
>> https://lore.kernel.org/all/MW5PR84MB184250EA1CAE04497C1E7CE9AB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM/
>>
>> Those ones are with ppc64 big endian, so objtool would be welcome here 
>> as well.
>>
>>>   	select HAVE_PERF_EVENTS
>>>   	select HAVE_PERF_EVENTS_NMI		if PPC64
>>>   	select HAVE_PERF_REGS
>>> diff --git a/arch/powerpc/include/asm/asm.h b/arch/powerpc/include/asm/asm.h
>>> new file mode 100644
>>> index 000000000000..86f46b604e9a
>>> --- /dev/null
>>> +++ b/arch/powerpc/include/asm/asm.h
>>> @@ -0,0 +1,7 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_POWERPC_ASM_H
>>> +#define _ASM_POWERPC_ASM_H
>>> +
>>> +#define _ASM_PTR	" .long "
>>> +
>>> +#endif /* _ASM_POWERPC_ASM_H */
>>> diff --git a/tools/objtool/arch/powerpc/Build b/tools/objtool/arch/powerpc/Build
>>> new file mode 100644
>>> index 000000000000..d24d5636a5b8
>>> --- /dev/null
>>> +++ b/tools/objtool/arch/powerpc/Build
>>> @@ -0,0 +1,2 @@
>>> +objtool-y += decode.o
>>> +objtool-y += special.o
>>> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
>>> new file mode 100644
>>> index 000000000000..8b6a14680da7
>>> --- /dev/null
>>> +++ b/tools/objtool/arch/powerpc/decode.c
>>> @@ -0,0 +1,74 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +#include <stdio.h>
>>> +#include <stdlib.h>
>>> +#include <objtool/check.h>
>>> +#include <objtool/elf.h>
>>> +#include <objtool/arch.h>
>>> +#include <objtool/warn.h>
>>> +#include <objtool/builtin.h>
>>> +#include <objtool/endianness.h>
>>> +
>>> +unsigned long arch_dest_reloc_offset(int addend)
>>> +{
>>> +	return addend;
>>> +}
>>> +
>>> +bool arch_callee_saved_reg(unsigned char reg)
>>> +{
>>> +	return false;
>>> +}
>>> +
>>> +int arch_decode_hint_reg(u8 sp_reg, int *base)
>>> +{
>>> +	exit(-1);
>>> +}
>>> +
>>> +const char *arch_nop_insn(int len)
>>> +{
>>> +	exit(-1);
>>> +}
>>> +
>>> +const char *arch_ret_insn(int len)
>>> +{
>>> +	exit(-1);
>>> +}
>>> +
>>> +int arch_decode_instruction(struct objtool_file *file, const struct section *sec,
>>> +			    unsigned long offset, unsigned int maxlen,
>>> +			    unsigned int *len, enum insn_type *type,
>>> +			    unsigned long *immediate,
>>> +			    struct list_head *ops_list)
>>> +{
>>> +	u32 insn;
>>> +
>>> +	*immediate = 0;
>>> +	insn = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
>>> +	*len = 4;
>>> +	*type = INSN_OTHER;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +unsigned long arch_jump_destination(struct instruction *insn)
>>> +{
>>> +	return insn->offset +  insn->immediate;
>>> +}
>>> +
>>> +void arch_initial_func_cfi_state(struct cfi_init_state *state)
>>> +{
>>> +	int i;
>>> +
>>> +	for (i = 0; i < CFI_NUM_REGS; i++) {
>>> +		state->regs[i].base = CFI_UNDEFINED;
>>> +		state->regs[i].offset = 0;
>>> +	}
>>> +
>>> +	/* initial CFA (call frame address) */
>>> +	state->cfa.base = CFI_SP;
>>> +	state->cfa.offset = 0;
>>> +
>>> +	/* initial LR (return address) */
>>> +	state->regs[CFI_RA].base = CFI_CFA;
>>> +	state->regs[CFI_RA].offset = 0;
>>> +}
>>> diff --git a/tools/objtool/arch/powerpc/include/arch/cfi_regs.h b/tools/objtool/arch/powerpc/include/arch/cfi_regs.h
>>> new file mode 100644
>>> index 000000000000..59638ebeafc8
>>> --- /dev/null
>>> +++ b/tools/objtool/arch/powerpc/include/arch/cfi_regs.h
>>> @@ -0,0 +1,11 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +#ifndef _OBJTOOL_CFI_REGS_H
>>> +#define _OBJTOOL_CFI_REGS_H
>>> +
>>> +#define CFI_BP 1
>>> +#define CFI_SP CFI_BP
>>> +#define CFI_RA 32
>>> +#define CFI_NUM_REGS 33
>>> +
>>> +#endif
>>> diff --git a/tools/objtool/arch/powerpc/include/arch/elf.h b/tools/objtool/arch/powerpc/include/arch/elf.h
>>> new file mode 100644
>>> index 000000000000..3c8ebb7d2a6b
>>> --- /dev/null
>>> +++ b/tools/objtool/arch/powerpc/include/arch/elf.h
>>> @@ -0,0 +1,8 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +#ifndef _OBJTOOL_ARCH_ELF
>>> +#define _OBJTOOL_ARCH_ELF
>>> +
>>> +#define R_NONE R_PPC_NONE
>>> +
>>> +#endif /* _OBJTOOL_ARCH_ELF */
>>> diff --git a/tools/objtool/arch/powerpc/include/arch/special.h b/tools/objtool/arch/powerpc/include/arch/special.h
>>> new file mode 100644
>>> index 000000000000..ffef9ada7133
>>> --- /dev/null
>>> +++ b/tools/objtool/arch/powerpc/include/arch/special.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +#ifndef _PPC_ARCH_SPECIAL_H
>>> +#define _PPC_ARCH_SPECIAL_H
>>> +
>>> +#define EX_ENTRY_SIZE 8
>>> +#define EX_ORIG_OFFSET 0
>>> +#define EX_NEW_OFFSET 4
>>> +
>>> +#define JUMP_ENTRY_SIZE 16
>>> +#define JUMP_ORIG_OFFSET 0
>>> +#define JUMP_NEW_OFFSET 4
>>> +#define JUMP_KEY_OFFSET 8
>>> +
>>> +#define ALT_ENTRY_SIZE 12
>>> +#define ALT_ORIG_OFFSET 0
>>> +#define ALT_NEW_OFFSET 4
>>> +#define ALT_FEATURE_OFFSET 8
>>> +#define ALT_ORIG_LEN_OFFSET 10
>>> +#define ALT_NEW_LEN_OFFSET 11
>>> +
>>> +#endif /* _PPC_ARCH_SPECIAL_H */
>>> diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
>>> new file mode 100644
>>> index 000000000000..d33868147196
>>> --- /dev/null
>>> +++ b/tools/objtool/arch/powerpc/special.c
>>> @@ -0,0 +1,19 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +#include <string.h>
>>> +#include <stdlib.h>
>>> +#include <objtool/special.h>
>>> +#include <objtool/builtin.h>
>>> +
>>> +
>>> +bool arch_support_alt_relocation(struct special_alt *special_alt,
>>> +				 struct instruction *insn,
>>> +				 struct reloc *reloc)
>>> +{
>>> +	exit(-1);
>>> +}
>>> +
>>> +struct reloc *arch_find_switch_table(struct objtool_file *file,
>>> +				    struct instruction *insn)
>>> +{
>>> +	exit(-1);
>>> +}
> 

-- 
~Randy
