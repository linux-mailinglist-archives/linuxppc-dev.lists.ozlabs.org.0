Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA9169D46
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 05:57:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QqY55dCPzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 15:56:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QqW91XLRzDqFS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 15:55:16 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O4oL2W050797; Sun, 23 Feb 2020 23:55:10 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb008tudv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 23 Feb 2020 23:55:10 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01O4pL9W005423;
 Mon, 24 Feb 2020 04:55:09 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 2yaux6cqjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 04:55:09 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O4t9rY45023654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 04:55:09 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1847FB2064;
 Mon, 24 Feb 2020 04:55:09 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDCB5B205F;
 Mon, 24 Feb 2020 04:55:08 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.26])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 04:55:08 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 39DCC2E3231; Mon, 24 Feb 2020 10:25:06 +0530 (IST)
Date: Mon, 24 Feb 2020 10:25:06 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 1/5] powerpc: Move idle_loop_prolog()/epilog()
 functions to header file
Message-ID: <20200224045506.GA12846@in.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-2-git-send-email-ego@linux.vnet.ibm.com>
 <87lfowt22z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lfowt22z.fsf@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-23_07:2020-02-21,
 2020-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240040
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

On Fri, Feb 21, 2020 at 09:03:16AM -0600, Nathan Lynch wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> 
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> > Currently prior to entering an idle state on a Linux Guest, the
> > pseries cpuidle driver implement an idle_loop_prolog() and
> > idle_loop_epilog() functions which ensure that idle_purr is correctly
> > computed, and the hypervisor is informed that the CPU cycles have been
> > donated.
> >
> > These prolog and epilog functions are also required in the default
> > idle call, i.e pseries_lpar_idle(). Hence move these accessor
> > functions to a common header file and call them from
> > pseries_lpar_idle(). Since the existing header files such as
> > asm/processor.h have enough clutter, create a new header file
> > asm/idle.h.
> >
> > Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/include/asm/idle.h        | 27 +++++++++++++++++++++++++++
> >  arch/powerpc/platforms/pseries/setup.c |  7 +++++--
> >  drivers/cpuidle/cpuidle-pseries.c      | 24 +-----------------------
> >  3 files changed, 33 insertions(+), 25 deletions(-)
> >  create mode 100644 arch/powerpc/include/asm/idle.h
> >
> > diff --git a/arch/powerpc/include/asm/idle.h b/arch/powerpc/include/asm/idle.h
> > new file mode 100644
> > index 0000000..f32a7d8
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/idle.h
> > @@ -0,0 +1,27 @@
> > +#ifndef _ASM_POWERPC_IDLE_H
> > +#define _ASM_POWERPC_IDLE_H
> > +#include <asm/runlatch.h>
> > +
> > +static inline void idle_loop_prolog(unsigned long *in_purr)
> > +{
> > +	ppc64_runlatch_off();
> > +	*in_purr = mfspr(SPRN_PURR);
> > +	/*
> > +	 * Indicate to the HV that we are idle. Now would be
> > +	 * a good time to find other work to dispatch.
> > +	 */
> > +	get_lppaca()->idle = 1;
> > +}
> > +
> > +static inline void idle_loop_epilog(unsigned long in_purr)
> > +{
> > +	u64 wait_cycles;
> > +
> > +	wait_cycles = be64_to_cpu(get_lppaca()->wait_state_cycles);
> > +	wait_cycles += mfspr(SPRN_PURR) - in_purr;
> > +	get_lppaca()->wait_state_cycles = cpu_to_be64(wait_cycles);
> > +	get_lppaca()->idle = 0;
> > +
> > +	ppc64_runlatch_on();
> > +}
> > +#endif
> 
> Looks fine and correct as a cleanup, but asm/include/idle.h and
> idle_loop_prolog, idle_loop_epilog, strike me as too generic for
> pseries-specific code.

Should it be prefixed with pseries , i.e pseries_idle_prolog()
and pseries_idle_epilog() ?

Also, I am planning another round of cleanup to move all the
idle-related declaration from asm/include/processor.h to
asm/include/idle.h


