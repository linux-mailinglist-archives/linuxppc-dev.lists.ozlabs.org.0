Return-Path: <linuxppc-dev+bounces-16291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCkfOyJyd2n7ggEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 14:54:42 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4089250
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jan 2026 14:54:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f095928Kkz2yGM;
	Tue, 27 Jan 2026 00:54:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769435677;
	cv=none; b=IYjnjVdPaRZGKJ4P4v5s6iTeh56TYlyZXpSEt/UDMFEjLYrgMIRrM7dL4psTNp/z6JRc7fbRCSW72Ka0KHKL29JoelyKOOMFSXCiDDrKp71EK2EEpW5aTKqODiOnSaYA+WX+80Ajn7id3J03F3n0xHkCcZcwxoOei3vo6S4ZTKKyN24Gp24R3DtXDKP/7uJ8B18yIcmXcMvQa9IEbhrFgSXNPpfhTTKSkYAyQMSK4zRIoMhWNRwT6D/HNCBzlkop5s+CiuyPHvXBShqtooDKIm1FSZQxK+C2YUFaPDwXwUt9wGX4y3lyjutMAETamofiiGjEej3UanvqB8OGJ1IbZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769435677; c=relaxed/relaxed;
	bh=CFcBAlC1i+T83gIDpUoIuODo1IKNZ4kcTdp9hgHYcIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nseTdbFCn5FpyLzVe6sbgfywVP8ZQVBr2dAkkHiah6ppXKV3pFbDgVzi8SpGBOKcEwRQTmlLZPsnXezZwp+j5SepbnESzncys5JDUKTzDLGK5Irsdq6lAXA45O6Q22VFNMO4tX8/fxeil1BsXQvbNVojZGlwF5Wu2JweZKjVEmMG6oczrmCTE+4y8UFEgDzR5KIAq+afKPdObgEy7sTrUzRdx1jGvw8ViulZ3TS7jUkMpmIkz3IypP6Nbsn+uwnsQPvs2FctIc+cQQfOHSEd05fumMgcvGBg4BMyVahNluJ0slvH+7tR90j+ZLbCUZJGesr1+npCbdPfiBvL31wWLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3rBpq/F; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f3rBpq/F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f09564rbgz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jan 2026 00:54:34 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60PMdDwU004938;
	Mon, 26 Jan 2026 13:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CFcBAl
	C1i+T83gIDpUoIuODo1IKNZ4kcTdp9hgHYcIg=; b=f3rBpq/FswZ49t2Ddvx8r4
	Z898D7vSNsG6ZHROha31Zt+kNIe1K++Z+g+BcUOVKLKWhozxeppPnpzHybgRgxIU
	YooVBY7NpG9XB2gWBaw3bv+E6LmvYsVDVz7GrGX6hacWhiMX20FviDMSp5WQfxG9
	GMON+nWennk9KBXK8Ftjp1xEiAApFUnTJFedK5TJdNS1+rLcQ1VqjSI+iVRvsuTg
	Q4i7p06FBM4qWz5uCPaxtWL41m7MkcEsTCRI9XSqkHDdwIFmbks9XfHwQCzQc91Y
	yHdufEXGODVQ9aEu7asDYHDOwkfwuJZRN4SeICPTU/54s4ro8/tWtcWzZAtRhMCg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnk6rabm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 13:54:28 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60QDsSWZ029258;
	Mon, 26 Jan 2026 13:54:28 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnk6rabh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 13:54:28 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60QAZn9n006741;
	Mon, 26 Jan 2026 13:54:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw8sy4v0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 13:54:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60QDsMRU30474984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Jan 2026 13:54:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A294E20043;
	Mon, 26 Jan 2026 13:54:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9464720040;
	Mon, 26 Jan 2026 13:54:20 +0000 (GMT)
Received: from [9.124.209.168] (unknown [9.124.209.168])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Jan 2026 13:54:20 +0000 (GMT)
Message-ID: <26372850-476d-457f-ba97-9119cf81d376@linux.ibm.com>
Date: Mon, 26 Jan 2026 19:24:19 +0530
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
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, riteshh@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, hbathini@linux.ibm.com, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
        mhiramat@kernel.org, Nicholas Piggin <npiggin@gmail.com>
References: <20260109064917.777587-1-sshegde@linux.ibm.com>
 <a42acab4-274b-4e5e-804b-bb07a26058c7@kernel.org>
 <fe9b9c66-d1cd-4570-91fa-54329d8c6a37@linux.ibm.com>
 <336d274e-c831-4af9-ae65-42908b3c2c61@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <336d274e-c831-4af9-ae65-42908b3c2c61@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5IyPpdhM0mTH-Fwp-F2uM9U94O3BiEad
