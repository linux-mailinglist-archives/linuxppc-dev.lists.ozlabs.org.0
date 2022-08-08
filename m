Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B79F158C369
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 08:42:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1RSn59vrz3bmC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 16:42:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXXWgwMJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXXWgwMJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1RS26qt3z2xr2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 16:41:22 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2786Vx2D003194
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 06:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=hhjz0oyw1dN17cOaIPcVGWbxX4h4cQGd6a1QaHwNL2s=;
 b=gXXWgwMJQ3EMRIe7P1giZK89UBEIf13GwpiuAAHFpfL7Qymq3vj/9KOfM6SXCB508bCX
 H+2aM7dFxt9KGHu+trhLzjKQubhlTdceTvc96SnWDsQoPB+lx3wP/Kemvup6UEn3WEFI
 8n7OlHWgP1KgHgL1LfcqKyBFvpBbgN6d/t3NToHXHUUw98r+8lCiIy01GJAjiwFm3F3g
 rTLr38FxPmIdvAuXRsYizbCXnimP9aZbFeYPQiRdV2HT+uIJBggUybuqJU3N3x06jPy2
 Xm9yMuamBJY/GIFypO3ZpXY1T3oxvLeDKFfUr6L0Aau1OEAPUMOBDQetGupByBhKL0NY 4w== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3htwa6r95r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 06:41:19 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2786av24008056
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 06:41:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3hsfjhrr7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Aug 2022 06:41:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2786fFuE31719786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Aug 2022 06:41:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3FA64C044
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 06:41:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E2F04C040
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 06:41:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 06:41:15 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CA1216010A;
	Mon,  8 Aug 2022 16:41:10 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2 05/14] powerpc: Use generic fallocate compatibility
 syscall
From: Rohan McLure <rmclure@linux.ibm.com>
In-Reply-To: <0853fb1aba00e32ad6d09beb12f9d392386e2338.camel@linux.ibm.com>
Date: Mon, 8 Aug 2022 16:41:10 +1000
Content-Transfer-Encoding: 7bit
Message-Id: <B298D0CE-E6BA-47A2-96B2-5B63D44CA739@linux.ibm.com>
References: <20220725062651.119176-1-rmclure@linux.ibm.com>
 <0853fb1aba00e32ad6d09beb12f9d392386e2338.camel@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P0Us4bJ1JmHH-CTZpNgWuRQdAx7Py0nz
X-Proofpoint-ORIG-GUID: P0Us4bJ1JmHH-CTZpNgWuRQdAx7Py0nz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_03,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=804
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080034
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> --- a/arch/powerpc/kernel/asm-offsets.c
>> +++ b/arch/powerpc/kernel/asm-offsets.c
>> @@ -9,6 +9,7 @@
>>   * #defines from the assembly-language output.
>>   */
>>  
>> +#include <asm/compat.h>
> 
> What's this for?

Good spot.
