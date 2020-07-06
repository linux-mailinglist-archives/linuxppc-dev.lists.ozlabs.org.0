Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA48215CDD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 19:19:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0sk62BVNzDqc9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 03:19:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0shN0pbMzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 03:17:39 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066H2AiG061347; Mon, 6 Jul 2020 13:17:34 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 322nun7qv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 13:17:33 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 066HFjFg013367;
 Mon, 6 Jul 2020 17:17:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 322hd7thmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 17:17:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 066HHSQj65929238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 17:17:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCEA011C052;
 Mon,  6 Jul 2020 17:17:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEFBE11C050;
 Mon,  6 Jul 2020 17:17:27 +0000 (GMT)
Received: from [9.102.1.18] (unknown [9.102.1.18])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 17:17:27 +0000 (GMT)
Subject: Re: [PATCH v5 13/26] powerpc/book3s64/pkeys: Enable MMU_FTR_PKEY
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-14-aneesh.kumar@linux.ibm.com>
 <878sfw6b7v.fsf@mpe.ellerman.id.au>
 <cddb4987-860f-f4be-43b0-f164031f9f6a@linux.ibm.com>
Message-ID: <6fa2a91d-c11c-2be4-2057-15f86d4dd39c@linux.ibm.com>
Date: Mon, 6 Jul 2020 22:47:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <cddb4987-860f-f4be-43b0-f164031f9f6a@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_15:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0
 cotscore=-2147483648 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=856 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007060120
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
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>
>>>           /*
>>>            * Let's assume 32 pkeys on P8 bare metal, if its not 
>>> defined by device
>>>            * tree. We make this exception since skiboot forgot to 
>>> expose this
>>>            * property on power8.
>>>            */
>>>           if (!firmware_has_feature(FW_FEATURE_LPAR) &&
>>> -            cpu_has_feature(CPU_FTRS_POWER8))
>>> +            early_cpu_has_feature(CPU_FTRS_POWER8))
>>>               pkeys_total = 32;
>>
>> That's not how cpu_has_feature() works, we'll need to fix that.
>>
>> cheers
>>
> 
> I did a separate patch to handle that which switch the above to
> 
>          /*
>           * Let's assume 32 pkeys on P8/P9 bare metal, if its not 
> defined by device
>           * tree. We make this exception since skiboot forgot to expose 
> this
>           * property on power8/9.
>           */
>          if (!firmware_has_feature(FW_FEATURE_LPAR) &&
>              (early_cpu_has_feature(CPU_FTR_ARCH_207S) ||
>               early_cpu_has_feature(CPU_FTR_ARCH_300)))
>              pkeys_total = 32;
> 


We should do a PVR check here i guess.


	ret = of_scan_flat_dt(dt_scan_storage_keys, &pkeys_total);
	if (ret == 0) {

		/*
		 * Let's assume 32 pkeys on P8/P9 bare metal, if its not defined by device
		 * tree. We make this exception since skiboot forgot to expose this
		 * property on power8/9.
		 */
		if (!firmware_has_feature(FW_FEATURE_LPAR) &&
		    (pvr_version_is(PVR_POWER8) || pvr_version_is(PVR_POWER9)))
			pkeys_total = 32;
	}


-aneesh
