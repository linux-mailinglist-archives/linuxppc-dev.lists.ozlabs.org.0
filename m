Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1B71657F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 16:16:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z1r96S9wzDqJV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 00:16:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z1nH2bkxzDqHq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 00:14:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 44z1nG75bCz8syV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 00:14:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 44z1nG6W0Vz9sBb; Wed,  8 May 2019 00:14:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 44z1nG0SRRz9s9y
 for <linuxppc-dev@ozlabs.org>; Wed,  8 May 2019 00:14:08 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x47E3RVI109171
 for <linuxppc-dev@ozlabs.org>; Tue, 7 May 2019 10:14:05 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sbabmbyqq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 07 May 2019 10:14:05 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Tue, 7 May 2019 15:14:03 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 May 2019 15:14:02 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x47EE0Sq24248506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2019 14:14:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9DEEA4069;
 Tue,  7 May 2019 14:14:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04BFEA4059;
 Tue,  7 May 2019 14:13:59 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.3.43])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  7 May 2019 14:13:58 +0000 (GMT)
Date: Tue, 7 May 2019 19:43:56 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 09/16] powernv/fadump: process architected register
 state data provided by firmware
References: <155541065470.812.7120798773144842076.stgit@hbathini.in.ibm.com>
 <155541089317.812.14447001298006010972.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155541089317.812.14447001298006010972.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19050714-0016-0000-0000-00000279390C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050714-0017-0000-0000-000032D5E359
Message-Id: <20190507141356.saug5kjhntwozu76@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905070092
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-04-16 16:05:06 Tue, Hari Bathini wrote:
> From: Hari Bathini <hbathini@linux.vnet.ibm.com>
> 
> Firmware provides architected register state data at the time of crash.
> Process this data and build CPU notes to append to ELF core.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> ---
> 
> Changes in v2:
> * Updated reg type values according to recent OPAL changes
> 
> 
>  arch/powerpc/include/asm/opal-api.h          |   23 +++
>  arch/powerpc/kernel/fadump-common.h          |    3 
>  arch/powerpc/platforms/powernv/opal-fadump.c |  187 ++++++++++++++++++++++++--
>  arch/powerpc/platforms/powernv/opal-fadump.h |    4 +
>  4 files changed, 206 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 75471c2..91f2735 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -976,6 +976,29 @@ struct opal_sg_list {
>   * Firmware-Assisted Dump (FADump)
>   */
>  
> +/* FADump thread header for register entries */
> +struct opal_fadump_thread_hdr {
> +	__be32  pir;
> +	/* 0x00 - 0x0F - The corresponding stop state of the core */
> +	u8      core_state;
> +	u8      reserved[3];
> +
> +	__be32	offset;	/* Offset to Register Entries array */
> +	__be32	ecnt;	/* Number of entries */
> +	__be32	esize;	/* Alloc size of each array entry in bytes */
> +	__be32	eactsz;	/* Actual size of each array entry in bytes */
> +} __packed;
> +
> +#define OPAL_REG_TYPE_GPR		0x01
> +#define OPAL_REG_TYPE_SPR		0x02
> +
> +/* FADump register entry. */
> +struct opal_fadump_reg_entry {
> +	__be32		reg_type;
> +	__be32		reg_num;
> +	__be64		reg_val;
> +};
> +
>  /* The maximum number of dump sections supported by OPAL */
>  #define OPAL_FADUMP_NR_SECTIONS			64
>  
> diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
> index ff764d4..8d47382 100644
> --- a/arch/powerpc/kernel/fadump-common.h
> +++ b/arch/powerpc/kernel/fadump-common.h
> @@ -117,6 +117,9 @@ struct fadump_memory_range {
>  
>  /* Firmware-assisted dump configuration details. */
>  struct fw_dump {
> +	unsigned long	cpu_state_destination_addr;
> +	unsigned long	cpu_state_data_version;
> +	unsigned long	cpu_state_entry_size;
>  	unsigned long	cpu_state_data_size;
>  	unsigned long	hpte_region_size;
>  	unsigned long	boot_memory_size;
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index da8480d..853f663 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -94,6 +94,12 @@ static void update_fadump_config(struct fw_dump *fadump_conf,
>  
>  				last_end = base + size;
>  				j++;
> +			} else if (fdm->section[i].src_type ==
> +				   OPAL_FADUMP_CPU_STATE_DATA) {
> +				fadump_conf->cpu_state_destination_addr =
> +					be64_to_cpu(fdm->section[i].dest_addr);
> +				fadump_conf->cpu_state_data_size =
> +					be64_to_cpu(fdm->section[i].dest_size);
>  			}
>  		}
>  		fadump_conf->rmr_regions_cnt = j;
> @@ -199,6 +205,75 @@ static int opal_invalidate_fadump(struct fw_dump *fadump_conf)
>  	return 0;
>  }
>  
> +static inline void fadump_set_regval_regnum(struct pt_regs *regs, u32 reg_type,
> +					    u32 reg_num, u64 reg_val)
> +{
> +	if (reg_type == OPAL_REG_TYPE_GPR) {
> +		if (reg_num < 32)
> +			regs->gpr[reg_num] = reg_val;
> +		return;
> +	}
> +
> +	switch (reg_num) {
> +	case 2000:
> +		regs->nip = reg_val;
> +		break;
> +	case 2001:
> +		regs->msr = reg_val;
> +		break;
> +	case 9:
> +		regs->ctr = reg_val;
> +		break;
> +	case 8:
> +		regs->link = reg_val;
> +		break;
> +	case 1:
> +		regs->xer = reg_val;
> +		break;
> +	case 2002:
> +		regs->ccr = reg_val;
> +		break;
> +	case 19:
> +		regs->dar = reg_val;
> +		break;
> +	case 18:
> +		regs->dsisr = reg_val;
> +		break;

Can we use SPRN_* #defines which are already present in asm/reg.h instead of
hard coding numbers for switch cases ? You may want to add new #defines
for NIP, MSR and CCR.

Thanks,
-Mahesh.

