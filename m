Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBC1369694
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 18:00:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRfC24CXTz30Cm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Apr 2021 02:00:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TVK1sPzD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TVK1sPzD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRfBN38GPz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Apr 2021 01:59:55 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13NFXiCf074326; Fri, 23 Apr 2021 11:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=YN4MaMne+t2iBBy9ri4SqOYm8FYZRv3XIWLdKanHvXE=;
 b=TVK1sPzD5wYrfHET8Q16xqaLx+zgYuay8y4ZMxz19ScyLe4ZScPDMHV/UxYpYbyVHryQ
 xzcLW+QZnaNz1lSLqRvKK3MbyArsTtLhytN0Gc340oLIoVzm2ytVXeI3lIkuAfp+3sF9
 ZYXu/GBhEjUSvxKlvsoEmjKcnBQogRNVYn9fO8T6jhIEb/We07cOdfFA7idPsPRe4zwk
 hFc2Y0l3m9Pu82/8nHuQOfgcjaH+Pi6gatqQlCNN+eSa0WHSga+tR0nZXQMZ0MXOx04C
 7oZ1DGAARsjN+NlNB3snMlbgyHr8Zh/2vOf6l5rVQBZapCjWDXH+iFZlC5L5/fo2Kbrm lA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383yemc9ag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 11:59:48 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13NFrFLh030597;
 Fri, 23 Apr 2021 15:59:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 37yqa89wyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 15:59:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13NFxh7126607984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 15:59:43 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88368AE045;
 Fri, 23 Apr 2021 15:59:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE9A0AE04D;
 Fri, 23 Apr 2021 15:59:41 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.199.57.164])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Apr 2021 15:59:41 +0000 (GMT)
Date: Fri, 23 Apr 2021 21:29:39 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: Michal Such?nek <msuchanek@suse.de>
Subject: Re: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <YILu6/GK+RwpskCc@drishya.in.ibm.com>
References: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210423073551.GZ6564@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210423073551.GZ6564@kitsune.suse.cz>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oATxFiE923wyNw6jy8w07RzUPHm1xTTp
X-Proofpoint-GUID: oATxFiE923wyNw6jy8w07RzUPHm1xTTp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-23_07:2021-04-23,
 2021-04-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104230100
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Such?nek <msuchanek@suse.de> [2021-04-23 09:35:51]:

> On Thu, Apr 22, 2021 at 08:37:29PM +0530, Gautham R. Shenoy wrote:
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > 
> > Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> > of the Extended CEDE states advertised by the platform
> > 
> > On some of the POWER9 LPARs, the older firmwares advertise a very low
> > value of 2us for CEDE1 exit latency on a Dedicated LPAR. However the
> Can you be more specific about 'older firmwares'?

Hi Michal,

This is POWER9 vs POWER10 difference, not really an obsolete FW.  The
key idea behind the original patch was to make the H_CEDE latency and
hence target residency come from firmware instead of being decided by
the kernel.  The advantage is such that, different type of systems in
POWER10 generation can adjust this value and have an optimal H_CEDE
entry criteria which balances good single thread performance and
wakeup latency.  Further we can have additional H_CEDE state to feed
into the cpuidle.  

> Also while this is a performance regression on such firmwares it
> should be fixed by updating the firmware to current version.
> 
> Having sub-optimal performance on obsolete firmware should not require a
> kernel workaround, should it?

When we designed and tested this change on POWER9 and POWER10 systems
the values that were set in F/w were working out fine with positive
results in all our micro benchmarks and no regression in context
switch tests.  These repeatable results gave us the confidence that we
can go ahead and set the values from F/w and remove the kernel's value
for all future Linux versions.

But where we slipped is the fact that real world workload show
variations in performance and regressions in specific case because we
are favouring H_CEDE state more often than snooze loop.  The root
cause is we have to send more IPIs to wakeup now because more cpus
will be in H_CEDE state than before.

This is a performance problem on POWER9 systems where we actually
expected good benefit and also proved them with micro benchmarks, but
later it turned out to have an impact for some workloads.  Further the
challenge is not that regressions are severe, it is the fact that on
exact same hardware and firmware end users expect similar or better
performance for everything when updating to a newer kernel and no
regressions.

We have these setting adjusted for POWER10 in F/w and hence behaviour
will be similar when we come from old kernel on P9 to a new kernel on
P10.  We did test the reverse also like new kernel on P9 should show
benefit.  But as explained, the benefit came at the cost of regressing
in few cases which were discovered later.

Hence this fix is to keep exact same behaviour for POWER9 and use this
F/w driven heuristics only from POWER10.

> It's not like the kernel would crash on the affected firmware.

Correct. We do not have a functional issue, but only a performance
regression observable on certain real workloads.

This is a minor change in cpuidle's H_CEDE usage which will show up
only in certain workload patterns where we need idle CPU threads to
wakeup faster to get the job done as compared to keeping busy CPU
threads in single thread mode to get more execution slices.

This fix is primarily to ensure kernel update does not change H_CEDE
behaviour on same hardware generation there by causing performance
variation and also regression in some case.

Thanks for the questions and comments, I hope this gives additional
context for this fix.

--Vaidy

