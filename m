Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5753603E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 10:08:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLX5c3zdNz3bvN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 18:08:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bOZgsQih;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=de.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=borntraeger@de.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bOZgsQih; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLX576ZfDz2yZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 18:07:39 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13F84B5A132058; Thu, 15 Apr 2021 04:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qlxWFtVavXCd/lHzWzSrLnEFhrdIu+gCNQ7cSdIefOE=;
 b=bOZgsQih45h3B+5N6i127n5q0Bt37CffaF1qGurNTvPvvbtRdw6NurRtE3OBov4NbcWg
 No9e2XWo0lZoaTXFPJLkYMS+iJw5+7FwmFQz2q8RarOroiGvm+bUcxOVDV/AnaA+MxhS
 Isrt/JCoG3ub6c6U220wf85bvx7TZTnQVeuWW+FiUz8yqabHlxLadVz8066EFBSQlWbw
 vhWgdkLMxV3wb2XlCl4kuaR3grtYSouRI4Xb9/6NhyjxS9q1MuCx2HKutg3FhtSa4R09
 0U3LYPk/nE0mP8BmWUvLE/a89G1+KCBjYsy1Xl7c+Lr4i5VpdZqVmy0F+06cpG2qGm8Y Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x46utmt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 04:06:53 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13F84VnS133994;
 Thu, 15 Apr 2021 04:06:52 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x46utmru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 04:06:52 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13F85EEK011874;
 Thu, 15 Apr 2021 08:06:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 37u3n8a0dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 08:06:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13F86lP066322744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 08:06:47 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73F1011C050;
 Thu, 15 Apr 2021 08:06:47 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA81411C064;
 Thu, 15 Apr 2021 08:06:45 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.63.231])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 08:06:45 +0000 (GMT)
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <eb623ea6-a2f4-9692-ff3d-cb9f9b9ea15f@de.ibm.com>
Date: Thu, 15 Apr 2021 10:06:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210415072700.147125-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -YMTQ38-A9pZbmNZPcHayMt5HbaIwtug
X-Proofpoint-ORIG-GUID: FIconhLodZz_0nArX8fkTBP6UY0y2BNs
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_03:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104150053
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


On 15.04.21 09:27, Masahiro Yamada wrote:
> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
> scripts/Makefile.compiler"), some kselftests fail to build.
> 
> The tools/ directory opted out Kbuild, and went in a different
> direction. They copy any kind of files to the tools/ directory
> in order to do whatever they want to do in their world.
> 
> tools/build/Build.include mimics scripts/Kbuild.include, but some
> tool Makefiles included the Kbuild one to import a feature that is
> missing in tools/build/Build.include:
> 
>   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
>     only if supported") included scripts/Kbuild.include from
>     tools/thermal/tmon/Makefile to import the cc-option macro.
> 
>   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
>     not support -no-pie") included scripts/Kbuild.include from
>     tools/testing/selftests/kvm/Makefile to import the try-run macro.
> 
>   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
>     failures") included scripts/Kbuild.include from
>     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
>     target.
> 
>   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
>     unrecognized option") included scripts/Kbuild.include from
>     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
>     try-run macro.
> 
> Copy what they want there, and stop including scripts/Kbuild.include
> from the tool Makefiles.
> 
> Link: https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/
> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> Reported-by: Janosch Frank <frankja@linux.ibm.com>
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

When applying this on top of d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")

I still do get

# ==== Test Assertion Failure ====
#   lib/kvm_util.c:142: vm->fd >= 0
#   pid=315635 tid=315635 - Invalid argument
#      1	0x0000000001002f4b: vm_open at kvm_util.c:142
#      2	 (inlined by) vm_create at kvm_util.c:258
#      3	0x00000000010015ef: test_add_max_memory_regions at set_memory_region_test.c:351
#      4	 (inlined by) main at set_memory_region_test.c:397
#      5	0x000003ff971abb89: ?? ??:0
#      6	0x00000000010017ad: .annobin_abi_note.c.hot at crt1.o:?
#   KVM_CREATE_VM ioctl failed, rc: -1 errno: 22
not ok 7 selftests: kvm: set_memory_region_test # exit=254

and the testcase compilation does not pickup the pgste option.
