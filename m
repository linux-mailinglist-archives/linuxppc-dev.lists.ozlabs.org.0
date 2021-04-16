Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C436197F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 07:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM58C6bnqz3bvP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 15:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K+wZXvqy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=de.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@de.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=K+wZXvqy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM57l2ztTz2yxq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 15:56:51 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G5Y9CV094409; Fri, 16 Apr 2021 01:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mD4JHx4ue4R4SWQTfzp86VvxTxtf2D6eHtp4kBqDp2U=;
 b=K+wZXvqyggiXIVUk43dPMcgg0X1uPV7RmiOlOI2xX7OrAEvYzClF9znpPcf4HWx8C+mk
 QjtPQoVTBN7/jW5PvtKEf0HP2ABacMhpSDBkvMeBR74z+PBVTUWFA+gWCdv2Ilx1RWFI
 6U9IJH8N0NpAFx63mpM/EA5+cC5w9XAIBxBHTX0CdIi0HHtmGUD5uNqW24gbH5T+jhZv
 26m6AxGvR0l0M5cMvbIk5jtSdkhvrfWavBHPPLdmn7VL1QL0dQrGy6hhMkfJafBHNHJd
 Trk95btM0l1Luij2mpU1s8SFwkl9/Vrc0+RVqAZ5oakKsCLr0E5vJCwkyOMKQIO1jZdk 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xvte9u90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 01:56:28 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13G5ZFNE096365;
 Fri, 16 Apr 2021 01:56:28 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xvte9u8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 01:56:27 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13G5rttD011621;
 Fri, 16 Apr 2021 05:56:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 37u3n8j9qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 05:56:25 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13G5u0UG37618172
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 05:56:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80067A405B;
 Fri, 16 Apr 2021 05:56:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D2F1A4054;
 Fri, 16 Apr 2021 05:56:19 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.64.24])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 05:56:19 +0000 (GMT)
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
 <eb623ea6-a2f4-9692-ff3d-cb9f9b9ea15f@de.ibm.com>
Message-ID: <0eeed665-a105-917b-e7fb-8dafe2ae9d94@de.ibm.com>
Date: Fri, 16 Apr 2021 07:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <eb623ea6-a2f4-9692-ff3d-cb9f9b9ea15f@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9iL9uw5JSj46ABaUJ5-OgKR5h6DlkRk1
X-Proofpoint-ORIG-GUID: TiW04LfuFfbrVJq-d80Jlu1KQqPml71C
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160042
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
Cc: Song Liu <songliubraving@fb.com>, kvm@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 clang-built-linux@googlegroups.com, Harish <harish@linux.ibm.com>,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, netdev@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 15.04.21 10:06, Christian Borntraeger wrote:
> 
> On 15.04.21 09:27, Masahiro Yamada wrote:
>> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
>> scripts/Makefile.compiler"), some kselftests fail to build.
>>
>> The tools/ directory opted out Kbuild, and went in a different
>> direction. They copy any kind of files to the tools/ directory
>> in order to do whatever they want to do in their world.
>>
>> tools/build/Build.include mimics scripts/Kbuild.include, but some
>> tool Makefiles included the Kbuild one to import a feature that is
>> missing in tools/build/Build.include:
>>
>>   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
>>     only if supported") included scripts/Kbuild.include from
>>     tools/thermal/tmon/Makefile to import the cc-option macro.
>>
>>   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
>>     not support -no-pie") included scripts/Kbuild.include from
>>     tools/testing/selftests/kvm/Makefile to import the try-run macro.
>>
>>   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
>>     failures") included scripts/Kbuild.include from
>>     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
>>     target.
>>
>>   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
>>     unrecognized option") included scripts/Kbuild.include from
>>     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
>>     try-run macro.
>>
>> Copy what they want there, and stop including scripts/Kbuild.include
>> from the tool Makefiles.
>>
>> Link: https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/
>> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
>> Reported-by: Janosch Frank <frankja@linux.ibm.com>
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> When applying this on top of d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> 
> I still do get
> 
> # ==== Test Assertion Failure ====
> #   lib/kvm_util.c:142: vm->fd >= 0
> #   pid=315635 tid=315635 - Invalid argument
> #      1    0x0000000001002f4b: vm_open at kvm_util.c:142
> #      2     (inlined by) vm_create at kvm_util.c:258
> #      3    0x00000000010015ef: test_add_max_memory_regions at set_memory_region_test.c:351
> #      4     (inlined by) main at set_memory_region_test.c:397
> #      5    0x000003ff971abb89: ?? ??:0
> #      6    0x00000000010017ad: .annobin_abi_note.c.hot at crt1.o:?
> #   KVM_CREATE_VM ioctl failed, rc: -1 errno: 22
> not ok 7 selftests: kvm: set_memory_region_test # exit=254
> 
> and the testcase compilation does not pickup the pgste option.


What does work is the following:
diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a6d61f451f88..d9c6d9c2069e 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -1,5 +1,6 @@
  # SPDX-License-Identifier: GPL-2.0-only
  include ../../../../scripts/Kbuild.include
+include ../../../../scripts/Makefile.compiler
  
  all:
  

as it does pickup the linker option handling.


