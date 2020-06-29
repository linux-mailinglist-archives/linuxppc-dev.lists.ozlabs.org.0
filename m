Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320820CB95
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 03:55:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49w9YL1VSvzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 11:55:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49w9Wg5ZFnzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 11:53:51 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05T1XOLB049325; Sun, 28 Jun 2020 21:53:42 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31x26s8e81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jun 2020 21:53:41 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05T1poXX031168;
 Mon, 29 Jun 2020 01:53:39 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch1nqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jun 2020 01:53:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05T1raFw1442164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Jun 2020 01:53:36 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4CF552052;
 Mon, 29 Jun 2020 01:53:36 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.73.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 881845204E;
 Mon, 29 Jun 2020 01:53:33 +0000 (GMT)
Date: Mon, 29 Jun 2020 07:23:30 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [PATCH v3 0/4] Migrate non-migrated pages of a SVM.
Message-ID: <20200629015330.GC27215@in.ibm.com>
References: <1592606622-29884-1-git-send-email-linuxram@us.ibm.com>
 <20200628161149.GA27215@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200628161149.GA27215@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-28_11:2020-06-26,
 2020-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 cotscore=-2147483648 bulkscore=0 phishscore=0 suspectscore=1 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006290009
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
Cc: ldufour@linux.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 sathnaga@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jun 28, 2020 at 09:41:53PM +0530, Bharata B Rao wrote:
> On Fri, Jun 19, 2020 at 03:43:38PM -0700, Ram Pai wrote:
> > The time taken to switch a VM to Secure-VM, increases by the size of the VM.  A
> > 100GB VM takes about 7minutes. This is unacceptable.  This linear increase is
> > caused by a suboptimal behavior by the Ultravisor and the Hypervisor.  The
> > Ultravisor unnecessarily migrates all the GFN of the VM from normal-memory to
> > secure-memory. It has to just migrate the necessary and sufficient GFNs.
> > 
> > However when the optimization is incorporated in the Ultravisor, the Hypervisor
> > starts misbehaving. The Hypervisor has a inbuilt assumption that the Ultravisor
> > will explicitly request to migrate, each and every GFN of the VM. If only
> > necessary and sufficient GFNs are requested for migration, the Hypervisor
> > continues to manage the remaining GFNs as normal GFNs. This leads of memory
> > corruption, manifested consistently when the SVM reboots.
> > 
> > The same is true, when a memory slot is hotplugged into a SVM. The Hypervisor
> > expects the ultravisor to request migration of all GFNs to secure-GFN.  But at
> > the same time, the hypervisor is unable to handle any H_SVM_PAGE_IN requests
> > from the Ultravisor, done in the context of UV_REGISTER_MEM_SLOT ucall.  This
> > problem manifests as random errors in the SVM, when a memory-slot is
> > hotplugged.
> > 
> > This patch series automatically migrates the non-migrated pages of a SVM,
> >      and thus solves the problem.
> 
> So this is what I understand as the objective of this patchset:
> 
> 1. Getting all the pages into the secure memory right when the guest
>    transitions into secure mode is expensive. Ultravisor wants to just get
>    the necessary and sufficient pages in and put the onus on the Hypervisor
>    to mark the remaining pages (w/o actual page-in) as secure during
>    H_SVM_INIT_DONE.
> 2. During H_SVM_INIT_DONE, you want a way to differentiate the pages that
>    are already secure from the pages that are shared and that are paged-out.
>    For this you are introducing all these new states in HV.
> 
> UV knows about the shared GFNs and maintains the state of the same. Hence
> let HV send all the pages (minus already secured pages) via H_SVM_PAGE_IN
> and if UV finds any shared pages in them, let it fail the uv-page-in call.
> Then HV can fail the migration for it  and the page continues to remain
> shared. With this, you don't need to maintain a state for secured GFN in HV.
> 
> In the unlikely case of sending a paged-out page to UV during
> H_SVM_INIT_DONE, let the page-in succeed and HV will fault on it again
> if required. With this, you don't need a state in HV to identify a
> paged-out-but-encrypted state.
> 
> Doesn't the above work?

I see that you want to infact skip the uv-page-in calls from H_SVM_INIT_DONE.
So that would need the extra states in HV which you are proposing here.

Regards,
Bharata.
