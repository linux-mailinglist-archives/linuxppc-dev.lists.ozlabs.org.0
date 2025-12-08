Return-Path: <linuxppc-dev+bounces-14689-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 578CFCADAE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 17:02:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQ6Fd46L1z2xKx;
	Tue, 09 Dec 2025 03:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765209765;
	cv=none; b=P+ALauE1vqbdHBuqa8F2TQIR/jPCJ/6yjKJKKRX/YQCvbLjxRnyaJedukfEkaxbC9bcG4toDdQMZtwNSUInAQvuikpq/ymPxBtCnAF/03ivEx3vZbvXLQyvBYiqrXzW1JygTJ+GxEZcg3BClb26oDghTF+NSBAAASEdDHZZygCAducyn+qGP5hRIp9EUhvZbUJQaKK8NLXwEjbRpOY1WVRlAzJB7zt1t+Hkj/YaKkDrgsXe53FnMuL0rxhJ/hLC2fk0pmcX0EI6VMPR5GG6gCmOjKOiAATpQH2nUTZvpIJwrXPkHFy0B/WcZ8QkrQ7cdbliOa2kxp0uRrvvBAwn2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765209765; c=relaxed/relaxed;
	bh=gJvuvqYZAgxlLUAE6Fwul06tJ0nrEzvgoC4NvPNaZPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4FMtOU7HE98BM7QvaUTSeVSiwnurwVXgY1RYuJcJJZHdabMnLOyHJT6EqiVi83SGHtv4T5gVyvIsBDbnlTw3Xw9Sg7UkXHa6RE+m1GXemurRZY8rrDTS31LpKXA+ySetwJiSCGfASXL6VQEKEUo1n3BA9+lEAWDoVfrlnJynueWgVYaI5Za8w8PiF3OLRpW9JjDsKkiy0BfKadAq9Mz9Ktav4oDdNgfDfp4Wmjfu5hh9WLws0lsCt3uMRdafURavlFvy/k3mj4nGU2Ozby+MGlDD4Lnavs8PK1AusaCD+hNdM4LBvK13i0Y2SwgKDgz9qH2f4h9cR2gwKz32OhKqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mc/JUntA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mc/JUntA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQ6Fb0XSJz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 03:02:42 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8CxQWL021443;
	Mon, 8 Dec 2025 16:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gJvuvq
	YZAgxlLUAE6Fwul06tJ0nrEzvgoC4NvPNaZPE=; b=Mc/JUntAtkolDIayUvofNT
	/Z47uBofo7NCecwE/3XCmZ6az8Mx67etGfYzx+5yBt8loilmCf5/UImr8DKBlypE
	u3TPgytO4XghhpAPZU2sKtMkq3n2wS1S67vEZb5nEF2j5ZqBAaC3BjSJvHswlZ+N
	oqgo1edMJ30GA07RQwy/h90VQpgkmhJultLrETfqA40gnTH/3yg5u45tRkkke7az
	DwVawEOgD55MsjSPq8oa/4e3Gia7huX1AJiGOz68d1qe8+u4CEv9BexVYp/qK2lb
	kx91wvXNLP0JbmOvFO6qHr3XVeA/BJTSBBx338+3TEWoOxJJRgThlPvd5mD9vpNA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4av9wvgcff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:02:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8Cl6eh026782;
	Mon, 8 Dec 2025 16:02:13 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw1h0x50u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 16:02:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B8G29Wj42402068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 16:02:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88A5920043;
	Mon,  8 Dec 2025 16:02:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90BEF20040;
	Mon,  8 Dec 2025 16:02:07 +0000 (GMT)
Received: from [9.43.1.23] (unknown [9.43.1.23])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 16:02:07 +0000 (GMT)
Message-ID: <8141c6eb-f2b7-4a19-b637-af699bb8d5c4@linux.ibm.com>
Date: Mon, 8 Dec 2025 21:32:06 +0530
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
Subject: Re: [PATCH 1/3] powerpc64: make clang cross-build friendly
To: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-trace-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>, llvm@lists.linux.dev,
        Maryam Moghadas <maryammo@ca.ibm.com>
References: <20251108210405.2375472-1-hbathini@linux.ibm.com>
 <20251108210405.2375472-2-hbathini@linux.ibm.com>
 <rtnn6dd6y3refo7myc4crzmrunbuyabr2ewlyk7oe4yx3f2rl2@wzoyvsucfeyf>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <rtnn6dd6y3refo7myc4crzmrunbuyabr2ewlyk7oe4yx3f2rl2@wzoyvsucfeyf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3VoYZ8OBYWh4UKYG15cGMyvtUlt8UbYU
X-Proofpoint-ORIG-GUID: 3VoYZ8OBYWh4UKYG15cGMyvtUlt8UbYU
X-Authority-Analysis: v=2.4 cv=AdS83nXG c=1 sm=1 tr=0 ts=6936f686 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=9ecn0eQcEfoHkOsjxl0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAwMCBTYWx0ZWRfX20e1KMPfjCzU
 sl1Tls4Skrmeb8cKZrsTRMO82pcOBFOy2K7eaqqzNwgfJxiADrmBb8NqkNw+k8ZVHCDG694L4jJ
 CEkZUevYquiDMYLX1+KSvM0wd5WcEylRDOxRo2G+h5HvYQHv80eYsI14E9GA0Jf16LC3VUmjHuc
 rd/NF48SiutBsbtVVCOcFks53nIG7JMsN2YVnDiFyOp4Fx/+Rf+EGxg9u7DjCVLaN/hU4MsM+aa
 ZPwkO+N6ccEk8by9KSTMq1EVi6GuV6WGgLIqyIOe5hwTA7oy0DnvYKJ7ZikEfWFNC19mqQBYfYr
 Vv3fcotaJ6bZ+AqcbAL7xFQlZ7kFss01JFKy9zrmEtcI8jm/uXRvqp5+hrJ8UOdcGmyUKzDeUtX
 u1h+L3DDvtN1zMnOgRSYLvbSNUNrEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Thanks for the review, Naveen.

On 24/11/25 11:19 am, Naveen N Rao wrote:
> On Sun, Nov 09, 2025 at 02:34:03AM +0530, Hari Bathini wrote:
>> ARCH_USING_PATCHABLE_FUNCTION_ENTRY depends on toolchain support for
>> -fpatchable-function-entry option. The current script that checks
>> for this support only handles GCC. Rename the script and extend it
>> to detect support for -fpatchable-function-entry with Clang as well,
>> allowing clean cross-compilation with Clang toolchains.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig                                         | 5 +++--
>>   ...-function-entry.sh => check-fpatchable-function-entry.sh} | 0
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>   rename arch/powerpc/tools/{gcc-check-fpatchable-function-entry.sh => check-fpatchable-function-entry.sh} (100%)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 325c1171894d..dfb62e211c92 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -568,8 +568,9 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>>   	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
>>   	depends on $(cc-option,-fpatchable-function-entry=2)
>>   	def_bool y if PPC32
>> -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
>> -	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
>> +	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_GCC
>> +	def_bool $(success,$(srctree)/arch/powerpc/tools/check-fpatchable-function-entry.sh $(CC) -target ppc64le -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN && CC_IS_CLANG
> 
> Can you instead pass $(CLANG_FLAGS) to retain the same command across
> gcc/clang?

Should work, I guess.
But do I need to test for any additional clang flags that
may interfere with what we are trying to check here?

- Hari

