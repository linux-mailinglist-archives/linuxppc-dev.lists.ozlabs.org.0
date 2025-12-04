Return-Path: <linuxppc-dev+bounces-14606-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A47D8CA4C24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:26:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhJR0LDqz2xHG;
	Fri, 05 Dec 2025 04:26:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764869206;
	cv=none; b=lhjJN0ivZZKCmiTYkp7YN95LXq2mmgAC9sAuc8H364uiVNPGmAdjCMFryqxnJkje9xqpC7EGv78MXw3CBjYPhnBjxSpBOR1QvSNDb9RXNUDoTXCwJMYTnGHw23p6Ru44f+HDALM7LcHNEy8Yoai1aNdEhfE9fP3woTiQw/9uTerpm/CPGQakrPjAaEfLGaRVERbUAyHdNRgmRWZbwSXMsFpPK8nca/7qc4aD0lbsaB1gOurJvIdv9b59jm84Arglta2s3mrFgqk0uTe0MLHrg2cTJjLmsm4IxQBwmBec8kgQwKN+9xFxoZVu1nZMj33FxhiqZUnKfXLkQp5ij6d8dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764869206; c=relaxed/relaxed;
	bh=W210kuiutBYot3cfai1Q0RxqxVdr2WR6ebf8uF16DCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfnzpSWjM/v4aUOl3AK9fyL25aAsiGzQhA/9Ql8IRSGWKpuldn/lTFg15Bk1cSutZjPlNqyIf31AdIzOFS7lNzeXMqfc5UqYhP7CNHIfwirtLyRlpUpP2nMZbJpZCjt7Xm9XzxQKwgE6UtX+OAepfXMrN6HasjvpWE4sMkwyFy2QMTCv+ylYZ+QKAeUSLjJL0y5EX3T2nCYS8F8zJrajDhGr0FxzSzMKeI2nwr5w+AEOeuuwDNiLhYyJqBFwYeDRF2cA2if9hjYFKqOF2ZaTynwlF0HG9g+FCietOPYVPO+D66L1l2wtbcHI3FwrMrRQbiNpLFtu3OeJtKF9KVRAYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BoteA+cF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BoteA+cF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhJP6BLPz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:26:45 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4EkGOj001798;
	Thu, 4 Dec 2025 17:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=W210ku
	iutBYot3cfai1Q0RxqxVdr2WR6ebf8uF16DCk=; b=BoteA+cFgg4nK3+/pfWxj+
	ut75xqyaPGv7PMrJRISYS/6gx+PY8Pcky+moHP6iDGcXjUnMpvTYt+8fd0k2Kxp2
	yLapB1wMMNqlTTWmSH4MPuhz7hJ8Hp+9Ww3EmDBBafCT6ayZM9GGvj7vg/Kkv2ay
	W44RLTTYg8HMGAIi2B8xU/hWGnAX2FPiTzxuMlK2cQQKYO9YuKlzHxClD3OTkTN7
	CKkgdYwDF6m9aGI8eamZ2RQ9J1/XXpTDSV5yle6L2jGIrmZqzYPAjY+ZfpcP2xbn
	xsU9Q5pU8GtATNXTr7qAeasIurWdP2VzpjKxS83FMCC87nu0WWlctRIRbDZ5kg0A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v1513-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:26:17 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HQHIM011421;
	Thu, 4 Dec 2025 17:26:17 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqq8v1511-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:26:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4Fmpps003867;
	Thu, 4 Dec 2025 17:26:16 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardck0txf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:26:16 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HQFtU63308232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:26:15 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C3DA5803F;
	Thu,  4 Dec 2025 17:26:15 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D32E58056;
	Thu,  4 Dec 2025 17:26:12 +0000 (GMT)
Received: from [9.61.104.96] (unknown [9.61.104.96])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:26:12 +0000 (GMT)
Message-ID: <f82d1224-509f-446c-8dee-13e28429b52b@linux.ibm.com>
Date: Thu, 4 Dec 2025 22:54:50 +0530
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
Subject: Re: [bug report] powerpc: per device MSI irq domain
To: Nam Cao <namcao@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
        maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
References: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
 <87qztawmiv.fsf@yellow.woof>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <87qztawmiv.fsf@yellow.woof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nEOq4DFiqSxJ2kcVOFhz59fQfug6-ms2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwOCBTYWx0ZWRfX1CJaxVJPRJXW
 MlP3hw8CKofgEzFcs/0Yo0sHwod+McTfAfUNGb8vrUr7xr5XcBjI78ZLJy6w8c3UGwFVieA2w78
 G0/GzX8MM4yPNQwYyfxbkI/k3HMOLKwfLKiWWjcbzdt5wxLRnReLbWtBUZC8kFSsnaF5dKyWyNS
 sdpWhNc64pB/qxMplpRAxXGnxv38WYITovAS2pgck0VpM3QHeO/IoXPXmRxdLTxgcBa7n4xX4Yf
 TWzy66RarQFv43MibB/E9nOi3Buclszs0LxfdoaM3fIoeShYr2LsjayPuB2xXv5WgPtrzsHjCnh
 EmKqtbjmzco3sPGBfwqHhWk489gwoWloraOcImonG3zbUz+z7tH7mm9ehmZNHtuXFzZzTQVAvpI
 fQe3W0N/9AgC12zbYLudrNClm1JAAQ==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=6931c439 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zBSMDy8UAAAA:20 a=VnNF1IyMAAAA:8 a=N230wxSBAqRhngV6vJ4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: DFG59atyx7KTtWm1UAv5jiClWSFzA5yi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/4/25 4:18 PM, Nam Cao wrote:
> Hi Nilay,
> 
> Nilay Shroff <nilay@linux.ibm.com> writes:
>> I have been using an NVMe disk on my PowerPC system that supports up to
>> 129 MSI-X interrupt vectors. Everything worked fine until Linux kernel
>> v6.18, after which the NVMe driver stopped detecting the disk because
>> the driver probe now fails.
>>
>> After further investigation, I found that the probe failure in v6.18
>> occurs during PCI/MSI-X vector allocation. A git bisect identified
>> commit daaa574aba6f (“powerpc/pseries/msi: Switch to msi_create_parent_
>> irq_domain()”) as the first bad commit.
> 
> Thanks for the report. I can (kind of) reproduce the problem with QEMU.
> 
> I think moving rtas_prepare_msi_irqs() into pseries_irq_domain_alloc()
> should resolve the problem. But I'm not sure because I don't understand
> how RTAS works.
> 
> Does IBM have some documentation describing the RTAS API? I failed to
> google it.

Yes you can find the architecture document here: 
https://github.com/linuxppc/public-docs/blob/main/LoPAPR/LoPAR-20200812.pdf

You may refer section 7 in the above document, which describes RTAS API.

Thanks,--Nilay

