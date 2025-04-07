Return-Path: <linuxppc-dev+bounces-7482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33606A7D76B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 10:17:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWMWH3XGQz2xpn;
	Mon,  7 Apr 2025 18:16:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744013819;
	cv=none; b=g2cpyXUa4ppGPHRlO6Jy3UU/EcStURstItz0rIXQu67hBu9FCdCfLY0YDBwcPf1uWoFpWTd1kZAkW0eQEyya5gC+bJh8OuwA/XWpcR7tzuLXVG6lKniLXlEmmMHo1Hpf++EN4ngdR1vMjppKhscsqA/1fU7tJEp47Pet4onHF7MIWOuCNaIf5C9ADp7w3h0sakprr21wCxUN+dFSMSePbeUtqpF/Be8fpGaCwlGFj6yqvXyaEax1Ce4lQb0Y/Ho1kWiPp0I67ux60l2lCJG8HqaSml54/cGHKZIsUycSkozdYhXRpcWE1GAxb4avTJQTCvefKFpe3A1vgj6/842Hgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744013819; c=relaxed/relaxed;
	bh=nabt4MTzF21qlD7olPmRrgXeKPdV2cuXz31d6xns7pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npCw7XuqKaxoRzHuTuyidSzPeFDs6BpFyVvqx5ZjrlNL+7sfntH+An2TRF8ApfzysU9+hq+vqUbVAIgCJf/7fGL77FuL9DUgtATlkx4nrakgGQ5r3CW0qHqigqNIMPelME4aD2DzNbBAqhzbLUasp/lFVpwMsJYL7CG0SEVN4rPnND8ugqSRBgkJp9jodsvzNqrO9G5oMwD0pMiUdoQkftvzB5k+3+QEJOhlVSpgTa+Z6CQg0s9bFaYCloYUwsqkTE2vNOkT5Bzrk9OyBulQ79rD35BSr8OqnosxbKo6criZEJiF+rVvIG2C2aAnFbP2SjEYZKYQVA76FXMt7uk88g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TfYaQwIs; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TfYaQwIs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWMWF6m11z2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 18:16:57 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536MGZZu028164;
	Mon, 7 Apr 2025 08:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nabt4M
	TzF21qlD7olPmRrgXeKPdV2cuXz31d6xns7pk=; b=TfYaQwIsEXj0+xl/be2u3N
	Sfq6LSaTC8uXkIWwKYeIbOtt9EPT59/boI0gkBhdagb8tMlwJZyI5t4ZK2MYa8z8
	QFK181Ubw/S8LHF6ivpB8U23+daactok/GrDx4KzH0fLYouxkC4O0o4CSbe1Otw+
	vRGk/ZJVOZMQnIfeeCvW8j7KtR5EZIAqdDve1zXY38+Q6dhFW3lSdqU28/92RQY8
	DLzit2IQSqT0DwDGoTb/evs4yVYZ5e8y4cZiVmef+OC9rR1XXxQSju8izu2ooID4
	kdzD5cGAH+NqsAIQBzM4UFu9gub9/fkxMCRCPbEZ5SApxY5wzWQQ7Rt8WrpynErg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswtnvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:16:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5378FFoK018849;
	Mon, 7 Apr 2025 08:16:30 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45uwswtnvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:16:30 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5375iRVK025562;
	Mon, 7 Apr 2025 08:16:29 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ugbkmvda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:16:29 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5378GPIu56623414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:16:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B98A2004B;
	Mon,  7 Apr 2025 08:16:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B555D20043;
	Mon,  7 Apr 2025 08:16:20 +0000 (GMT)
Received: from [9.203.115.62] (unknown [9.203.115.62])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 08:16:20 +0000 (GMT)
Message-ID: <873f3934-e964-49d4-a312-1debb1c77255@linux.ibm.com>
Date: Mon, 7 Apr 2025 13:46:19 +0530
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
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
To: Shung-Hsi Yu <shung-hsi.yu@suse.com>, "Naveen N. Rao"
 <naveen@kernel.org>,
        bpf@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Miroslav Benes <mbenes@suse.cz>,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-trace-kernel@vger.kernel.org, live-patching@vger.kernel.org
References: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <rwmwrvvtg3pd7qrnt3of6dideioohwhsplancoc2gdrjran7bg@j5tqng6loymr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CiVB0C82QOgMH9tKUtHz9g8EIftRWHzy
X-Proofpoint-ORIG-GUID: m4LySXxzR5w3uK0HEcFy_rQKR8xuJbln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070056
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shung-Hsi Yu

Thanks for reporting this.

On 31/03/25 6:49 pm, Shung-Hsi Yu wrote:
> Hi all,
> 
> On ppc64le (v6.14, kernel config attached), I've observed that fentry
> BPF programs stop being invoked after the target kernel function is live
> patched. This occurs regardless of whether the BPF program was attached
> before or after the live patch. I believe fentry/fprobe on ppc64le is
> added with [1].
> 
> Steps to reproduce on ppc64le:
> - Use bpftrace (v0.10.0+) to attach a BPF program to cmdline_proc_show
>    with fentry (kfunc is the older name bpftrace used for fentry, used
>    here for max compatability)
> 
>      bpftrace -e 'kfunc:cmdline_proc_show { printf("%lld: cmdline_proc_show() called by %s\n", nsecs(), comm) }'
> 
> - Run `cat /proc/cmdline` and observe bpftrace output
> 
> - Load samples/livepatch/livepatch-sample.ko
> 
> - Run `cat /proc/cmdline` again. Observe "this has been live patched" in
>    output, but no new bpftrace output.
> 
> Note: once the live patching module is disabled through the sysfs interface
> the BPF program invocation is restored.
> 
> Is this the expected interaction between fentry BPF and live patching?
> On x86_64 it does _not_ happen, so I'd guess the behavior on ppc64le is
> unintended. Any insights appreciated.

As Naveen updated in another thread already, this behavior is expected
as ppc64le does not handle it. Will take a stab at fixing it.

> 
> Thanks,
> Shung-Hsi Yu
> 
> 1: https://lore.kernel.org/all/20241030070850.1361304-2-hbathini@linux.ibm.com/

fwiw, the above patch was necessary for fentry, but the support was
complete with:

  
https://lore.kernel.org/all/20241018173632.277333-18-hbathini@linux.ibm.com/

Thanks
Hari

