Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B837C22E48F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:51:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFQpP4CCLzDrqd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 13:51:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFQm432GrzDrDl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 13:49:24 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R3ZJqk118682; Sun, 26 Jul 2020 23:49:16 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ggw46jja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 23:49:16 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06R3f2vv032289;
 Mon, 27 Jul 2020 03:49:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4hrg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 03:49:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06R3lkd165405284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 03:47:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CF48A4054;
 Mon, 27 Jul 2020 03:49:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C91DA4066;
 Mon, 27 Jul 2020 03:49:08 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.81.241])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Jul 2020 03:49:07 +0000 (GMT)
Date: Mon, 27 Jul 2020 09:19:05 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: rework secure mem slot dropping
Message-ID: <20200727034905.GF1082478@in.ibm.com>
References: <20200724030337.GC1082478@in.ibm.com>
 <20200724083527.28027-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724083527.28027-1-ldufour@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_02:2020-07-24,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=486
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=1 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270021
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
Cc: aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com, cclaudio@linux.ibm.com,
 kvm-ppc@vger.kernel.org, sathnaga@linux.vnet.ibm.com, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 24, 2020 at 10:35:27AM +0200, Laurent Dufour wrote:
> When a secure memslot is dropped, all the pages backed in the secure
> device (aka really backed by secure memory by the Ultravisor)
> should be paged out to a normal page. Previously, this was
> achieved by triggering the page fault mechanism which is calling
> kvmppc_svm_page_out() on each pages.
> 
> This can't work when hot unplugging a memory slot because the memory
> slot is flagged as invalid and gfn_to_pfn() is then not trying to access
> the page, so the page fault mechanism is not triggered.
> 
> Since the final goal is to make a call to kvmppc_svm_page_out() it seems
> simpler to call directly instead of triggering such a mechanism. This
> way kvmppc_uvmem_drop_pages() can be called even when hot unplugging a
> memslot.
> 
> Since kvmppc_uvmem_drop_pages() is already holding kvm->arch.uvmem_lock,
> the call to __kvmppc_svm_page_out() is made.  As
> __kvmppc_svm_page_out needs the vma pointer to migrate the pages,
> the VMA is fetched in a lazy way, to not trigger find_vma() all
> the time. In addition, the mmap_sem is held in read mode during
> that time, not in write mode since the virual memory layout is not
> impacted, and kvm->arch.uvmem_lock prevents concurrent operation
> on the secure device.
> 
> Cc: Ram Pai <linuxram@us.ibm.com>
> Cc: Bharata B Rao <bharata@linux.ibm.com>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> 	[modified the changelog description]
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>         [modified check on the VMA in kvmppc_uvmem_drop_pages]

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

Regards,
Bharata.
