Return-Path: <linuxppc-dev+bounces-7108-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C572A6438C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 08:27:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGRPw3d4Sz2yd7;
	Mon, 17 Mar 2025 18:27:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742196452;
	cv=none; b=TOwBvdKaCe7NxqUN3DMmOoNRxJgO55l4psVWh5BVYdV/uXEEMmv1/tx9IudbY58rAtUcUw1tUU+i9b0jiGFeEG5ZK5vL9b/KG3VKYO6L1pgD1zbYPY0Nw4E1CVNePJWMFJ7rwOaY/OF/HC97HvMMdneLvGDexZBNOjSp1SzVe6CNq1LGNOpJtVX3KZ6rTDprqwvBD5C5+Elx5iVt6wGQD1S2gfSVwtdeLFlHJOSoL2yFtNXe5s4dEE/BFZu+XjD9MafWBmOzJZAqEt5cIewwPpaHUTq9/1kULpw5pm2CDItKrz/CCDCGZF2FOomszwK4dmGNjPtY8hFs5vHYBl3VKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742196452; c=relaxed/relaxed;
	bh=hcycxxjnsnNocNAPKlQOHoruJQXx4GJ8snQ6qY0ENpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dQqXyX4ohIIwGXTphRVSRzjgPA32Uc6a+8wXcswQ7mpDuNgUR8dbGm3X6ELEzbW/k1zd/PLk8W1Wtvg3q+pj72spkeGSo0dXBgIV3OPsJZcwnk1LQpUjGWvCV+frQhjcpdfuiueiVByXdk2o/RpkHP/cbohjOHBkEMTpuOTJQQoMeahzH3oDiXfBUsXBpmrGYfGXVWO+lQZZi4zhYKpA54q+f6z3cmU94NR2blRzRTrl2nQp1GZZpbJkmd3G/2DnxLONCDbFCAp1T7dn/IM7lAHIMXAUosD8YF3YGwFfHo1trnw60MUmYCLqz0r4pMCzCSqZckem1QIrIxrWruckyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s/Ni7WMl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s/Ni7WMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGRPv3zvsz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 18:27:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GMGTSu001856;
	Mon, 17 Mar 2025 07:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hcycxx
	jnsnNocNAPKlQOHoruJQXx4GJ8snQ6qY0ENpo=; b=s/Ni7WMl2dNwuL3BWf3jRW
	CHlrWgErJ5y+3q3O8xJhLc2nzugzOX+D6LD4hhdDm6MgYsyXjsXxI949r5x7Wwni
	41yhM5a8MgQvUFeI+iUm6kbl4nd2doG0lAyNufsrC4DvD4VtjvJ4XKv8cefjcFVU
	b+Im2CGHvm+hRGRuVivjiqxLepPmsj+bN3EqFBSgNMmrjkB4uNKkG4mcDohuCsVh
	V7jR74OjVN1IDVTdVySMquYU+1/yNzV+V5EKzBqTPeGp7swcMuVzLL2NaXVAldMb
	BSB13q/2Ws/hHYMyHRHVfE94x+xIGBwGasNcGyTYaHV66WBZzE864wLQsMdwlVYA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45e6251tgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 07:27:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52H4HFVR012347;
	Mon, 17 Mar 2025 07:27:16 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dmvnmxkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 07:27:16 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52H7RGLI26477134
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 07:27:16 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F49858054;
	Mon, 17 Mar 2025 07:27:16 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F2695803F;
	Mon, 17 Mar 2025 07:27:14 +0000 (GMT)
Received: from [9.61.253.6] (unknown [9.61.253.6])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Mar 2025 07:27:13 +0000 (GMT)
Message-ID: <25e5d468-6c40-40b7-a010-8c8018b6d228@linux.ibm.com>
Date: Mon, 17 Mar 2025 12:57:12 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next-20250307] Build Failure
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <70ba4e80-53c4-4583-82f3-2851e0829aa6@linux.ibm.com>
 <5ab103b4-70f0-454e-bca6-0bfc66d143f5@csgroup.eu>
 <c0a716d0-6811-4b1b-b008-d4e97900cb0e@linux.ibm.com>
 <5c671410-cedd-4854-a3e7-2060607d5c4d@csgroup.eu>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <5c671410-cedd-4854-a3e7-2060607d5c4d@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YhvBaWjhfQDpi8JCDxE7_yIHnHyO0JDU
X-Proofpoint-ORIG-GUID: YhvBaWjhfQDpi8JCDxE7_yIHnHyO0JDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_02,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=865
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503170054
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 12/03/25 8:49 pm, Christophe Leroy wrote:
>
>
> Le 12/03/2025 à 11:11, Venkat Rao Bagalkote a écrit :
>>
>> On 12/03/25 4:20 am, Christophe Leroy wrote:
>>>
>>>
>>> Le 09/03/2025 à 13:38, Venkat Rao Bagalkote a écrit :
>>>> Greetings!!,
>>>>
>>>> I see linux-next-20250307 fails to build on IBM Power9 and Power10 
>>>> servers.
>>>>
>>>>
>>>> Errors:
>>>>
>>>> In file included from ^[[01m^[[K<command-line>^[[m^[[K:
>>>> ^[[01m^[[K./usr/include/cxl/features.h:11:10:^[[m^[[K 
>>>> ^[[01;31m^[[Kfatal error: ^[[m^[[Kuuid/uuid.h: No such file or 
>>>> directory
>>>>     11 | #include ^[[01;31m^[[K<uuid/uuid.h>^[[m^[[K
>>>>        |          ^[[01;31m^[[K^~~~~~~~~~~~~^[[m^[[K
>>>
>>> This is unreadable. Please avoid fancy colors that add escapes to 
>>> logs. You can unset LANG environment var before building in order to 
>>> get pastable stuff.
>>>
>
> Allthought not really readable, it seems to mention that uuid/uuid.h 
> is missing.
>
> Can you confirm that you have installed libuuid package in your system 
> ? Maybe you also need some libuuid-dev packet to get headers ?


Yeah uuid package is installed on my system. I am seeing this failure 
only with build next-20250307.

Builds with before and after are compiling successfully.

UUID package version:
libuuid-2.37.4-18.el9.ppc64le
libuuid-2.37.4-20.el9.ppc64le

Regards,

Venkat.

>
> Christophe
>

