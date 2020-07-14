Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8A21E78A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 07:33:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5ThP4tmpzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 15:33:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Tf05JLJzDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:31:36 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06E53ELO039431; Tue, 14 Jul 2020 01:31:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3278qt4y97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 01:31:31 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06E5Ohjc111622;
 Tue, 14 Jul 2020 01:31:30 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3278qt4y8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 01:31:30 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06E5RBp7027455;
 Tue, 14 Jul 2020 05:31:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgtw4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 05:31:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06E5VQID57082064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 05:31:26 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 009AB4C046;
 Tue, 14 Jul 2020 05:31:26 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBCFA4C059;
 Tue, 14 Jul 2020 05:31:24 +0000 (GMT)
Received: from in.ibm.com (unknown [9.79.210.191])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Jul 2020 05:31:24 +0000 (GMT)
Date: Tue, 14 Jul 2020 11:01:22 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: Re: [RFC PATCH v0 2/2] KVM: PPC: Book3S HV: Use H_RPT_INVALIDATE in
 nested KVM
Message-ID: <20200714053122.GI7902@in.ibm.com>
References: <20200703104420.21349-1-bharata@linux.ibm.com>
 <20200703104420.21349-3-bharata@linux.ibm.com>
 <20200709051803.GC2822576@thinks.paulus.ozlabs.org>
 <20200709090851.GD7902@in.ibm.com>
 <20200709100711.GA2961345@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709100711.GA2961345@thinks.paulus.ozlabs.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_17:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140034
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 09, 2020 at 08:07:11PM +1000, Paul Mackerras wrote:
> On Thu, Jul 09, 2020 at 02:38:51PM +0530, Bharata B Rao wrote:
> > On Thu, Jul 09, 2020 at 03:18:03PM +1000, Paul Mackerras wrote:
> > > On Fri, Jul 03, 2020 at 04:14:20PM +0530, Bharata B Rao wrote:
> > > > In the nested KVM case, replace H_TLB_INVALIDATE by the new hcall
> > > > H_RPT_INVALIDATE if available. The availability of this hcall
> > > > is determined from "hcall-rpt-invalidate" string in ibm,hypertas-functions
> > > > DT property.
> > > 
> > > What are we going to use when nested KVM supports HPT guests at L2?
> > > L1 will need to do partition-scoped tlbies with R=0 via a hypercall,
> > > but H_RPT_INVALIDATE says in its name that it only handles radix
> > > page tables (i.e. R=1).
> > 
> > For L2 HPT guests, the old hcall is expected to work after it adds
> > support for R=0 case?
> 
> That was the plan.
> 
> > The new hcall should be advertised via ibm,hypertas-functions only
> > for radix guests I suppose.
> 
> Well, the L1 hypervisor is a radix guest of L0, so it would have
> H_RPT_INVALIDATE available to it?
> 
> I guess the question is whether H_RPT_INVALIDATE is supposed to do
> everything, that is, radix process-scoped invalidations, radix
> partition-scoped invalidations, and HPT partition-scoped
> invalidations.  If that is the plan then we should call it something
> different.

Guess we are bit late now to rename it and include HPT in the scope.

> 
> This patchset seems to imply that H_RPT_INVALIDATE is at least going
> to be used for radix partition-scoped invalidations as well as radix
> process-scoped invalidations.  If you are thinking that in future when
> we need HPT partition-scoped invalidations for a radix L1 hypervisor
> running a HPT L2 guest, we are going to define a new hypercall for
> that, I suppose that is OK, though it doesn't really seem necessary.

Guess a new hcall would be the way forward to cover the HPT L2 guest
requirements.

Thanks for pointing this out.

Regards,
Bharata.
