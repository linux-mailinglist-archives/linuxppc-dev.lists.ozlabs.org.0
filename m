Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B942C21FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 10:46:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgK156S7szDqQf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 20:46:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rB7ybnh0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgJyW5X3fzDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 20:44:29 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AO9X5dU144025; Tue, 24 Nov 2020 04:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=1vZhDxrI0UH7+tnSnDGhw+6VjE+lwO1okY22M3IqcgU=;
 b=rB7ybnh0/GiVIvl+NDmTcMPKqhQROD1uaENqmgNk2U0arcAw+uHYAalB6PuT7XyiU8h7
 CsS/sPWUC++KP2ZnlkNrL5WCIK+4wyg/gyIUtCbizZukEgm+R3W07OImgnPgio24hSC5
 V/c2waixGOKq1HpKfnauw/e6Pz0UhRn3aZyrO1et1ufSw6OvhWA7QfV2XqAiXR0vq/c5
 +EZfKhjv3qxSDZewkY8+gb2Z/NSprKiyCXWKnYn0DcvdWJky6wx5sXIORnOF2rnzGHo5
 BZjcd2ydLFMA9PNOxIYWurV6tbZzQ52MAFZAfJb8pHyrWqy7QLFEA+Lr7rLUZXJjUmfH nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350rb0wduq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 04:44:21 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AO9XC9Y144581;
 Tue, 24 Nov 2020 04:44:20 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350rb0wdtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 04:44:20 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AO9X29h016220;
 Tue, 24 Nov 2020 09:44:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 34y6k4sh6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 09:44:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AO9iFOM63439202
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 09:44:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC289A4054;
 Tue, 24 Nov 2020 09:44:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0389FA4065;
 Tue, 24 Nov 2020 09:44:14 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.46.179])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 24 Nov 2020 09:44:13 +0000 (GMT)
Date: Tue, 24 Nov 2020 15:14:11 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 0/2] Use H_RPT_INVALIDATE for nested guest
Message-ID: <20201124094411.GA72234@in.ibm.com>
References: <20201019112642.53016-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201019112642.53016-1-bharata@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_03:2020-11-24,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240056
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
Reply-To: bharata@linux.ibm.com
Cc: aneesh.kumar@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Any comments on this patchset? Anything specific to be addressed
before it could be considered for inclusion?

Regards,
Bharata.

On Mon, Oct 19, 2020 at 04:56:40PM +0530, Bharata B Rao wrote:
> This patchset adds support for the new hcall H_RPT_INVALIDATE
> (currently handles nested case only) and replaces the nested tlb flush
> calls with this new hcall if the support for the same exists.
> 
> Changes in v1:
> -------------
> - Removed the bits that added the FW_FEATURE_RPT_INVALIDATE feature
>   as they are already upstream.
> 
> v0: https://lore.kernel.org/linuxppc-dev/20200703104420.21349-1-bharata@linux.ibm.com/T/#m1800c5f5b3d4f6a154ae58fc1c617c06f286358f
> 
> H_RPT_INVALIDATE
> ================
> Syntax:
> int64   /* H_Success: Return code on successful completion */
>         /* H_Busy - repeat the call with the same */
>         /* H_Parameter, H_P2, H_P3, H_P4, H_P5 : Invalid parameters */
>         hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate RPT translation lookaside information */
>               uint64 pid,       /* PID/LPID to invalidate */
>               uint64 target,    /* Invalidation target */
>               uint64 type,      /* Type of lookaside information */
>               uint64 pageSizes,     /* Page sizes */
>               uint64 start,     /* Start of Effective Address (EA) range (inclusive) */
>               uint64 end)       /* End of EA range (exclusive) */
> 
> Invalidation targets (target)
> -----------------------------
> Core MMU        0x01 /* All virtual processors in the partition */
> Core local MMU  0x02 /* Current virtual processor */
> Nest MMU        0x04 /* All nest/accelerator agents in use by the partition */
> 
> A combination of the above can be specified, except core and core local.
> 
> Type of translation to invalidate (type)
> ---------------------------------------
> NESTED       0x0001  /* Invalidate nested guest partition-scope */
> TLB          0x0002  /* Invalidate TLB */
> PWC          0x0004  /* Invalidate Page Walk Cache */
> PRT          0x0008  /* Invalidate Process Table Entries if NESTED is clear */
> PAT          0x0008  /* Invalidate Partition Table Entries if NESTED is set */
> 
> A combination of the above can be specified.
> 
> Page size mask (pageSizes)
> --------------------------
> 4K              0x01
> 64K             0x02
> 2M              0x04
> 1G              0x08
> All sizes       (-1UL)
> 
> A combination of the above can be specified.
> All page sizes can be selected with -1.
> 
> Semantics: Invalidate radix tree lookaside information
>            matching the parameters given.
> * Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters are
>   different from the defined values.
> * Return H_PARAMETER if NESTED is set and pid is not a valid nested
>   LPID allocated to this partition
> * Return H_P5 if (start, end) doesn't form a valid range. Start and end
>   should be a valid Quadrant address and  end > start.
> * Return H_NotSupported if the partition is not in running in radix
>   translation mode.
> * May invalidate more translation information than requested.
> * If start = 0 and end = -1, set the range to cover all valid addresses.
>   Else start and end should be aligned to 4kB (lower 11 bits clear).
> * If NESTED is clear, then invalidate process scoped lookaside information.
>   Else pid specifies a nested LPID, and the invalidation is performed
>   on nested guest partition table and nested guest partition scope real
>   addresses.
> * If pid = 0 and NESTED is clear, then valid addresses are quadrant 3 and
>   quadrant 0 spaces, Else valid addresses are quadrant 0.
> * Pages which are fully covered by the range are to be invalidated.
>   Those which are partially covered are considered outside invalidation
>   range, which allows a caller to optimally invalidate ranges that may
>   contain mixed page sizes.
> * Return H_SUCCESS on success.
> 
> Bharata B Rao (2):
>   KVM: PPC: Book3S HV: Add support for H_RPT_INVALIDATE (nested case
>     only)
>   KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in nested KVM
> 
>  Documentation/virt/kvm/api.rst                |  17 +++
>  .../include/asm/book3s/64/tlbflush-radix.h    |  18 +++
>  arch/powerpc/include/asm/kvm_book3s.h         |   3 +
>  arch/powerpc/kvm/book3s_64_mmu_radix.c        |  26 ++++-
>  arch/powerpc/kvm/book3s_hv.c                  |  32 ++++++
>  arch/powerpc/kvm/book3s_hv_nested.c           | 107 +++++++++++++++++-
>  arch/powerpc/kvm/powerpc.c                    |   3 +
>  arch/powerpc/mm/book3s64/radix_tlb.c          |   4 -
>  include/uapi/linux/kvm.h                      |   1 +
>  9 files changed, 200 insertions(+), 11 deletions(-)
> 
> -- 
> 2.26.2
