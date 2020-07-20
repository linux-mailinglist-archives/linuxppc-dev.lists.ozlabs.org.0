Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38A22573E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 07:52:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B99pm5FhHzDqP6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B99lL5JlbzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 15:49:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B99lK6DSJz8sXg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 15:49:01 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B99lK4lnxz9sSJ; Mon, 20 Jul 2020 15:49:01 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B99lK0DNwz9sRN;
 Mon, 20 Jul 2020 15:49:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K5V4J0089870; Mon, 20 Jul 2020 01:48:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32bu7r1835-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 01:48:57 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06K5VO5Z090716;
 Mon, 20 Jul 2020 01:48:57 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32bu7r182e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 01:48:57 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K5jZqx023895;
 Mon, 20 Jul 2020 05:48:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 32brq7j7e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 05:48:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K5mrdU32833938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 05:48:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CA765205A;
 Mon, 20 Jul 2020 05:48:53 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.113.150])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 9022952051;
 Mon, 20 Jul 2020 05:48:51 +0000 (GMT)
Date: Mon, 20 Jul 2020 11:18:49 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] cpuidle-pseries: Parse extended CEDE information for
 idle.
Message-ID: <20200720054849.GA4000@drishya.in.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200038
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-07 16:41:34]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> Hi,
> 
> On pseries Dedicated Linux LPARs, apart from the polling snooze idle
> state, we currently have the CEDE idle state which cedes the CPU to
> the hypervisor with latency-hint = 0.
> 
> However, the PowerVM hypervisor supports additional extended CEDE
> states, which can be queried through the "ibm,get-systems-parameter"
> rtas-call with the CEDE_LATENCY_TOKEN. The hypervisor maps these
> extended CEDE states to appropriate platform idle-states in order to
> provide energy-savings as well as shifting power to the active
> units. On existing pseries LPARs today we have extended CEDE with
> latency-hints {1,2} supported.
> 
> In Patches 1-3 of this patchset, we add the code to parse the CEDE
> latency records provided by the hypervisor. We use this information to
> determine the wakeup latency of the regular CEDE (which we have been
> so far hardcoding to 10us while experimentally it is much lesser ~
> 1us), by looking at the wakeup latency provided by the hypervisor for
> Extended CEDE states. Since the platform currently advertises Extended
> CEDE 1 to have wakeup latency of 2us, we can be sure that the wakeup
> latency of the regular CEDE is no more than this.
> 
> Patch 4 (currently marked as RFC), expose the extended CEDE states
> parsed above to the cpuidle framework, provided that they can wakeup
> on an interrupt. On current platforms only Extended CEDE 1 fits the
> bill, but this is going to change in future platforms where even
> Extended CEDE 2 may be responsive to external interrupts.
> 
> Patch 5 (currently marked as RFC), filters out Extended CEDE 1 since
> it offers no added advantage over the normal CEDE.
> 
> With Patches 1-3, we see an improvement in the single-threaded
> performance on ebizzy.
> 
> 2 ebizzy threads bound to the same big-core. 25% improvement in the
> avg records/s (higher the better) with patches 1-3.
> x without_patches
> * with_patches
>     N           Min           Max        Median           Avg        Stddev
> x  10       2491089       5834307       5398375       4244335     1596244.9
> *  10       2893813       5834474       5832448     5327281.3     1055941.4
> 
> We do not observe any major regression in either the context_switch2
> benchmark or the schbench benchmark
> 
> context_switch2 across CPU0 CPU1 (Both belong to same big-core, but different
> small cores). We observe a minor 0.14% regression in the number of
> context-switches (higher is better).
> x without_patch
> * with_patch
>     N           Min           Max        Median           Avg        Stddev
> x 500        348872        362236        354712     354745.69      2711.827
> * 500        349422        361452        353942      354215.4     2576.9258
> 
> context_switch2 across CPU0 CPU8 (Different big-cores). We observe a 0.37%
> improvement in the number of context-switches (higher is better).
> x without_patch
> * with_patch
>     N           Min           Max        Median           Avg        Stddev
> x 500        287956        294940        288896     288977.23     646.59295
> * 500        288300        294646        289582     290064.76     1161.9992
> 
> schbench:
> No major difference could be seen until the 99.9th percentile.
> 
> Without-patch
> Latency percentiles (usec)
> 	50.0th: 29
> 	75.0th: 39
> 	90.0th: 49
> 	95.0th: 59
> 	*99.0th: 13104
> 	99.5th: 14672
> 	99.9th: 15824
> 	min=0, max=17993
> 
> With-patch:
> Latency percentiles (usec)
> 	50.0th: 29
> 	75.0th: 40
> 	90.0th: 50
> 	95.0th: 61
> 	*99.0th: 13648
> 	99.5th: 14768
> 	99.9th: 15664
> 	min=0, max=29812

This patch series mainly cleans up the CEDE latency discovery and
prepares to add different cpuidle states in virtualised environment.
This helps in improving SMT folding speeds and also power savings and
power shifting with newer platform firmware.

The current benefit is primarily from faster SMT folding and resulting
single performance achieved by updating the platform firmware provided
heuristics in the cpuidle states.

--Vaidy



