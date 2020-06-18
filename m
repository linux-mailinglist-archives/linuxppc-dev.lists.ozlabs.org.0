Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD71FFCAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:40:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nv2J5BcWzDr8D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 06:40:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ntzm3mbDzDr8D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 06:37:56 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IKWJjo038864; Thu, 18 Jun 2020 16:37:46 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r6d0q8j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 16:37:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IKVlEV016429;
 Thu, 18 Jun 2020 20:37:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 31quax9npy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 20:37:44 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05IKbedF43712598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 20:37:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 612814C04E;
 Thu, 18 Jun 2020 20:37:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 413A44C040;
 Thu, 18 Jun 2020 20:37:37 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.211.71.42])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 18 Jun 2020 20:37:37 +0000 (GMT)
Date: Thu, 18 Jun 2020 13:37:34 -0700
From: Ram Pai <linuxram@us.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/4] Migrate non-migrated pages of a SVM.
Message-ID: <20200618203734.GA6772@oc0525413822.ibm.com>
References: <1592471945-24786-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592471945-24786-1-git-send-email-linuxram@us.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_15:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 cotscore=-2147483648 spamscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180152
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, bharata@linux.ibm.com,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I should have elaborated on the problem and the need for these patches.

Explaining it here. Will add it to the series in next version.

-------------------------------------------------------------

The time taken to switch a VM to Secure-VM, increases by the size of
the VM.  A 100GB VM takes about 7minutes. This is unacceptable.  This
linear increase is caused by a suboptimal behavior by the Ultravisor and
the Hypervisor.  The Ultravisor unnecessarily migrates all the GFN of
the VM from normal-memory to secure-memory. It has to just migrate the
necessary and sufficient GFNs.

However when the optimization is incorporated in the Ultravisor, the
Hypervisor starts misbehaving. The Hypervisor has a inbuilt assumption
that the Ultravisor will explicitly request to migrate, each and every
GFN of the VM. If only necessary and sufficient GFNs are requested for
migration, the Hypervisor continues to manage the rest of the GFNs are
normal GFNs. This leads of memory corruption, manifested consistently
when the SVM reboots.

The same is true, when a memory slot is hotplugged into a SVM. The
Hypervisor expects the ultravisor to request migration of all GFNs to
secure-GFN.  But at the same time the hypervisor is unable to handle any
H_SVM_PAGE_IN requests from the Ultravisor, done in the context of
UV_REGISTER_MEM_SLOT ucall.  This problem manifests as random errors in
the SVM, when a memory-slot is hotplugged.

This patch series automatically migrates the non-migrated pages of a SVM,
and thus solves the problem.

------------------------------------------------------------------



On Thu, Jun 18, 2020 at 02:19:01AM -0700, Ram Pai wrote:
> This patch series migrates the non-migrated pages of a SVM.
> This is required when the UV calls H_SVM_INIT_DONE, and
> when a memory-slot is hotplugged to a Secure VM.
> 
> Testing: Passed rigorous SVM reboot test using different
> 	sized SVMs.
> 
> Changelog:
> 	. fixed a bug observed by Bharata. Pages that
> 	where paged-in and later paged-out must also be
> 	skipped from migration during H_SVM_INIT_DONE.
> 
> Laurent Dufour (1):
>   KVM: PPC: Book3S HV: migrate hot plugged memory
> 
> Ram Pai (3):
>   KVM: PPC: Book3S HV: Fix function definition in book3s_hv_uvmem.c
>   KVM: PPC: Book3S HV: track the state GFNs associated with secure VMs
>   KVM: PPC: Book3S HV: migrate remaining normal-GFNs to secure-GFNs in
>     H_SVM_INIT_DONE
> 
>  Documentation/powerpc/ultravisor.rst        |   2 +
>  arch/powerpc/include/asm/kvm_book3s_uvmem.h |   8 +-
>  arch/powerpc/kvm/book3s_64_mmu_radix.c      |   2 +-
>  arch/powerpc/kvm/book3s_hv.c                |  12 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c          | 449 ++++++++++++++++++++++------
>  5 files changed, 368 insertions(+), 105 deletions(-)
> 
> -- 
> 1.8.3.1

-- 
Ram Pai
