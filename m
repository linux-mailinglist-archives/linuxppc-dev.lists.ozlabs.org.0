Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA133B326
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:00:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzc3Z65Qzz300K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DkzdEzl9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DkzdEzl9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzc2y5w2nz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:00:10 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FCYNK5116156; Mon, 15 Mar 2021 08:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8WFkFCUzbiDpnPzhEpGycbtsY42d0ftEwAfUOcXYa6E=;
 b=DkzdEzl9/X0yunHIa+DQ/TN2tIN13HfM8SxQzDPWeWTuCGinGKqvb1Wvo8av15RRBjMm
 NL3hS6TQ2OM94h9IvIVOJq93iMvGIDKBDxdXm0qIui7VWdqh9EpEL0nZi/NaCFEzntzG
 Eici8Lr9wKixpPDbeNc8Yw2qMmBSSGkJHQ4ZznBtJ5jLMQlBsoXYm0QHg9Dau7F39qgs
 8KSaf9/pI6L2baHSGKU7KaU4CRrgxTwmV35km1SvIRIB+Ds3t1X1TpX6yyQtVxiBmlQl
 DlS8kIHNKujuGOGp30K/3B04GByTsa1AQrGW5BDcmFftKVJAb7Z7YJlBaijy/QTgRqMv bA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379yhqnrjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 08:59:58 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FCw3R7016896;
 Mon, 15 Mar 2021 12:59:56 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 378mnh1vyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:59:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FCxsfO42992036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 12:59:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 045C0A405B;
 Mon, 15 Mar 2021 12:59:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AD9BA4060;
 Mon, 15 Mar 2021 12:59:53 +0000 (GMT)
Received: from [9.199.36.236] (unknown [9.199.36.236])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 12:59:52 +0000 (GMT)
Subject: Re: [PATCH v6 19/22] powerpc/book3s64/hash/kuap: Enable kuap on hash
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-20-aneesh.kumar@linux.ibm.com>
 <2898f50c-aa42-5842-9d29-7272c7da5d00@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <cc0338af-da92-f6d5-c0fb-aca67a2cccc5@linux.ibm.com>
Date: Mon, 15 Mar 2021 18:29:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2898f50c-aa42-5842-9d29-7272c7da5d00@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_05:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103150088
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
Cc: Sandipan Das <sandipan@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/15/21 5:36 PM, Christophe Leroy wrote:
> 
> 
> Le 25/11/2020 à 06:16, Aneesh Kumar K.V a écrit :
>> Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 
> PPC_HAVE_KUAP is only selected on book3s/64 when PPC_RADIX_MMU is 
> selected. Is that normal ?
> 


I guess we missed fixing that with this patch. How about

modified   arch/powerpc/platforms/Kconfig.cputype
@@ -103,6 +103,8 @@ config PPC_BOOK3S_64
  	select ARCH_SUPPORTS_NUMA_BALANCING
  	select IRQ_WORK
  	select PPC_MM_SLICES
+	select PPC_HAVE_KUEP
+	select PPC_HAVE_KUAP

  config PPC_BOOK3E_64
  	bool "Embedded processors"
@@ -365,8 +367,6 @@ config PPC_RADIX_MMU
  	bool "Radix MMU Support"
  	depends on PPC_BOOK3S_64
  	select ARCH_HAS_GIGANTIC_PAGE
-	select PPC_HAVE_KUEP
-	select PPC_HAVE_KUAP
  	default y
  	help
  	  Enable support for the Power ISA 3.0 Radix style MMU. Currently this





-aneesh
