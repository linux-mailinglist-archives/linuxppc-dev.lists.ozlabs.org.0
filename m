Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFEA835C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 15:06:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nkbk2FwCzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 23:06:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NjbH143WzDqtr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 22:20:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46NjbG1Q45z9sDB; Wed,  4 Sep 2019 22:20:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46NjbF2m68z9s7T;
 Wed,  4 Sep 2019 22:20:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 21/31] powernv/fadump: process architected register
 state data provided by firmware
In-Reply-To: <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630280239.8896.11769233860624935762.stgit@hbathini.in.ibm.com>
Date: Wed, 04 Sep 2019 22:20:56 +1000
Message-ID: <87sgpcp80n.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:

> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
> index 7107cf2..fc408b0 100644
> --- a/arch/powerpc/kernel/fadump-common.h
> +++ b/arch/powerpc/kernel/fadump-common.h
> @@ -98,7 +98,11 @@ struct fw_dump {
>  	/* cmd line option during boot */
>  	unsigned long	reserve_bootvar;
>  
> +	unsigned long	cpu_state_destination_addr;

AFAICS that is only used in two places, and both of them have to call
__va() on it, so why don't we store the virtual address to start with?

> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index f75b861..9a32a7f 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -282,15 +283,122 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
>  		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
>  }
>  
> +static inline void opal_fadump_set_regval_regnum(struct pt_regs *regs,
> +						 u32 reg_type, u32 reg_num,
> +						 u64 reg_val)
> +{
> +	if (reg_type == HDAT_FADUMP_REG_TYPE_GPR) {
> +		if (reg_num < 32)
> +			regs->gpr[reg_num] = reg_val;
> +		return;
> +	}
> +
> +	switch (reg_num) {
> +	case SPRN_CTR:
> +		regs->ctr = reg_val;
> +		break;
> +	case SPRN_LR:
> +		regs->link = reg_val;
> +		break;
> +	case SPRN_XER:
> +		regs->xer = reg_val;
> +		break;
> +	case SPRN_DAR:
> +		regs->dar = reg_val;
> +		break;
> +	case SPRN_DSISR:
> +		regs->dsisr = reg_val;
> +		break;
> +	case HDAT_FADUMP_REG_ID_NIP:
> +		regs->nip = reg_val;
> +		break;
> +	case HDAT_FADUMP_REG_ID_MSR:
> +		regs->msr = reg_val;
> +		break;
> +	case HDAT_FADUMP_REG_ID_CCR:
> +		regs->ccr = reg_val;
> +		break;
> +	}
> +}
> +
> +static inline void opal_fadump_read_regs(char *bufp, unsigned int regs_cnt,
> +					 unsigned int reg_entry_size,
> +					 struct pt_regs *regs)
> +{
> +	int i;
> +	struct hdat_fadump_reg_entry *reg_entry;

Where's my christmas tree :)

> +
> +	memset(regs, 0, sizeof(struct pt_regs));
> +
> +	for (i = 0; i < regs_cnt; i++, bufp += reg_entry_size) {
> +		reg_entry = (struct hdat_fadump_reg_entry *)bufp;
> +		opal_fadump_set_regval_regnum(regs,
> +					      be32_to_cpu(reg_entry->reg_type),
> +					      be32_to_cpu(reg_entry->reg_num),
> +					      be64_to_cpu(reg_entry->reg_val));
> +	}
> +}
> +
> +static inline bool __init is_thread_core_inactive(u8 core_state)
> +{
> +	bool is_inactive = false;
> +
> +	if (core_state == HDAT_FADUMP_CORE_INACTIVE)
> +		is_inactive = true;
> +
> +	return is_inactive;

	return core_state == HDAT_FADUMP_CORE_INACTIVE;

??

In fact there's only one caller, so just drop the inline entirely.

> +}
> +
>  /*
>   * Convert CPU state data saved at the time of crash into ELF notes.
> + *
> + * Each register entry is of 16 bytes, A numerical identifier along with
> + * a GPR/SPR flag in the first 8 bytes and the register value in the next
> + * 8 bytes. For more details refer to F/W documentation.
>   */
>  static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
>  {
>  	u32 num_cpus, *note_buf;
>  	struct fadump_crash_info_header *fdh = NULL;
> +	struct hdat_fadump_thread_hdr *thdr;
> +	unsigned long addr;
> +	u32 thread_pir;
> +	char *bufp;
> +	struct pt_regs regs;
> +	unsigned int size_of_each_thread;
> +	unsigned int regs_offset, regs_cnt, reg_esize;
> +	int i;

	unsigned int size_of_each_thread, regs_offset, regs_cnt, reg_esize;
  	struct fadump_crash_info_header *fdh = NULL;
  	u32 num_cpus, thread_pir, *note_buf;
	struct hdat_fadump_thread_hdr *thdr;
	struct pt_regs regs;
	unsigned long addr;
	char *bufp;
	int i;

Ah much better :)

Though the number of variables might be an indication that this function
could be split into smaller parts.

> @@ -473,6 +627,26 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
>  			return 1;
>  		}
>  
> +		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
> +		if ((ret != OPAL_SUCCESS) || !addr) {
> +			pr_err("Failed to get CPU metadata (%lld)\n", ret);
> +			return 1;
> +		}
> +
> +		addr = be64_to_cpu(addr);
> +		pr_debug("CPU metadata addr: %llx\n", addr);
> +
> +		opal_cpu_metadata = __va(addr);
> +		r_opal_cpu_metadata = (void *)addr;

Another r_ variable I don't understand.

> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
> index 19cac1f..ce4c522 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.h
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.h
> @@ -30,4 +30,43 @@ struct opal_fadump_mem_struct {
>  	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
>  } __attribute__((packed));
>  
> +/*
> + * CPU state data is provided by f/w. Below are the definitions
> + * provided in HDAT spec. Refer to latest HDAT specification for
> + * any update to this format.
> + */

How is this meant to work? If HDAT ever changes the format they will
break all existing kernels in the field.

> +#define HDAT_FADUMP_CPU_DATA_VERSION		1
> +
> +#define HDAT_FADUMP_CORE_INACTIVE		(0x0F)
> +
> +/* HDAT thread header for register entries */
> +struct hdat_fadump_thread_hdr {
> +	__be32  pir;
> +	/* 0x00 - 0x0F - The corresponding stop state of the core */
> +	u8      core_state;
> +	u8      reserved[3];
> +
> +	__be32	offset;	/* Offset to Register Entries array */
> +	__be32	ecnt;	/* Number of entries */
> +	__be32	esize;	/* Alloc size of each array entry in bytes */
> +	__be32	eactsz;	/* Actual size of each array entry in bytes */
> +} __attribute__((packed));
> +
> +/* Register types populated by f/w */
> +#define HDAT_FADUMP_REG_TYPE_GPR		0x01
> +#define HDAT_FADUMP_REG_TYPE_SPR		0x02
> +
> +/* ID numbers used by f/w while populating certain registers */
> +#define HDAT_FADUMP_REG_ID_NIP			0x7D0
> +#define HDAT_FADUMP_REG_ID_MSR			0x7D1
> +#define HDAT_FADUMP_REG_ID_CCR			0x7D2
> +
> +/* HDAT register entry. */
> +struct hdat_fadump_reg_entry {
> +	__be32		reg_type;
> +	__be32		reg_num;
> +	__be64		reg_val;
> +} __attribute__((packed));

cheers
