Return-Path: <linuxppc-dev+bounces-15454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6425DD0975F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 13:19:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dngnH4ltWz2xgv;
	Fri, 09 Jan 2026 23:19:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767961171;
	cv=none; b=Dp/vm0cg3ohEvLcpvjoOI/wDlvuT0y5wflgm+Acd8VHCF2r4YW2JMyaA9WCa7ALX+uWh/ajq0WZ5rnNYNKTs3ehLc2W2WYnt5WAwejfLmx/npLXSYKrmFWKEAXa09amBYvcqdVbE+NXxizvdOLz9k9BouUftUYPsZwYDg0eHIoQu5GlazJ0Im9s8eE0yJAIKWusp9+a3RTTnZFBDn9/fG3D/EIzztHX7l8izxcVoH7Ry5a1Vu/d1AOfBHMM3KhsK5wek7aBrq3qgp5fZoyXm1Ewf9i/3MBHNpTcvHX3omDlmzOJzR+mVrwjvhjo26gwS5gD8unhnB8HvdWovLudWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767961171; c=relaxed/relaxed;
	bh=zQ7WzLDODRXRA+ezHEMQiIjovUHJPdF7sASUcWTfEAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ii1UKWTPIHnYaCJyKQDODGJcRlpq4xD+lAuptsKfw3yRoeoz9xn6aqwCu2O4TrwNpvAgvWNcKNXegeuwrHBwY8APb/60Xbe8qEp9V1U9HlBq45BmdzCul1icqn0Nxi2nlMM3Olt1RqNOX61w/a1Npvq6BGi30irg9gmV3tl2fjnLU6NjQ2CFye2V2ZW2jyY+8FSFJuotcHhvDzEs+SLpp1Qn2lq0k1sQs/+gZk9IgGUmpKARduIF5Zg3DmyU/Kq5Cm206EaMkntl4jHjPJlaWZxCDxOy4jI6q2RoVu8G4ESAQV6T9Dj382ymMBw6xhaKn9DAAqFqooKwmJKOpqTxhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vj50qh6a; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vj50qh6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dngnF6mnMz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 23:19:28 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 609AHjkO022493;
	Fri, 9 Jan 2026 12:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zQ7WzL
	DODRXRA+ezHEMQiIjovUHJPdF7sASUcWTfEAk=; b=Vj50qh6aoMJFRhHN1DhJDw
	NlDcUwoilpsTi8i3UZGiDwi8MQ4YZECA8F4qSoXNZLheoY7qs/Nm7jfDiI9TkiOF
	F6bxwW+9S/MgnBXfs8n73qcGfRoNEuWKlGh41IOw2CmJKPcMDbAlF3C/03eDyM61
	rpFdK3LHJJ2nAKNbejf80dpHiVR7Ggdr1X21S2UcSMxeEOibD3Pl6ATIfXuqwG8R
	c9AkkNy3Axa6+hxRidVH23T3GtqTxzD24kYqJGJlKu8wHwU0NKHTJJ62WrS+AJAG
	P6+gg2w2XawyH/GqBDkqqrrqFC2dz0H8vKmQbOAqh0E5mPW1X7eIvdeRy9YsJ6mQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsqk9pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 12:19:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 609CJGmk011951;
	Fri, 9 Jan 2026 12:19:16 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsqk9pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 12:19:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 609BZ3lJ019177;
	Fri, 9 Jan 2026 12:19:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfg51meua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 12:19:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 609CJBpk47579526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jan 2026 12:19:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BEA620040;
	Fri,  9 Jan 2026 12:19:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87B8920043;
	Fri,  9 Jan 2026 12:19:09 +0000 (GMT)
Received: from [9.39.17.37] (unknown [9.39.17.37])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jan 2026 12:19:09 +0000 (GMT)
Message-ID: <fe9b9c66-d1cd-4570-91fa-54329d8c6a37@linux.ibm.com>
Date: Fri, 9 Jan 2026 17:49:08 +0530
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
Subject: Re: [PATCH 0/1] powerpc: Fix kuap warnings
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: riteshh@linux.ibm.com, linux-kernel@vger.kernel.org,
        hbathini@linux.ibm.com, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
        mhiramat@kernel.org, Nicholas Piggin <npiggin@gmail.com>
