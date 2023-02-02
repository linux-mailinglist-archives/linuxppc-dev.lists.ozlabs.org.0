Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 446B9687F4A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 14:54:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P70dv0pwrz3f5B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 00:54:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qbCASdw/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qbCASdw/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P70cv1DTgz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:53:50 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312DfdKI023243;
	Thu, 2 Feb 2023 13:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=KHT04ypkuMNAE1cyVpqufW7bFUM1S1XbQRRzIGWowkU=;
 b=qbCASdw/Il7AmUjL1AtsPdAoV23ZBDAatCZeK7uGS3C3U5rIazqwYYX0TKLMZtAEYWDG
 uyUIsBk0tj/SskHSBVVIKIyl87nIMc+ZgY14jWK5tY5s4aZ4ytYHQl3b32QsqWxjx6Cg
 UoSDQGQ8wcbRBriTTCmwAZo7Fs8eqbUWlF51Wbw1yE+ztsjjM21G1Y+dvwbo09JG+9yo
 btWukpk2Se52Z9Td1cc1Q3H/sJ+xWIpigUrGXFNKHnCZJ909m6Hnwij4YBlFvTA6mw5V
 wQ5MJxZWovbPLhpitDW3N1XCCQru7/qrllmAEH/P/TTqRyKK8gw4gvmjprPOTXdvCR7f +A== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngcs1aqg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 13:53:34 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3123lct6013346;
	Thu, 2 Feb 2023 13:53:32 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshcf5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Feb 2023 13:53:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 312DrUXJ47120826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Feb 2023 13:53:30 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C46C20043;
	Thu,  2 Feb 2023 13:53:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6425E20040;
	Thu,  2 Feb 2023 13:53:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.126.173])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Feb 2023 13:53:29 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH] powerpc: Don't select ARCH_WANTS_NO_INSTR
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230202121805.1176492-1-mpe@ellerman.id.au>
Date: Thu, 2 Feb 2023 19:23:18 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <13CC27B9-BDFE-4C68-89F1-F56E1F8C0468@linux.ibm.com>
References: <20230202121805.1176492-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SeqSOQZMice_JQcbblGTByI-MHIzvneZ
X-Proofpoint-ORIG-GUID: SeqSOQZMice_JQcbblGTByI-MHIzvneZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=805 mlxscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020121
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
Cc: Peter Zijlstra <peterz@infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> 
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---

Thanks for the patch Michael. 

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> arch/powerpc/Kconfig | 1 -
> 1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b8c4ac56bddc..7a5f8dbfbdd0 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -163,7 +163,6 @@ config PPC
> select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
> select ARCH_WANT_LD_ORPHAN_WARN
> select ARCH_WANTS_MODULES_DATA_IN_VMALLOC if PPC_BOOK3S_32 || PPC_8xx
> - select ARCH_WANTS_NO_INSTR
> select ARCH_WEAK_RELEASE_ACQUIRE
> select BINFMT_ELF
> select BUILDTIME_TABLE_SORT
> -- 
> 2.39.1
> 

