Return-Path: <linuxppc-dev+bounces-12638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F514BB50A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 02 Oct 2025 21:45:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd2N15TnCz3cYR;
	Fri,  3 Oct 2025 05:45:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759434353;
	cv=none; b=jJKe+fAHwTkQerZk8xZMv+qLPDcG1p4aFMEoZeC46CfayvUSzd0t3qKQOME0WBBoYHF8Y5Woxvc5D8hZOOyTNeYEh1KIQDZBt4VA+REOzrfsOtP/meCjIvzlUnEiQpG+TSjJzeBoCrb7uba+sYqGUpEBJB5mFOCvKoy63sVFD/YT4/N3IlGGoA7iidTP1OJjL+H9LvCwIIT6ABI32BgS/CfK+6uB/MJ/xDYXX1aZ72U5Zn3mAeasuSn5XDZeUbZjwstnJHHgKbQh6nKMNCdZTFQ+f6JGzgV3bSeVO4FmHtFnw0NOsIg2GcoyiHPoGhz9CC6UIm7sQg0UUPbd0heqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759434353; c=relaxed/relaxed;
	bh=ewK1ePSYf3jGqCYcyiq+2WlrBOsXE5AbjVsfdMR0pas=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=N3jqak86mWdiBqJsAjGcqeSMmEK5BiisFSSsHl3RiwCPtBO23VqI5PP9eIFK938SUQYKtsdN1sblbTYCeWnytX+hrDe1nDArRxSCrsyBiuBqzHqQoPphZtzV4BIpJV1Gwmt3TszAbIytcDCE0GFW/akw1wfyBiLOpjHWFtFpfzGjZUXuZuWbu98zEWaB5Zr9UeChm6Sd+zUMtFWpZ0JesMZERwjPJ3Xg1VBOg7k2Ce7FPIQ9IyjOcEyFCzxvH/KLpjHBYSpa47qiSMEFl0W3+fNetyNiMcsLxZGzpdOXfc/KPMKduAJud8y9riizLQrpUq1IfQfWiTz2S4GYnzqKNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pkSgTccK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pkSgTccK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd2N071n1z2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 05:45:52 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592GgNWU024032;
	Thu, 2 Oct 2025 19:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ewK1eP
	SYf3jGqCYcyiq+2WlrBOsXE5AbjVsfdMR0pas=; b=pkSgTccKovaw2tisNbkI1U
	R2jWSJ9OeXM9zo0RlU7Q19cAmS6nyWhqvJLGi7ITGb9NxtRrOeoUgScJYHiBe9s+
	J87INWkWOQCcQsDtYnAvbf6NMXCihITrUyPcy1lBS5ZMA9/6oUf6lQ6GzSYyILVi
	xemJ7kqA5JklmEEW3klMnR6cWCnkPX7vOl4ZGTtPfdi7nsmQIZgqTcygODIRMeBX
	eaI8JtNq0fKxWQnrwEQ+uoktkSpPkacRVLJIUXDpurZfr7clgG/58yWF3dqxMmZi
	qFT0uEI+VvaM6AK/PJJQJb1GuA1e9rEPKS7Atqsdy2mrdRFEQ7GjEkUWpfuVrCIA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7n87fty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 19:45:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 592JjMxw008671;
	Thu, 2 Oct 2025 19:45:22 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49e7n87ftu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 19:45:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 592J7dJC003784;
	Thu, 2 Oct 2025 19:45:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49etmy7ss4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Oct 2025 19:45:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 592JjHAG49283566
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Oct 2025 19:45:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 061C120043;
	Thu,  2 Oct 2025 19:45:17 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57AE720040;
	Thu,  2 Oct 2025 19:45:12 +0000 (GMT)