X-Proofpoint-ORIG-GUID: 5zRq1vsl7zfbSDQk2pUstQDni1W_4SCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDExNyBTYWx0ZWRfX3Rorn6Dh6jMt
 1eZFOUJfw+JQ9cxwsppqfTubxamoM+VI5NCEIaNruxRMxszrGO/jCgasOM7oNnqvdLA1AkPwr0Z
 3KmEg3RK5tN65aNVWccbaWCQCCVN3v6cBZrvtDfmC8FCjAjDyB8Pv0WB+WGU5oYJLmbTG5Gxvx9
 wB0RMznhcXgSGjkjmRCcI5lDGkxXfZJK4hFJGfoaaW/rv+0BOOr8QT+j/9+r/6uWGhC9jyxNYW4
 LHX1/yWPJLbRFQClu4xH/G6y7mR+KA7q3/iIbGHBOjbF+k/NcOqY4zr1hE27S2mh6cwwe2Mw4XU
 EF8nLDDwnRtoEpWKip19cmypFFOxcYD0YiETJACM2p64S2x0yKtBdmsuPfc+C6kVi9rKkddrN7Z
 2mIAeYFAlJDBYRTUwtPJcwNstbhZnxJN63lYal45b58VuKA+nwWIGAwx7Gpen89hOFPNxXTkpHZ
 yQBcbPgfEoiO1mB3NmQ==
X-Authority-Analysis: v=2.4 cv=AMiVTGgp c=1 sm=1 tr=0 ts=69777214 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ifPovhY8YLxVixpNiMkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_03,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601260117
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:riteshh@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:hbathini@linux.ibm.com,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:npiggin@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,lists.ozlabs.org,goodmis.org,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-16291-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C3A4089250
X-Rspamd-Action: no action

Hi Christophe.

On 1/9/26 6:24 PM, Christophe Leroy (CS GROUP) wrote:
> Hi Shrikanth,
> 
> Le 09/01/2026 à 13:19, Shrikanth Hegde a écrit :
>> Hi Christophe.
>>
>> On 1/9/26 1:41 PM, Christophe Leroy (CS GROUP) wrote:
>>>
>>>
>>> Le 09/01/2026 à 07:49, Shrikanth Hegde a écrit :
>>>> Recently stumbled upon these kuap warnings. This happens with
>>>> preempt=full/lazy kernel with function tracing enabled. What irked
>>>> me was kernel compilation was getting failed when i had tracing
>>>> enabled. It doesn't fail everytime. While running stress-ng memory 
>>>> class
>>>> it threw same warnings. So that helped to narrow it down.
>>>> So one possible way is to disable tracing for these enter/exit
>>>> vmx_usercopy. That seems to fix the bug/warnings. But that will make
>>>> them as non trace-able. If there is a better way to fix these 
>>>> warning while
>>>> keeping them as trace-able, please let me know.
>>>>
>>>> Anyone with insights on amr, vmx and tracing, please advise.
>>>
>>> The main principle with KUAP is to not call subfunctions once 
>>> userspace access enabled. There are a few exceptions like 
>>> __copy_tofrom_user() that are allowed in order to optimise large 
>>> copies. However this needs to be handled very carefully, and in 
>>> principle we don't expect __copy_tofrom_user() to call other functions.
>>>
>>
>> I didn't understand. My knowledge is quite limited in this space.
>> Could you please explain how this will help us avoid the warnings?
>> or are you saying we have more callsites which needs to worked upon.
> 
> Read tools/objtool/Documentation/objtool.txt section "Objtool warning" 
> item 9.
> 
> Unfortunately powerpc doesn't yet implement objtool to detect it, but 
> the principle applies anyway.
> 
>>
>>> So it might require wider rework but we should narrow as much as 
>>> possible the period during which access to userspace is opened, with 
>>> something like:
>>>
>>> raw_coy_to_user_power7()
>>> {
>>>      enter_vmx_usercopy();
>>
>> I think the problem is when it comes here, it has some AMR state, but
>> it is preemptible. So shouldn't call schedule IIUC.
> 
> See commit 00ff1eaac129 ("powerpc: Fix reschedule bug in KUAP-unlocked 
> user copy")
> 
> The problem is because enter_vmx_usercopy() is called _after_ 
> allow_write_to_user() which changes AMR.
> 
> If you call enter_vmx_usercopy() _before_ allow_write_to_user() and call 
> exit_vmx_usercopy() _after_ prevent_write_to_user() the problem is solved.
> 
>>
>>>      allow_write_to_user(to, n);
>>>      ret = __copy_tofrom_user_power7();
>>>      prevent_write_to_user(to, n);
>>>      exit_vmx_usercopy();
>>>      return ret;
>>> }
>>>
>>> raw_copy_to_user()
>>> {
>>>      if (cpu_has_feature(CPU_FTR_VMX_COPY))
>>>          raw_copy_to_user_power7();
>>>
>>>      allow_write_to_user(to, n);
>>>      ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
>>>      prevent_write_to_user(to, n);
>>>      return ret;
>>> }
>>
> 

Sorry, I forgot to update.

I spoke to ritesh a while ago and someone with better knowledge in
this area will work on a proper fix for this.

