Return-Path: <linuxppc-dev+bounces-7483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8CA7D7A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 10:23:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWMfJ1Y2rz2xlK;
	Mon,  7 Apr 2025 18:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744014184;
	cv=none; b=NQPISYVnCFtK2xN0Kkbg4DMY9SfIS2lm3E1o2UUebI358B/wEu83VAEWuXUzPErHKAJn5Zd7ELhE46eqGxHsfjPmoJtC+PYw6F6etO8w4U3O/9sgDkudwOfa+YWLYmOksipthAG2YHM60UXu6mm29BBYLmA+WDgnBvxeLvIyFGmlKsKhUuqw1d8lVthBQom5G7hsViwIwQL07bxGKd+xh0tDoHlkA60wroS8LAAx4ncAlG4xVVNno4kPrKG7zwDA0Z7sngnAFOfzGNnGVYtrTCZKvh2n5ZXhlq3ZaZhr5DMUGoa6NW1fjZ0BHy+nns+0VsQ2qw+RX/+mvZdVlQ/IWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744014184; c=relaxed/relaxed;
	bh=YPtmPmzERDzlYoBQcUrZt2+qPqu0w63jn9JnwFB5X38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7Q15ex/Ju2T4TNRSdtM9/cnd8ax2WJrY3etGcOg0hIGBmKTEPq+9gXg+HTe0EIY2znONpP9V7tIb7+NM/ZafKuGILYGIkH8JSDf5FvT2iLqiflBlgvJLihhpoueAgVj4GtO8DPSlKayIBLtBBvp9TTIVgR7vrLqdkhQyZ0qusVBj1Bfr/jnIuyffB1W5c60e2L4JnwH0ErXAdGzzjoJbFdg0McuONwmCvTdCbvsoUEGKHnbLn5nz/VGl99ZX/RkEDHkf+Q+wPgAnHKjAMXQ2o/wS+KUTGK7OP8H0iJS/TYZoY/oPmwlw0nwSMetHY/MLoWAhEeulbMBid84ake7zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eL4oOE+U; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eL4oOE+U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWMfH2JV7z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Apr 2025 18:23:03 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536MGZB3001479;
	Mon, 7 Apr 2025 08:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YPtmPm
	zERDzlYoBQcUrZt2+qPqu0w63jn9JnwFB5X38=; b=eL4oOE+UP5Paq9ymOMhfMI
	0JKnh+QsuVyvf8LF0cOBZ8MJRlNWoZRdC+NJcgZoS9XIgHsvgDP7sh/ppG//kl50
	kRceq5jO2ThMUIVTLYAHMXLjodaCgD7YudErTDGoJvdIeidL15nEs0Tsl+cU8Vbj
	hl9B0Ak4QKjDyiPMMildybCnOjUBcSqWNsoUfaWrlo88QgLk+0SF+NrBO3pw3/uX
	LT/R1sLMDE4CzN1fOwX1t9Xc46pxusCPvEQdtA1Wm3U7O6hDDN7aOoqU3N3O4eET
	CDAOkMYWSBck2UHoJt+F/is3XY0hUV1b5kQb6IDH2SJdPB7a+ndRNX631zsy2ZFQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0u0j5f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:22:38 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53789tS7002583;
	Mon, 7 Apr 2025 08:22:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0u0j5f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:22:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5375GS5M013858;
	Mon, 7 Apr 2025 08:22:36 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45ufuncy22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 08:22:36 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5378MWkQ41812316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 08:22:32 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92D642004D;
	Mon,  7 Apr 2025 08:22:32 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FB4820040;
	Mon,  7 Apr 2025 08:22:28 +0000 (GMT)
Received: from [9.203.115.62] (unknown [9.203.115.62])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Apr 2025 08:22:28 +0000 (GMT)
Message-ID: <81b222ec-7635-411f-b72f-804284295edf@linux.ibm.com>
Date: Mon, 7 Apr 2025 13:52:27 +0530
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
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAPhsuW5yBLMPJy3YNoJKUfP+BEsKOgJZ_BjrJnyUQ=tMPqC7ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hUVjILF1Tcqp1L0vKDUEync7ugVgzhRi
X-Proofpoint-GUID: kVDfTP40NBM1dQUVNPPWkz3TIKN5O25M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxlogscore=995 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070056
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 04/04/25 12:03 am, Song Liu wrote:
> On Thu, Apr 3, 2025 at 8:30 AM Naveen N Rao <naveen@kernel.org> wrote:
> [...]
>>
>> We haven't addressed this particular interaction in the powerpc support
>> for ftrace direct and BPF trampolines. Right now, live patching takes
>> priority so we call the livepatch'ed function and skip further ftrace
>> direct calls.
>>
>> I'm curious if this works on arm64 with which we share support for
>> DYNAMIC_FTRACE_WITH_CALL_OPS.
> 
> We still need to land [1] for arm64 to support livepatch. In a quick test
> with [1], livepatch and bpf trampoline works together. I haven't looked
> into the arm64 JIT code, so I am not sure whether all the corner cases
> are properly handled.
> 
> [1] https://lore.kernel.org/live-patching/20250320171559.3423224-1-song@kernel.org/

Thanks for checking this on arm64, Song.
As Naveen pointed out, with out of line trampoline
on ppc64le, there are a few things to sort out with
regard to livepatch & BPF Trampoline interaction. Will
try and take a stab at it soon.

Thanks
Hari


