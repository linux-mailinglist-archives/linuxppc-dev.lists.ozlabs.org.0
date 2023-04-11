Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69F6DD622
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 11:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwfyR49lnz3f4h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 19:03:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgfMUiCs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tgfMUiCs;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwfxT6nfPz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 19:02:37 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33B6WoGn017447;
	Tue, 11 Apr 2023 09:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=/9YOv71zL1nrd/HhdDDHs5nXwKJ3IA/QxmcaZVSFHdA=;
 b=tgfMUiCsHzjYbP+Shm1kKg1MMJFnhqDLK9+V/Ubb0P2p2CdJcxmoBge7eTNho0p0PV6e
 KcTPW4AeIEJye0J+8Oying00nn2568829ODlfKoRMCPBRlJ7NCp54b9pUyRdVxjSKrPC
 th1xJq44UL96pZmLRnCSxE09qD9kj6Zh1bHZtJLBuBp3xxuQMpFrt2bzY1O/YdWkGGgA
 KIVfWxVQ0xLMZ7kT/DpR5xoHbLHluA4LM8RwzwiRfD8UXN6fPzB0A306N9cMEdTNKaJz
 j3h/WTavi4DTUgu8ByDXioNiudjrgmJpWVhrrkRJDCasWwxRoF/nT6U9bXANeCB4trJk bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pvr78h6cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 09:02:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33B8Upng013948;
	Tue, 11 Apr 2023 09:02:23 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pvr78h6bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 09:02:22 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33B4B3uj026599;
	Tue, 11 Apr 2023 09:02:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pu0m19juk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 09:02:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33B92Ieq17302156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Apr 2023 09:02:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8A2720043;
	Tue, 11 Apr 2023 09:02:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B9D220040;
	Tue, 11 Apr 2023 09:02:17 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.240.72])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Apr 2023 09:02:17 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 3/4] cpuidle: pseries: Mark ->enter() functions as
 __cpuidle
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230406144535.3786008-3-mpe@ellerman.id.au>
Date: Tue, 11 Apr 2023 14:32:06 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <0BA7072D-9B38-4F5A-B8E4-BB57CC97C354@linux.ibm.com>
References: <20230406144535.3786008-1-mpe@ellerman.id.au>
 <20230406144535.3786008-3-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.500.231)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BvuAr5QX0LKRuthBsVJDr63AFEzfGAPU
X-Proofpoint-ORIG-GUID: YzSZ8899gwS57Z6r8lh4hhlaxNuJioRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_04,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=740 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304110080
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nick Piggin <npiggin@gmail.com>, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 06-Apr-2023, at 8:15 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> 
> Code in the idle path is not allowed to be instrumented because RCU is
> disabled, see commit 0e985e9d2286 ("cpuidle: Add comments about
> noinstr/__cpuidle usage").
> 
> Mark the cpuidle ->enter() callbacks as __cpuidle and use the
> raw_local_irq_*() routines to ensure that is the case.
> 
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Thanks for the patch. With this patch (and others from the series)
applied, I no longer observe the reported kernel warning while running
ftrace selftests.

For this and other patches in the series

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
