Return-Path: <linuxppc-dev+bounces-13554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F15CC200E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 13:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy3cB2Y2Lz30V1;
	Thu, 30 Oct 2025 23:40:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761828026;
	cv=none; b=LeIZ1HBKMjTOpuKGg+x43KatBcO2lDHBt2YFt44CPMoeSvhJmrm4KFaiLBiHzn8mhUvjKzmF9FRrJ8ookXPPkNRrFJZhYqwsFSbbdz4Ur81S8sRQjCGjJDtpBZelL+tO/tTT0zGBeGfT5nRMM4b18yDibYqhOnJx8zcBN9UWj7Yjs3TO1jXzS9ynSVqw+nCaBAoRKjupgJXuwYg1f/Hnkl0WvewcEMI2fAqXDHcyLFO2psZZ/zJH335+NaQuhyxqsHqGnYflwvyCBmmJDOHlvHSBf+3YEOzNSOlLwPAxTT9n8i1+8R0E4NEMGuUDCHwbs6bCZY2H6aIqavSP+unHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761828026; c=relaxed/relaxed;
	bh=8r2Luk2NHJWKvIX+RnBPPSWak+4eqo0ePowxoc98Skk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUn8Q6zhcPygnnNajFcR758EvyKFZEdINB+TdmNutLt+oBJGdK7p3K+TAV0JM0Ym930D3dhX0NKFiC0XdktEHRNIdAXEtjGRQ4k6T2yf7Q/EhNHzrUo8jFFkdRdqjO0bfW7D7iwaPZQgoUeJe+CiiPY63VzFxvJ/MAZ8G0vlVEEajX6RnPgF3+aMF4xQvKBoH7u/rwISRGzK7nKh06qelBVbV3O/DdaCRTEC4+wQbCguqwzM4eWnpNCfp9DjWWFi+2/Eb4+5IcHM7N5qoCyKxZ0R6qGemDHdqhzGgEYJFrF8vl3U9caFIx8NUpGPJckZddbRwNyMzC0gTZ9x3y8iQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iab3et7Y; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Iab3et7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy3c90978z2yrX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 23:40:24 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59TM1ATb019585;
	Thu, 30 Oct 2025 12:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8r2Luk
	2NHJWKvIX+RnBPPSWak+4eqo0ePowxoc98Skk=; b=Iab3et7YKOKkc/REPq2Rbc
	Jk2IN/YpmnVrc2tX2+KzSMymuMH6xZRrKtdT9jZLrwY59xEtwnHK5BWbA1czTpNn
	0XbOclrFdp82iRcq1dgkmRsSVKDg7gPHSNJ/CMVYN8FxFRPiAj+M3+lDOQ7SAoK0
	zW/Wh1esLdUxHLtHRogzJNJZ/qj/9EFGd2seCO9LD7tzPS83xyIPi8Jz49lAw4io
	2LlOxx0ALb8jiJqNDb3Ywxwxo+eo5yAD1oVP/OLVkoOkNj4VwrU86vQd3X0Nw7u4
	rJNSEDkeetUjDKPHuAlD6eMOMoOW9T+0hKOkjmUsqS2IdlGsEc2HmLJO90DWRCsg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34agr4rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 12:40:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59U9h6CV018751;
	Thu, 30 Oct 2025 12:40:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33xwgmfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 12:40:10 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59UCe7nL57016662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 12:40:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4819920043;
	Thu, 30 Oct 2025 12:40:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DE7C20040;
	Thu, 30 Oct 2025 12:40:05 +0000 (GMT)
Received: from [9.43.108.211] (unknown [9.43.108.211])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Oct 2025 12:40:05 +0000 (GMT)
Message-ID: <7f461974-7fdd-422f-b4fe-e65af50b0728@linux.ibm.com>
Date: Thu, 30 Oct 2025 18:09:54 +0530
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
Subject: Re: [next-20251022] Kernel Boot Warnings at
 arch/powerpc/kernel/trace/ftrace.c:234
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, joe.lawrence@redhat.com,
        Naveen N Rao <naveen@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <72469502-ca37-4287-90b9-a751cecc498c@linux.ibm.com>
 <cdf7c458-b28f-4657-8708-1f820369baa6@linux.ibm.com>
 <aPjW3P2AU7L71S-s@pathway.suse.cz>
 <ee9aaeec-23bf-42ac-8a8d-4ba899cfdd13@linux.ibm.com>
 <aPnxlEkV1rL0hWOm@pathway.suse.cz>
 <875b21ae-c30f-4dff-bef2-e41965013416@linux.ibm.com>
 <wxqithrj3vvgbefr7d7afv5vcnuu2ssuzrw6fqtmdjtq3ete3j@pfsgyacqjama>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <wxqithrj3vvgbefr7d7afv5vcnuu2ssuzrw6fqtmdjtq3ete3j@pfsgyacqjama>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=K+gv3iWI c=1 sm=1 tr=0 ts=69035cab cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=0Gqk-NYDlX5IHisLGrAA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 4fLOi9r2Zk4hTCA0MNtVNFeycqIoPwlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX/ahDmW26sAB0
 jX6wAbsomBIx+sDAbMb0FEmH0srkrVA7j47h76+uY4d4fScZG8yMRFYUvJkhcJqxXoDR+WpoPrs
 PnbIbCuq4bZZWtzqGw1A0P+XgwJFb653q70I4zPFcdwyltiMzYszc590Go+57j+E1sn4WtalmS9
 GT0fOeOZtBKDYqCM7/RZUrocPLx/YWgpSPGuqEpcqQ/uk6VRbIBhec9lztf9+1e3e+RMx9a+6Qp
 0WvGA3VGmiHiyqFZr2VYTrJMtpiDLzI5YvigBBMVAF+R1BPkjG22ml86T/FqL0SRGWXCi/gmXsl
 46qxj69gFaJAjtwQLrLMIQD4vXmq+3HQf4QlZUQZfND+8cllU1foiUw2Dm7tDQkTvoxLKfC/y6O
 Xe1C6F6T9v0FHzgEpjMIePv3FBcUOg==
