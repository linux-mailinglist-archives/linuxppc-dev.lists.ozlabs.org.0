Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D240836E996
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWCxl6GJ9z300x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 21:31:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HeUEocEn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HeUEocEn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWCxJ4CP9z2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 21:30:59 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TB5ms0087623; Thu, 29 Apr 2021 07:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=YmJXi57H4EYKKd0lNxc2ASrsFxYwFFpdZqwcakff7w8=;
 b=HeUEocEnhvDB8SjpvEusnLjDjFTaYC69ZHsIuukCVBfovTO0/h4oOVKYv30rLSlJJtAn
 w3JXN7u4sFsXfIxeZrQyEC3ZdixdCvdYAMuP0nB/aYOhwENqJ6iFQENTSn1Jw5MgY/7y
 RrtuWnjINkNRBN+WjpdMPj7FaqWzsvZnshV4Ldo+k4P5TBCCrqfWzELzJP8r5fCT1F6S
 uKXegYQ7HML8xrf4uqKgjN1htCUd4mbX59AlPbSc5C7tY4bU9yrue67h+upPn9XG82d2
 GBI3Z96GiZTAKqiK/dU3DoBZlBq1zagc83BsedPsC9kYTdy4GZ1F5l1qwtfsEN5XWJGv BA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387te0ty4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 07:30:52 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TBRTn7032338;
 Thu, 29 Apr 2021 11:30:51 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 384ay9mv07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 11:30:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TBUoHw40042774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 11:30:50 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF7D6B24B3;
 Thu, 29 Apr 2021 11:30:49 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DCC2B3860;
 Thu, 29 Apr 2021 11:10:44 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.46.50])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 11:10:44 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 6AF4F2E2E70; Thu, 29 Apr 2021 16:40:40 +0530 (IST)
Date: Thu, 29 Apr 2021 16:40:40 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <20210429111040.GA13183@in.ibm.com>
References: <1619673517-10853-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r1it9zxy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r1it9zxy.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A1lc2brbgi1tTgwdTq79jIjV8xI7WPdQ
X-Proofpoint-ORIG-GUID: A1lc2brbgi1tTgwdTq79jIjV8xI7WPdQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_06:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290075
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
 Michal Suchanek <msuchanek@suse.de>, linux-pm@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

On Thu, Apr 29, 2021 at 07:56:25PM +1000, Michael Ellerman wrote:
> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> > Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> > of the Extended CEDE states advertised by the platform
> >
> > On POWER9 LPARs, the firmwares advertise a very low value of 2us for
> > CEDE1 exit latency on a Dedicated LPAR. The latency advertized by the
> > PHYP hypervisor corresponds to the latency required to wakeup from the
> > underlying hardware idle state. However the wakeup latency from the
> > LPAR perspective should include
> >
> > 1. The time taken to transition the CPU from the Hypervisor into the
> >    LPAR post wakeup from platform idle state
> >
> > 2. Time taken to send the IPI from the source CPU (waker) to the idle
> >    target CPU (wakee).
> >
> > 1. can be measured via timer idle test, where we queue a timer, say
> > for 1ms, and enter the CEDE state. When the timer fires, in the timer
> > handler we compute how much extra timer over the expected 1ms have we
> > consumed. On a a POWER9 LPAR the numbers are
> >
> > CEDE latency measured using a timer (numbers in ns)
> > N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
> > 400     2601     5677     5668.74    5917    6413     9299   455.01
> >
> > 1. and 2. combined can be determined by an IPI latency test where we
> > send an IPI to an idle CPU and in the handler compute the time
> > difference between when the IPI was sent and when the handler ran. We
> > see the following numbers on POWER9 LPAR.
> >
> > CEDE latency measured using an IPI (numbers in ns)
> > N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
> > 400     711      7564     7369.43   8559    9514      9698   1200.01
> >
> > Suppose, we consider the 99th percentile latency value measured using
> > the IPI to be the wakeup latency, the value would be 9.5us This is in
> > the ballpark of the default value of 10us.
> >
> > Hence, use the exit latency of CEDE(0) based on the latency values
> > advertized by platform only from POWER10 onwards. The values
>                                            ^^^^^^^
> > advertized on POWER10 platforms is more realistic and informed by the
> > latency measurements. For earlier platforms stick to the default value
> > of 10us.
> 
> ...
> 
> > diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> > index a2b5c6f..7207467 100644
> > --- a/drivers/cpuidle/cpuidle-pseries.c
> > +++ b/drivers/cpuidle/cpuidle-pseries.c
> > @@ -419,7 +419,8 @@ static int pseries_idle_probe(void)
> >  			cpuidle_state_table = shared_states;
> >  			max_idle_state = ARRAY_SIZE(shared_states);
> >  		} else {
> > -			fixup_cede0_latency();
> > +			if (pvr_version_is(PVR_POWER10))
> > +				fixup_cede0_latency();
> 
> A PVR check like that tests for *only* Power10, not Power10 and onwards
> as you say in the change log.

Right. The accurate thing would be to check not do the fix up for


!(PVR_POWER4 || PVR_POWER4p || POWER_POWER5 || PVR_POWER5p  || PVR_POWER6  || PVR_POWER7
	     || PVR_POWER8  || PVR_POWER9)

But that was a bit mouthful. I will go with your suggestion (from
private correspondence)

if (cpu_has_feature(CPU_FTR_ARCH_31) || pvr_version_is(PVR_POWER10))
	fixup_cede0_latency(); 

since it will allow the fixup for Processors suporting ISA 3.1
(POWER10 and above) and also on POWER10 CPUs running in compat mode.


> 
> The other question is what should happen on a Power10 LPAR that's
> running in Power9 compat mode. I assume in that case we *do* want to use
> the firmware provided values, because they're tied to the underlying
> CPU, not the compat mode?
>

Yes, the firmware provided values are tied to the underlying CPU. Not
the compat mode.


> In which case a check for !PVR_POWER9 would seem to achieve what we
> want?
> 
> cheers

--
Thanks and Regards
gautham.
