Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D301022E73C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 10:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFXPF6n59zF1KC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 18:03:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFX6d6MzSzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:50:49 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R7YPFH143012; Mon, 27 Jul 2020 03:50:41 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hs1bk5mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:50:41 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R7gGRL021364;
 Mon, 27 Jul 2020 07:50:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 32gcye964w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:50:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06R7oZsW24052162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 07:50:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D46CD11C050;
 Mon, 27 Jul 2020 07:50:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B81E11C058;
 Mon, 27 Jul 2020 07:50:35 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.68.234])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Jul 2020 07:50:34 +0000 (GMT)
Date: Mon, 27 Jul 2020 13:20:32 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/book3s64/radix: Add kernel command line option
 to disable radix GTSE
Message-ID: <20200727075032.GI1082478@in.ibm.com>
References: <20200724075600.317640-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724075600.317640-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_04:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=1 impostorscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270053
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 01:26:00PM +0530, Aneesh Kumar K.V wrote:
> This adds a kernel command line option that can be used to disable GTSE support.
> Disabling GTSE implies kernel will make hcalls to invalidate TLB entries.
> 
> This was done so that we can do VM migration between configs that enable/disable
> GTSE support via hypervisor. To migrate a VM from a system that supports
> GTSE to a system that doesn't, we can boot the guest with radix_gtse=off, thereby
> forcing the guest to use hcalls for TLB invalidates.
> 
> The check for hcall availability is done in pSeries_setup_arch so that
> the panic message appears on the console. This should only happen on
> a hypervisor that doesn't force the guest to hash translation even
> though it can't handle the radix GTSE=0 request via CAS. With radix_gtse=off
> if the hypervisor doesn't support hcall_rpt_invalidate hcall it should
> force the LPAR to hash translation.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  3 +++
>  arch/powerpc/include/asm/firmware.h             |  4 +++-
>  arch/powerpc/kernel/prom_init.c                 | 13 +++++++++----
>  arch/powerpc/platforms/pseries/firmware.c       |  1 +
>  arch/powerpc/platforms/pseries/setup.c          |  5 +++++
>  5 files changed, 21 insertions(+), 5 deletions(-)
 
Tested

1. radix_gtse=off with KVM implementation of H_RPT_INVALIDATE hcall, the
   tlb flush calls get off-loaded to hcalls.
2. radix_gtse=off w/o H_RPT_INVALIDATE hcall, the guest kernel panics
   as per design.

However in both cases, the guest kernel prints out
"WARNING: Hypervisor doesn't support RADIX with GTSE" which can be a bit
confusing in case 1 as GTSE has disabled by the guest and hypervisor is
capable of supporting the same via hcall.

Regards,
Bharata.
