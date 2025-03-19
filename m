Return-Path: <linuxppc-dev+bounces-7217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A658A68C38
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 12:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHnK64SNvz2yy9;
	Wed, 19 Mar 2025 22:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742385482;
	cv=none; b=Wedzew6Ee6jHwLQIlcCFWI5yGCW6TD5u3NH6KVhP96+8GqLWZ5UKR/f9pf03OgzHZGAg7TylsoGZc2a21mBBkwdO4gYhibFFGwYAFfwl7KpejnTrRGV3nlOix5HvWvrf7hvALcanEMsEBkqPQoJSLA4o+rHFBeWdnXqZ1MxcQT/HQ6iSMJKdrqveGYqPmuXl4CZpGTun4VoMKw3vys29KufruNxvMmFi3CsHxnB2DG96cpVDrKr+KUOjC4wj8G+zUdgTRlMXiKECATkFlvZQwujmZaFuKqAKawBbqvMAEfwjkf7fPQ3mYen1517sEIz1U19tj75SOsJisuadL2xTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742385482; c=relaxed/relaxed;
	bh=qlFmJJzfVW5FdZniI+1Tl9MAgv8xIgfG5CF9EPPXOPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FEDfpIMsBFhUyqw/Szui3KkmCThnwe5VFVSPvJjrJIJfYVfwQRE9e7Kd5XB3ykqX4dM/EDD+FrgWGtmHCIqK7CIXyATg8YT99RovM6lrdQ5KcxEimeyMPTveRB345+IE9PBdO87fufDhfHpO+ayMklv2UhsIzuhASsnPeX/ktVZj2FBshdp/8onzAyT2nj6sm7cBb9uiw07EvKi/wqjtuYpOR7P50L0GteMLWs9nkK46uIoJtVsIbpVfj+9Atm5X4sYLeKZ7+0U3LeJvCL9P8MQanDJvK/Tx0oARZvPoDxZmfXXGFJzvIz4BtsnayflDUt7rjS+jOqcTx+NIsgoKEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tHQ6TdYj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tHQ6TdYj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHnK54qBTz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 22:58:01 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J9FuFc008033;
	Wed, 19 Mar 2025 11:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qlFmJJ
	zfVW5FdZniI+1Tl9MAgv8xIgfG5CF9EPPXOPQ=; b=tHQ6TdYjLsnx/Ad/soVz7k
	y1B7QK99/+OYgC0CnLhkx6h8NUxKP2CXYRH8/KlQjW9R05U4Q8dehyXwiElvsBeN
	Ua+lNOH2rDeFxcai4ztOhF0/+i8CN8KvlKixv2lWx3FSSHqjKkY7duPV/2210zbo
	lb1K0Ne2N8w8Ev5cm253EaNyrPwtXUkzQZGscXpO7NjS8gqX12+53l+ntn0RQW4Y
	gsYQu7W2rVRoqS2VP08gM1y13yEwMUfKXwU2iyG3y1qT/GusQqkAi2Z+k9BxDZTe
	tvXQT2KEsHFc+ka1f4dOVxG4bdiADIRoK8VVNbP73sJzYLTR/W4pEafPzK0/0ylw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg1ykdgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 11:57:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52JAnHaa023211;
	Wed, 19 Mar 2025 11:57:30 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dp3ks513-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 11:57:30 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52JBvTWC31785534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 11:57:29 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DBEE5805A;
	Wed, 19 Mar 2025 11:57:29 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BD2F58054;
	Wed, 19 Mar 2025 11:57:28 +0000 (GMT)
Received: from [9.61.249.96] (unknown [9.61.249.96])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Mar 2025 11:57:27 +0000 (GMT)
Message-ID: <580bc4d3-9195-4165-8b5b-cc4742d5b528@linux.ibm.com>
Date: Wed, 19 Mar 2025 17:27:26 +0530
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
Subject: Re: [main-line][PowerPC]selftests/powerpc/signal: sigfuz fails
Content-Language: en-GB
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>
References: <5f88a95b-1c8d-4a74-9753-9cdb2e64daf4@linux.ibm.com>
 <87v7s7di56.fsf@mpe.ellerman.id.au>
 <8efb89d6-cae0-441c-909c-3de5574e9058@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <8efb89d6-cae0-441c-909c-3de5574e9058@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7e0Wr8EOeSGAz5CM3kP9a1TrYTBuwfOG
X-Proofpoint-ORIG-GUID: 7e0Wr8EOeSGAz5CM3kP9a1TrYTBuwfOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190083
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

/Resending in proper format./

