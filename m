Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8790368645
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 19:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR4rx5869z30Ds
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 03:57:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iq6hqZOO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iq6hqZOO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR4rT5ygVz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 03:57:29 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MHkC1o108848; Thu, 22 Apr 2021 13:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=GfDPIACN+TCttSpk/qJulkS2QmvtdXvKz2PlMyrnU08=;
 b=iq6hqZOOQh/ocNlqwD26jhgjD99ZsRwn/qyr3fa8TtLtC5LlK3r/rU+1nkx6k5C4TIKq
 2UpuM3Jx7Y/a0SN8GUjsLCe5alqEK+PYCpR0YoAnt+GwlOVtNPD156OGCx136Za7xisG
 ViLo5YbbOgxW2hs4WRxs2tLe9v4d482R18tU0ak2pPy8WgXbfggQZLW95/YJ8D1XRcan
 kCgizuUsbiFdrWz8D2ASvf1ENbvws1S+hP4igJMxYvkasgUPg/Ngsqc5XCqbAPLU7e5Y
 3NwHHG+VT2MKEr7C6KKOb8J1E5/kjTe8q0JeVWYPsZIX+Z8CO9D7PdGRE+EwJrTv8mC0 bQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383at7pufv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 13:57:22 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MHvJwG002236;
 Thu, 22 Apr 2021 17:57:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 37yqa89npg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 17:57:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13MHvGTJ24904036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 17:57:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16071A405B;
 Thu, 22 Apr 2021 17:57:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30DD0A4054;
 Thu, 22 Apr 2021 17:57:14 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.93.19])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 22 Apr 2021 17:57:13 +0000 (GMT)
Date: Thu, 22 Apr 2021 23:27:11 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <YIG49/JrwnymvBPA@drishya.in.ibm.com>
References: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eNjEwf63sXkzH8padMet4pAJwdfKu_Fr
X-Proofpoint-GUID: eNjEwf63sXkzH8padMet4pAJwdfKu_Fr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_12:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1011 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104220132
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
Reply-To: svaidy@linux.ibm.com
Cc: linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2021-04-22 20:37:29]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> of the Extended CEDE states advertised by the platform
> 
> On some of the POWER9 LPARs, the older firmwares advertise a very low
> value of 2us for CEDE1 exit latency on a Dedicated LPAR. However the
> measured value is 5us on an average. Due to the low advertised exit
> latency, we are entering CEDE(0) more aggressively on such
> platforms. While this helps achieve SMT folding faster, we pay the
> penalty of having to send an IPI to wakeup the CPU when the target
> residency is very short. This is showing up as a performance
> regression on the newer kernels running on the LPARs with older
> firmware.
> 
> Hence, set the exit latency of CEDE(0) based on the latency values
> advertized by platform only from POWER10 onwards. The values
> advertized on POWER10 platforms is more realistic and informed by the
> latency measurements.
> 
> For platforms older than POWER10, retain the hardcoded value of exit
> latency, which is 10us. Though this is higher than the measured
> values, we would be erring on the side of caution.
> 
> Reported-by: Enrico Joedecke <joedecke@de.ibm.com>
> Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> CEDE(0)")
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

> ---
>  drivers/cpuidle/cpuidle-pseries.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index a2b5c6f..7207467 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -419,7 +419,8 @@ static int pseries_idle_probe(void)
>  			cpuidle_state_table = shared_states;
>  			max_idle_state = ARRAY_SIZE(shared_states);
>  		} else {
> -			fixup_cede0_latency();
> +			if (pvr_version_is(PVR_POWER10))
> +				fixup_cede0_latency();
>  			cpuidle_state_table = dedicated_states;
>  			max_idle_state = NR_DEDICATED_STATES;
>  		}

Thanks for the fix.  We should have such safeguards or fallbacks while
running on older platforms.  This fix is needed because of the
unfortunate regression on some older platforms that we failed to
notice while designing and testing the original feature.

--Vaidy

