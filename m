Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A755388DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 00:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBqlQ2CxPz3cgw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=liaochang1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBJ8q1ZDSz2xss
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 11:43:35 +1000 (AEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LBJ7K4K7JzjX0y;
	Mon, 30 May 2022 09:42:21 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 30 May 2022 09:43:27 +0800
Message-ID: <59e8faec-05fd-805d-7de0-4b0508f8467f@huawei.com>
Date: Mon, 30 May 2022 09:43:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com>
 <20220529065637.xgapqjp2342flbuj@pengutronix.de>
 <264786d9-7756-19e0-2742-8b8d17f5ace5@csgroup.eu>
 <20220529140655.bnd4fgggccrorj4t@pengutronix.de>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20220529140655.bnd4fgggccrorj4t@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 31 May 2022 08:25:41 +1000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Eric Biederman <ebiederm@xmission.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Li Zhengyu <lizhengyu3@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/5/29 22:06, Uwe Kleine-König 写道:
> Hello,
> 
> On Sun, May 29, 2022 at 09:46:47AM +0000, Christophe Leroy wrote:
>> Le 29/05/2022 à 08:56, Uwe Kleine-König a écrit :
>>> Hello,
>>>
>>> on current linux-next ARCH=riscv allmodconfig breaks with:
>>>
>>>    CC      arch/riscv/kernel/elf_kexec.o
>>> arch/riscv/kernel/elf_kexec.c:345:5: error: redefinition of ‘arch_kexec_apply_relocations_add’
>>>    345 | int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>>>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> In file included from arch/riscv/kernel/elf_kexec.c:16:
>>> include/linux/kexec.h:236:1: note: previous definition of ‘arch_kexec_apply_relocations_add’ with type ‘int(struct purgatory_info *, Elf64_Shdr *, const Elf64_Shdr *, const Elf64_Shdr *)’ {aka ‘int(struct purgatory_info *, struct elf64_shdr *, const struct elf64_shdr *, const struct elf64_shdr *)’}
>>>    236 | arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *section,
>>>        | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> (I think) because there is a conflict between the two commits:
>>>
>>> 233c1e6c319c kexec_file: drop weak attribute from arch_kexec_apply_relocations[_add]
>>> 838b3e28488f RISC-V: Load purgatory in kexec_file
>>>
>>> And so next is broken starting from
>>> 164a9037b1d33f28ba27671c16ec1c23d4a11acf which merges the riscv tree.
>>>
>>
>> In arch/riscv/include/asm/kexec.h, do the same as s390 did in commit 
>> 233c1e6c319c:
>>
>> diff --git a/arch/s390/include/asm/kexec.h b/arch/s390/include/asm/kexec.h
>> index 7f3c9ac34bd8..540dd469b088 100644
>> --- a/arch/s390/include/asm/kexec.h
>> +++ b/arch/s390/include/asm/kexec.h
>> @@ -83,4 +83,12 @@ struct kimage_arch {
>>   extern const struct kexec_file_ops s390_kexec_image_ops;
>>   extern const struct kexec_file_ops s390_kexec_elf_ops;
>>
>> +#ifdef CONFIG_KEXEC_FILE
>> +struct purgatory_info;
>> +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
>> +				     Elf_Shdr *section,
>> +				     const Elf_Shdr *relsec,
>> +				     const Elf_Shdr *symtab);
>> +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
>> +#endif
>>   #endif /*_S390_KEXEC_H */
> 
> I can confirm that doing
> 
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> index 206217b23301..eee260e8ab30 100644
> --- a/arch/riscv/include/asm/kexec.h
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -55,6 +55,13 @@ extern riscv_kexec_method riscv_kexec_norelocate;
>  
>  #ifdef CONFIG_KEXEC_FILE
>  extern const struct kexec_file_ops elf_kexec_ops;
> +
> +struct purgatory_info;
> +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> +				     Elf_Shdr *section,
> +				     const Elf_Shdr *relsec,
> +				     const Elf_Shdr *symtab);
> +#define arch_kexec_apply_relocations_add arch_kexec_apply_relocations_add
>  #endif
>  
>  #endif

LGTM, you could send a fixup patch to riscv, thanks.

> 
> on top of 838b3e28488f results in a compilable tree. And when merging
> 233c1e6c319c into this, it is still building.
> 
> I'm not enough into kexec (and riscv) to judge if this is sensible, or
> create a useful commit log but the obvious way forward is to apply the
> above patch to the riscv tree before it hits Linus' tree.
> 
> Best regards
> Uwe
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
BR,
Liao, Chang
