Return-Path: <linuxppc-dev+bounces-16892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNE2LNYulGnQAQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16892-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 10:03:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA94214A281
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 10:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFYZn3twNz2yS4;
	Tue, 17 Feb 2026 20:03:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771318993;
	cv=none; b=Tt6tjmREkzKYAWzR3Ki+F4K2+nn7seKEVfVvq+A9SFPQzDNPfB04mI+RZqfXf1WvgvSNYznfS8+g9I8IURN4QEyBRbm5c/pNkU+p4pibXmIOxLGev/5jjrrUC04e1EFI/Ss6BzK/7vlS0XY+CntfJeUpsESOyl62gNqUfhJwE62krg1XYKqq0w23AMWOpWplOhVHyrU3UZLkFHDonOnqOawVig0XNZYxuWGL/U2MPJ0iOWko9hBSBkMOe0YEImd7sXweIUgm4t07/0rTP4LSLTNeRvV7DLiobWjIVwOPxmtdWwXPOwTsdan3y+khxmLynd4kchDu/1N8HWoNXsH36A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771318993; c=relaxed/relaxed;
	bh=+F+FH8uI21Zksyb4nfrJ/qncm6mFAjtPtrLBgWTT+Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hzaUPt3OdvEEk3x06U7o7goay/fPpdbbAaKC8mqfhEoKjOKAb3MThJEGmY2lwomIavF65X50D2IB+ypEzi7Fy5FxvviB1JjgosDcjcUxM28HUn/GsvJ4knLddNbRv0XtVjFMJ+75awvlZC2AgxRmwoofZ/LFoiVCBigT2cxE5GZF7pIm4n3F6RqER0p/yxxqYztdl/ldYv8xhsX4Av32M0R5TMIebm2/Bh940AlYWyUK/7M3VLMJUoiFxSo9tJJfytbheb6I8UBC3AGBhnP67EAz6kY1WF11zjJZTAgGdTvv+EyZrg6ZR1BjDhPkqIdez89oNp6tkH4KDDJpEhcIGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QAcWuu+k; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QAcWuu+k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFYZm14z4z2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 20:03:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GFPbQc3438125;
	Tue, 17 Feb 2026 09:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+F+FH8
	uI21Zksyb4nfrJ/qncm6mFAjtPtrLBgWTT+Vo=; b=QAcWuu+kJ+8BOyxs5xRvHe
	H8GSdq6X4XQv6bGt9O612v70T8QNmG55qtpBRWvZFOdG3mcqhJnPEmrTz9qnuZOR
	ydsnMC/BDxgP7pHH0Kzo8ZhvwismQiw24TynkwexrnSld7VuUrbBKweFr7aem27e
	gh6RbbdffwwrhJwzoQCSmTgKYDsQYrQgx1NarPsfF5rto8f70ya/SuAsn5kSRaDK
	kKkoYF+JNx5Y3X410p85bnEN4OMbFV7vkx8cPZyw5qaJwIaNq6J2ndqSZ2tQtj2j
	UFyyL/JKEgycz2HPzj9eiXMq26xQTN5jm9JYGDYs48oIEckgQkL8DBjqb8BGlN8w
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj4kad9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 09:03:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H8mlph001391;
	Tue, 17 Feb 2026 09:03:05 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2b9stb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 09:03:05 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61H933cY56230192
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 09:03:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB38B20043;
	Tue, 17 Feb 2026 09:03:03 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2592020040;
	Tue, 17 Feb 2026 09:03:02 +0000 (GMT)
Received: from [9.111.58.187] (unknown [9.111.58.187])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Feb 2026 09:03:01 +0000 (GMT)
Message-ID: <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
Date: Tue, 17 Feb 2026 14:33:01 +0530
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
Subject: Re: [Linux PPC] KVM PR and KVM HV do not work if the kernel was
 compiled with PREEMPT
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3MSBTYWx0ZWRfX3lWOIUnx1arH
 8gtHY+X7fs3cqKOdBp2VQJbch83tyYAvddPMwmI3bGvwqrZr7z4izV21NZLxK25gUD017ys3WfG
 6kVMOrwUa+t03zP0NWB6cvuNra6UpqmgtQJIYs/MyJwRP056NsMVC0b6O7uKUplWQ8IruFXCep9
 DxaPI4q/9wfgeCftzIF2SuhEaV1wJYM88uCEyDzkvtjA4B3LPL01GtdTu1tkxYl2zHA8kr5JcD+
 IcGzN+0494LXag518qAzYru8Unv3BMP7S7hHLlms/bIwnvRQhssPXMuxCmzOH5xOOh7+JJ409f1
 cbrLkYT5zruCaHNiXzAFTc707NHFIGCsvkyVk8xZXeHaQjHO3M9vXW01Iw71eKgznA2RmC4c3ZY
 a3whkAUbECYEJf3WelIqZRpOpfAMt4XqQmge56ZM5lhTstKf6GsmtmkMNfnvmW0AsKoJ2y+Fbf6
 C04pR56OZaxIyl0Bbiw==
X-Proofpoint-ORIG-GUID: ZM7EQN83RdhOHsHwF6jxsysFuG2S23Lk
X-Proofpoint-GUID: TDI10gho6kg4nqXO0nTVu-q4rzPq_Ijh
X-Authority-Analysis: v=2.4 cv=M7hA6iws c=1 sm=1 tr=0 ts=69942eca cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=3C8m8oGrICBjaXfL1acA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170071
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16892-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:chzigotzky@xenosoft.de,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DA94214A281
X-Rspamd-Action: no action



On 2/17/26 2:22 PM, Christian Zigotzky wrote:
> Hi,
> 
> Thank you for your patch. I tested the latest git kernel with your patch 
> today. Unfortunately the system freezes while booting the VM with KVM HV.
> 
> Cheers,
> Christian
> 
> 
Would it be possible to share the console log or boot log of KVM to the
point it freezes?

