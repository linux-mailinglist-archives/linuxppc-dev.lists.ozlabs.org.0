Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FF743CDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 15:35:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AYCBSEh+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsxCP4N9bz3c1K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 23:35:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AYCBSEh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsxBR1bQ9z3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 23:34:38 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UDRKIQ001910;
	Fri, 30 Jun 2023 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=HcIuo5iNRHSUNBxlCZgv/teoSoQx2V7lJf8YA4L3YiQ=;
 b=AYCBSEh+ZFASUtDoRQaiHHP2NkzNnh9s0Js37YtAkq6uYoCrBwfoXOkAHIRK7DnGC9+U
 bYc0kaMv/u9woY3V0DEYD4pbFB7NY8+JsRftjgNOoufrHlhlIe5q2Rn1vGl4Pu3X36Ly
 H8CqHbsNhyqnszcMa9bNbA/FuAIpHHiRhX9JWWpMvPaWsLoa1Co0Zvi0auT+rzICUltV
 Hq8oOfzUjafp5izon0HARogR7LeIpd1DQ7oI83ycopaS6E3cfKBKiaoM1m5UvTHVJMNC
 9+4y15u1MhbnvIVv4rRONbAvzhfGrmbbaTwghwaDo87criJ83SNo7DHt936JtHBC12im cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhyxug8dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 13:34:14 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35UDUDcs013493;
	Fri, 30 Jun 2023 13:34:00 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhyxug78n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 13:34:00 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35UBYm0J020495;
	Fri, 30 Jun 2023 13:32:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rdqre32vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 13:32:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35UDWjds20841208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jun 2023 13:32:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D061F20043;
	Fri, 30 Jun 2023 13:32:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B004D2004B;
	Fri, 30 Jun 2023 13:32:43 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.93.35])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Jun 2023 13:32:43 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH v3 0/9] Introduce SMT level and add PowerPC support
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230629143149.79073-1-ldufour@linux.ibm.com>
Date: Fri, 30 Jun 2023 19:02:32 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <58662E98-81B0-4553-9A75-4CA033720BE3@linux.ibm.com>
References: <20230629143149.79073-1-ldufour@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pyawJ9eCCobKKDvnKZg-jgbs3eDsRO0n
X-Proofpoint-ORIG-GUID: poT8_JcSvEbIrE4x-Z2BkviwjxmdiKaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_05,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300116
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, open list <linux-kernel@vger.kernel.org>, npiggin@gmail.com, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, tglx@linutronix.de, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 29-Jun-2023, at 8:01 PM, Laurent Dufour <ldufour@linux.ibm.com> wrote:
> 
> I'm taking over the series Michael sent previously [1] which is smartly
> reviewing the initial series I sent [2].  This series is addressing the
> comments sent by Thomas and me on the Michael's one.
> 
> Here is a short introduction to the issue this series is addressing:
> 
> When a new CPU is added, the kernel is activating all its threads. This
> leads to weird, but functional, result when adding CPU on a SMT 4 system
> for instance.
> 
> Here the newly added CPU 1 has 8 threads while the other one has 4 threads
> active (system has been booted with the 'smt-enabled=4' kernel option):
> 
> ltcden3-lp12:~ # ppc64_cpu --info
> Core   0:    0*    1*    2*    3*    4     5     6     7
> Core   1:    8*    9*   10*   11*   12*   13*   14*   15*
> 
> This mixed SMT level may confused end users and/or some applications.
> 
> There is no SMT level recorded in the kernel (common code), neither in user
> space, as far as I know. Such a level is helpful when adding new CPU or
> when optimizing the energy efficiency (when reactivating CPUs).
> 
> When SMP and HOTPLUG_SMT are defined, this series is adding a new SMT level
> (cpu_smt_num_threads) and few callbacks allowing the architecture code to
> fine control this value, setting a max and a "at boot" level, and
> controling whether a thread should be onlined or not.
> 
> v3:
>  Fix a build error in the patch 6/9

Successfully tested the V3 version on a Power10 LPAR. Add/remove of
processor core worked correctly, preserving the SMT level (on a kernel
booted with smt-enabled= parameter)

Laurent (Thanks!) also provided a patch to update the ppc64_cpu &
lparstat utility. With patched ppc64_cpu utility verified that SMT level
changed at runtime was preserved across processor core add (on
a kernel booted without smt-enabled= parameter)

Based on these test results

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin

