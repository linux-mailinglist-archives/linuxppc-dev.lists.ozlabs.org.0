Return-Path: <linuxppc-dev+bounces-2896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DD9BDE5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 06:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjvYZ66scz2yhD;
	Wed,  6 Nov 2024 16:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730872498;
	cv=none; b=C0Y5oqIBesLJ9In79gUrc5QOq68nKdjqXYNCve1nebZLNXtEX+traA/2ugaUvUEUAydv9IQ14Mw7WW2f8ESlbqyWesAw1nf92KaAmZmQxB+Ifkya/YWTyRmI9YVvUQujl7nzOKb8QwurERQODxe/r9RPkurdo3I6xMPZ3KvrDTLCAka9Iwf2KoFXBoE+qgzzcQCDS3hREJyL4mzU6n00HDq7xYaf9HPMOdKdFQdS39ZOwYonKKgIpHaKCLrwlFNzyeNcxUqLai/BBcC9ZItwmdTTgaJ+gyD5iUPz84f9qadLugrn7uUEip5S60X80gmr9dhP4qzdfXiRraFBIXTCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730872498; c=relaxed/relaxed;
	bh=ysSqMGtbwbmFOqT1XRY+kGYi4gISugGgiIjpkXQ26zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df1jrsmEAvkyO1cxcIQCAVSFTSI0s57YoKDMtnH5qKG2GxJkRJEQ/CWYeTfrYFFL0sxgcFO3tpoArHrO20ZlLfkO1kgIGv8147ej24hvWrQc47xO126osThXPvuRDpzzl3JvmG0O9YjPSlFlTFH+ke+3+d5iTBq60+h4UwZXkW662ka8Xo/maBGiGPQMIZVI/W/VsExk41UK8ebuag3QidyAQLTp6RZ4+GjBGDez1uSYpdzDhh4eM5tDyWrUNHm0YQaTSQqvkS8rzq53xujeJ+FGMTvsuCzCENjeui0Echdm3hKm8JCNfxAjSj2qxXlTJs3XIOhhPl1Ri7YLXgDHZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W+2cJHzS; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W+2cJHzS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjvYX4dmnz2yh1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 16:54:55 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A65eR0j031806;
	Wed, 6 Nov 2024 05:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ysSqMG
	tbwbmFOqT1XRY+kGYi4gISugGgiIjpkXQ26zE=; b=W+2cJHzSxKStqNEMsCJ6oE
	oo4PRwZMT3VaXlB60G0+ql//qGBpP/dIRa8vvca2UVpU8ceiBC0w2R0YHBPVtqTg
	AGTK65/PgYIWa8sq+ePofqXUYZUAhH6jo4rZ8m4FFCHMy4NgJRk8HFZCYKpeDEqH
	Mw0panYRRr2Z3XGJyv2D7rLvMT/PcA9enRq6mwpxZMTrUm2GPRgiSzq3buYCapg1
	Lpns4YFX2GhurjfD06WorpPEcY5O3Uh9BaSF3bNzFffo+YiC6oD5njQWOSnM12nD
	+hmB/2mVG8ufb3rhigiHPJ23XVk14KUZVxQ3TP1LgAefH4th/gZK+iqwJ5NG8TXQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42r2gq0164-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 05:54:39 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A65WLMT008430;
	Wed, 6 Nov 2024 05:54:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywkqwav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 05:54:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A65sbAX58655144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Nov 2024 05:54:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 430FE20043;
	Wed,  6 Nov 2024 05:54:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36E5E20040;
	Wed,  6 Nov 2024 05:54:35 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Nov 2024 05:54:35 +0000 (GMT)
Message-ID: <e6ba6084-e224-44c8-86e6-f3ae408209c1@linux.ibm.com>
Date: Wed, 6 Nov 2024 11:24:34 +0530
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
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for
 ppc64le
Content-Language: en-US
To: Segher Boessenkool <segher@kernel.crashing.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao"
 <naveen@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
 <20241101205948.GW29862@gate.crashing.org>
 <1916cb5c-cb3d-427c-bcf0-2c1b905fd6d1@linux.ibm.com>
 <20241104094431.GY29862@gate.crashing.org>
 <245fed6f-5fb4-4925-ba0a-fb2f32e650d0@linux.ibm.com>
 <20241104103615.GZ29862@gate.crashing.org>
 <f7e8243a-a4c8-44ce-ad03-7d232df461ed@linux.ibm.com>
 <20241105082018.GA29862@gate.crashing.org>
 <20241105181752.74a3d6fa2f06d0adfdf85322@kernel.org>
 <20241105195208.GC29862@gate.crashing.org>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20241105195208.GC29862@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l3aRu8tgKptju9-xOMLrFcnp-sMl082c
X-Proofpoint-GUID: l3aRu8tgKptju9-xOMLrFcnp-sMl082c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 mlxlogscore=841 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060043
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 06/11/24 1:22 am, Segher Boessenkool wrote:
> Hi!
> 
> On Tue, Nov 05, 2024 at 06:17:51PM +0900, Masami Hiramatsu wrote:
>> On Tue, 5 Nov 2024 02:20:18 -0600
>> Segher Boessenkool <segher@kernel.crashing.org> wrote:
>>> On Mon, Nov 04, 2024 at 11:06:23PM +0530, Hari Bathini wrote:
>>>> Seems like a bit of misunderstanding there. Function entry here intends
>>>> to mean the actual start of function code (function prologue) - after
>>>> GEP and function profiling sequence (mflr r0; bl mcount).
>>>
>>> What you call "function entry" here simply does not exist.  The compiler
>>> can -- and ***WILL***, ***DOES*** -- mix up all of that.
>>
>> Here is the "function entry" means the function address.
> 
> "Function entry point".  "Function entry" can mean whatever nebulous
> thing done at the start of a function :-)
> 
> You're free to use your own terminology of course, but it help to use
> standard names for standard things!
> 
>> Not the prologue.
> 
> But that is literally what Hari said, so it confused me.

Sorry about that. I should have said.. maybe prologue or whatever
nebulous thing at the start of a function :-)

Basically, the address provided to test case can be any insn in the
function code expect what the kernel considers function entry address..

Thanks
Hari


