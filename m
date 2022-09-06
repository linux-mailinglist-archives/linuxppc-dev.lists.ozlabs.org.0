Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4E5ADEB7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 06:59:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMCq308H6z3bSW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 14:59:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PvpC50nW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PvpC50nW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMCpL1l3xz2xrX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 14:58:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2864Svc0030252;
	Tue, 6 Sep 2022 04:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=fIjFv6g9RDcoYCiz2FUS4MuXmPY92L9zlnkILw9hUqE=;
 b=PvpC50nWg6jYm3DXybOgWFCon/BfA/elC5HnffarO+vzz+6wSkvRsywmt1DNkAptlKg8
 /gbDIcLB9n2k+AXJEnP+y5npaSOwXAQnmmC/HKWqDFp/8xPiJQ+80Fjs4nBpynfIR7rJ
 xwsiuHqOJq1X/SZleiEQyKqC7Awmdffuzw0LgHhZIVNpKP8jAVFfWxi+lG5WDSJ95041
 zIRxs7tGeuRgJKyPkWqfJrMKDXHez/737vYdTWKhfz/9VpmmE9wSpGp+VmYzhg9wxJ79
 4o9voVHOknXLxRktzYjkdujun778QI/H4y9MvtrPQXRUaYmvFYePFLJ8+Bxj5L7VRTjK kw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdy7ggrn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 04:58:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2864oLww003486;
	Tue, 6 Sep 2022 04:58:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8u7x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 04:58:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2864waqh36635070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Sep 2022 04:58:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89316A405B;
	Tue,  6 Sep 2022 04:58:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8245CA405C;
	Tue,  6 Sep 2022 04:58:35 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.109.85])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Sep 2022 04:58:35 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PACTH v2] powerpc/pseries/mce: Avoid instrumentation in realmode
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
Date: Tue, 6 Sep 2022 10:28:34 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <72C59FAA-04A2-4DDE-8B26-7DA531BDB18E@linux.ibm.com>
References: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bUTs1vPBKOopWcZH8bXPzjKA26DkklU6
X-Proofpoint-ORIG-GUID: bUTs1vPBKOopWcZH8bXPzjKA26DkklU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_01,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=642 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060021
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
Cc: linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Sep-2022, at 12:08 PM, Ganesh Goudar <ganeshgr@linux.ibm.com> wrote:
> 
> Part of machine check error handling is done in realmode,
> As of now instrumentation is not possible for any code that
> runs in realmode.
> When MCE is injected on KASAN enabled kernel, crash is
> observed, Hence force inline or mark no instrumentation
> for functions which can run in realmode, to avoid KASAN
> instrumentation.
> 
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> v2: Force inline few more functions.

Thanks for the patch. The test successfully ran to completion.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