On 18/03/25 4:20 pm, Madhavan Srinivasan wrote:
>
> On 3/17/25 4:43 PM, Michael Ellerman wrote:
>> Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:
>>> Greetings!!
>>>
>>> I am observing selftests/powerpc/signal:sigfuz test fails on linux
>>> mainline repo on IBM Power10 systems.
>>>
>>> The test passes on the kernel with commit head:
>>> 619f0b6fad524f08d493a98d55bac9ab8895e3a6 and fails on the kernel with
>>> commit head: ce69b4019001407f9cd738dd2ba217b3a8ab831b on the main line.
>>>
>>>
>>> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>
>>> I tried to do git bisect and the bisect tool pointed first bad commit
>>> to: 16ebb6f5b6295c9688749862a39a4889c56227f8.
>>>
>>> But upon reverting the first bad commit issue is still seen. So please
>>> ignore, if the bisection dosent help.
>>>
>>>
>>> Error:
>>>
>>> # selftests: powerpc/signal: sigfuz
>>> # test: signal_fuzzer
>>> # tags: git_version:v6.14-rc7-1-g49c747976afa
>>> # !! killing signal_fuzzer
>>> # !! child died by signal 15
>>> # failure: signal_fuzzer
>>> not ok 3 selftests: powerpc/signal: sigfuz # exit=1
>> That error means the test is timing out and being killed by the test
>> harness.
>>
I increased the timeout from 0 to 120, I still see the issue.

Below are the logs with and with out time out.

# make -j 33 -C powerpc/signal/ run_tests

   CC       signal
   CC       signal_tm
   CC       sigfuz
   CC       sigreturn_vdso
   CC       sig_sc_double_restart
   CC       sigreturn_kernel
   CC       sigreturn_unaligned
TAP version 13
1..7
# timeout set to 0
# selftests: powerpc/signal: signal
# test: signal
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: signal
ok 1 selftests: powerpc/signal: signal
# timeout set to 0
# selftests: powerpc/signal: signal_tm
# test: signal_tm
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# [SKIP] Test skipped on line 58
# skip: signal_tm
ok 2 selftests: powerpc/signal: signal_tm
# timeout set to 0
# selftests: powerpc/signal: sigfuz
# test: signal_fuzzer
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# !! killing signal_fuzzer
# !! child died by signal 15
# failure: signal_fuzzer
not ok 3 selftests: powerpc/signal: sigfuz # exit=1
# timeout set to 0
# selftests: powerpc/signal: sigreturn_vdso
# test: sigreturn_vdso
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# VDSO is at 0x7fffb1860000-0x7fffb186ffff (65536 bytes)
# Signal delivered OK with VDSO mapped
# VDSO moved to 0x7fffb17f0000-0x7fffb17fffff (65536 bytes)
# Signal delivered OK with VDSO moved
# Unmapped VDSO
# Remapped the stack executable
# Signal delivered OK with VDSO unmapped
# success: sigreturn_vdso
ok 4 selftests: powerpc/signal: sigreturn_vdso
# timeout set to 0
# selftests: powerpc/signal: sig_sc_double_restart
# test: sig sys restart
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: sig sys restart
ok 5 selftests: powerpc/signal: sig_sc_double_restart
# timeout set to 0
# selftests: powerpc/signal: sigreturn_kernel
# test: sigreturn_kernel
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# All children killed as expected
# success: sigreturn_kernel
ok 6 selftests: powerpc/signal: sigreturn_kernel
# timeout set to 0
# selftests: powerpc/signal: sigreturn_unaligned
# test: sigreturn_unaligned
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: sigreturn_unaligned
ok 7 selftests: powerpc/signal: sigreturn_unaligned
make: Leaving directory '/root/linux/tools/testing/selftests/powerpc/signal'

# vi powerpc/signal/settings

# make -j 33 -C powerpc/signal/ run_tests

TAP version 13
1..7
# timeout set to 120
# selftests: powerpc/signal: signal
# test: signal
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: signal
ok 1 selftests: powerpc/signal: signal
# timeout set to 120
# selftests: powerpc/signal: signal_tm
# test: signal_tm
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# [SKIP] Test skipped on line 58
# skip: signal_tm
ok 2 selftests: powerpc/signal: signal_tm
# timeout set to 120
# selftests: powerpc/signal: sigfuz
# test: signal_fuzzer
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
#
not ok 3 selftests: powerpc/signal: sigfuz # TIMEOUT 120 seconds
# timeout set to 120
# selftests: powerpc/signal: sigreturn_vdso
# test: sigreturn_vdso
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# VDSO is at 0x7fff8b170000-0x7fff8b17ffff (65536 bytes)
# Signal delivered OK with VDSO mapped
# VDSO moved to 0x7fff8b100000-0x7fff8b10ffff (65536 bytes)
# Signal delivered OK with VDSO moved
# Unmapped VDSO
# Remapped the stack executable
# Signal delivered OK with VDSO unmapped
# success: sigreturn_vdso
ok 4 selftests: powerpc/signal: sigreturn_vdso
# timeout set to 120
# selftests: powerpc/signal: sig_sc_double_restart
# test: sig sys restart
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: sig sys restart
ok 5 selftests: powerpc/signal: sig_sc_double_restart
# timeout set to 120
# selftests: powerpc/signal: sigreturn_kernel
# test: sigreturn_kernel
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# All children killed as expected
# success: sigreturn_kernel
ok 6 selftests: powerpc/signal: sigreturn_kernel
# timeout set to 120
# selftests: powerpc/signal: sigreturn_unaligned
# test: sigreturn_unaligned
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: sigreturn_unaligned
ok 7 selftests: powerpc/signal: sigreturn_unaligned
make: Leaving directory '/root/linux/tools/testing/selftests/powerpc/signal'

