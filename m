Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AD169D71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 06:18:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qr1r58SczDqTX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 16:18:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qqyn1T3MzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 16:15:44 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01O54E7V093652; Mon, 24 Feb 2020 00:15:40 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yb1c5sw33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 00:15:39 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01O55L4C000428;
 Mon, 24 Feb 2020 05:15:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 2yaux6cx7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Feb 2020 05:15:38 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01O5FbXh19464564
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 05:15:37 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8975136055;
 Mon, 24 Feb 2020 05:15:37 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C58313604F;
 Mon, 24 Feb 2020 05:15:37 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.26])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 05:15:37 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 6B4922E2F59; Mon, 24 Feb 2020 10:45:35 +0530 (IST)
Date: Mon, 24 Feb 2020 10:45:35 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 5/5] Documentation: Document sysfs interfaces purr,
 spurr, idle_purr, idle_spurr
Message-ID: <20200224051535.GD12846@in.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-6-git-send-email-ego@linux.vnet.ibm.com>
 <87blprubh0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blprubh0.fsf@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-23_07:2020-02-21,
 2020-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

On Fri, Feb 21, 2020 at 10:55:07AM -0600, Nathan Lynch wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> > index 2e0e3b4..799dc737a 100644
> > --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> > +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> > @@ -580,3 +580,42 @@ Description:	Secure Virtual Machine
> >  		If 1, it means the system is using the Protected Execution
> >  		Facility in POWER9 and newer processors. i.e., it is a Secure
> >  		Virtual Machine.
> > +
> > +What: 		/sys/devices/system/cpu/cpuX/purr
> > +Date:		Apr 2005
> > +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> > +Description:	PURR ticks for this CPU since the system boot.
> > +
> > +		The Processor Utilization Resources Register (PURR) is
> > +		a 64-bit counter which provides an estimate of the
> > +		resources used by the CPU thread. The contents of this
> > +		register increases monotonically. This sysfs interface
> > +		exposes the number of PURR ticks for cpuX.
> > +
> > +What: 		/sys/devices/system/cpu/cpuX/spurr
> > +Date:		Dec 2006
> > +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> > +Description:	SPURR ticks for this CPU since the system boot.
> > +
> > +		The Scaled Processor Utilization Resources Register
> > +		(SPURR) is a 64-bit counter that provides a frequency
> > +		invariant estimate of the resources used by the CPU
> > +		thread. The contents of this register increases
> > +		monotonically. This sysfs interface exposes the number
> > +		of SPURR ticks for cpuX.
> > +
> > +What: 		/sys/devices/system/cpu/cpuX/idle_purr
> > +Date:		Nov 2019
> > +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> > +Description:	PURR ticks for cpuX when it was idle.
> > +
> > +		This sysfs interface exposes the number of PURR ticks
> > +		for cpuX when it was idle.
> > +
> > +What: 		/sys/devices/system/cpu/cpuX/spurr
> 
> Copy-paste error? This should be:

Yes, this should have been idle_spurr. Will fix it in the next
version.

> 
>                         /sys/devices/system/cpu/cpuX/idle_spurr
> 
> > +Date:		Nov 2019
> 
> And I suppose Nov 2019 is no longer accurate.

My bad. I will resend this with the updated date.


> 
> 
> > +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> > +Description:	SPURR ticks for cpuX when it was idle.
> > +
> > +		This sysfs interface exposes the number of SPURR ticks
> > +		for cpuX when it was idle.
> > -- 
> > 1.9.4
