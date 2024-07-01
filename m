Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9343D91E7CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 20:39:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I4cOk3eM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZZd31mdz3gD4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 04:39:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I4cOk3eM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZMq22gJz3dXC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 04:29:58 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461IQpAZ023037;
	Mon, 1 Jul 2024 18:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	8M/NcLEsRj+FlvECMzLMigBD/zG81chYyCp7F5PFqCA=; b=I4cOk3eMOhM/v4Xp
	5RtQeHaUhKll9ZmTN6E5LFmSwRtwcNMlvvcT1YUa2SlAYUhGLZOr8voWFr+WZ81b
	C5G4HQmoMVP7tGdQfIwTxO7tYucZFxEANGZOPZKIW/Jw0BbqIouH3K5xG43brGa/
	ZOdrBXZSEj/dsob8ZE8l9vx72ub1rOMYwPFgqVAHmna5Lli4/I9+MnaFPl6lZ7yU
	EDPZxyR8ugSAfM+QpKmQAhDnc2DDqGEiip1GRTyevuj8MH1BiJk/+GwwHpjbPtnk
	gXHlsB7aUGn9Ly7Bfs4r6iN/MRnmccl8apBvTTsBMOP3bKhaDBFz8WCS2Gk9WfIH
	EPT+SA==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4041car1hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 18:29:48 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 461H0Fsv024077;
	Mon, 1 Jul 2024 18:29:47 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 402ya38b0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 18:29:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 461ITi7325035476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2024 18:29:47 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3C5258054;
	Mon,  1 Jul 2024 18:29:44 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CF9A5803F;
	Mon,  1 Jul 2024 18:29:44 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  1 Jul 2024 18:29:44 +0000 (GMT)
Message-ID: <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
Date: Mon, 1 Jul 2024 14:29:43 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TxbAsl9mb4epcgFCGrxx9fVFbeSNOPDy
X-Proofpoint-ORIG-GUID: TxbAsl9mb4epcgFCGrxx9fVFbeSNOPDy
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_18,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010138
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



On 7/1/24 11:22, Jarkko Sakkinen wrote:
> On Fri, 2024-06-28 at 17:00 +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [CCing the regression list]
>>
>> On 20.06.24 00:34, Stefan Berger wrote:
>>> Jarkko,
>>>    are you ok with this patch?
>>
>> Hmmm, hope I did not miss anythng, but looks like nothing happened for
>> about 10 days here. Hence:
>>
>> Jarkko, looks like some feedback from your side really would help to
>> find a path to get this regression resolved before 6.10 is released.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> Sorry for latency, and except a bit more slow phase also during
> July because I'm most of this month on Holiday, except taking care
> 6.11 release.
> 
> This really is a bug in the HMAC code not in the IBM driver as
> it should not break because of a new feature, i.e. this is only
> correct conclusions, give the "no regressions" rule.
> 
> Since HMAC is by default only for x86_64 and it does not break
> defconfig's, we should take time and fix the actual issue.

It was enabled it on my ppc64 system after a git pull -- at least I did 
not enable it explicitly. Besides that others can enable it on any arch 
unless you now change the 'default x86_64' to a 'depends x86_64' iiuc 
otherwise the usage of a Fixes: , as I used in my patch, would be justified.

config TCG_TPM2_HMAC
	bool "Use HMAC and encrypted transactions on the TPM bus"
	default X86_64
	select CRYPTO_ECDH
	select CRYPTO_LIB_AESCFB
	select CRYPTO_LIB_SHA256

https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/char/tpm/Kconfig

> 
> BR, Jarkko
> 
