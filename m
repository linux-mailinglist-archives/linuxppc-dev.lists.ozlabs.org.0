Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4CBB6397
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 14:54:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YKg76LwTzF3t9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 22:54:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YKcQ67ndzF4RC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 22:51:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8ICkrPl021767; Wed, 18 Sep 2019 08:51:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3m8ghv1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 08:51:43 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8IClK5P023058;
 Wed, 18 Sep 2019 08:51:43 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v3m8ghv0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 08:51:43 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8ICoB9M002954;
 Wed, 18 Sep 2019 12:51:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 2v37jvna51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Sep 2019 12:51:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8ICpeuC56361420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Sep 2019 12:51:40 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E8078066;
 Wed, 18 Sep 2019 12:51:40 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D44278063;
 Wed, 18 Sep 2019 12:51:40 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.237])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Sep 2019 12:51:40 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 286BE2E2FE9; Wed, 18 Sep 2019 18:21:38 +0530 (IST)
Date: Wed, 18 Sep 2019 18:21:38 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 0/2] pseries/hotplug: Change the default behaviour of
 cede_offline
Message-ID: <20190918125138.GB12534@in.ibm.com>
References: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r24ew5i0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r24ew5i0.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-18_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909180130
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Kamalesh Babulal <kamaleshb@in.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 18, 2019 at 03:14:15PM +1000, Michael Ellerman wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> > Currently on Pseries Linux Guests, the offlined CPU can be put to one
> > of the following two states:
> >    - Long term processor cede (also called extended cede)
> >    - Returned to the Hypervisor via RTAS "stop-self" call.
> >
> > This is controlled by the kernel boot parameter "cede_offline=on/off".
> >
> > By default the offlined CPUs enter extended cede.
> 
> Since commit 3aa565f53c39 ("powerpc/pseries: Add hooks to put the CPU into an appropriate offline state") (Nov 2009)
> 
> Which you wrote :)

Mea Culpa! I forgot to include the "Fixes commit 3aa565f53c39" into
Patch 1 of the series.

> 
> Why was that wrong?

It was wrong from the definition of what PHYP considers as
"not-active" CPU. From the point of view of that hypervisor, a CPU is
not-active iff it is in RTAS "stop-self". Thus if a CPU is offline via
extended cede, and not using any cycles, it is still considered to be
active, by PHYP. This causes PURR accounting is broken. 

> 
> > The PHYP hypervisor considers CPUs in extended cede to be "active"
> > since the CPUs are still under the control fo the Linux Guests. Hence, when we change the
> > SMT modes by offlining the secondary CPUs, the PURR and the RWMR SPRs
> > will continue to count the values for offlined CPUs in extended cede
> > as if they are online.
> >
> > One of the expectations with PURR is that the for an interval of time,
> > the sum of the PURR increments across the online CPUs of a core should
> > equal the number of timebase ticks for that interval.
> >
> > This is currently not the case.
> 
> But why does that matter? It's just some accounting stuff, does it
> actually break something meaningful?

As Naveen mentioned, it breaks lparstat which the customers are using
for capacity planning. Unfortunately we discovered this 10 years after
the feature was written.

> 
> Also what does this do to the latency of CPU online/offline.

It will have a slightly higher latency compared to extended cede,
since it involves an additional rtas-call for both the start and
stopping of CPU. Will measure the exact difference and post it in the
next version.

> And what does this do on KVM?

KVM doesn't seem to depend on the state of the offline VCPU as it has
an explicit way of signalling whether a CPU is online or not, via
KVM_REG_PPC_ONLINE. In commit 7aa15842c15f ("KVM: PPC: Book3S HV: Set
RWMR on POWER8 so PURR/SPURR count correctly") we use this KVM reg to
update the count of online vCPUs in a core, and use this count to set
the RWMR correctly before dispatching the core.

So, this patchset doesn't affect KVM.

> 
> 
> > In the following data (Generated using
> > https://github.com/gautshen/misc/blob/master/purr_tb.py):
> >
> >
> > delta tb = tb ticks elapsed in 1 second.
> > delta purr = sum of PURR increments on online CPUs of that core in 1
> >        	     second
> >       
> > SMT=off
> > ===========================================
> > Core        	delta tb(apprx)  delta purr	
> > ===========================================
> > core00 [  0]	512000000	69883784	
> > core01 [  8]	512000000	88782536	
> > core02 [ 16]	512000000	94296824	
> > core03 [ 24]	512000000	80951968	
> 
> Showing the expected value in another column would make this much
> clearer.

Thanks. Will update the testcase to call out the expected value.
> 
> cheers
> 


--
Thanks and Regards
gautham.
