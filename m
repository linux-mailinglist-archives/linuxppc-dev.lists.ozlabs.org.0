Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C21984CF9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 18:17:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCyKt1Yp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVRcZ11tLz3bwj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 04:17:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCyKt1Yp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVRbm5YxSz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 04:16:20 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 417GPBZ2028521
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Feb 2024 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=VexFILlqAeUkZ/ay28eQ5IDwWst2/CXb3doibsmN2Tw=;
 b=nCyKt1YpN2YxlzBLoVjwhiCWs3wdbCzZYbHEhtbTYVlFIub1XnELOeKvkv0+9qOB+GFJ
 TQK/B5M5XLZTg8hHtroHxSBAdDuPYq/8mHuHPR29jnqChEI17lmruAbOAQzyHxSL2LL6
 dlMUyIzG4Ode7xZV/VoQd1RVSQgQYE3/O6bPGde6drrqih+94gbfkNHHSUq8zxPztT9m
 zc0Tu9+pdq3gbcGwNATJVH2DSAnwhb/xU9nDJSlTfA96knJ2pwKr7bJXjv2ugfM3GCPk
 7LkbF+Q+2gCPd8uYN/6IE1bE/cvMz/Pgp8xVlis+YdyeD66borzs5o+26egFmjCbp4f2 Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4dc79f2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Feb 2024 17:16:17 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417GPFCY028726
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Feb 2024 17:16:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4dc79f2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 17:16:17 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 417G83o1019985;
	Wed, 7 Feb 2024 17:16:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w1ytt7byb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 17:16:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 417HGEcl40239424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Feb 2024 17:16:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C128220040;
	Wed,  7 Feb 2024 17:16:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A04DB20049;
	Wed,  7 Feb 2024 17:16:12 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.43.112.162])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Wed,  7 Feb 2024 17:16:12 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Wed, 07 Feb 2024 22:46:11 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/pseries: Set CPU_FTR_DBELL according to
 ibm,pi-features
In-Reply-To: <20240207035220.339726-2-npiggin@gmail.com>
References: <20240207035220.339726-1-npiggin@gmail.com>
 <20240207035220.339726-2-npiggin@gmail.com>
Date: Wed, 07 Feb 2024 22:46:11 +0530
Message-ID: <87bk8sfb50.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OKNEeIyXywHA7s15odBL-EQl9hVj2pGc
X-Proofpoint-ORIG-GUID: SQQ3Gyq6aNBncfYw0B0xJExWjm2OsHlp
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_08,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=321 malwarescore=0 bulkscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402070127
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> PAPR will define a new ibm,pi-features bit which says that doorbells
> should not be used even on architectures where they exist. This could be
> because they are emulated and slower than using the interrupt controller
> directly for IPIs.
>
> Wire this bit into the pi-features parser to clear CPU_FTR_DBELL, and
> ensure CPU_FTR_DBELL is not in CPU_FTRS_ALWAYS.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Tested this patch on a PP64-LE lpar with the patch[1] and seeing the
relevant pi-feature bit CPU_FTR_DBELL in `cur_cpu_spec->cpu_features`
getting cleared.


[1]
https://lore.kernel.org/all/20240207035220.339726-1-npiggin@gmail.com

Hence,
Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>

-- 
Cheers
~ Vaibhav
