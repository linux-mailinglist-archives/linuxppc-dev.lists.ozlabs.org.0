Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2232191E85E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:15:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DxlwhEpg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCbNS674dz3fRY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 05:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DxlwhEpg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCbMm641wz3cR1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 05:15:00 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461Iuxdu013370;
	Mon, 1 Jul 2024 19:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	HaYcdNOCxqMIToS0HOUilgNmYJAyWRLxhVayCjb+2cU=; b=DxlwhEpg6zPsxRcC
	0DVMLb4mjZDUUTnbip+qBSJuTaCVO+3au2Nu/KnzBHe4dyTVVE/7n21ebckDX6/e
	MXc+CuQl4m3w1EqoVBbRVnraOZk+ELf/sMsoSC6JQBZ8OWyOOf7XNqWU+C/bumHq
	MotfFH5vjf5i7Pn51BIdidyFT6Q2Oaqsaa1ONoZ8ZrsfJdvXeuYcJScmxIYJNLJO
	hxdWH/fO0evE5s8WkXJkBrcqONKH68FhzWdzWTboPXIsAqzuwIFJrlsC+38PE898
	k5lYcJV35hUZrIPhmbPGjwle+MX7pAXN/xBG54B9rnEKyYn+qSMOoaSql0ttXbUu
	4P3GLQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4041rw03bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 19:14:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 461J0wJl026393;
	Mon, 1 Jul 2024 19:14:46 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkprw12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 19:14:46 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 461JEiZi25887238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 19:14:46 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BB145804E;
	Mon,  1 Jul 2024 19:14:44 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4B4258062;
	Mon,  1 Jul 2024 19:14:43 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 19:14:43 +0000 (GMT)
Message-ID: <e7db74a0-cd5c-4394-b87e-c31ea0861ea1@linux.ibm.com>
Date: Mon, 1 Jul 2024 15:14:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
To: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
 <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
 <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Zw2_j-fDyvuJHOCaZUrh914wenkHAsg3
X-Proofpoint-ORIG-GUID: Zw2_j-fDyvuJHOCaZUrh914wenkHAsg3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_19,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010141
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/1/24 15:01, Jarkko Sakkinen wrote:
> On Mon Jul 1, 2024 at 6:29 PM UTC, Stefan Berger wrote:
>>
>>
>> On 7/1/24 11:22, Jarkko Sakkinen wrote:
>>> On Fri, 2024-06-28 at 17:00 +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> [CCing the regression list]
>>>>
>>>> On 20.06.24 00:34, Stefan Berger wrote:
>>>>> Jarkko,
>>>>>     are you ok with this patch?
>>>>
>>>> Hmmm, hope I did not miss anythng, but looks like nothing happened for
>>>> about 10 days here. Hence:
>>>>
>>>> Jarkko, looks like some feedback from your side really would help to
>>>> find a path to get this regression resolved before 6.10 is released.
>>>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>
>>> Sorry for latency, and except a bit more slow phase also during
>>> July because I'm most of this month on Holiday, except taking care
>>> 6.11 release.
>>>
>>> This really is a bug in the HMAC code not in the IBM driver as
>>> it should not break because of a new feature, i.e. this is only
>>> correct conclusions, give the "no regressions" rule.
>>>
>>> Since HMAC is by default only for x86_64 and it does not break
>>> defconfig's, we should take time and fix the actual issue.
>>
>> It was enabled it on my ppc64 system after a git pull -- at least I did
>> not enable it explicitly. Besides that others can enable it on any arch
>> unless you now change the 'default x86_64' to a 'depends x86_64' iiuc
>> otherwise the usage of a Fixes: , as I used in my patch, would be justified.
>>
>> config TCG_TPM2_HMAC
>> 	bool "Use HMAC and encrypted transactions on the TPM bus"
>> 	default X86_64
>> 	select CRYPTO_ECDH
>> 	select CRYPTO_LIB_AESCFB
>> 	select CRYPTO_LIB_SHA256
>>
>> https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/char/tpm/Kconfig
> 
> Yep, it is still a bug, and unmodified IBM vtpm driver must be expected
> to work. I was merely saying that there is some window to  fix it properly
> instead of duct tape since it is not yet widely enable feature.
> 
> I was shocked to see that the implementation has absolutely no checks
> whether chip->auth was allocated. I mean anything that would cause
> tpm2_sessions_init() not called could trigger null dereference.
> 
> So can you test this and see how your test hardware behaves:

I just tested it and it does NOT resolve the issue on my ppc64 machine. 
I see this here:

[    1.549798] tpm_ibmvtpm 5000: CRQ initialized
[    1.549871] tpm_ibmvtpm 5000: CRQ initialization completed
[    2.569446] tpm2_start_auth_session: encryption is not active
[    2.570544] tpm tpm0: A TPM error (154) occurred attempting get random
....
[  330.188826] tpm tpm0: A TPM error (149) occurred attempting extend a 
PCR value
[  330.189438] ima: Error Communicating to TPM chip, result: 149
[  330.195007] tpm tpm0: A TPM error (149) occurred attempting extend a 
PCR value
[  330.195550] ima: Error Communicating to TPM chip, result: 149
[  330.197246] tpm tpm0: A TPM error (149) occurred attempting extend a 
PCR value
[  330.197727] ima: Error Communicating to TPM chip, result: 149
[  330.199378] tpm tpm0: A TPM error (149) occurred attempting extend a 
PCR value
[  330.199962] ima: Error Communicating to TPM chip, result: 149
[  330.201452] tpm tpm0: A TPM error (149) occurred attempting extend a 
PCR value
[  330.201917] ima: Error Communicating to TPM chip, result: 149


My 4-liner patch, applied on top of it, does resolve the issue:

[    1.462079] tpm_ibmvtpm 5000: CRQ initialized
[    1.462125] tpm_ibmvtpm 5000: CRQ initialization completed
[    2.496024] xhci_hcd 0000:00:02.0: xHCI Host Controller
[    2.496183] xhci_hcd 0000:00:02.0: new USB bus registered, assigned 
bus number 1

Applying it is probably the better path forward than restricting HMAC to 
x86_64 now and enabling it on a per-architecture basis afterwards ...

    Stefan

> 
> https://lore.kernel.org/linux-integrity/20240701170735.109583-1-jarkko@kernel.org/T/#u
> 
> I'll modify it accrodingly if problems persist. Please put your feedback
> over there. I cannot anything but compile test so it could be that
> I've ignored something.
> 
> BR, Jarkko
