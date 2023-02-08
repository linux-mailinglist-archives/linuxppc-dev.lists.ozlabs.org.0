Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55968EF9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:17:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBgWy1dBNz3bZj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:17:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AyEL37zs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AyEL37zs;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBgW20p85z302m
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 00:16:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318CMkDU031991;
	Wed, 8 Feb 2023 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=lNg7tC9K6xTBJnF00cAYKVjgW5LMBw8kFJmXCKwlznU=;
 b=AyEL37zs/hPDHy5orZXXmcPymvHEULCnlpmEkoaPJ0T3NqGgHNVi/0Ig9hSFtvgdL1pP
 aLSEOmns+4OG5Rk+tjMWmHlL5iaWthdLbsPrHAxOBwcxBtHIZexkZeoN6bmIfSitReq0
 +p4ajRmX30AV08sgNm831V+meDqcuJocZVdHSuDOzrNdpKo2VBoI2J5BlNtq16Aof9Cl
 trwMWMS075ytPa0yLYkCZ2trGx65zmBl6nAfnaomnpGA7dufHGUKSeovmno+yQhM+GV7
 sStmsy5u58Jo3MuD18WtUNG9/XqWrWxm1Zvh6JIEgDzmSQFvEiQ4j29Rt/y8VZX9U0FX gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmbpmshaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 13:16:21 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 318CmVU0000511;
	Wed, 8 Feb 2023 13:16:20 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmbpmsh9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 13:16:20 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318BXMXv019627;
	Wed, 8 Feb 2023 13:16:19 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3nhf082t77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 13:16:19 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 318DGH3K63701324
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 13:16:18 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6C9C58043;
	Wed,  8 Feb 2023 13:16:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB3CE58055;
	Wed,  8 Feb 2023 13:16:17 +0000 (GMT)
Received: from localhost (unknown [9.163.2.97])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 13:16:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Lynch via B4 Submission
 Endpoint <devnull+nathanl.linux.ibm.com@kernel.org>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Kajol
 Jain <kjain@linux.ibm.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 07/19] powerpc/rtas: improve function information
 lookups
In-Reply-To: <87pmakwesq.fsf@mpe.ellerman.id.au>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-7-9aa6bd058063@linux.ibm.com>
 <87pmakwesq.fsf@mpe.ellerman.id.au>
Date: Wed, 08 Feb 2023 07:16:17 -0600
Message-ID: <87ttzwnvq6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: d_LwRHy1ci-XSuAuZqyqbpjuWb50M0Q9
X-Proofpoint-ORIG-GUID: B8dlNHslVuIKYh_kGXkbothNPhZxq6fh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_04,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=573 spamscore=0 phishscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080116
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch via B4 Submission Endpoint
> <devnull+nathanl.linux.ibm.com@kernel.org> writes:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> The core RTAS support code and its clients perform two types of lookup
>> for RTAS firmware function information.
>> 
> ...
>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>> index 479a95cb2770..14fe79217c26 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -16,6 +16,93 @@
>>   * Copyright (C) 2001 PPC 64 Team, IBM Corp
>>   */
>>  
>> +#define rtas_fnidx(x_) RTAS_FNIDX__ ## x_
>
> I'd prefer we just spelt it out in full, to aid grepability and
> cscope/tags etc.

OK.

