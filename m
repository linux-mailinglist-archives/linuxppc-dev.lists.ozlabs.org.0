Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F2177CBB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 18:04:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X3JT17cLzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 04:04:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X3GQ17pHzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 04:02:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023GoXmq008544
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 12:02:19 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmu5e4xq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 12:02:18 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Tue, 3 Mar 2020 17:02:17 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 17:02:13 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 023H1Dv340042968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 17:01:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ED2611C054;
 Tue,  3 Mar 2020 17:02:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D611E11C04A;
 Tue,  3 Mar 2020 17:02:08 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.197.107])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  3 Mar 2020 17:02:08 +0000 (GMT)
Date: Tue, 3 Mar 2020 09:02:05 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20030317-0028-0000-0000-000003E08E03
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030317-0029-0000-0000-000024A5BB26
Message-Id: <20200303170205.GA5416@oc0525413822.ibm.com>
Subject: RE: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_05:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030116
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 03, 2020 at 07:50:08AM +0100, Cédric Le Goater wrote:
> On 3/3/20 12:32 AM, David Gibson wrote:
> > On Fri, Feb 28, 2020 at 11:54:04PM -0800, Ram Pai wrote:
> >> XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.
> >>
> >> Hence Secure VM, must always default to XICS interrupt controller.
> >>
> >> If XIVE is requested through kernel command line option "xive=on",
> >> override and turn it off.
> >>
> >> If XIVE is the only supported platform interrupt controller; specified
> >> through qemu option "ic-mode=xive", simply abort. Otherwise default to
> >> XICS.
> > 
> > Uh... the discussion thread here seems to have gotten oddly off
> > track.  
> 
> There seem to be multiple issues. It is difficult to have a clear status.
> 
> > So, to try to clean up some misunderstandings on both sides:
> > 
> >   1) The guest is the main thing that knows that it will be in secure
> >      mode, so it's reasonable for it to conditionally use XIVE based
> >      on that
> 
> FW support is required AFAIUI.
> >   2) The mechanism by which we do it here isn't quite right.  Here the
> >      guest is checking itself that the host only allows XIVE, but we
> >      can't do XIVE and is panic()ing.  Instead, in the SVM case we
> >      should force support->xive to false, and send that in the CAS
> >      request to the host.  We expect the host to just terminate
> >      us because of the mismatch, but this will interact better with
> >      host side options setting policy for panic states and the like.
> >      Essentially an SVM kernel should behave like an old kernel with
> >      no XIVE support at all, at least w.r.t. the CAS irq mode flags.
> 
> Yes. XIVE shouldn't be requested by the guest.

	Ok.

> This is the last option 
> I proposed but I thought there was some negotiation with the hypervisor
> which is not the case. 
> 
> >   3) Although there are means by which the hypervisor can kind of know
> >      a guest is in secure mode, there's not really an "svm=on" option
> >      on the host side.  For the most part secure mode is based on
> >      discussion directly between the guest and the ultravisor with
> >      almost no hypervisor intervention.
> 
> Is there a negotiation with the ultravisor ? 

	The VM has no negotiation with the ultravisor w.r.t CAS.

> 
> >   4) I'm guessing the problem with XIVE in SVM mode is that XIVE needs
> >      to write to event queues in guest memory, which would have to be
> >      explicitly shared for secure mode.  That's true whether it's KVM
> >      or qemu accessing the guest memory, so kernel_irqchip=on/off is
> >      entirely irrelevant.
> 
> This problem should be already fixed.
> The XIVE event queues are shared 
 	
Yes i have a patch for the guest kernel that shares the event 
queue page with the hypervisor. This is done using the
UV_SHARE_PAGE ultracall. This patch is not sent out to any any mailing
lists yet. However the patch by itself does not solve the xive problem
for secure VM.

> and the remaining problem with XIVE is the KVM page fault handler 
> populating the TIMA and ESB pages. Ultravisor doesn't seem to support
> this feature and this breaks interrupt management in the guest. 

Yes. This is the bigger issue that needs to be fixed. When the secure guest
accesses the page associated with the xive memslot, a page fault is
generated, which the ultravisor reflects to the hypervisor. Hypervisor
seems to be mapping Hardware-page to that GPA. Unforatunately it is not
informing the ultravisor of that map.  I am trying to understand the
root cause. But since I am not sure what more issues I might run into
after chasing down that issue, I figured its better to disable xive
support in SVM in the interim.

**** BTW: I figured, I dont need this intermin patch to disable xive for
secure VM.  Just doing "svm=on xive=off" on the kernel command line is
sufficient for now. *****


> 
> But, kernel_irqchip=off should work out of the box. It seems it doesn't. 
> Something to investigate.

Dont know why. 

Does this option, disable the chip from interrupting the
guest directly; instead mediates the interrupt through the hypervisor?

> 
> > 
> >   5) All the above said, having to use XICS is pretty crappy.  You
> >      should really get working on XIVE support for secure VMs.
> 
> Yes. 

and yes too.


Summary:  I am dropping this patch for now.

> 
> Thanks,
> 
> C.

-- 
Ram Pai

