Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9611500FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 05:53:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489wT50w48zDqK3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Feb 2020 15:53:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 489wPG03XyzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Feb 2020 15:50:25 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0134oJmv129640; Sun, 2 Feb 2020 23:50:19 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xx33wj8kj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 02 Feb 2020 23:50:19 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0134ixx3032356;
 Mon, 3 Feb 2020 04:45:21 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 2xw0y69mt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 04:45:21 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0134jJIx61276610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Feb 2020 04:45:19 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4D5E6A051;
 Mon,  3 Feb 2020 04:45:19 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E69B6A047;
 Mon,  3 Feb 2020 04:45:19 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.110])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Feb 2020 04:45:19 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 809902E2DB0; Mon,  3 Feb 2020 10:15:16 +0530 (IST)
Date: Mon, 3 Feb 2020 10:15:16 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Account for SPURR ticks on idle CPUs
Message-ID: <20200203044516.GA13468@in.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <1574856072-30972-2-git-send-email-ego@linux.vnet.ibm.com>
 <87o8wnu3t7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8wnu3t7.fsf@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-02_09:2020-02-02,
 2020-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2002030037
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nathan,

On Wed, Dec 04, 2019 at 04:24:52PM -0600, Nathan Lynch wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > diff --git a/arch/powerpc/kernel/idle.c b/arch/powerpc/kernel/idle.c
> > index a36fd05..708ec68 100644
> > --- a/arch/powerpc/kernel/idle.c
> > +++ b/arch/powerpc/kernel/idle.c
> > @@ -33,6 +33,8 @@
> >  unsigned long cpuidle_disable = IDLE_NO_OVERRIDE;
> >  EXPORT_SYMBOL(cpuidle_disable);
> >  
> > +DEFINE_PER_CPU(u64, idle_spurr_cycles);
> > +
> 
> Does idle_spurr_cycles need any special treatment for CPU
> online/offline?

If offline uses extended cede, then we need to take a snapshot of the
idle_spurr_cycles before going offline and add the delta once we are
back online. However, since the plan is to deprecate the use of
extended cede for CPU-Offline and use only rtas-stop-self, we don't
need any special handling there.


> 
> >  static int __init powersave_off(char *arg)
> >  {
> >  	ppc_md.power_save = NULL;
> > diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> > index 74c2479..45e2be4 100644
> > --- a/drivers/cpuidle/cpuidle-pseries.c
> > +++ b/drivers/cpuidle/cpuidle-pseries.c
> > @@ -30,11 +30,14 @@ struct cpuidle_driver pseries_idle_driver = {
> >  static struct cpuidle_state *cpuidle_state_table __read_mostly;
> >  static u64 snooze_timeout __read_mostly;
> >  static bool snooze_timeout_en __read_mostly;
> > +DECLARE_PER_CPU(u64, idle_spurr_cycles);
> 
> This belongs in a header...

Will move it to the header file.

> 
> 
> > -static inline void idle_loop_prolog(unsigned long *in_purr)
> > +static inline void idle_loop_prolog(unsigned long *in_purr,
> > +				    unsigned long *in_spurr)
> >  {
> >  	ppc64_runlatch_off();
> >  	*in_purr = mfspr(SPRN_PURR);
> > +	*in_spurr = mfspr(SPRN_SPURR);
> >  	/*
> >  	 * Indicate to the HV that we are idle. Now would be
> >  	 * a good time to find other work to dispatch.
> > @@ -42,13 +45,16 @@ static inline void idle_loop_prolog(unsigned long *in_purr)
> >  	get_lppaca()->idle = 1;
> >  }
> >  
> > -static inline void idle_loop_epilog(unsigned long in_purr)
> > +static inline void idle_loop_epilog(unsigned long in_purr,
> > +				    unsigned long in_spurr)
> >  {
> >  	u64 wait_cycles;
> > +	u64 *idle_spurr_cycles_ptr = this_cpu_ptr(&idle_spurr_cycles);
> >  
> >  	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
> >  	wait_cycles += mfspr(SPRN_PURR) - in_purr;
> >  	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
> > +	*idle_spurr_cycles_ptr += mfspr(SPRN_SPURR) - in_spurr;
> 
> ... and the sampling and increment logic probably should be further
> encapsulated in accessor functions that can be used in both the cpuidle
> driver and the default/generic idle implementation. Or is there some
> reason this is specific to the pseries cpuidle driver?

I am not sure if we use SPURR and PURR for performing accounting on
Bare-Metal systems. IIUC, the patches proposed by Kamalesh is only to
use idle_[s]purr and [s]purr on POWERVM LPARs. This is why I coded the
sampling/increment logic in the pseries cpuidle driver. But you are
right, in the absence of cpuidle, when we use the default idle
implementation, we will still need to note the value of
idle_purr/spurr.

--
Thanks and Regards
gautham.