X-Proofpoint-GUID: 4fLOi9r2Zk4hTCA0MNtVNFeycqIoPwlj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Josh,

On 30/10/25 7:36 am, Josh Poimboeuf wrote:
> On Wed, Oct 29, 2025 at 11:42:54PM +0530, Hari Bathini wrote:
>> Hi Petr,
>> On 23/10/25 2:42 pm, Petr Mladek wrote:
>>> On Wed 2025-10-22 19:56:45, Venkat Rao Bagalkote wrote:
>>>>
>>>> On 22/10/25 6:36 pm, Petr Mladek wrote:
>>>>> On Wed 2025-10-22 17:36:18, Venkat Rao Bagalkote wrote:
>>>>>> On 22/10/25 1:52 pm, Venkat Rao Bagalkote wrote:
>>>>>>> Greetings!!!
>>>>>>>
>>>>>>>
>>>>>>> IBM CI has reported kernel boot warnings with next-20251022 kernel. I
>>>>>>> see there are couple of warnings hit and eventually system boots to
>>>>>>> emergency mode.
>>>>>>>
>>>>>>>
>>>>>> With the identified first bad commit, is casuing the kernel to boot to
>>>>>> emergency mode. I reverted the bad commit and built the kernel, then kernel
>>>>>> is booting fine, but with boot warnings.
>>>>> I guess that it is the same problem which should get fixed by the patch
>>>>> https://lore.kernel.org/r/e52ee3edf32874da645a9e037a7d77c69893a22a.1760982784.git.jpoimboe@kernel.org
>>>>
>>>>
>>>> Thank you Petr, for pointing to the fix patch. It fixes the kernel booting
>>>> to emergency mode.
>>>
>>> Great.
>>>
>>>> But boot warning still persists.
>>>
>>> I looks like another problem. I would expect that it is in
>>> the ftrace code, either in the generic or arch-specific part.
>> Yeah. This is part of arch-specific code that does init of ftrace
>> out line stubs. The problem seems to be since commit 1ba9f8979426
>> ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and related macros").
>> Before this commit, .text.startup section was featured in INIT_TEXT
>> but now it seems to feature in TEXT. Is this change right/intentional?
>> If yes, I can post a fix patch in ftrace arch-specific code accordingly.
> 
> Ah, I wasn't aware of .text.startup.  Apparently it's used by KASAN,
> KCSCAN and GCOV for a significant amount of constructor code, which is
> only called during boot.  So we should try to keep it in .init.text.
> 
> Venkat, does this fix it?

I tried the patch along with
https://lore.kernel.org/r/e52ee3edf32874da645a9e037a7d77c69893a22a.1760982784.git.jpoimboe@kernel.org
It fixes the problems reported. Thanks!

> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 5facbc9946344..9de1d900fa154 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -88,13 +88,29 @@
>   
>   /*
>    * Support -ffunction-sections by matching .text and .text.*,
> - * but exclude '.text..*'.
> + * but exclude '.text..*', .text.startup[.*], and .text.exit[.*].
>    *
> - * Special .text.* sections that are typically grouped separately, such as
> + * .text.startup and .text.startup.* are matched later by INIT_TEXT.
> + * .text.exit and .text.exit.* are matched later by EXIT_TEXT.
> + *
> + * Other .text.* sections that are typically grouped separately, such as
>    * .text.unlikely or .text.hot, must be matched explicitly before using
>    * TEXT_MAIN.
>    */
> -#define TEXT_MAIN .text .text.[0-9a-zA-Z_]*
> +#define TEXT_MAIN							\
> +	.text								\
> +	.text.[_0-9A-Za-df-rt-z]*					\
> +	.text.s[_0-9A-Za-su-z]*						\
> +	.text.st[_0-9A-Zb-z]*						\
> +	.text.sta[_0-9A-Za-qs-z]*					\
> +	.text.star[_0-9A-Za-su-z]*					\
> +	.text.start[_0-9A-Za-tv-z]*					\
> +	.text.startu[_0-9A-Za-oq-z]*					\
> +	.text.startup[_0-9A-Za-z]*					\
> +	.text.e[_0-9A-Za-wy-z]*						\
> +	.text.ex[_0-9A-Za-hj-z]*					\
> +	.text.exi[_0-9A-Za-su-z]*					\
> +	.text.exit[_0-9A-Za-z]*
>   
>   /*
>    * Support -fdata-sections by matching .data, .data.*, and others,
> @@ -713,16 +729,16 @@
>   
>   #define INIT_TEXT							\
>   	*(.init.text .init.text.*)					\
> -	*(.text.startup)
> +	*(.text.startup .text.startup.*)
>   
>   #define EXIT_DATA							\
>   	*(.exit.data .exit.data.*)					\
>   	*(.fini_array .fini_array.*)					\
> -	*(.dtors .dtors.*)						\
> +	*(.dtors .dtors.*)
>   
>   #define EXIT_TEXT							\
>   	*(.exit.text)							\
> -	*(.text.exit)							\
> +	*(.text.exit .text.exit.*)
>   
>   #define EXIT_CALL							\
>   	*(.exitcall.exit)
> 


