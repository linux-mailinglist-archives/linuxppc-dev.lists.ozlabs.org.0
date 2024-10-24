Return-Path: <linuxppc-dev+bounces-2551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0259AEDC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 19:21:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZCPn0920z3bbS;
	Fri, 25 Oct 2024 04:21:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729790492;
	cv=none; b=U5Y7bKyBGg0cMGKiiH1XDjFZOnA1wx7KSe8X7IXNKYvHHScZdDCwWZvlxZ0unUe38of5E96Bup3AiDOy2NXWmmhij4UL1wZVJ+PT5f8kF8t0GhwxGcCk62W/UMRj58G7FjjQ9FSyuUGdzHh8fnN0SFc1Cg/BSmySjCcw0oME5tY0k/xklu8t2iOT453Y5ATrjN2q2W0qoRGumsKbrStYR8iYTpeFh84YTUjOqGn8lS9yOtJ65MVNbas7MoJb1O2eUGknUiW0OBCxg6K+SUfxFnezdyo0SNEJgqi9ptBlC6qr/jF89xjMai5GIyu2jc7K0qUL+XJlxLmEbR4eI/vubw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729790492; c=relaxed/relaxed;
	bh=H+g2opzh46Svkhzx4LlHfQsurYnKEQ+tiYaR6erOphc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kSy+EX337cdmDVFcCPXklDhBZXcJex30flIlMCA1icwRTkw1vBD7KxKVBd5a13vNTlBm4jGO8R+11JfzheOd08PKv4SpzATUmNxZQM7dq6PFdPDkseDeHsuy0TqLJeTQtQYlrRQwJKTIL7osWAtECGv6qsAyFQC93o4Uj9NhD+V0td7gBzoJpTE4hevYa/wP8dgRQDMSHYbXf0aecb7TWx0QQpYYz8FbM8/XZUK/n7uhx1OUfa80TJXQeS635dczyJDJAE42mSItZ81WAnMuiuwUEtukRPnKS8zvQP3UbCOYZuOqhPYhMldNUpqTw4GrO0EupaZ4j9ltKTdn9p1SVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWj6hVty; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MWj6hVty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZCPl1w9Cz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 04:21:30 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OFF8vO016293;
	Thu, 24 Oct 2024 17:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=H+g2op
	zh46Svkhzx4LlHfQsurYnKEQ+tiYaR6erOphc=; b=MWj6hVtyT94abuEvDKwRzg
	vEzfIuRErN0hnAwbRY/TUvt5E34H4VjrsGar4t7xWhlMnz2E9gJrgOepzd1o/DDK
	rxf88/mhlQ6sVC8spJ3dz7FEbULlLMZ8P0XnstAaqA7tca1j7aM5i24B/u7Scai+
	fTey4tJzmOww45iKPwzaYJW4wtd34fatd/6LTAYkcz457PTHbx57ig4y77L3CdiS
	bEk3ZOCFJgAemvfgRLNqfkwlWYokA3redirlvEzgcxP0C3oIIJMHQAUJTRkxGRaC
	yQgd/ucLMXlDwcNRLvrgvTgeNNwV2KDkKbSH+2BjnMPwuhM9T3/q1xjpssqF7qaw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emae23px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:21:08 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49OHL7LF030187;
	Thu, 24 Oct 2024 17:21:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emae23ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:21:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49OEFldL014303;
	Thu, 24 Oct 2024 17:21:06 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42emhfsgyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 17:21:06 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49OHL2LZ46793140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 17:21:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4978420049;
	Thu, 24 Oct 2024 17:21:02 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB36C2004B;
	Thu, 24 Oct 2024 17:20:58 +0000 (GMT)
Received: from [9.43.42.125] (unknown [9.43.42.125])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Oct 2024 17:20:58 +0000 (GMT)
Message-ID: <dce0a201-7e73-44e2-9228-f28973cdd639@linux.ibm.com>
Date: Thu, 24 Oct 2024 22:50:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-12-hbathini@linux.ibm.com>
 <CAK7LNAS9LPPxVOU55t2C_vkXYXK-8_2bHCVPWVxYdwrSrxCduw@mail.gmail.com>
 <beeea05a-7dfc-4506-9f20-7c8a4d1f4c85@linux.ibm.com>
 <CAK7LNATFVmhfQv5Rb=Gkq=fST9+SmSFo_uPi4pB2ckC1qHdkqw@mail.gmail.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAK7LNATFVmhfQv5Rb=Gkq=fST9+SmSFo_uPi4pB2ckC1qHdkqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tPOOaHwjgKOcLfv7t_BLtF8m_99ykuMc
