Return-Path: <linuxppc-dev+bounces-7041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF5A60959
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 07:58:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDZvK3mGyz3cX0;
	Fri, 14 Mar 2025 17:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741935485;
	cv=none; b=WV8vZFyE8horYH89tS9gHS86UzS/UyWmpZGfD5q6Q5j/q5LS99M/TzYnxKcEGksk+S8D1ePY/5AtEkv5+KbL8gYPdv1byLtJC0UmFEigz7izilKTxWQvHgBF/VITgIYenc1GDBJGmIsLJwJ9iFD2wo7mWihFmr/V30i0i5bfgvRr4DyBy9HE37gKGhduAWy3MNOpIcGFrBvJ2cYHRGY0Qg3NHVYhcGccQl19mrsJpPlMQnq/W4Mv6u/M3OTHRodGgx54V1Bwi4xUsLkCV2KNjZl1kaGcdVPgp8QqdNLUtyR+9Q4F5RsF5oQAKsbuBbw9kNfYG8Tc8N5iJ1qIWwgIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741935485; c=relaxed/relaxed;
	bh=93rADN1l4leHkQdDKQol30WlkU++J8cD8JYZk+aER8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjQN5NQp51WCkZ0aoqbgh3WTjm9r4I20IGOu2CkVzFjzMcgnnMvpRp1v0PeUsPAemKsDYwX7Ho6k0Uy0QoVi2djwRGz6fI/yzgjWVJ+Yy2E4Pf8XjYzEdFzD4B/76QdYbanJjFyg4tLhZM1kT1TzClCc9EHWUSrvXnyRfoPlfJ57oXmZlSKlfC7Y7weB6AnMmFUGbLJC/2y/Ws4mevejFiipcUbfbQSPYLVxP/AIJ/CunHpN5VD/3ZHx7sMQJPIGWCQX5CqaEraHgKB7QP0tqzonbDk7MnNOUD0EiHxL2KCstYuQvw6R0efq+LM0o74WkZURqYa/Ok2VEUrXh3TCng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SCDAkLZ3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SCDAkLZ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDZvJ0T1cz30RN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 17:58:03 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNQ5aq015394;
	Fri, 14 Mar 2025 06:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=93rADN
	1l4leHkQdDKQol30WlkU++J8cD8JYZk+aER8Y=; b=SCDAkLZ3+c3c3Z6R/xLZku
	hcDQhgrw/18knPUJ3r0b4SEx0jP+gMJDsG3V2/C1tfuBd9l3NpzXQ6vOgO81YDpc
	5evttTJMokQy5zW5NdZBmR9+bHJiTHuHjyvk4ZJwzj8p8tFNgq/dHZQNBvD5KzQT
	/HHx2v6GHGnlOME14ESIE13EmsrTw0ySd0kM0FuO2W1mj5W/KDtSO4+eGbwO6PO4
	P7qSjmL/H2fa7rqYpCH/9NDoJAPOtklP/hYjX5wZALiYRD0uO3SYgdAxjMH05P9D
	1tBW7vPfSieMF3ssuffNDp5ZFsVpSKYyXpg0o73087elSW+DFwhLnM0T4SxIVejQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k02397-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:57:49 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E6sAH1020818;
	Fri, 14 Mar 2025 06:57:49 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45c6k02394-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:57:49 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E512Qn012259;
	Fri, 14 Mar 2025 06:57:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45atsrnnbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 06:57:48 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E6vitF23265552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 06:57:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CB132004B;
	Fri, 14 Mar 2025 06:57:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2C3720043;
	Fri, 14 Mar 2025 06:57:41 +0000 (GMT)
Received: from [9.39.22.126] (unknown [9.39.22.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 06:57:41 +0000 (GMT)
Message-ID: <62356be0-a319-4ec8-88d6-08bed4c04945@linux.ibm.com>
Date: Fri, 14 Mar 2025 12:27:40 +0530
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
Subject: Re: [PATCH 5/6] powerpc: powenv: oxcl: use lock guard for mutex
To: Andrew Donnellan <ajd@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, fbarrat@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-6-sshegde@linux.ibm.com>
 <af15fbf507dee3d96249bdfbb1a7419a26985f9b.camel@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <af15fbf507dee3d96249bdfbb1a7419a26985f9b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KmZZO4VnmgZGcKkFmOx0OgjFyLhNuX_w
X-Proofpoint-ORIG-GUID: n3QZFdmW8An65Vpl2vFqfy-V7FeP4Rjy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=601 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2503140054
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/14/25 11:36, Andrew Donnellan wrote:
> On Fri, 2025-03-14 at 11:15 +0530, Shrikanth Hegde wrote:
>> use guard(mutex) for scope based resource management of mutex.
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
> The subject line of this patch misspells powernv and ocxl.

Ah. my bad. will correct it.

> 
> Otherwise this looks like a nice cleanup.

Thanks.

