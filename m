Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6217931D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 16:15:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xcs22Kl2zDqXB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 02:15:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Xcq101nWzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 02:14:04 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 024Eofim042498
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 4 Mar 2020 10:14:02 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj4q17k6k-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 10:14:01 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <linuxram@us.ibm.com>;
 Wed, 4 Mar 2020 15:13:59 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 4 Mar 2020 15:13:55 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 024FDsLL25428016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 Mar 2020 15:13:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25AEF52065;
 Wed,  4 Mar 2020 15:13:54 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.197.107])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 9B6BE52069;
 Wed,  4 Mar 2020 15:13:51 +0000 (GMT)
Date: Wed, 4 Mar 2020 07:13:48 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Greg Kurz <groug@kaod.org>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
 <20200302233240.GB35885@umbus.fritz.box>
 <8f0c3d41-d1f9-7e6d-276b-b95238715979@fr.ibm.com>
 <20200303170205.GA5416@oc0525413822.ibm.com>
 <20200303184520.632be270@bahia.home>
 <20200303185645.GB5416@oc0525413822.ibm.com>
 <20200304115948.7b2dfe10@bahia.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200304115948.7b2dfe10@bahia.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20030415-0012-0000-0000-0000038D25E6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030415-0013-0000-0000-000021C9E1D8
Message-Id: <20200304151348.GG5416@oc0525413822.ibm.com>
Subject: RE: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_05:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003040112
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, kvm-ppc@vger.kernel.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@fr.ibm.com>,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 04, 2020 at 11:59:48AM +0100, Greg Kurz wrote:
> On Tue, 3 Mar 2020 10:56:45 -0800
> Ram Pai <linuxram@us.ibm.com> wrote:
> 
> > On Tue, Mar 03, 2020 at 06:45:20PM +0100, Greg Kurz wrote:
> > > On Tue, 3 Mar 2020 09:02:05 -0800
> > > Ram Pai <linuxram@us.ibm.com> wrote:
> > > 
> > > > On Tue, Mar 03, 2020 at 07:50:08AM +0100, Cédric Le Goater wrote:
> > > > > On 3/3/20 12:32 AM, David Gibson wrote:
> > > > > > On Fri, Feb 28, 2020 at 11:54:04PM -0800, Ram Pai wrote:
> > > > > >> XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.
> > > > > >>
> > > > > >> Hence Secure VM, must always default to XICS interrupt controller.
> > > > > >>
> > > > > >> If XIVE is requested through kernel command line option "xive=on",
> > > > > >> override and turn it off.
> > > > > >>
> > > > > >> If XIVE is the only supported platform interrupt controller; specified
> > > > > >> through qemu option "ic-mode=xive", simply abort. Otherwise default to
> > > > > >> XICS.
> > > > > > 
> > > > > > Uh... the discussion thread here seems to have gotten oddly off
> > > > > > track.  
> > > > > 
> > > > > There seem to be multiple issues. It is difficult to have a clear status.
> > > > > 
> > > > > > So, to try to clean up some misunderstandings on both sides:
> > > > > > 
> > > > > >   1) The guest is the main thing that knows that it will be in secure
> > > > > >      mode, so it's reasonable for it to conditionally use XIVE based
> > > > > >      on that
> > > > > 
> > > > > FW support is required AFAIUI.
> > > > > >   2) The mechanism by which we do it here isn't quite right.  Here the
> > > > > >      guest is checking itself that the host only allows XIVE, but we
> > > > > >      can't do XIVE and is panic()ing.  Instead, in the SVM case we
> > > > > >      should force support->xive to false, and send that in the CAS
> > > > > >      request to the host.  We expect the host to just terminate
> > > > > >      us because of the mismatch, but this will interact better with
> > > > > >      host side options setting policy for panic states and the like.
> > > > > >      Essentially an SVM kernel should behave like an old kernel with
> > > > > >      no XIVE support at all, at least w.r.t. the CAS irq mode flags.
> > > > > 
> > > > > Yes. XIVE shouldn't be requested by the guest.
> > > > 
> > > > 	Ok.
> > > > 
> > > > > This is the last option 
> > > > > I proposed but I thought there was some negotiation with the hypervisor
> > > > > which is not the case. 
> > > > > 
> > > > > >   3) Although there are means by which the hypervisor can kind of know
> > > > > >      a guest is in secure mode, there's not really an "svm=on" option
> > > > > >      on the host side.  For the most part secure mode is based on
> > > > > >      discussion directly between the guest and the ultravisor with
> > > > > >      almost no hypervisor intervention.
> > > > > 
> > > > > Is there a negotiation with the ultravisor ? 
> > > > 
> > > > 	The VM has no negotiation with the ultravisor w.r.t CAS.
> > > > 
> > > > > 
> > > > > >   4) I'm guessing the problem with XIVE in SVM mode is that XIVE needs
> > > > > >      to write to event queues in guest memory, which would have to be
> > > > > >      explicitly shared for secure mode.  That's true whether it's KVM
> > > > > >      or qemu accessing the guest memory, so kernel_irqchip=on/off is
> > > > > >      entirely irrelevant.
> > > > > 
> > > > > This problem should be already fixed.
> > > > > The XIVE event queues are shared 
> > > >  	
> > > > Yes i have a patch for the guest kernel that shares the event 
> > > > queue page with the hypervisor. This is done using the
> > > > UV_SHARE_PAGE ultracall. This patch is not sent out to any any mailing
> > > > lists yet.
> > > 
> > > Why ?
> > 
> > At this point I am not sure if this is the only change, I need to the
> > guest kernel.
> 
> Maybe but we're already sure that this change is needed. I don't really see
> the point in holding this any longer.
> 
> >  I also need changes to KVM and to the ultravisor. Its bit
> > premature to send the patch without having figured out everything
> > to get xive working on a Secure VM.
> > 
> 
> I'm a bit confused... why did you send this workaround patch in
> the first place then ? I mean, this raises a concern and we're
> just trying to move forward.

The upstream kernel in its current form, will hang as of today if qemu
has 'ic-mode=xive'. The kernel hangs without giving any indication as to
'why?'. This is a bad state to be in.

This patch was a temporary solution. It is there to inform the user, not
to use 'xive' in secureVM. The user is atleast informed/guided, instead
of lost/confused.

The permanent solution, is to fix the problem in KVM and ultravisor,
along with sharing the EQ-page in the SVM, and get a holistic solution
in place. But that will take time, and may not happen by the time 5.6
releases.

RP

