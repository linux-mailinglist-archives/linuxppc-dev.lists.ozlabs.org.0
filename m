Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B9345691
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 05:06:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4HqH4CR1z3bN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 15:06:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=em36av/N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=em36av/N; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Hpn3stbz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 15:05:52 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12N42vWg122883; Tue, 23 Mar 2021 00:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=jwWmbMmk27SPFWQEUWYl1Zlp8N2bmzsUcETwGPC6K2c=;
 b=em36av/NM8PTlmeaaX65HEbXn6tzGImjgBYnHrdZuNaGR4dFIdquzGpvJpwaO+x0aYqp
 Lj7p8X9tZqwyJoVWlGVbDTttE1bVeQvvdnfvQSn0dNxdh8/xziX7C/XTGhNKj8voB/VE
 SxqPObufnHIkwfDo8c58KR4ecFzBTw3s+Kv3x5ZL0KKxnAd2PS/Kyn96rONC5p80K5kR
 c/9uUdt2rllyw+dPIWcqIYOWOeI8LCHFAj2zpPtErQ+PeL8mlCK28qZOKx4zU20xZP/Z
 qTopgEMpdeSiGeeqNQapxMpjpoRlhn+DHJ7VdnbOtJbiAuD+jFyW1Id5+q4xqz/wlpdH 4w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ef8bp361-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 00:05:41 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12N432V7123332;
 Tue, 23 Mar 2021 00:05:41 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ef8bp35m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 00:05:41 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12N43hWA006996;
 Tue, 23 Mar 2021 04:05:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 37d9d8sh0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 04:05:39 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12N45aXH43319750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 04:05:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 458BE11C050;
 Tue, 23 Mar 2021 04:05:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6DA411C04C;
 Tue, 23 Mar 2021 04:05:34 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.87.3])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 04:05:34 +0000 (GMT)
Date: Tue, 23 Mar 2021 09:35:32 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 3/6] KVM: PPC: Book3S HV: Add support for
 H_RPT_INVALIDATE