References: <20260109064917.777587-1-sshegde@linux.ibm.com>
 <a42acab4-274b-4e5e-804b-bb07a26058c7@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <a42acab4-274b-4e5e-804b-bb07a26058c7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3VzzPUsqhXRRg-YGxl2QQJEmB3J75YlC
X-Authority-Analysis: v=2.4 cv=Jvf8bc4C c=1 sm=1 tr=0 ts=6960f245 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rwkp22JNO13XuyKORbsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iY1sJdelU0jkiW7LllFk6cZJKYMtb6uX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5MCBTYWx0ZWRfX/Dw9Al5YDZRJ
 D2K3LXXGrbQtThlmyE0VEw8B4zq3bo7qUgLUVTUkqDjr7sJQOoBQeitYBoK0fAf/r1mwP8eoCN8
 BSKgXdi2Tqx4ca2rxsi7/8bGH5DpdAkOlu3TUIUeYpEy/Mobkh2yLh97g7WpLz4AUv0/4G4iFl5
 hvRiA7nfJam7J0rpDfXhgcoJeUEYo/bBLlxVcDPmVzjn3wqJj+aZm9oVvU0Q/yK7i1Qw0/NWvgd
 qZTIVOc4dH0hqLBLvo6dHoDo5rZ23QtPc7LZRa4LxyVvEXmDgayp68G+MG1D/ZLuJC/Z0DlyfGT
 99iVKU87XZDDh7HvvU6RP6GTI9CMieGdCPBtWmdeZbEJweo/cD+1z6fHplfC4nKtlaaJUXmMfFw
 zaiKzaNux8MpFM4VNFANqp5fowOY4zWdm7JbUAWQZwlzUW0S811nxomTZQ5YuMEwhcah4YS48Sj
 iCkMmXk1VdlURmgn0zQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601090090
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe.

On 1/9/26 1:41 PM, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 09/01/2026 à 07:49, Shrikanth Hegde a écrit :
>> Recently stumbled upon these kuap warnings. This happens with
>> preempt=full/lazy kernel with function tracing enabled. What irked
>> me was kernel compilation was getting failed when i had tracing
>> enabled. It doesn't fail everytime. While running stress-ng memory class
>> it threw same warnings. So that helped to narrow it down.
>> So one possible way is to disable tracing for these enter/exit
>> vmx_usercopy. That seems to fix the bug/warnings. But that will make
>> them as non trace-able. If there is a better way to fix these warning 
>> while
>> keeping them as trace-able, please let me know.
>>
>> Anyone with insights on amr, vmx and tracing, please advise.
> 
> The main principle with KUAP is to not call subfunctions once userspace 
> access enabled. There are a few exceptions like __copy_tofrom_user() 
> that are allowed in order to optimise large copies. However this needs 
> to be handled very carefully, and in principle we don't expect 
> __copy_tofrom_user() to call other functions.
> 

I didn't understand. My knowledge is quite limited in this space.
Could you please explain how this will help us avoid the warnings?
or are you saying we have more callsites which needs to worked upon.

> So it might require wider rework but we should narrow as much as 
> possible the period during which access to userspace is opened, with 
> something like:
> 
> raw_coy_to_user_power7()
> {
>      enter_vmx_usercopy();

I think the problem is when it comes here, it has some AMR state, but
it is preemptible. So shouldn't call schedule IIUC.

>      allow_write_to_user(to, n);
>      ret = __copy_tofrom_user_power7();
>      prevent_write_to_user(to, n);
>      exit_vmx_usercopy();
>      return ret;
> }
> 
> raw_copy_to_user()
> {
>      if (cpu_has_feature(CPU_FTR_VMX_COPY))
>          raw_copy_to_user_power7();
> 
>      allow_write_to_user(to, n);
>      ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
>      prevent_write_to_user(to, n);
>      return ret;
> }


