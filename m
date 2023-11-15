Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEB57EBCD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 06:44:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hdJjDpSI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVXCt0JfLz3cW5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 16:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hdJjDpSI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVXBz1BTlz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 16:43:22 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF5cvdZ002633;
	Wed, 15 Nov 2023 05:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=JP+HnJbg+icVpKfCTrt/tjMNxJmjNd2iiVzDNjezNik=;
 b=hdJjDpSIwQ5aXmpsY4+a8vKMFwFai/8rgriMRe8Sc8mwGPdPeghsOpQyzX+smU037cOm
 gJ2qRYlQ3sltVuFgNtWdjHpBKoG3glR/IFg/lJ2CyDze7BtW+DTMB8Gi9SuSSF7naQKr
 rbKQWhan0nvXQsGhqBbxtDdXki7+8jCSkZHVIS4XfzRdfsUOLjS9EOe1dLmFKZG2ZpNB
 zKdLtJSsxmxcE5tPtc4If8OSbNNfRZA3BlBsxipxiKKloM+T+rNz5LPTfDBbLgjevObP
 5CvVtnoJ1M9Ljc38mzkkcPWTKbfGY3TgGZw8AbHJHzrpTXdMuK+3jIYMfa0AV90UKxwk cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucqx603xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 05:42:58 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AF5fKGm009032;
	Wed, 15 Nov 2023 05:42:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucqx603x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 05:42:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AF4jpIc029442;
	Wed, 15 Nov 2023 05:42:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn1mmna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 05:42:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AF5gr5h13566474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 05:42:53 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E2A320040;
	Wed, 15 Nov 2023 05:42:53 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A70B120043;
	Wed, 15 Nov 2023 05:42:50 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed, 15 Nov 2023 05:42:50 +0000 (GMT)
Date: Wed, 15 Nov 2023 11:12:49 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 1/5] powerpc/smp: Enable Asym packing for cores on
 shared processor
Message-ID: <20231115054249.GU2194132@linux.vnet.ibm.com>
References: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
 <20231109054938.26589-2-srikar@linux.vnet.ibm.com>
 <87y1ezzivn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87y1ezzivn.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zomlcP0pf8N65RFJnsp8mhL92_KTB0QJ
X-Proofpoint-ORIG-GUID: MPLHRE2V3qDNbSDab5SXYdbHpWvDG23D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_04,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 mlxlogscore=955 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150042
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2023-11-15 10:57:08]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> 
> > If there are shared processor LPARs, underlying Hypervisor can have more
> > virtual cores to handle than actual physical cores.
> >
> > Starting with Power 9, a big core (aka SMT8 core) has 2 nearly
> > independent thread groups. On a shared processors LPARs, it helps to
> > pack threads to lesser number of cores so that the overall system
> > performance and utilization improves. PowerVM schedules at a big core
> > level. Hence packing to fewer cores helps.
> >
> > For example: Lets says there are two 8-core Shared LPARs that are
> > actually sharing a 8 Core shared physical pool, each running 8 threads
> > each. Then Consolidating 8 threads to 4 cores on each LPAR would help
> > them to perform better. This is because each of the LPAR will get
> > 100% time to run applications and there will no switching required by
> > the Hypervisor.
> >
> 
> Will this patch consolidate things to first 8 threads or just the one
> Big core? /me continues to look at other patches and wonder whether 4/5
> should come before this? 

It will consolidate 1 thread per small core aka SMT domain or 2 threads per
Big core. If the load is such that there are more unbound threads than SMT
domains, asym packing will not kick-in.

4/5 would make sense only once we enable asym_packing above SMT domain.
> 
> 
> >
> > To achieve this, enable SD_ASYM_PACKING flag at CACHE, MC and DIE level
> > when the system is running in shared processor mode and has big cores.
> >
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> 
> 
> -aneesh

-- 
Thanks and Regards
Srikar Dronamraju
