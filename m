Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 963255DCAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 04:54:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dm0v5MgczDqF5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 12:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dlzC5CHvzDqCg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 12:53:11 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x632qAcd115608
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jul 2019 22:53:08 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tgkg3rujx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 22:53:08 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 3 Jul 2019 03:53:05 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 03:53:04 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x632qqiR34341138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 02:52:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17C97A4053;
 Wed,  3 Jul 2019 02:53:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FB45A404D;
 Wed,  3 Jul 2019 02:53:00 +0000 (GMT)
Received: from [9.85.75.18] (unknown [9.85.75.18])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 02:53:00 +0000 (GMT)
Subject: Re: [RFC PATCH v2 09/12] powerpc/ptrace: split out ADV_DEBUG_REGS
 related functions.
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <79b765523f7d45f93cc3b636fec57055f52801b3.1561735588.git.christophe.leroy@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 3 Jul 2019 08:22:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <79b765523f7d45f93cc3b636fec57055f52801b3.1561735588.git.christophe.leroy@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070302-0028-0000-0000-0000037FD689
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070302-0029-0000-0000-0000244012C6
Message-Id: <62ced601-d768-65e8-cdcd-bb649259390c@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030032
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
Cc: mikey@neuling.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/28/19 9:17 PM, Christophe Leroy wrote:
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
> new file mode 100644
> index 000000000000..86e71fa6c5c8
> --- /dev/null
> +++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
> @@ -0,0 +1,487 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/mm.h>
> +#include <linux/smp.h>
> +#include <linux/errno.h>
> +#include <linux/ptrace.h>
> +#include <linux/regset.h>
> +#include <linux/tracehook.h>
> +#include <linux/elf.h>
> +#include <linux/user.h>
> +#include <linux/security.h>
> +#include <linux/signal.h>
> +#include <linux/seccomp.h>
> +#include <linux/audit.h>
> +#include <trace/syscall.h>
> +#include <linux/hw_breakpoint.h>
> +#include <linux/perf_event.h>
> +#include <linux/context_tracking.h>
> +#include <linux/nospec.h>
> +
> +#include <linux/uaccess.h>
> +#include <linux/pkeys.h>
> +#include <asm/page.h>
> +#include <asm/pgtable.h>
> +#include <asm/switch_to.h>
> +#include <asm/tm.h>
> +#include <asm/asm-prototypes.h>
> +#include <asm/debug.h>
> +#include <asm/hw_breakpoint.h>
> +
> +#include <kernel/ptrace/ptrace-decl.h>
> +
> +void user_enable_single_step(struct task_struct *task)
> +{
> +	struct pt_regs *regs = task->thread.regs;
> +
> +	if (regs != NULL) {
> +		task->thread.debug.dbcr0 &= ~DBCR0_BT;
> +		task->thread.debug.dbcr0 |= DBCR0_IDM | DBCR0_IC;
> +		regs->msr |= MSR_DE;
> +	}
> +	set_tsk_thread_flag(task, TIF_SINGLESTEP);
> +}
> +
> +void user_enable_block_step(struct task_struct *task)
> +{
> +	struct pt_regs *regs = task->thread.regs;
> +
> +	if (regs != NULL) {
> +		task->thread.debug.dbcr0 &= ~DBCR0_IC;
> +		task->thread.debug.dbcr0 = DBCR0_IDM | DBCR0_BT;
> +		regs->msr |= MSR_DE;
> +	}
> +	set_tsk_thread_flag(task, TIF_SINGLESTEP);
> +}
> +
> +void user_disable_single_step(struct task_struct *task)
> +{
> +	struct pt_regs *regs = task->thread.regs;
> +
> +	if (regs != NULL) {
> +		/*
> +		 * The logic to disable single stepping should be as
> +		 * simple as turning off the Instruction Complete flag.
> +		 * And, after doing so, if all debug flags are off, turn
> +		 * off DBCR0(IDM) and MSR(DE) .... Torez
> +		 */
> +		task->thread.debug.dbcr0 &= ~(DBCR0_IC|DBCR0_BT);
> +		/*
> +		 * Test to see if any of the DBCR_ACTIVE_EVENTS bits are set.
> +		 */
> +		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
> +					task->thread.debug.dbcr1)) {
> +			/*
> +			 * All debug events were off.....
> +			 */
> +			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
> +			regs->msr &= ~MSR_DE;
> +		}
> +	}
> +	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
> +}
> +
> +int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
> +{
> +	/* For ppc64 we support one DABR and no IABR's at the moment (ppc64).
> +	 *  For embedded processors we support one DAC and no IAC's at the
> +	 *  moment.
> +	 */

I guess mentioning DABR and IABR doesn't make sense in ptrace-adv.c?

> +	if (addr > 0)
> +		return -EINVAL;
> +
> +	/* The bottom 3 bits in dabr are flags */

Same here.

> +	if ((data & ~0x7UL) >= TASK_SIZE)
> +		return -EIO;
> +
> +	/* As described above, it was assumed 3 bits were passed with the data
> +	 *  address, but we will assume only the mode bits will be passed
> +	 *  as to not cause alignment restrictions for DAC-based processors.
> +	 */
> +
> +	/* DAC's hold the whole address without any mode flags */
> +	task->thread.debug.dac1 = data & ~0x3UL;
> +
> +	if (task->thread.debug.dac1 == 0) {
> +		dbcr_dac(task) &= ~(DBCR_DAC1R | DBCR_DAC1W);
> +		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
> +					task->thread.debug.dbcr1)) {
> +			task->thread.regs->msr &= ~MSR_DE;
> +			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
> +		}
> +		return 0;
> +	}
> +
> +	/* Read or Write bits must be set */
> +
> +	if (!(data & 0x3UL))
> +		return -EINVAL;
> +
> +	/* Set the Internal Debugging flag (IDM bit 1) for the DBCR0
> +	   register */
> +	task->thread.debug.dbcr0 |= DBCR0_IDM;
> +
> +	/* Check for write and read flags and set DBCR0
> +	   accordingly */
> +	dbcr_dac(task) &= ~(DBCR_DAC1R|DBCR_DAC1W);
> +	if (data & 0x1UL)
> +		dbcr_dac(task) |= DBCR_DAC1R;
> +	if (data & 0x2UL)
> +		dbcr_dac(task) |= DBCR_DAC1W;
> +	task->thread.regs->msr |= MSR_DE;
> +	return 0;
> +}
> +
> +static long set_instruction_bp(struct task_struct *child,
> +			      struct ppc_hw_breakpoint *bp_info)
> +{
> +	int slot;
> +	int slot1_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC1) != 0);
> +	int slot2_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC2) != 0);
> +	int slot3_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC3) != 0);
> +	int slot4_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC4) != 0);
> +
> +	if (dbcr_iac_range(child) & DBCR_IAC12MODE)
> +		slot2_in_use = 1;
> +	if (dbcr_iac_range(child) & DBCR_IAC34MODE)
> +		slot4_in_use = 1;
> +
> +	if (bp_info->addr >= TASK_SIZE)
> +		return -EIO;
> +
> +	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT) {
> +
> +		/* Make sure range is valid. */
> +		if (bp_info->addr2 >= TASK_SIZE)
> +			return -EIO;
> +
> +		/* We need a pair of IAC regsisters */
> +		if ((!slot1_in_use) && (!slot2_in_use)) {
> +			slot = 1;
> +			child->thread.debug.iac1 = bp_info->addr;
> +			child->thread.debug.iac2 = bp_info->addr2;
> +			child->thread.debug.dbcr0 |= DBCR0_IAC1;
> +			if (bp_info->addr_mode ==
> +					PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
> +				dbcr_iac_range(child) |= DBCR_IAC12X;
> +			else
> +				dbcr_iac_range(child) |= DBCR_IAC12I;
> +#if CONFIG_PPC_ADV_DEBUG_IACS > 2
> +		} else if ((!slot3_in_use) && (!slot4_in_use)) {
> +			slot = 3;
> +			child->thread.debug.iac3 = bp_info->addr;
> +			child->thread.debug.iac4 = bp_info->addr2;
> +			child->thread.debug.dbcr0 |= DBCR0_IAC3;
> +			if (bp_info->addr_mode ==
> +					PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
> +				dbcr_iac_range(child) |= DBCR_IAC34X;
> +			else
> +				dbcr_iac_range(child) |= DBCR_IAC34I;
> +#endif
> +		} else
> +			return -ENOSPC;
> +	} else {
> +		/* We only need one.  If possible leave a pair free in
> +		 * case a range is needed later
> +		 */
> +		if (!slot1_in_use) {
> +			/*
> +			 * Don't use iac1 if iac1-iac2 are free and either
> +			 * iac3 or iac4 (but not both) are free
> +			 */
> +			if (slot2_in_use || (slot3_in_use == slot4_in_use)) {
> +				slot = 1;
> +				child->thread.debug.iac1 = bp_info->addr;
> +				child->thread.debug.dbcr0 |= DBCR0_IAC1;
> +				goto out;
> +			}
> +		}
> +		if (!slot2_in_use) {
> +			slot = 2;
> +			child->thread.debug.iac2 = bp_info->addr;
> +			child->thread.debug.dbcr0 |= DBCR0_IAC2;
> +#if CONFIG_PPC_ADV_DEBUG_IACS > 2
> +		} else if (!slot3_in_use) {
> +			slot = 3;
> +			child->thread.debug.iac3 = bp_info->addr;
> +			child->thread.debug.dbcr0 |= DBCR0_IAC3;
> +		} else if (!slot4_in_use) {
> +			slot = 4;
> +			child->thread.debug.iac4 = bp_info->addr;
> +			child->thread.debug.dbcr0 |= DBCR0_IAC4;
> +#endif
> +		} else
> +			return -ENOSPC;
> +	}
> +out:
> +	child->thread.debug.dbcr0 |= DBCR0_IDM;
> +	child->thread.regs->msr |= MSR_DE;
> +
> +	return slot;
> +}
> +
> +static int del_instruction_bp(struct task_struct *child, int slot)
> +{
> +	switch (slot) {
> +	case 1:
> +		if ((child->thread.debug.dbcr0 & DBCR0_IAC1) == 0)
> +			return -ENOENT;
> +
> +		if (dbcr_iac_range(child) & DBCR_IAC12MODE) {
> +			/* address range - clear slots 1 & 2 */
> +			child->thread.debug.iac2 = 0;
> +			dbcr_iac_range(child) &= ~DBCR_IAC12MODE;
> +		}
> +		child->thread.debug.iac1 = 0;
> +		child->thread.debug.dbcr0 &= ~DBCR0_IAC1;
> +		break;
> +	case 2:
> +		if ((child->thread.debug.dbcr0 & DBCR0_IAC2) == 0)
> +			return -ENOENT;
> +
> +		if (dbcr_iac_range(child) & DBCR_IAC12MODE)
> +			/* used in a range */
> +			return -EINVAL;
> +		child->thread.debug.iac2 = 0;
> +		child->thread.debug.dbcr0 &= ~DBCR0_IAC2;
> +		break;
> +#if CONFIG_PPC_ADV_DEBUG_IACS > 2
> +	case 3:
> +		if ((child->thread.debug.dbcr0 & DBCR0_IAC3) == 0)
> +			return -ENOENT;
> +
> +		if (dbcr_iac_range(child) & DBCR_IAC34MODE) {
> +			/* address range - clear slots 3 & 4 */
> +			child->thread.debug.iac4 = 0;
> +			dbcr_iac_range(child) &= ~DBCR_IAC34MODE;
> +		}
> +		child->thread.debug.iac3 = 0;
> +		child->thread.debug.dbcr0 &= ~DBCR0_IAC3;
> +		break;
> +	case 4:
> +		if ((child->thread.debug.dbcr0 & DBCR0_IAC4) == 0)
> +			return -ENOENT;
> +
> +		if (dbcr_iac_range(child) & DBCR_IAC34MODE)
> +			/* Used in a range */
> +			return -EINVAL;
> +		child->thread.debug.iac4 = 0;
> +		child->thread.debug.dbcr0 &= ~DBCR0_IAC4;
> +		break;
> +#endif
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int set_dac(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
> +{
> +	int byte_enable =
> +		(bp_info->condition_mode >> PPC_BREAKPOINT_CONDITION_BE_SHIFT)
> +		& 0xf;
> +	int condition_mode =
> +		bp_info->condition_mode & PPC_BREAKPOINT_CONDITION_MODE;
> +	int slot;
> +
> +	if (byte_enable && (condition_mode == 0))
> +		return -EINVAL;
> +
> +	if (bp_info->addr >= TASK_SIZE)
> +		return -EIO;
> +
> +	if ((dbcr_dac(child) & (DBCR_DAC1R | DBCR_DAC1W)) == 0) {
> +		slot = 1;
> +		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
> +			dbcr_dac(child) |= DBCR_DAC1R;
> +		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
> +			dbcr_dac(child) |= DBCR_DAC1W;
> +		child->thread.debug.dac1 = (unsigned long)bp_info->addr;
> +#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
> +		if (byte_enable) {
> +			child->thread.debug.dvc1 =
> +				(unsigned long)bp_info->condition_value;
> +			child->thread.debug.dbcr2 |=
> +				((byte_enable << DBCR2_DVC1BE_SHIFT) |
> +				 (condition_mode << DBCR2_DVC1M_SHIFT));
> +		}
> +#endif
> +#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
> +	} else if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE) {
> +		/* Both dac1 and dac2 are part of a range */
> +		return -ENOSPC;
> +#endif
> +	} else if ((dbcr_dac(child) & (DBCR_DAC2R | DBCR_DAC2W)) == 0) {
> +		slot = 2;
> +		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
> +			dbcr_dac(child) |= DBCR_DAC2R;
> +		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
> +			dbcr_dac(child) |= DBCR_DAC2W;
> +		child->thread.debug.dac2 = (unsigned long)bp_info->addr;
> +#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
> +		if (byte_enable) {
> +			child->thread.debug.dvc2 =
> +				(unsigned long)bp_info->condition_value;
> +			child->thread.debug.dbcr2 |=
> +				((byte_enable << DBCR2_DVC2BE_SHIFT) |
> +				 (condition_mode << DBCR2_DVC2M_SHIFT));
> +		}
> +#endif
> +	} else
> +		return -ENOSPC;
> +	child->thread.debug.dbcr0 |= DBCR0_IDM;
> +	child->thread.regs->msr |= MSR_DE;
> +
> +	return slot + 4;
> +}
> +
> +static int del_dac(struct task_struct *child, int slot)
> +{
> +	if (slot == 1) {
> +		if ((dbcr_dac(child) & (DBCR_DAC1R | DBCR_DAC1W)) == 0)
> +			return -ENOENT;
> +
> +		child->thread.debug.dac1 = 0;
> +		dbcr_dac(child) &= ~(DBCR_DAC1R | DBCR_DAC1W);
> +#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
> +		if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE) {
> +			child->thread.debug.dac2 = 0;
> +			child->thread.debug.dbcr2 &= ~DBCR2_DAC12MODE;
> +		}
> +		child->thread.debug.dbcr2 &= ~(DBCR2_DVC1M | DBCR2_DVC1BE);
> +#endif
> +#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
> +		child->thread.debug.dvc1 = 0;
> +#endif
> +	} else if (slot == 2) {
> +		if ((dbcr_dac(child) & (DBCR_DAC2R | DBCR_DAC2W)) == 0)
> +			return -ENOENT;
> +
> +#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
> +		if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE)
> +			/* Part of a range */
> +			return -EINVAL;
> +		child->thread.debug.dbcr2 &= ~(DBCR2_DVC2M | DBCR2_DVC2BE);
> +#endif
> +#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
> +		child->thread.debug.dvc2 = 0;
> +#endif
> +		child->thread.debug.dac2 = 0;
> +		dbcr_dac(child) &= ~(DBCR_DAC2R | DBCR_DAC2W);
> +	} else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
> +static int set_dac_range(struct task_struct *child,
> +			 struct ppc_hw_breakpoint *bp_info)
> +{
> +	int mode = bp_info->addr_mode & PPC_BREAKPOINT_MODE_MASK;
> +
> +	/* We don't allow range watchpoints to be used with DVC */
> +	if (bp_info->condition_mode)
> +		return -EINVAL;
> +
> +	/*
> +	 * Best effort to verify the address range.  The user/supervisor bits
> +	 * prevent trapping in kernel space, but let's fail on an obvious bad
> +	 * range.  The simple test on the mask is not fool-proof, and any
> +	 * exclusive range will spill over into kernel space.
> +	 */
> +	if (bp_info->addr >= TASK_SIZE)
> +		return -EIO;
> +	if (mode == PPC_BREAKPOINT_MODE_MASK) {
> +		/*
> +		 * dac2 is a bitmask.  Don't allow a mask that makes a
> +		 * kernel space address from a valid dac1 value
> +		 */
> +		if (~((unsigned long)bp_info->addr2) >= TASK_SIZE)
> +			return -EIO;
> +	} else {
> +		/*
> +		 * For range breakpoints, addr2 must also be a valid address
> +		 */
> +		if (bp_info->addr2 >= TASK_SIZE)
> +			return -EIO;
> +	}
> +
> +	if (child->thread.debug.dbcr0 &
> +	    (DBCR0_DAC1R | DBCR0_DAC1W | DBCR0_DAC2R | DBCR0_DAC2W))
> +		return -ENOSPC;
> +
> +	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
> +		child->thread.debug.dbcr0 |= (DBCR0_DAC1R | DBCR0_IDM);
> +	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
> +		child->thread.debug.dbcr0 |= (DBCR0_DAC1W | DBCR0_IDM);
> +	child->thread.debug.dac1 = bp_info->addr;
> +	child->thread.debug.dac2 = bp_info->addr2;
> +	if (mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
> +		child->thread.debug.dbcr2  |= DBCR2_DAC12M;
> +	else if (mode == PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
> +		child->thread.debug.dbcr2  |= DBCR2_DAC12MX;
> +	else	/* PPC_BREAKPOINT_MODE_MASK */
> +		child->thread.debug.dbcr2  |= DBCR2_DAC12MM;
> +	child->thread.regs->msr |= MSR_DE;
> +
> +	return 5;
> +}
> +#endif /* CONFIG_PPC_ADV_DEBUG_DAC_RANGE */
> +
> +long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
> +{
> +	if (bp_info->version != 1)
> +		return -ENOTSUPP;
> +	/*
> +	 * Check for invalid flags and combinations
> +	 */
> +	if ((bp_info->trigger_type == 0) ||
> +	    (bp_info->trigger_type & ~(PPC_BREAKPOINT_TRIGGER_EXECUTE |
> +				       PPC_BREAKPOINT_TRIGGER_RW)) ||
> +	    (bp_info->addr_mode & ~PPC_BREAKPOINT_MODE_MASK) ||
> +	    (bp_info->condition_mode &
> +	     ~(PPC_BREAKPOINT_CONDITION_MODE |
> +	       PPC_BREAKPOINT_CONDITION_BE_ALL)))
> +		return -EINVAL;
> +#if CONFIG_PPC_ADV_DEBUG_DVCS == 0
> +	if (bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE)
> +		return -EINVAL;
> +#endif
> +
> +	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_EXECUTE) {
> +		if ((bp_info->trigger_type != PPC_BREAKPOINT_TRIGGER_EXECUTE) ||
> +		    (bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE))
> +			return -EINVAL;
> +		return set_instruction_bp(child, bp_info);
> +	}
> +	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
> +		return set_dac(child, bp_info);
> +
> +#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
> +	return set_dac_range(child, bp_info);
> +#else
> +	return -EINVAL;
> +#endif
> +}
> +
> +long ppc_del_hwdebug(struct task_struct *child, long data)
> +{
> +	int rc;
> +
> +	if (data <= 4)
> +		rc = del_instruction_bp(child, (int)data);
> +	else
> +		rc = del_dac(child, (int)data - 4);
> +
> +	if (!rc) {
> +		if (!DBCR_ACTIVE_EVENTS(child->thread.debug.dbcr0,
> +					child->thread.debug.dbcr1)) {
> +			child->thread.debug.dbcr0 &= ~DBCR0_IDM;
> +			child->thread.regs->msr &= ~MSR_DE;
> +		}
> +	}
> +	return rc;
> +}
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
> index e12f6615fc1d..bdba09a87aea 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
> +++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
> @@ -174,3 +174,8 @@ int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
>  /* ptrace-view */
>  
>  extern const struct user_regset_view user_ppc_native_view;
> +
> +/* ptrace-(no)adv */
> +int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data);
> +long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info);
> +long ppc_del_hwdebug(struct task_struct *child, long data);
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> new file mode 100644
> index 000000000000..7db330c94538
> --- /dev/null
> +++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c

ptrace-noadv.c looks good to me.

