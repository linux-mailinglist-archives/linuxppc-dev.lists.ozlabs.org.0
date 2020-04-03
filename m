Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B1B19D02D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:24:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tqdV0chqzDrgr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 17:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tqbr2CXYzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 17:22:32 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0335dSnM087477; Fri, 3 Apr 2020 02:22:25 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 305s8309m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 02:22:25 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0336LfaW001775;
 Fri, 3 Apr 2020 06:22:24 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 301x776wcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Apr 2020 06:22:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0336MOeH15008554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 06:22:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B2FC124052;
 Fri,  3 Apr 2020 06:22:24 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD7E3124054;
 Fri,  3 Apr 2020 06:22:23 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.34.1])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  3 Apr 2020 06:22:23 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 0FFDA2E2F59; Fri,  3 Apr 2020 11:45:36 +0530 (IST)
Date: Fri, 3 Apr 2020 11:45:36 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 2/6] powerpc/idle: Add accessor function to always
 read latest idle PURR
Message-ID: <20200403061536.GA9066@in.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
 <1585308760-28792-3-git-send-email-ego@linux.vnet.ibm.com>
 <1585734073.0qmf6bbdoa.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585734073.0qmf6bbdoa.naveen@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_03:2020-04-02,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030046
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
 Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 01, 2020 at 03:12:53PM +0530, Naveen N. Rao wrote:
> Hi Gautham,
> 
> Gautham R. Shenoy wrote:
> >From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> >Currently when CPU goes idle, we take a snapshot of PURR via
> >pseries_idle_prolog() which is used at the CPU idle exit to compute
> >the idle PURR cycles via the function pseries_idle_epilog().  Thus,
> >the value of idle PURR cycle thus read before pseries_idle_prolog() and
> >after pseries_idle_epilog() is always correct.
> >
> >However, if we were to read the idle PURR cycles from an interrupt
> >context between pseries_idle_prolog() and pseries_idle_epilog() (this will
> >be done in a future patch), then, the value of the idle PURR thus read
> >will not include the cycles spent in the most recent idle period.
> >
> >This patch addresses the issue by providing accessor function to read
> >the idle PURR such such that it includes the cycles spent in the most
> >recent idle period, if we read it between pseries_idle_prolog() and
> >pseries_idle_epilog(). In order to achieve it, the patch saves the
> >snapshot of PURR in pseries_idle_prolog() in a per-cpu variable,
> >instead of on the stack, so that it can be accessed from an interrupt
> >context.
> >
> >Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> >---
> > arch/powerpc/include/asm/idle.h        | 47 +++++++++++++++++++++++++++-------
> > arch/powerpc/platforms/pseries/setup.c |  7 +++--
> > drivers/cpuidle/cpuidle-pseries.c      | 15 +++++------
> > 3 files changed, 47 insertions(+), 22 deletions(-)
> >
> >diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
> >index 32064a4c..d4bfb6a 100644
> >--- a/arch/powerpc/include/asm/idle.h
> >+++ b/arch/powerpc/include/asm/idle.h
> >@@ -5,10 +5,27 @@
> > #include <asm/paca.h>
> >
> > #ifdef CONFIG_PPC_PSERIES
> >-static inline void pseries_idle_prolog(unsigned long *in_purr)
> >+DECLARE_PER_CPU(u64, idle_entry_purr_snap);
> >+
> >+static inline void snapshot_purr_idle_entry(void)
> >+{
> >+	*this_cpu_ptr(&idle_entry_purr_snap) = mfspr(SPRN_PURR);
> >+}
> >+
> >+static inline void update_idle_purr_accounting(void)
> >+{
> >+	u64 wait_cycles;
> >+	u64 in_purr = *this_cpu_ptr(&idle_entry_purr_snap);
> >+
> >+	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
> >+	wait_cycles += mfspr(SPRN_PURR) - in_purr;
> >+	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
> >+}
> >+
> >+static inline void pseries_idle_prolog(void)
> > {
> > 	ppc64_runlatch_off();
> >-	*in_purr = mfspr(SPRN_PURR);
> >+	snapshot_purr_idle_entry();
> > 	/*
> > 	 * Indicate to the HV that we are idle. Now would be
> > 	 * a good time to find other work to dispatch.
> >@@ -16,16 +33,28 @@ static inline void pseries_idle_prolog(unsigned long *in_purr)
> > 	get_lppaca()->idle = 1;
> > }
> >
> >-static inline void pseries_idle_epilog(unsigned long in_purr)
> >+static inline void pseries_idle_epilog(void)
> > {
> >-	u64 wait_cycles;
> >-
> >-	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
> >-	wait_cycles += mfspr(SPRN_PURR) - in_purr;
> >-	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
> >+	update_idle_purr_accounting();
> > 	get_lppaca()->idle = 0;
> >-
> > 	ppc64_runlatch_on();
> > }
> >+
> >+static inline u64 read_this_idle_purr(void)
> >+{
> >+	/*
> >+	 * If we are reading from an idle context, update the
> >+	 * idle-purr cycles corresponding to the last idle period.
> >+	 * Since the idle context is not yet over, take a fresh
> >+	 * snapshot of the idle-purr.
> >+	 */
> >+	if (unlikely(get_lppaca()->idle == 1)) {
> >+		update_idle_purr_accounting();
> >+		snapshot_purr_idle_entry();
> >+	}
> >+
> >+	return be64_to_cpu(get_lppaca()->wait_state_cycles);
> >+}
> >+
> 
> I think this and read_this_idle_spurr() from the next patch should be moved
> to Patch 4/6, where they are actually used.

The reason I included this function in this patch was to justify why
we were introducing snapshotting the purr values in a global per-cpu
variable instead of on a stack variable. The reason being that someone
might want to read the PURR value from an interrupt context which had
woken up the CPU from idle. At this point, since epilog() function
wasn't called, the idle PURR count corresponding to this latest idle
period would have been accumulated in lppaca->wait_cycles. Thus, this
helper function safely reads the value by
   1) First updating the lppaca->wait_cycles with the latest idle_purr
   count.
   2) Take a fresh snapshot, since the time from now to the epilog()
   call is also counted under idle CPU. So the PURR cycle increment
   during this short period should also be accumulated in lppaca->wait_cycles.


prolog()
|	snapshot PURR
|
|
|
Idle
|
| <----- Interrupt . Read idle PURR ---- update idle PURR;
|                              	         snapshot PURR;
|                                   	 Read idle PURR.       
|
epilog()
	update idle PURR



> 
> - Naveen
> 

However, if you feel that moving this function to Patch 4 where it is
actually used makes it more readable, I can do that.

--
Thanks and Regards
gautham.