X-Proofpoint-GUID: NsEgD9dkkLJ1l8cofoEq6NuK79WRkVpe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240143
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Masahiro,

On 10/10/24 5:07 pm, Masahiro Yamada wrote:
> On Thu, Oct 10, 2024 at 6:57 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>>
>> On 09/10/24 8:53 pm, Masahiro Yamada wrote:
>>> On Mon, Sep 16, 2024 at 5:58 AM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>>>
>>>> From: Naveen N Rao <naveen@kernel.org>
>>>>
>>>> On powerpc, we would like to be able to make a pass on vmlinux.o and
>>>> generate a new object file to be linked into vmlinux. Add a generic pass
>>>> in Makefile.vmlinux that architectures can use for this purpose.
>>>>
>>>> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
>>>> provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
>>>> will be invoked prior to the final vmlinux link step.
>>>>
>>>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>>>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>>>> ---
>>>>
>>>> Changes in v5:
>>>> * Intermediate files named .vmlinux.arch.* instead of .arch.vmlinux.*
>>>>
>>>>
>>>>    arch/Kconfig             | 6 ++++++
>>>>    scripts/Makefile.vmlinux | 7 +++++++
>>>>    scripts/link-vmlinux.sh  | 7 ++++++-
>>>>    3 files changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/Kconfig b/arch/Kconfig
>>>> index 975dd22a2dbd..ef868ff8156a 100644
>>>> --- a/arch/Kconfig
>>>> +++ b/arch/Kconfig
>>>> @@ -1643,4 +1643,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>>>>    config ARCH_NEED_CMPXCHG_1_EMU
>>>>           bool
>>>>
>>>> +config ARCH_WANTS_PRE_LINK_VMLINUX
>>>> +       def_bool n
>>>
>>>
>>> Redundant default. This line should be "bool".
>>>
>>>
>>>
>>>
>>>
>>>
>>>> +       help
>>>> +         An architecture can select this if it provides arch/<arch>/tools/Makefile
>>>> +         with .arch.vmlinux.o target to be linked into vmlinux.
>>>> +
>>>>    endmenu
>>>> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
>>>> index 49946cb96844..edf6fae8d960 100644
>>>> --- a/scripts/Makefile.vmlinux
>>>> +++ b/scripts/Makefile.vmlinux
>>>> @@ -22,6 +22,13 @@ targets += .vmlinux.export.o
>>>>    vmlinux: .vmlinux.export.o
>>>>    endif
>>>>
>>>> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
>>>> +vmlinux: arch/$(SRCARCH)/tools/.vmlinux.arch.o
>>>
>>> If you move this to arch/*/tools/, there is no reason
>>> to make it a hidden file.
>>
>> Thanks for reviewing and the detailed comments, Masahiro.
>>
>>>
>>>
>>> vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o
>>>
>>>
>>>
>>>
>>>> +arch/$(SRCARCH)/tools/.vmlinux.arch.o: vmlinux.o
>>>
>>> FORCE is missing.
>>
>>
>> I dropped FORCE as it was rebuilding vmlinux on every invocation
>> of `make` irrespective of whether vmlinux.o changed or not..
> 
> 
> It is because you did not add vmlinux.arch.S to 'targets'
> 
> See my comment in 12/17.
> 
>    targets += vmlinux.arch.S
> 
> 
>> Just curious if the changes you suggested makes FORCE necessary
>> or FORCE was expected even without the other changes you suggested?
> 
> 
> FORCE is necessary.
> 
> arch/powerpc/tools/Makefile must be checked every time.
> 
> 
> When arch/powerpc/tools/ftrace-gen-ool-stubs.sh is changed,
> vmlinux must be relinked.

Thanks for the review and clarifications!
Posted v6 with the changes. Please review:

  
https://lore.kernel.org/all/20241018173632.277333-1-hbathini@linux.ibm.com/

- Hari

