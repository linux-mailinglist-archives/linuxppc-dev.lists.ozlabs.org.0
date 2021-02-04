Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2730EC97
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 07:43:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWTXB4Zz4zDwsC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:43:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HCzgH6hV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWTVC2fPjzDs09
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 17:41:38 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1146WeUo088005; Thu, 4 Feb 2021 01:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=3jyta3jfJyDL/+MUYcU+yY3JtjlP3V4l4M9GAfV0dsU=;
 b=HCzgH6hVB27HQ0hc3KvTP6LQRbkna0PIRiUJ2Rm2ktOLOU0CM+3iRCGd49zdvqPQ/qWN
 blqTQ9mblnGBIAGqHlrhnL2eqmChdvAj/I146x71s1AiIcei8SmLyiBDNvzZWgVq7Iz7
 WAFAwVWXLcUoLkmsebUWF9viW87KB9ffb57q+/b0qmqqfhHrk1LO2Weyijpd4hWrZoia
 z1ITPvz/zfCxssAAXrNzmONzNK5CV58COIbyViBI/Vuq/2eQ8N9Mne0uoA2lq1w2JaYj
 NpWTARH6JPhr7PYhQ/6hVWXXMRIDZuiKUx5JeMtufXh3OQ1966pOc27JhAZR1sTqq+ta vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gbqp8a9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 01:41:29 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1146YW8b101087;
 Thu, 4 Feb 2021 01:41:29 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gbqp8a8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 01:41:29 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1146bsK6023765;
 Thu, 4 Feb 2021 06:41:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 36cy382dey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 06:41:27 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1146fOiP35914128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 06:41:24 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71D0242041;
 Thu,  4 Feb 2021 06:41:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB8BF42045;
 Thu,  4 Feb 2021 06:41:23 +0000 (GMT)
Received: from localhost (unknown [9.85.87.37])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 06:41:23 +0000 (GMT)
Date: Thu, 4 Feb 2021 12:11:22 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v2] powerpc/64s: Fix pte update for kernel memory on radix
Message-ID: <20210204064122.GF210@DESKTOP-TDPLP67.localdomain>
References: <20210203235907.961243-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203235907.961243-1-jniethe5@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_02:2021-02-03,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=691 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040036
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jordan,

On 2021/02/04 10:59AM, Jordan Niethe wrote:
> When adding a pte a ptesync is needed to order the update of the pte
> with subsequent accesses otherwise a spurious fault may be raised.
> 
> radix__set_pte_at() does not do this for performance gains. For
> non-kernel memory this is not an issue as any faults of this kind are
> corrected by the page fault handler.  For kernel memory these faults are
> not handled.  The current solution is that there is a ptesync in
> flush_cache_vmap() which should be called when mapping from the vmalloc
> region.
> 
> However, map_kernel_page() does not call flush_cache_vmap(). This is
> troublesome in particular for code patching with Strict RWX on radix. In
> do_patch_instruction() the page frame that contains the instruction to
> be patched is mapped and then immediately patched. With no ordering or
> synchronization between setting up the pte and writing to the page it is
> possible for faults.
> 
> As the code patching is done using __put_user_asm_goto() the resulting
> fault is obscured - but using a normal store instead it can be seen:
> 
> [  418.498768][  T757] BUG: Unable to handle kernel data access on write at 0xc008000008f24a3c
> [  418.498790][  T757] Faulting instruction address: 0xc00000000008bd74
> [  418.498805][  T757] Oops: Kernel access of bad area, sig: 11 [#1]
> [  418.498828][  T757] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> [  418.498843][  T757] Modules linked in: nop_module(PO+) [last unloaded: nop_module]
> [  418.498872][  T757] CPU: 4 PID: 757 Comm: sh Tainted: P           O      5.10.0-rc5-01361-ge3c1b78c8440-dirty #43
> [  418.498936][  T757] NIP:  c00000000008bd74 LR: c00000000008bd50 CTR: c000000000025810
> [  418.498979][  T757] REGS: c000000016f634a0 TRAP: 0300   Tainted: P           O       (5.10.0-rc5-01361-ge3c1b78c8440-dirty)
> [  418.499033][  T757] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44002884  XER: 00000000
> [  418.499084][  T757] CFAR: c00000000007c68c DAR: c008000008f24a3c DSISR: 42000000 IRQMASK: 1
> 
> This results in the kind of issue reported here:
> https://lore.kernel.org/linuxppc-dev/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw/
> 

Thanks for fixing this!

- Naveen

