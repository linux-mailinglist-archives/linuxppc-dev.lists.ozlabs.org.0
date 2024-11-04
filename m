Return-Path: <linuxppc-dev+bounces-2822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB79BAFB0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 10:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhmTX2kf5z2xJ8;
	Mon,  4 Nov 2024 20:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730712752;
	cv=none; b=QUzWu+wh6VuCPfhbaBab2NlSMc00e/0LE1hVzVEZD0uPtP5VRIsturoiv67IpgYDEOvL2LjSq5f84lnZ3AoAsM15Cet1hp5I5XKJlWdM1zcDnkvFXwRIbQ7O1txzlYpaXwqQFL45n3JpjTkjavMHMn2t/CAMTRpYBwK2ArnmRLT8Jz4NsfN3b3IHkrsXW6ukEo7HoVOEXeiMMaP6lcYm4K98WnNYYT8ezEp9oFDXsXQLRGDv3RwNkjUmCSRAxslCrFfQljNNu4RKl5h4G2h4JggJyzP+mvKVdm7dshrWP+IDwn3DTlVJBhGTBhY3J+RJrKJocFY3EVAYoVVkzEzBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730712752; c=relaxed/relaxed;
	bh=vq7XpOrAhxZrEh8MsbbnnyWtsYCcs6v2Cq/ffdk6E8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WtKAZObMfxr276gCsfd0hgO6vhCIocX4vR+FVcgDkiGAgIkOeaQDrJN1c0pc+GAxU269srFtCJb1M+lK5v35MDZYKa95+Ni/THFl7UJ8rHrK5hjDjoXC8WhjR19We40Cz15InAWrhVNEf6UXz/d+1WaKuEYHepkkfHEOk3TBaevVUpHvhmuHyp5eQL0JXSIAaQLwUNo5yJXMcdduILKVsY6p5QWs7cJcLFAk+3aYKe6+PhHmVL9RUWKcZ1TkVKrIAHMPoYiTGzmaUwc6Un/V0doRBTi1kJwNHKtKHpy/c4f8//lSybooXMK0XqjbLxa0LHtvOsED0A+NCbF1IlFiHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mq7F6wDI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mq7F6wDI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhmTW1Y65z2xCp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 20:32:30 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A49A2u0028329;
	Mon, 4 Nov 2024 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vq7XpO
	rAhxZrEh8MsbbnnyWtsYCcs6v2Cq/ffdk6E8s=; b=mq7F6wDIPY2fCWIvAWYB/V
	H8B8dzsTafxhoxYMISXjmlWk+GrlI2OILwkEMYrzpFThbXGFAic9+uLbCKLZsoW6
	bDXL7C7+uI5bCSXimbhepAeYsaYIUUl+nZH/fnQM61YALdfAgXcflhiXG9+HBePp
	5XINDetkGTGZv1YZk2Fqo1rpXuj7GsnDkS9rTcJ+4vq39EWpxJGWAn08+G13BG/5
	6Icbv61a2smRmLVRqMbLDBvJAFYm03Z0QRTjApQUWG+z3zrnVPrz2KTWJ8+2GLNk
	fMOgvbN8Br08Dm68Fpn7PpfF9w5w9pQrx70qiGqgN5OAWqIpzHCEQuLVzOPs3p9g
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42pud7r2hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:32:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A47SfrH008439;
	Mon, 4 Nov 2024 09:32:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywk3br7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:32:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A49WFTi58327538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 09:32:15 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29E0A2004F;
	Mon,  4 Nov 2024 09:32:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B60A2004B;
	Mon,  4 Nov 2024 09:32:13 +0000 (GMT)
Received: from [9.203.115.143] (unknown [9.203.115.143])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 09:32:13 +0000 (GMT)
Message-ID: <d10f4a96-944f-42c4-9886-05dfe831e8fd@linux.ibm.com>
Date: Mon, 4 Nov 2024 15:02:12 +0530
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
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Naveen N. Rao"
 <naveen@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20241101191925.1550493-1-hbathini@linux.ibm.com>
 <20241103135758.5a5f8f0870a139ab1a5bc7b8@kernel.org>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20241103135758.5a5f8f0870a139ab1a5bc7b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aEoJL43cIgdoMF8wJRPvpWSTbRrdj9xw
X-Proofpoint-ORIG-GUID: aEoJL43cIgdoMF8wJRPvpWSTbRrdj9xw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040081
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 03/11/24 10:27 am, Masami Hiramatsu (Google) wrote:
> On Sat,  2 Nov 2024 00:49:25 +0530
> Hari Bathini <hbathini@linux.ibm.com> wrote:
> 
>> For ppc64le, depending on the kernel configuration used, offset 16
>> from function start address can also be considered function entry.
>> Update the test case to accommodate such configurations.
>>
> 
> Hi Hari, so have you met any error on this test case?

Hi Masami,

vfs_read+8 is function entry on powerpc. So, the test case bails out at:
   "check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS"

as it allows setting kprobe "vfs_read+8 $arg*"

> Can you share the error result too?


End of the log file for reference:

"
Test command: p vfs_read $arg* $arg*
[2661828.483436] trace_kprobe: error: $arg* can be used only once in the 
parameters
   Command: p vfs_read $arg* $arg*
                             ^
Test command: p vfs_read+8 $arg*
"

Thanks
Hari

> 
> Thank you,
> 
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>   .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
>> index a16c6a6f6055..c03b94cc5784 100644
>> --- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
>> +++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
>> @@ -111,7 +111,11 @@ check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
>>   if !grep -q 'kernel return probes support:' README; then
>>   check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
>>   fi
>> +if [ "$(uname -m)" = "ppc64le" ]; then
>> +check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
>> +else
>>   check_error 'p vfs_read+8 ^$arg*'		# NOFENTRY_ARGS
>> +fi
>>   check_error 'p vfs_read ^hoge'			# NO_BTFARG
>>   check_error 'p kfree ^$arg10'			# NO_BTFARG (exceed the number of parameters)
>>   check_error 'r kfree ^$retval'			# NO_RETVAL
>> -- 
>> 2.47.0
>>
> 
> 


