Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F30CF4544DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 11:20:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvJp761S3z305V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 21:19:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jd/hKOOm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Jd/hKOOm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvJnM0xfzz2yNC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 21:19:18 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AH9HUAo008345; 
 Wed, 17 Nov 2021 10:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dfr8+T1qdAIIQ+LYGwoB8m99uR3cNtITRW3mOovAnUY=;
 b=Jd/hKOOmFIxctKD4c52eVP2uA+nnuHZ5G8JrmMpnsKdueewVz+4aagT7ZDtHgik4pn7h
 x0dFWxGpLx4Niy5H+Xl8WJEBDA9Hf/HEGli3BW5BLiapwFTCIBOqdgDpc7PqSHVYHuAR
 ckd8ARDezHWNR6t5m/3jcFBjHw0AR3i3E3hn1RvINffVuQY3lCpWvPY8wbblfOEY1xKU
 UaqiX22jrimrkXt2UJEaX6jgo44qU0WR/27LvBWE80xC0ppeqPB6UojgTqpXzM76MGYo
 sVSrwEC10gTqF9Foln1EgYN4hvMCdCnfvMj0v6n7+s+RWIqBzboEzkZDOY87DnOn9jJR BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccxys9548-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 10:19:11 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHAH2qV001993;
 Wed, 17 Nov 2021 10:19:10 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccxys953p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 10:19:10 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHAIjnT024512;
 Wed, 17 Nov 2021 10:19:08 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3ca50a703m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 10:19:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHAJ5CJ15270264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 10:19:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE9805204E;
 Wed, 17 Nov 2021 10:19:05 +0000 (GMT)
Received: from [9.145.179.29] (unknown [9.145.179.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 42DA452051;
 Wed, 17 Nov 2021 10:19:05 +0000 (GMT)
Message-ID: <98447986-ecef-13eb-1fd3-a635cb75fba7@linux.ibm.com>
Date: Wed, 17 Nov 2021 11:19:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH kernel 0/4] Fixes for powerpc/pseries/iommu: Make use of
 DDW for indirect mapping
Content-Language: en-US
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20211020132315.2287178-1-aik@ozlabs.ru>
 <163582100676.1804905.10010614237761858649.b4-ty@ellerman.id.au>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <163582100676.1804905.10010614237761858649.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3W7aKZSwFsj6cdMf4xZF1-2O0EURzP4d
X-Proofpoint-GUID: mkM9TIiTarZcqLbsqi0fF719H4OENOiH
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_03,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170051
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Brian King <brking@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/11/2021 03:43, Michael Ellerman wrote:
> On Thu, 21 Oct 2021 00:23:11 +1100, Alexey Kardashevskiy wrote:
>> Found some issues on SRIOV enabled PHYP.
>> It probably should be one patch, or not?
>>
>> Please comment. Thanks.
>>
>>
>>
>> [...]
> 
> Patches 2-4 applied to powerpc/fixes.


Any reason why patch 1 was not applied? The indents are still wrong in 
5.16-rc1

   Fred



> [2/4] powerpc/pseries/iommu: Use correct vfree for it_map
>        https://git.kernel.org/powerpc/c/41ee7232fa5f3c034f22baa52bc287e494e2129a
> [3/4] powerpc/pseries/iommu: Check if the default window in use before removing it
>        https://git.kernel.org/powerpc/c/92fe01b7c655b9767724e7d62bdded0761d232ff
> [4/4] powerpc/pseries/iommu: Create huge DMA window if no MMIO32 is present
>        https://git.kernel.org/powerpc/c/d853adc7adf601d7d6823afe3ed396065a3e08d1
> 
> cheers
> 
