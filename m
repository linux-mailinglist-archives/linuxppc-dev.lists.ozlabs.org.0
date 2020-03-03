Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800217865F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 00:33:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XCxd33yjzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 10:33:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XCw106bpzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 10:32:00 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023NT9C9037510
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 18:31:57 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhukkjgtp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 18:31:57 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Tue, 3 Mar 2020 23:31:55 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 23:31:53 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 023NVqaQ53149774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 23:31:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D09311C052;
 Tue,  3 Mar 2020 23:31:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAA0A11C050;
 Tue,  3 Mar 2020 23:31:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Mar 2020 23:31:51 +0000 (GMT)
Received: from townsend.localnet (unknown [9.102.32.146])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 834C4A023A;
 Wed,  4 Mar 2020 10:31:46 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v3 02/14] powerpc: Define new SRR1 bits for a future ISA
 version
Date: Wed, 04 Mar 2020 10:31:49 +1100
In-Reply-To: <20200226040716.32395-3-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-3-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 20030323-0012-0000-0000-0000038CE934
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030323-0013-0000-0000-000021C9A169
Message-Id: <1654497.DKOrHs3RfR@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_08:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 mlxlogscore=525 bulkscore=0 suspectscore=1
 clxscore=1034 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003030154
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
Cc: dja@axtens.net, linuxppc-dev@lists.ozlabs.org, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wednesday, 26 February 2020 3:07:04 PM AEDT Jordan Niethe wrote:
> Add the BOUNDARY SRR1 bit definition for when the cause of an alignment
> exception is a prefixed instruction that crosses a 64-byte boundary.
> Add the PREFIXED SRR1 bit definition for exceptions caused by prefixed
> instructions.
> 
> Bit 35 of SRR1 is called SRR1_ISI_N_OR_G. This name comes from it being
> used to indicate that an ISI was due to the access being no-exec or
> guarded. A future ISA version adds another purpose. It is also set if
> there is an access in a cache-inhibited location for prefixed
> instruction.  Rename from SRR1_ISI_N_OR_G to SRR1_ISI_N_G_OR_CIP.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Confirmed the definitions here match the specifications so:

Reviewed-by: Alistair Popple <alistair@popple.id.au>

> ---
> v2: Combined all the commits concerning SRR1 bits.
> ---
>  arch/powerpc/include/asm/reg.h      | 4 +++-
>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index c7758c2ccc5f..173f33df4fab 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -762,7 +762,7 @@
>  #endif
> 
>  #define   SRR1_ISI_NOPT		0x40000000 /* ISI: Not found in hash */
> -#define   SRR1_ISI_N_OR_G	0x10000000 /* ISI: Access is no-exec or G */
> +#define   SRR1_ISI_N_G_OR_CIP	0x10000000 /* ISI: Access is no-exec or G or
> CI for a prefixed instruction */ #define   SRR1_ISI_PROT		0x08000000 /*
> ISI: Other protection fault */ #define   SRR1_WAKEMASK		0x00380000 /*
> reason for wakeup */
>  #define   SRR1_WAKEMASK_P8	0x003c0000 /* reason for wakeup on POWER8 and 9
> */ @@ -789,6 +789,8 @@
>  #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
> 
>  #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused 
interrupt
> */ +#define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses
> 64-byte boundary */ +#define   SRR1_PREFIXED		0x20000000 /* Exception
> caused by prefixed instruction */
> 
>  #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
>  #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c
> b/arch/powerpc/kvm/book3s_hv_nested.c index dc97e5be76f6..6ab685227574
> 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -1169,7 +1169,7 @@ static int kvmhv_translate_addr_nested(struct kvm_vcpu
> *vcpu, } else if (vcpu->arch.trap == BOOK3S_INTERRUPT_H_INST_STORAGE) { /*
> Can we execute? */
>  			if (!gpte_p->may_execute) {
> -				flags |= SRR1_ISI_N_OR_G;
> +				flags |= SRR1_ISI_N_G_OR_CIP;
>  				goto forward_to_l1;
>  			}
>  		} else {
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> b/arch/powerpc/kvm/book3s_hv_rm_mmu.c index 220305454c23..b53a9f1c1a46
> 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -1260,7 +1260,7 @@ long kvmppc_hpte_hv_fault(struct kvm_vcpu *vcpu,
> unsigned long addr, status &= ~DSISR_NOHPTE;	/* DSISR_NOHPTE ==
> SRR1_ISI_NOPT */
>  	if (!data) {
>  		if (gr & (HPTE_R_N | HPTE_R_G))
> -			return status | SRR1_ISI_N_OR_G;
> +			return status | SRR1_ISI_N_G_OR_CIP;
>  		if (!hpte_read_permission(pp, slb_v & key))
>  			return status | SRR1_ISI_PROT;
>  	} else if (status & DSISR_ISSTORE) {




