Return-Path: <linuxppc-dev+bounces-8176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B84AA4435
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 09:43:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnTgn4Xxgz3bTf;
	Wed, 30 Apr 2025 17:43:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745998997;
	cv=none; b=L0AgwUrDADV2BiGSom5MnvltWZ/6xn0G7htvyyECN6ZsBPvl7lXHSGPWh4niwl3R/rw6Je1bgUkdIQITw5jyHKByMlxkneuX1pa1Vbal+yMy2AjORaew7sAhsgIOnBHdbGQdIr6XVjkE8fUmrSp8lZ59vgrRvwMBBIgFAZdn5wa0fOW3O6E+zJmoA60aHLOpDJ2kXUl9rvUqYgZnBxcfE1pgCXgD35MjwJrJuVu0GkN9//Ml77hJUDfL9VEVHgGhzotWOh0WLGtNWZFHrA+wf+XlRcouuijiVfBBaz9jJBUsrlMvaORORUeLbR4IGxmeYOVGh2XOFlsDFbQkTcMHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745998997; c=relaxed/relaxed;
	bh=MfIutB74UXGa0VGW3ueTotawSSzDjL0JNqqyiQE6aNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLxudh2l0hTKAUygudarLYz5JlwSpnGXs43B1tjAaGgoduPj5eaPnnq9+pLng0iwqxM0esNuBWg1QgonwLN8sG4In+r7pET0xiqPAuS7Z+eX8FNAQ/U8jPVrMz6n/V1OMCBl84d8gKDOOO2MSxeYOfGVtQPGjL3PfsBlcctN9DopWtIg0JIVsjsSGk7xgOCKrbBNR3d21fdqW0OA5bVYgVnLmrISanPil6XsZC83/lmKIAOJlc7xw5PAq8VqDJ1rB4d34NvPE0+sH8U5Tl0+JFMoWX4CHFyXSMHTRLSDkiBy7nj7RxpUYc6x40x6W4+1fzLP7iRlUiUJhLxtsEF79w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CSsJ5IUQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CSsJ5IUQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnTgm4GQtz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 17:43:16 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLgMEl024470;
	Wed, 30 Apr 2025 07:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MfIutB
	74UXGa0VGW3ueTotawSSzDjL0JNqqyiQE6aNo=; b=CSsJ5IUQM3bet50t2Xgq6d
	HBEl+NLRRldsUrehK2uR/nNmtHY8UqvncfFb3rg/Ivbk2EDBe5KVeXTwcaSoLUoh
	0cNKjKUslSkAJ4mGEtHFczmLYtd0Df2cgDaxMack2g7vb3whEQD0OkLi9ent1eFe
	krttFegWU11tvZed71NBaIpryT1Vv+HsUvKmWLJxDRweWv1O5fTx2KFOkxwAUZo0
	0tch8tZrlMgFtS1hJSmp6Ush0KUYrmm1TybAHjNeoFhEZT/5iKdS9CiugpXIOPDw
	sHOmBl2e/A82octaam2AER7dKwExgCTxSuOcMmQw5YqFk/8SysPqVszeZXw56KUA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b6ww9qhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 07:43:06 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U79G7U016174;
	Wed, 30 Apr 2025 07:43:05 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a70f12d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 07:43:05 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U7h19j10289800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 07:43:01 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7136E5809A;
	Wed, 30 Apr 2025 07:43:01 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECE0458091;
	Wed, 30 Apr 2025 07:42:58 +0000 (GMT)
Received: from [9.61.255.15] (unknown [9.61.255.15])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 07:42:58 +0000 (GMT)
Message-ID: <41c0aee3-e2ab-4b2f-878a-d65220e944ff@linux.ibm.com>
Date: Wed, 30 Apr 2025 13:12:57 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Include linux/types.h in
 papr-platform-dump.h
Content-Language: en-GB
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, sfr@canb.auug.org.au, tyreld@linux.ibm.com,
        linux-next@vger.kernel.org, hbabu@us.ibm.com
References: <20250429211419.1081354-1-haren@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250429211419.1081354-1-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1w9f1dGKtYYp7oyMOB7Cck82_jFkJnYV
X-Proofpoint-GUID: 1w9f1dGKtYYp7oyMOB7Cck82_jFkJnYV
X-Authority-Analysis: v=2.4 cv=GOIIEvNK c=1 sm=1 tr=0 ts=6811d48a cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=T27zWQewwPj6uHe5IjQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MiBTYWx0ZWRfX9GZ6wU6vmCp3 8TtNJ1fVkD1hzj87cKDLfc9O3AUEG7GH4AjAJDhzopFHCzdk0/dDdx9XbAB0o08EpAiDkHWfgPe 16ndkc1LcNDwnfXe0O+iExeqnve1SuFG7L5sxSsf2JIpahl1ekf5utGkGK8k4X0ZWLSm4QX47Cl
 dwp9vHNMls84Aw4rAduhGJ57gyrftK2CwiZb+ujxqUaEn2E2LkN/d45Gv8eznVQ6TjIC2W25h2Y pZAhm0FRc2pALsYFKXDJ32CEHjn+EG9WEKHzXwbuiWPLd0zTHXWsjDNUbCUK4IClfqMQWiwqqVA yNIz7si5ZUzD83L82QRDbYzV5igQsqL7UD9YIai82HJj37sLnUpgr3ACrM4up0rep4mxR8zkks/
 ScC4K4ZlP1vL/hpcg8JT37Veg6Ae3qfwjR9Nz/KxrDeSVbh/79sqO+RiQ1SQiGErDNmxmuny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300052
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 30/04/25 2:44 am, Haren Myneni wrote:
> Fix the following build warning:
> usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type without #include <linux/types.h>
>
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
> Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.auug.org.au/
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>   arch/powerpc/include/uapi/asm/papr-platform-dump.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/include/uapi/asm/papr-platform-dump.h b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> index a1d89c290dab..8a1c060e89a9 100644
> --- a/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> +++ b/arch/powerpc/include/uapi/asm/papr-platform-dump.h
> @@ -2,6 +2,7 @@
>   #ifndef _UAPI_PAPR_PLATFORM_DUMP_H_
>   #define _UAPI_PAPR_PLATFORM_DUMP_H_
>   
> +#include <linux/types.h>
>   #include <asm/ioctl.h>
>   #include <asm/papr-miscdev.h>
>   


Tested this patch by applying on top of 6.15.0-rc4-next-20250429 and it 
fixes the reported warning. Hence,


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Before Patch:


make -j 17 -s && make modules_install && make install
usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type 
without #include <linux/types.h>
   SYMLINK /lib/modules/6.15.0-rc4-next-20250429-auto/build
   INSTALL /lib/modules/6.15.0-rc4-next-20250429-auto/modules.order


After Patch:

  make -j 17 -s && make modules_install && make install
   SYMLINK 
/lib/modules/6.15.0-rc4-next-20250429-auto-00001-g5f4677f96288/build
   INSTALL 
/lib/modules/6.15.0-rc4-next-20250429-auto-00001-g5f4677f96288/modules.order
   INSTALL 
/lib/modules/6.15.0-rc4-next-20250429-auto-00001-g5f4677f96288/modules.builti


Regards,

Venkat.


