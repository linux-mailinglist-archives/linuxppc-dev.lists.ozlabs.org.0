Return-Path: <linuxppc-dev+bounces-1968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F140B9982F7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 11:57:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPQCN52w0z3bkf;
	Thu, 10 Oct 2024 20:57:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728554224;
	cv=none; b=HfD9IRJGB/kTGG22K9VOoDNUO8cNvbcCgvgnPM/btKi8ul3Ce187M5koeoEpArNVF+C+oAsshCB/v3fw9LzTXr4phqVpK6OfuGovefW8KVVL+ffuXtYIZgUrFFhJ98nXNfucGTzPZ1C5/3V/SZUkDx2AkHyzjXj+wRNrts3r8U/jO3RqGDDICHYyiJHfUuaCfaBozQUwUGZmwbhFUycH2jNokn5tkk3uZg/pFfTJOW1iN0TctoEKRAnVPWLrKK6Brr95HBt5A4njt+0TIckF5DeTby2YBp8YUqqTkzvxmBfW+Eu3yhkBWLhGXx+E4yiIaGFN1P0NWOHtCDeFHWCdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728554224; c=relaxed/relaxed;
	bh=q3Ar17ZnhePlLQfTjr+lorYL7JqJXclVExDnbtijseI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezat1OT9y+Ekq3eH2J9FB/xMC+HbNdSm+rVqTer5MOqqfg8XAVLVG5WWL24obGkjb7sa+002WCHRrLkDpbCtghff869oydaR9IsXUSUxgjGYlOMW4iB59c9jRxXlLgHRcgi95cE7OtS2oPQZJoD/dP1JeEcnPPVBtidGFWoOSIAlYnOZpu6i7yMO9hKzEzSRFldofK+e7PZmXSQr7fBwLuU+nMfvn/wy6OmeRttEzOEDOj0KXRZZJNwOYO5DbVJkg8EII0i9NYXyINciLsREgOaaTXOyM8Guw77xqR9fAVFvGvqqTTP8uPNs9q6cjIruDUabCoAZy1hgqVHNGTRIFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOwMQKqp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOwMQKqp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPQCL6JSzz3bjq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 20:57:02 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A9J5mA032450;
	Thu, 10 Oct 2024 09:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=q
	3Ar17ZnhePlLQfTjr+lorYL7JqJXclVExDnbtijseI=; b=UOwMQKqpQucUEgWDZ
	sqhqcNShv+z9VerWOPQtuRkXQmw3Zq1de00G2T2hTBWdilQ/0tB/LJbX1eDP7ZkT
	QIV2gxeDNJOD7lsWh66OWYSqQlQwFcw8iyzDa4eTtVc2eXdZMH2E11LxfV7LzcVb
	YxN2r8rY7uxJrtWe/D59OqABmFdBvwowTICQxQoNvvfValqiD7JfH2YRmnT6MKaI
	ZfM0wicahL0oeQn+SkY3KGY7n+DZ9sRTX77+DRMVSkkmjbUBt29+0tUUvl0X9flm
	tpMRyGo6iEaz/MXdiT7hvccGOD/5BBgNvXoD+cCeeap/2GFyyqwEt/cb1VFUtVWM
	86oEw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426c6fr589-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:56:40 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A9ud5X009096;
	Thu, 10 Oct 2024 09:56:39 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426c6fr585-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:56:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49A7IHed022867;
	Thu, 10 Oct 2024 09:56:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 423jg16qqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 09:56:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49A9uYsT37159264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 09:56:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADE732004B;
	Thu, 10 Oct 2024 09:56:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37A2720040;
	Thu, 10 Oct 2024 09:56:31 +0000 (GMT)
Received: from [9.43.111.131] (unknown [9.43.111.131])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Oct 2024 09:56:30 +0000 (GMT)
Message-ID: <beeea05a-7dfc-4506-9f20-7c8a4d1f4c85@linux.ibm.com>
Date: Thu, 10 Oct 2024 15:26:30 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
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
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAK7LNAS9LPPxVOU55t2C_vkXYXK-8_2bHCVPWVxYdwrSrxCduw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7IbZoMAePHWk5dsGsKv-k9M1do2Lo13b
X-Proofpoint-GUID: StUHlrh169O9lS9A_wENg5YC2q5GXph6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_07,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100065
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 09/10/24 8:53 pm, Masahiro Yamada wrote:
> On Mon, Sep 16, 2024 at 5:58 AM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>> From: Naveen N Rao <naveen@kernel.org>
>>
>> On powerpc, we would like to be able to make a pass on vmlinux.o and
>> generate a new object file to be linked into vmlinux. Add a generic pass
>> in Makefile.vmlinux that architectures can use for this purpose.
>>
>> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
>> provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
>> will be invoked prior to the final vmlinux link step.
>>
>> Signed-off-by: Naveen N Rao <naveen@kernel.org>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>
>> Changes in v5:
>> * Intermediate files named .vmlinux.arch.* instead of .arch.vmlinux.*
>>
>>
>>   arch/Kconfig             | 6 ++++++
>>   scripts/Makefile.vmlinux | 7 +++++++
>>   scripts/link-vmlinux.sh  | 7 ++++++-
>>   3 files changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index 975dd22a2dbd..ef868ff8156a 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -1643,4 +1643,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
>>   config ARCH_NEED_CMPXCHG_1_EMU
>>          bool
>>
>> +config ARCH_WANTS_PRE_LINK_VMLINUX
>> +       def_bool n
> 
> 
> Redundant default. This line should be "bool".
> 
> 
> 
> 
> 
> 
>> +       help
>> +         An architecture can select this if it provides arch/<arch>/tools/Makefile
>> +         with .arch.vmlinux.o target to be linked into vmlinux.
>> +
>>   endmenu
>> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
>> index 49946cb96844..edf6fae8d960 100644
>> --- a/scripts/Makefile.vmlinux
>> +++ b/scripts/Makefile.vmlinux
>> @@ -22,6 +22,13 @@ targets += .vmlinux.export.o
>>   vmlinux: .vmlinux.export.o
>>   endif
>>
>> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
>> +vmlinux: arch/$(SRCARCH)/tools/.vmlinux.arch.o
> 
> If you move this to arch/*/tools/, there is no reason
> to make it a hidden file.

Thanks for reviewing and the detailed comments, Masahiro.

> 
> 
> vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o
> 
> 
> 
> 
>> +arch/$(SRCARCH)/tools/.vmlinux.arch.o: vmlinux.o
> 
> FORCE is missing.


I dropped FORCE as it was rebuilding vmlinux on every invocation
of `make` irrespective of whether vmlinux.o changed or not..
Just curious if the changes you suggested makes FORCE necessary
or FORCE was expected even without the other changes you suggested?

Thanks
Hari