Received: from [9.43.110.151] (unknown [9.43.110.151])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Oct 2025 19:45:12 +0000 (GMT)
Message-ID: <c7c3936c-7be5-4b8f-8766-b4b156ac0390@linux.ibm.com>
Date: Fri, 3 Oct 2025 01:15:11 +0530
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
Subject: Re: [BUG?] ppc64le: fentry BPF not triggered after live patch (v6.14)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Song Liu <song@kernel.org>, Naveen N Rao <naveen@kernel.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
        Shung-Hsi Yu <shung-hsi.yu@suse.com>, bpf@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
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
 <20250331100940.3dc5e23a@gandalf.local.home> <Z-vgigjuor5awkh-@krava>
 <xcym3f3rnakaokcf55266czlm5iuh6gv32yl2hplr2hh4uknz3@jusk2mxbrcvw>
 <CAPhsuW5yBLMPJy3YNoJKUfP+BEsKOgJZ_BjrJnyUQ=tMPqC7ag@mail.gmail.com>
 <81b222ec-7635-411f-b72f-804284295edf@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <81b222ec-7635-411f-b72f-804284295edf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: K1S-EC2brolSkpXUCmpj3sYic-zjulfU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyNSBTYWx0ZWRfX1lc2mTk/D2eV
 ZpJbKthFGjOy8Wi3hQQNUKcwRR6uA21Jx/WlqB4CFZYlbKyY6mpHpGKg7TCq+mKarndlpaJGO2p
 ybsJexnd+XOTZJ5bUowtJKagWUmY9ixns/JwTKeu4S4EPOyqWvzikfRCs1SOjZ/TfBuyLemT0Fl
 hmpSlTogLnhl1zDq0Xp8JvgJnD3/RpVrQdStswSl9tmnAcf/CPLVO+z9eX4ijU6Ocf4eqyHl4Yh
 IIHEAitA+N1VuupqTg3Xt6ZzDDoHmMLa8audg7/x4qTUnTHdUadjrwAsDbEaEZ2Z2jYnKIZGYwh
 9lKRl/S3f7ep14zDxCpf1XtJaz8AZ8UxzP90cmTSnsV+oQIlvKp7hN5d+eJyE/Q3tLjWcz2IHDS
 EuZtmXbcQtLvAWLph5ytUuV3/D2sqw==
X-Proofpoint-GUID: u1mB30mAIWFEhLat6GXj0HPBTNZO9gvk
X-Authority-Analysis: v=2.4 cv=T7qBjvKQ c=1 sm=1 tr=0 ts=68ded653 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=c84sZwiEPmgdPDJChn4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 07/04/25 1:52 pm, Hari Bathini wrote:
> 
> 
> On 04/04/25 12:03 am, Song Liu wrote:
>> On Thu, Apr 3, 2025 at 8:30 AM Naveen N Rao <naveen@kernel.org> wrote:
>> [...]
>>>
>>> We haven't addressed this particular interaction in the powerpc support
>>> for ftrace direct and BPF trampolines. Right now, live patching takes
>>> priority so we call the livepatch'ed function and skip further ftrace
>>> direct calls.
>>>
>>> I'm curious if this works on arm64 with which we share support for
>>> DYNAMIC_FTRACE_WITH_CALL_OPS.
>>
>> We still need to land [1] for arm64 to support livepatch. In a quick test
>> with [1], livepatch and bpf trampoline works together. I haven't looked
>> into the arm64 JIT code, so I am not sure whether all the corner cases
>> are properly handled.
>>
>> [1] https://lore.kernel.org/live-patching/20250320171559.3423224-1- 
>> song@kernel.org/
> 
> Thanks for checking this on arm64, Song.
> As Naveen pointed out, with out of line trampoline
> on ppc64le, there are a few things to sort out with
> regard to livepatch & BPF Trampoline interaction. Will
> try and take a stab at it soon.

Sorry, couldn't get to it sooner.
Posted the change that fixes livepatch & BPF trampoline
interaction in powerpc upstream now. Please take a look:

  
https://lore.kernel.org/all/20251002192755.86441-1-hbathini@linux.ibm.com/

- Hari

