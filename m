Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33F5E9CF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 11:08:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbcNg16mzz3blV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:08:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Herv8AMS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Herv8AMS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbcMz72Y0z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:07:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q8rQJW016958;
	Mon, 26 Sep 2022 09:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=J0lse/BJRhIIs5EwbBLqDS/lJK6RAtCOexFCGyRGBKo=;
 b=Herv8AMSQWXMzenSav51Or8Qc7gxf44GEx9VZUjzdWxFu0H9pmYmhXfZiGkjZfOZ8+yX
 v9ZZezRT6AQhfoPrTJA7UAw2fHn4LY5dUiEefKY+MzZnrxvxYUJsy7sJDnNhlm+j0KSr
 eh5jMSGqXP2XQD7O7ZvmhMV8/ux6mDb8q5hJIjnIZ9USNwLk7TXqoMycNOWvbsskk4J3
 xbyPlR+bxRf2X3FK3TGMrXSbcIEoAF2EPek4GyFjcP6THL38zLaj80SCHxpreO5GQDG1
 G7Q+L8WWvmV3D5yoHrWnayJfcErTCvcGKCg5b0hBj+f1W+Eq2dGtkbZMbeow/tms836m Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju8yfrbrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 09:07:20 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q8t62m021701;
	Mon, 26 Sep 2022 09:07:20 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju8yfrbqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 09:07:20 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q95f5b019723;
	Mon, 26 Sep 2022 09:07:18 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3jssh91msr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 09:07:18 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q97FoY1901178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 09:07:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 106F0A4051;
	Mon, 26 Sep 2022 09:07:15 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C37EBA4040;
	Mon, 26 Sep 2022 09:07:13 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.21.247])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 09:07:13 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v3] powerpc/pseries/mce: Avoid instrumentation in realmode
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220926061827.95102-1-ganeshgr@linux.ibm.com>
Date: Mon, 26 Sep 2022 14:37:09 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <C4EF1929-2154-4CFF-96D5-93221E3AAFF3@linux.ibm.com>
References: <20220926061827.95102-1-ganeshgr@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: q2G-PODS3UGafuU9ToOtI980-XF_1iKD
X-Proofpoint-ORIG-GUID: u22wNtcA_E2lg1aCPpSFXAgfakUZ7rmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_06,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=584 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209260057
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Sep-2022, at 11:48 AM, Ganesh Goudar <ganeshgr@linux.ibm.com> wrote:
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
> 
> v3: Adding noinstr to few functions instead of __always_inline.
> ---

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin
