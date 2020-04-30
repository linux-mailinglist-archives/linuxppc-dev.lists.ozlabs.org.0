Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70D1BEEF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 06:17:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CMYY246NzDrCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 14:17:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CMWt1vPFzDr8s
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 14:16:26 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U420Zk051394; Thu, 30 Apr 2020 00:16:20 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30me46yreg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 00:16:20 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03U4EowQ010028;
 Thu, 30 Apr 2020 04:16:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 30mcu751g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 04:16:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03U4GHHq21168586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 04:16:17 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43DA87805C;
 Thu, 30 Apr 2020 04:16:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B47367805E;
 Thu, 30 Apr 2020 04:16:17 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.60.232])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Apr 2020 04:16:17 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 1B1262E2DE5; Thu, 30 Apr 2020 09:46:13 +0530 (IST)
Date: Thu, 30 Apr 2020 09:46:13 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 0/5] Track and expose idle PURR and SPURR ticks
Message-ID: <20200430041612.GA25522@in.ibm.com>
References: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
 <04b5e2fa-089f-93c9-cde9-33a930455bb2@linux.ibm.com>
 <20200423100213.GA23192@in.ibm.com>
 <871ro5g0qb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871ro5g0qb.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_01:2020-04-30,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300025
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

On Thu, Apr 30, 2020 at 12:34:52PM +1000, Michael Ellerman wrote:
> Gautham R Shenoy <ego@linux.vnet.ibm.com> writes:
> > On Mon, Apr 20, 2020 at 03:46:35PM -0700, Tyrel Datwyler wrote:
> >> On 4/7/20 1:47 AM, Gautham R. Shenoy wrote:
> >> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >> > 
> >> > Hi,
> >> > 
> >> > This is the fifth version of the patches to track and expose idle PURR
> >> > and SPURR ticks. These patches are required by tools such as lparstat
> >> > to compute system utilization for capacity planning purposes.
> ...
> >> > 
> >> > Gautham R. Shenoy (5):
> >> >   powerpc: Move idle_loop_prolog()/epilog() functions to header file
> >> >   powerpc/idle: Store PURR snapshot in a per-cpu global variable
> >> >   powerpc/pseries: Account for SPURR ticks on idle CPUs
> >> >   powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
> >> >   Documentation: Document sysfs interfaces purr, spurr, idle_purr,
> >> >     idle_spurr
> >> > 
> >> >  Documentation/ABI/testing/sysfs-devices-system-cpu | 39 +++++++++
> >> >  arch/powerpc/include/asm/idle.h                    | 93 ++++++++++++++++++++++
> >> >  arch/powerpc/kernel/sysfs.c                        | 82 ++++++++++++++++++-
> >> >  arch/powerpc/platforms/pseries/setup.c             |  8 +-
> >> >  drivers/cpuidle/cpuidle-pseries.c                  | 39 ++-------
> >> >  5 files changed, 224 insertions(+), 37 deletions(-)
> >> >  create mode 100644 arch/powerpc/include/asm/idle.h
> >> > 
> >> 
> >> Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> >
> > Thanks for reviewing the patches.
> >
> >> 
> >> Any chance this is going to be merged in the near future? There is a patchset to
> >> update lparstat in the powerpc-utils package to calculate PURR/SPURR cpu
> >> utilization that I would like to merge, but have been holding off to make sure
> >> we are synced with this proposed patchset.
> >
> > Michael, could you please consider this for 5.8 ?
> 
> Yes. Has it been tested on KVM at all?

No. I haven't tested this on KVM. Will do that today.


> 
> cheers

--
Thanks and Regards
gautham.