# uname -r
6.14.0-rc7-00069-g81e4f8d68c66

> I tired multiple times with the config shared by Venkat in my P10 LPAR
> and it always passes for me with default timeout as 0.
>
>
> ok 2 selftests: powerpc/signal: signal_tm
> # timeout set to 0
> # selftests: powerpc/signal: sigfuz
> # test: signal_fuzzer
> # tags: git_version:v6.14-rc2-61-g861efb8a48ee
> # success: signal_fuzzer
> ok 3 selftests: powerpc/signal: sigfuz
> # timeout set to 0
> # selftests: powerpc/signal: sigreturn_vdso
> # test: sigreturn_vdso
> # tags: git_version:v6.14-rc2-61-g861efb8a48ee
> # VDSO is at 0x7fff9aac0000-0x7fff9aacffff (65536 bytes)
> # Signal delivered OK with VDSO mapped
> # VDSO moved to 0x7fff9aa50000-0x7fff9aa5ffff (65536 bytes)
> # Signal delivered OK with VDSO moved
> # Unmapped VDSO
> # Remapped the stack executable
> # Signal delivered OK with VDSO unmapped
> # success: sigreturn_vdso
>
>
> Setup: P10 LPAR with 16CPUs, LPAR running only the selftest
> Kernel: powerpc/next (861efb8a48ee), config shared by venkat
>
> Maddy

One key difference which I could figure out so far in the set up is, 
mine is Power10 system running on P11 FW.

I quickly gave a try with P10 system with P10 FW, and issue is not seen.

Logs from P10 system running on P10 FW:


1..7
# timeout set to 0
# selftests: powerpc/signal: signal
# test: signal
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: signal
ok 1 selftests: powerpc/signal: signal
# timeout set to 0
# selftests: powerpc/signal: signal_tm
# test: signal_tm
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# [SKIP] Test skipped on line 58
# skip: signal_tm
ok 2 selftests: powerpc/signal: signal_tm
# timeout set to 0
# selftests: powerpc/signal: sigfuz
# test: signal_fuzzer
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: signal_fuzzer
ok 3 selftests: powerpc/signal: sigfuz
# timeout set to 0
# selftests: powerpc/signal: sigreturn_vdso
# test: sigreturn_vdso
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# VDSO is at 0x7fffae2e0000-0x7fffae2effff (65536 bytes)
# Signal delivered OK with VDSO mapped
# VDSO moved to 0x7fffae270000-0x7fffae27ffff (65536 bytes)
# Signal delivered OK with VDSO moved
# Unmapped VDSO
# Remapped the stack executable
# Signal delivered OK with VDSO unmapped
# success: sigreturn_vdso
ok 4 selftests: powerpc/signal: sigreturn_vdso
# timeout set to 0
# selftests: powerpc/signal: sig_sc_double_restart
# test: sig sys restart
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: sig sys restart
ok 5 selftests: powerpc/signal: sig_sc_double_restart
# timeout set to 0
# selftests: powerpc/signal: sigreturn_kernel
# test: sigreturn_kernel
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# All children killed as expected
# success: sigreturn_kernel
ok 6 selftests: powerpc/signal: sigreturn_kernel
# timeout set to 0
# selftests: powerpc/signal: sigreturn_unaligned
# test: sigreturn_unaligned
# tags: git_version:v6.14-rc7-69-g81e4f8d68c66
# success: sigreturn_unaligned
ok 7 selftests: powerpc/signal: sigreturn_unaligned

Regards,

Venkat.

>
>> That could be due to a bug, but it could just be that your system is
>> overloaded or something. You can increase the timeout in the code by
>> adding a call to test_harness_timeout().
>>
>> The test also includes lots of randomisation, so if you actually need to
>> bisect it you'd want to change the code to use a consistent random seed
>> in the calls to srand().
>>
>> cheers
>

