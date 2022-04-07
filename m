Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E94F8744
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ9Jh1ytpz3brN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 04:44:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTK+L98k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UTK+L98k; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ9J04RHTz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 04:43:28 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 237Hl2PG028376; 
 Thu, 7 Apr 2022 18:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : reply-to :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=1B5vaK/2hT9I635/FlOuVn7Utgk3f94GU0YT8bfngFs=;
 b=UTK+L98ktYoeUuIc6TAbltMLxXfhfs/1LDz1cl0OWUAvY7tbGgcpyF8fDwEEECqrNK8T
 TwwxjyCyX6zpWsfxQIQbz31GIkNXfgZgf53MH0QvJv92JyKcjOxdu1jThG3gViNmokX0
 Zmzzf42HDRHeGp6N/zhyx6eH0jYuxro8sPsrHMc5Ar60ENa4tz12l37VOu4wKKCAnO78
 UPeQ1CTITVYrI9Xbe+Kiy0prIHDGohkaASjC/SOM+Tl+4jTXJWRfVS62iruRHkr/VndB
 zx0GjvyKPmu3VgOh7bOApZTlI62BIReltwxRwl9Ap7dVc9ptF22wt5GGwu3UVgnEYt91 +g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fa4jwhfbh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:43:24 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 237INGPk017740;
 Thu, 7 Apr 2022 18:43:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3f6e4b2f22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Apr 2022 18:43:23 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 237IhMux30146900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Apr 2022 18:43:22 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF2D3C6055;
 Thu,  7 Apr 2022 18:43:22 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02607C605A;
 Thu,  7 Apr 2022 18:43:22 +0000 (GMT)
Received: from [9.65.241.234] (unknown [9.65.241.234])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu,  7 Apr 2022 18:43:21 +0000 (GMT)
Message-ID: <75f14a30-f1ad-7cdf-a8af-d1fad8647ca2@linux.ibm.com>
Date: Thu, 7 Apr 2022 15:43:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>,
 Segher Boessenkool <segher@kernel.crashing.org>
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
 <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
 <167db0bd-4f10-7751-36a2-fb9ec5b136a7@gmail.com>
 <20220331234433.GB614@gate.crashing.org>
 <CACPK8XcWuFuR0zTj=tqUNZ9aQNVWEeyoDeDUOmUE3_RS_4Whxg@mail.gmail.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <CACPK8XcWuFuR0zTj=tqUNZ9aQNVWEeyoDeDUOmUE3_RS_4Whxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WET__2wLrgd3_KD-9HnkhDWq9p-Uu8l4
X-Proofpoint-ORIG-GUID: WET__2wLrgd3_KD-9HnkhDWq9p-Uu8l4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_04,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070092
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: muriloo@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/6/22 04:08, Joel Stanley wrote:
> On Thu, 31 Mar 2022 at 23:46, Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
>>
>> On Thu, Mar 31, 2022 at 12:19:52PM -0300, Murilo Opsfelder Araújo wrote:
>>> My understanding is that the default cpu type for -mcpu=powerpc64 can
>>> change.
>>
>> Different subtargets (Linux, AIX, Darwin, the various BSDs, bare ELF,
>> etc.) have different default CPUs.  It also can be set at configure time
>> for most subtargets.
>>
>> Linux can be built with compilers not targetting *-linux*, so it would
>> be best to specify a specific CPU always.
>>
>>>> I did a little test using my buildroot compiler which has
>>>> with-cpu=power10. I used the presence of PCREL relocations as evidence
>>>> that it was build for power10.
>>>>
>>>> $ powerpc64le-buildroot-linux-gnu-gcc -mcpu=power10 -c test.c
>>>> $ readelf -r test.o |grep -c PCREL
>>>> 24
>>>
>>> It respected the -mcpu=power10 you provided.
>>
>> Of course.
>>
>>> And that's my concern.  We're relying on the compiler default cpu type.
>>
>> That is not the compiler default.  It is the default from who built the
>> compiler.  It can vary wildly and unpredictably.
>>
>> The actual compiler default will not change so easily at all, basically
>> only when its subtarget drops support for an older CPU.
>>
>>> If gcc defaults -mcpu=powerpc64le to power10, you're going to have
>>> the same problem again.
>>
>> That will not happen before power10 is the minimum supported CPU.
>> Anything else is madness.
> 
> Murilo, does Segher's explanation address your concerns?

The comment:

"Different subtargets (Linux, AIX, Darwin, the various BSDs, bare ELF,
etc.) have different default CPUs.  It also can be set at configure time
for most subtargets.

Linux can be built with compilers not targetting *-linux*, so it would
be best to specify a specific CPU always."

made me think that it's better to specify -mcpu=power8 instead of -mcpu=powerpc64le
because of such compilers not targetting *-linux*.

Did I understand Segher's comment correctly?  To be honest, I don't know
how much concerned we should be about this scenario.

Just for the sake of consistency, if we decide to go with -mcpu=powerpc64le,
then I think we should also change arch/powerpc/Makefile CFLAGS.
Otherwise, we could follow what we already have in the tree and use
-mcpu=power8 in BOOTCLAGS, too.

Practically speaking, either way works for us.  In any case:

Reviewed-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

> 
> I believe the patch I sent fixes the problem that you're worried
> about. It should be compatible into the future too.
> 
> Cheers,
> 
> Joel
> 
>>
>>> It happens that the power8 default cpu type
>>> is compatible to your system by coincidence.
>>
>> No, power8 is (and always was) the minimum supported CPU type for
>> powerpc64le-linux.
>>
>>> In gcc/config/rs6000/rs6000-cpus.def, they are set to different processors:
>>>
>>>      254 RS6000_CPU ("powerpc64", PROCESSOR_POWERPC64, MASK_PPC_GFXOPT |
>>>      MASK_POWERPC64)
>>>      255 RS6000_CPU ("powerpc64le", PROCESSOR_POWER8, MASK_POWERPC64 |
>>>      ISA_2_7_MASKS_SERVER
>>
>> Those can and will change though, over time.  But -mcpu=powerpc64 (etc.)
>> always will mean what the current documentation says it does:
>>       '-mcpu=powerpc', '-mcpu=powerpc64', and '-mcpu=powerpc64le' specify
>>       pure 32-bit PowerPC (either endian), 64-bit big endian PowerPC and
>>       64-bit little endian PowerPC architecture machine types, with an
>>       appropriate, generic processor model assumed for scheduling
>>       purposes.
>>
>>> My suggestion was to explicitly set -mcpu=power8 instead of
>>> -mcpu=powerpc64le.
>>
>> That is implied anyway, it is the minimum supported for
>> powerpc64le-linux.  Using -mcpu=powerpc64le might schedule better for
>> newer CPUs, in the future (but the code will always work on all still
>> supported CPUs).
>>
>>
>> Segher

-- 
Murilo