Message-ID: <20210323040532.GA868309@in.ibm.com>
References: <20210311083939.595568-1-bharata@linux.ibm.com>
 <20210311083939.595568-4-bharata@linux.ibm.com>
 <YFlR8BROYwX0i0A9@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFlR8BROYwX0i0A9@yekko.fritz.box>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-22_12:2021-03-22,
 2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103230025
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
Cc: farosas@linux.ibm.com, aneesh.kumar@linux.ibm.com, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 01:26:56PM +1100, David Gibson wrote:
> On Thu, Mar 11, 2021 at 02:09:36PM +0530, Bharata B Rao wrote:
> > H_RPT_INVALIDATE does two types of TLB invalidations:
> > 
> > 1. Process-scoped invalidations for guests when LPCR[GTSE]=0.
> >    This is currently not used in KVM as GTSE is not usually
> >    disabled in KVM.
> > 2. Partition-scoped invalidations that an L1 hypervisor does on
> >    behalf of an L2 guest. This is currently handled
> >    by H_TLB_INVALIDATE hcall and this new replaces the old that.
> > 
> > This commit enables process-scoped invalidations for L1 guests.
> > Support for process-scoped and partition-scoped invalidations
> > from/for nested guests will be added separately.
> > 
> > Process scoped tlbie invalidations from L1 and nested guests
> > need RS register for TLBIE instruction to contain both PID and
> > LPID.  This patch introduces primitives that execute tlbie
> > instruction with both PID and LPID set in prepartion for
> > H_RPT_INVALIDATE hcall.
> > 
> > A description of H_RPT_INVALIDATE follows:
> > 
> > int64   /* H_Success: Return code on successful completion */
> >         /* H_Busy - repeat the call with the same */
> >         /* H_Parameter, H_P2, H_P3, H_P4, H_P5 : Invalid
> > 	   parameters */
> > hcall(const uint64 H_RPT_INVALIDATE, /* Invalidate RPT
> > 					translation
> > 					lookaside information */
> >       uint64 id,        /* PID/LPID to invalidate */
> >       uint64 target,    /* Invalidation target */
> >       uint64 type,      /* Type of lookaside information */
> >       uint64 pg_sizes,  /* Page sizes */
> >       uint64 start,     /* Start of Effective Address (EA)
> > 			   range (inclusive) */
> >       uint64 end)       /* End of EA range (exclusive) */
> > 
> > Invalidation targets (target)
> > -----------------------------
> > Core MMU        0x01 /* All virtual processors in the
> > 			partition */
> > Core local MMU  0x02 /* Current virtual processor */
> > Nest MMU        0x04 /* All nest/accelerator agents
> > 			in use by the partition */
> > 
> > A combination of the above can be specified,
> > except core and core local.
> > 
> > Type of translation to invalidate (type)
> > ---------------------------------------
> > NESTED       0x0001  /* invalidate nested guest partition-scope */
> > TLB          0x0002  /* Invalidate TLB */
> > PWC          0x0004  /* Invalidate Page Walk Cache */
> > PRT          0x0008  /* Invalidate caching of Process Table
> > 			Entries if NESTED is clear */
> > PAT          0x0008  /* Invalidate caching of Partition Table
> > 			Entries if NESTED is set */
> > 
> > A combination of the above can be specified.
> > 
> > Page size mask (pages)
> > ----------------------
> > 4K              0x01
> > 64K             0x02
> > 2M              0x04
> > 1G              0x08
> > All sizes       (-1UL)
> > 
> > A combination of the above can be specified.
> > All page sizes can be selected with -1.
> > 
> > Semantics: Invalidate radix tree lookaside information
> >            matching the parameters given.
> > * Return H_P2, H_P3 or H_P4 if target, type, or pageSizes parameters
> >   are different from the defined values.
> > * Return H_PARAMETER if NESTED is set and pid is not a valid nested
> >   LPID allocated to this partition
> > * Return H_P5 if (start, end) doesn't form a valid range. Start and
> >   end should be a valid Quadrant address and  end > start.
> > * Return H_NotSupported if the partition is not in running in radix
> >   translation mode.
> > * May invalidate more translation information than requested.
> > * If start = 0 and end = -1, set the range to cover all valid
> >   addresses. Else start and end should be aligned to 4kB (lower 11
> >   bits clear).
> > * If NESTED is clear, then invalidate process scoped lookaside
> >   information. Else pid specifies a nested LPID, and the invalidation
> >   is performed   on nested guest partition table and nested guest
> >   partition scope real addresses.
> > * If pid = 0 and NESTED is clear, then valid addresses are quadrant 3
> >   and quadrant 0 spaces, Else valid addresses are quadrant 0.
> > * Pages which are fully covered by the range are to be invalidated.
> >   Those which are partially covered are considered outside
> >   invalidation range, which allows a caller to optimally invalidate
> >   ranges that may   contain mixed page sizes.
> > * Return H_SUCCESS on success.
> > 
> > Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> with the exception of one nit noted below.
> 
> > ---
> >  .../include/asm/book3s/64/tlbflush-radix.h    |   4 +
> >  arch/powerpc/include/asm/mmu_context.h        |  11 ++
> >  arch/powerpc/kvm/book3s_hv.c                  |  46 ++++++
> >  arch/powerpc/mm/book3s64/radix_tlb.c          | 152 +++++++++++++++++-
> >  4 files changed, 209 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > index 8b33601cdb9d..a46fd37ad552 100644
> > --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> > @@ -4,6 +4,10 @@
> >  
> >  #include <asm/hvcall.h>
> >  
> > +#define RIC_FLUSH_TLB 0
> > +#define RIC_FLUSH_PWC 1
> > +#define RIC_FLUSH_ALL 2
> 
> Is there a reason for moving these?  You don't appear to be adding a
> use of them outside the .c file they were in before.

They are used in arch/powerpc/kvm/book3s_hv_nested.c. It was all in the
same patchset earlier, but during reorgazing the hcall into 3 separate patches,
this change remained here. May be I should move this change to the next patch
where it is used.

Thanks for your review.

Regards,
Bharata.
