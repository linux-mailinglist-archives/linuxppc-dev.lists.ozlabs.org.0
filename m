Return-Path: <linuxppc-dev+bounces-2821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E459BAF84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 10:22:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhmGH4zXPz2xWZ;
	Mon,  4 Nov 2024 20:22:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730712167;
	cv=none; b=lQzM38UGGs7+IYEkjHCwpMPkxMUt/Yx1OenLMKjoIzBactzeto84vJQNXTYZ3p4/VRiND2u+4Dc4ewJACz9BlkvVZ0qNWcHthr/1+IomhX9OrtUe1LN//8ifZcZ3/f6Anc5pMySoeHyHrvd0TRu0cmKM5ebrKMwBkKoMzI9PmlZrpZKgkMq2c80yfrPOfPLfTircnA8NDk8RRmhLm9//NQWVkXm/HP7+ycPpoXJnOqP9dBySbBR/Rnxr5F6dXDbxVSWLG/44ZyIywZbFVkpUZU99Yo0IJhSMqJrzeX2R4IaLaw7SBowY7zCLuuHd/0IKIGfyiSyP4F2NfK6u4qna1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730712167; c=relaxed/relaxed;
	bh=BgtOlUYcexH28p6ZLGkQs9farVzwCdQjbGABQPsJEZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FH0oVVMKXdo5fZrawy3toNN0x6b74BuhJ6K3NfBLsvT4Q+Y12yNBhlhPaYWXBuITnWyZVplDPMVgnnh6eYU+qOKoVegvi+BHCrTgRcp+lgdWPErd7lg0Qckhu0SrP/O8qscL2K+Xew+37Pb/3GZ2It5OOc1KSSsD0vf/FguTOdPLhLB+5YDByeIOrU/dyNyt8pm2biqagnL1tM816V4exObWpvi3wWcVhGPhR3qUd5+d6/qBNdeHD4W9zqXX3TwWM5TnQwtZfLCdw2DvxgRH5nwdUSourkPlH+rtvwQIv0X4G81nq96OfRpmBA0W3U7UWL1dZPRz8KrzSuY6GxWKig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sFRV2jaX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sFRV2jaX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhmGG3lPsz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 20:22:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A489oSP003826;
	Mon, 4 Nov 2024 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BgtOlU
	YcexH28p6ZLGkQs9farVzwCdQjbGABQPsJEZA=; b=sFRV2jaXiqRF9vwmAJSZjR
	J+/ruI5vjVq2OxrsONgqH9P3XR4mPpYZ4kqi/PpzJC/RkMRx0cBSNlpVvHcqqcUJ
	kYeG01cOSREN367acc3bzfVmLNALXmm6OPLy/zT1xbv+Y1LVz4SVAlxAJXdT3BXY
	7RTqSJ33l20fe6ASiyoXRDEgYFsUvluPRHYTr/2KlJia1PrP4CBVv1P9naPMF1MY
	ZmMRpYiejm3C1jufQWwbmlyMUz0TrRHrHCqyt+jVtJ/IAmGxIYQjxsfq2BTNVdvJ
	PA1G+ICOMilXo02uQOzWiqGIu3DZJfsTmFAEoBad9oYDjMQBlg+tmNUBt0q+IvdA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ptgyg9gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:22:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A498xnA032050;
	Mon, 4 Nov 2024 09:22:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nydmhurk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:22:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A49M1aS54788574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 09:22:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FBDE2004B;
	Mon,  4 Nov 2024 09:22:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E51E20043;
	Mon,  4 Nov 2024 09:21:59 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 09:21:59 +0000 (GMT)
Message-ID: <1916cb5c-cb3d-427c-bcf0-2c1b905fd6d1@linux.ibm.com>
Date: Mon, 4 Nov 2024 14:51:57 +0530
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
Subject: Re: [PATCH] selftests/ftrace: update kprobe syntax error test for
 ppc64le
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao"
 <naveen@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
 <20241101205948.GW29862@gate.crashing.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20241101205948.GW29862@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8GtkEmTnIot0mf1svQRW34AKbisKBiaf
X-Proofpoint-ORIG-GUID: 8GtkEmTnIot0mf1svQRW34AKbisKBiaf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411040081
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 02/11/24 2:29 am, Segher Boessenkool wrote:
> Hi!
> 
> On Sat, Nov 02, 2024 at 12:49:25AM +0530, Hari Bathini wrote:
>> For ppc64le, depending on the kernel configuration used, offset 16
>> from function start address can also be considered function entry.
>> Update the test case to accommodate such configurations.
> 
> (This is true for all ELfv2, not just LE.  For the kernel that is about
> the same).
> 
> The LEP and GEP can differ by zero, one, two, four, eight, or sixteen
> insns (where an insn is four bytes).  Four insns is common, yes, but
> maybe you can support all?  See the function symbol's st_other field
> to see what the offset is:
> 0, 1: zero insns, zero bytes
> N = 2..6: 1 << (N-2) insns, i.e. 1<<N bytes
> 7: reserved
> 
> (This is the top 3 bits of st_other, the other bits have other meanings).
> 
> Four insns is common, yes, but by no means the only possibility.

Hi Segher,

Querying for function arguments is supported on kprobes only at function
entry. This is a negative test case where the offset is intentionally
set beyond function entry while querying for function arguments.
I guess, simply setting the offset to 20 (vfs_read is anyway
going to be beyond 5 instructions) instead of 8 for powerpc would
make all platforms and ABI variants happy?

Thanks
Hari

