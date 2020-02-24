Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB193169D6A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 06:11:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qqsf0xh3zDqLH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:11:18 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qqkk4NHjzDqKJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 16:05:18 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O54T6E064675; Mon, 24 Feb 2020 00:05:09 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb0g2txeg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 00:05:09 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01O4ursG002528;
 Mon, 24 Feb 2020 05:05:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2yaux6cv8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 05:05:08 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O557t649021264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 05:05:07 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9338136053;
 Mon, 24 Feb 2020 05:05:06 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD678136055;
 Mon, 24 Feb 2020 05:05:06 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.26])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 05:05:06 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id B5CEE2E3231; Mon, 24 Feb 2020 10:35:04 +0530 (IST)
Date: Mon, 24 Feb 2020 10:35:04 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 3/5] powerpc/pseries: Account for SPURR ticks on idle
 CPUs
Message-ID: <20200224050504.GB12846@in.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-4-git-send-email-ego@linux.vnet.ibm.com>
 <87ftf3ubte.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftf3ubte.fsf@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-23_07:2020-02-21,
 2020-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240043
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

On Fri, Feb 21, 2020 at 10:47:41AM -0600, Nathan Lynch wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > +static inline void snapshot_spurr_idle_entry(void)
> > +{
> > +	*this_cpu_ptr(&idle_entry_spurr_snap) = mfspr(SPRN_SPURR);
> > +}
> > +
> 
> [...]
> 
> > +static inline void update_idle_spurr_accounting(void)
> > +{
> > +	u64 *idle_spurr_cycles_ptr = this_cpu_ptr(&idle_spurr_cycles);
> > +	u64 in_spurr = *this_cpu_ptr(&idle_entry_spurr_snap);
> > +
> > +	*idle_spurr_cycles_ptr += mfspr(SPRN_SPURR) - in_spurr;
> > +}
> 
> [...]
> 
> > +static inline u64 read_this_idle_spurr(void)
> > +{
> > +	/*
> > +	 * If we are reading from an idle context, update the
> > +	 * idle-spurr cycles corresponding to the last idle period.
> > +	 * Since the idle context is not yet over, take a fresh
> > +	 * snapshot of the idle-spurr.
> > +	 */
> > +	if (get_lppaca()->idle == 1) {
> > +		update_idle_spurr_accounting();
> > +		snapshot_spurr_idle_entry();
> 
> This samples spurr twice when it could do with just one. I don't know
> the performance implications, but will the results be coherent?


We would have taken the snapshot in idle_loop_prolog() just before
entering idle. That fact that the "if" condition is true above in
read_this_idle_spurr() implies that we are reading the idle_spurr
value from an interrupt context and since get_lppaca()->idle == 1, we
haven't yet called idle_loop_epilog(), where we would have updated the
idle_spurr ticks for the last idle period.

Hence, in this function, we first update the idle_spurr accounting
from the time of the last snapshot to now. We update the snapshot to
the current SPURR value so that when we eventually call
idle_loop_epilog(), we will account for the remaining idle duration,
i.e from the read_this_idle_spurr() call to idle_loop_epilog()

The results are therefore coherant, in that we do not perform double
accounting the second time we invoke update_idle_spurr_accounting()
from idle_loop_epilog(), but only add the spurr ticks from
read_this_idle_spurr() to idle_loop_epilog().

--
Thanks and Regards
gautham.
