Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 036402F8023
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 16:58:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHQnh03smzDsg9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 02:58:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=spqz5S/U; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHQlq4DNPzDqCq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 02:56:38 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FFaLVv050535; Fri, 15 Jan 2021 10:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2WUPAQBt0I29vVKDQYBD9/IEmOHfgVL4h4thWu8ITuE=;
 b=spqz5S/Ug0C6RjJuCDh5HG52dDtZ6l/Mtjj02V63t0SqCoqdveuiFkGzyhlGO0pMYJoB
 hkW8aZuLoXuc2qt4mI3z+i2H8zow6MveZx2ftz1krwYX4kLwMI6vxDxt0OMBVFn6BTCO
 rh46KjzpwFAXzk6yqQn7vwp9XTb4Ck4hUs3nQaUEKMMxTCWIU+rVO4LUXxZjMqfnvoSc
 W0USwyWdZtZpZpDOpCJFSQ4XjMJ1EqSzfa49ZOInpi4Jc6kCpB9Vog5etNw+1YO+CeKB
 /E0g5K59BbcA+eJ0ljUJ+sCll8UxywMaMU2i9WvZto8RJkSDtls2afT5C6XMCAABfdtw cA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363d9c1qg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:56:34 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FFaBuh004511;
 Fri, 15 Jan 2021 15:56:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 35y44a95hq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:56:34 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FFuXMH32571666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 15:56:33 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 169D0B2066;
 Fri, 15 Jan 2021 15:56:33 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA8B1B2068;
 Fri, 15 Jan 2021 15:56:32 +0000 (GMT)
Received: from localhost (unknown [9.163.36.68])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 15:56:32 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
In-Reply-To: <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-6-nathanl@linux.ibm.com>
 <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
Date: Fri, 15 Jan 2021 09:56:32 -0600
Message-ID: <87a6taxkgf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150095
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> On 15/01/2021 09:00, Nathan Lynch wrote:
>> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
>> index 332e1000ca0f..1aa7ab1cbc84 100644
>> --- a/arch/powerpc/include/asm/rtas.h
>> +++ b/arch/powerpc/include/asm/rtas.h
>> @@ -19,8 +19,11 @@
>>   #define RTAS_UNKNOWN_SERVICE (-1)
>>   #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
>>   
>> -/* Buffer size for ppc_rtas system call. */
>> -#define RTAS_RMOBUF_MAX (64 * 1024)
>> +/* Work areas shared with RTAS must be 4K, naturally aligned. */
>
> Why exactly 4K and not (for example) PAGE_SIZE?

4K is a platform requirement and isn't related to Linux's configured
page size. See the PAPR specification for RTAS functions such as
ibm,configure-connector, ibm,update-nodes, ibm,update-properties.

There are other calls with work area parameters where alignment isn't
specified (e.g. ibm,get-system-parameter) but 4KB alignment is a safe
choice for those.

>> +#define RTAS_WORK_AREA_SIZE   4096
>> +
>> +/* Work areas allocated for user space access. */
>> +#define RTAS_USER_REGION_SIZE (RTAS_WORK_AREA_SIZE * 16)
>
> This is still 64K but no clarity why. There is 16 of something, what
> is it?

There are 16 4KB work areas in the region. I can name it
RTAS_NR_USER_WORK_AREAS or similar.
