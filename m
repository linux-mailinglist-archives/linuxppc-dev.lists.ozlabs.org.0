Return-Path: <linuxppc-dev+bounces-15153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6684ACEE48F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 12:13:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djLdl1vwpz2xrC;
	Fri, 02 Jan 2026 22:12:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767352379;
	cv=none; b=br6BwRPXPyyPEU/5Yjb3wZFedwA1bwmQx5+r9SVeJtgicE8SQR3JWgjk1pMlUxT25nbszqVA0o5G/tXHy6GdFOafs+Pyi8Q6obK0mnEVkKOg+Goe3/QFv1mZoz2AuM7L9i2Tr3fSQXARRbtyVMmxoWQLO/EnwnaP0z/KrhBFZe9ug7XgX9JU9TU73Y03f8I0LT/6gBiRBDDR4WWMIjbJjDLouXrl9B3Xi0BNSviDUg+RCG50tVHa2rmeX6Bh80ukmuvxjSGofmBgu/d3RWDj0/CVKnfvsG0qqBo6ps0HQ8w6XXjg5GCqxeYHO+83vFfHZEoW3sV+q9tTtDJDEEMluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767352379; c=relaxed/relaxed;
	bh=wZFKeg0AWfOFcFV4JlnEYmyNYPNS4cAttDy45O2Ydck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vo1lGgD3UB0Td0ivCP8vWi1bQYSS7I3SUlsJFGTRLPCB7fAelxFCnJpSWB2uUqnEuknVrN0lB0Xk02DiOKAVWyZhKek9Sa5YFI+x9UCXD/MxR+RrcivhdhdNO6CVZNiYKM3dnuYO88C5FAi50XtEfR7D9HNXBckClupHwGGov4GygHb8S5WDQA/UaXSdRgFUYqAWcUaNreepUXlGf0pLvWSS1uxMEZLmrn3p1+cC4ePHQkHrF2WxccIP33OxLvEPXUJPcQWNQ+dY3p6zabszHrQi5dcH5CcWxRy9my8sptjcZB0CTTsAgGp+iLR13EijBymkovoglt1TbFqQvwNXLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OHqzWLOQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OHqzWLOQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djLdj5RHBz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 22:12:56 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6020Rjgp005098;
	Fri, 2 Jan 2026 11:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wZFKeg
	0AWfOFcFV4JlnEYmyNYPNS4cAttDy45O2Ydck=; b=OHqzWLOQGvxpgvi9Pf8/pA
	z0b4fZqcpuLOVvCJ4oK4vD3qjwepRk09w/d8GqUXO1A0v/B4c4ZKTnQRRIU5Fpa5
	bG9nS9smKB/dJBWNLGx7mtBDtp97tr8ohKAqCOubLb+Oja0haHnPd+7ps2/Pg2OG
	azT4jx1GIQrGgmpOc5n1aIQ7hqIbHrKKiuowVBI6zNXRCby2tyFYYg0nnNnQ/5Si
	+73pRIBxPucCZWz0FNNw3Jcun6jAC30zgsozx7/6DUB3xaRG60R8IoxUUxwGwdcm
	Ww/hU7/q1xZRD7J0JkKCr+mNvyRnrWyKSs/+kjj/VwUuNHw1oxH4lxeKL/wKms/Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bb46xub3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 11:12:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 602BC8fB028503;
	Fri, 2 Jan 2026 11:12:32 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bb46xub3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 11:12:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6029Urwx012851;
	Fri, 2 Jan 2026 11:12:31 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4basst6ant-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jan 2026 11:12:31 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 602BCTUN62259518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 Jan 2026 11:12:29 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 690BF58057;
	Fri,  2 Jan 2026 11:12:29 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7882A5805D;
	Fri,  2 Jan 2026 11:12:25 +0000 (GMT)
Received: from [9.61.253.170] (unknown [9.61.253.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 Jan 2026 11:12:25 +0000 (GMT)
Message-ID: <813d6b3e-a8ec-479f-b14f-43cb43771824@linux.ibm.com>
Date: Fri, 2 Jan 2026 16:42:23 +0530
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
Subject: Re: [PATCH] powerpc/kexec/core: use big-endian types for crash
 variables
Content-Language: en-GB
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: kernel test robot <lkp@intel.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Sachin Sant <sachinp@linux.ibm.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
References: <20251224151257.28672-1-sourabhjain@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20251224151257.28672-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA5NCBTYWx0ZWRfX4J5mzmztBBHb
 QinZst4FirLQZd5z03f/98Rs0umdh+UyyS7ueLlPfRSsmGoTRlxxlAcSbjWnNQgB9zF3l/yvUBI
 1R73LGwli+KZRFs7A5h0LCcQM+PM6NSCiYGP//OP1IrNMbF4oMoURnFSRynBZLpcQf7QdjBSSLO
 Y+szMtevAfebRoD9C7eLXqMMd3+8Wfa/AfEKuOp0ZSUvl92L/2/8tHfl274pgLboRfFJgpoinQF
 rrxUmsTxhKL5kXp1P18Ziw+5aHih5x3WhdrD4bdiO9l6BFQivvr0R3totS31LZfu6Smf8/R+vx4
 BiZeGzprBAutVCC6bNdaI+5BW/54NZmLrr2ORSvRJgeWegv9jsJayHX4aqpuEgvW29ZOoGQbJL+
 153xyT28IpmUBqoa6QuDwkgs2wQsvWsNknXb5qbKJimXfsEekSSmcjHxgKIKg+0psq94tnHxxts
 w8s7JKnzMhrxCc1bToA==
X-Proofpoint-ORIG-GUID: JQ4-lukfEuW1OlK5Nj0IfM-oI0QSJOXM
X-Authority-Analysis: v=2.4 cv=L7AQguT8 c=1 sm=1 tr=0 ts=6957a821 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=Bei2zcNEShUcUz0PhNAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: a2JfeoqpqvRCu4_Vnk01h9tGO83c_bH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601020094
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 24/12/25 8:42 pm, Sourabh Jain wrote:
> Use explicit word-sized big-endian types for kexec and crash related
> variables. This makes the endianness unambiguous and avoids type
> mismatches that trigger sparse warnings.
>
> The change addresses sparse warnings like below (seen on both 32-bit
> and 64-bit builds):
>
> CHECK   ../arch/powerpc/kexec/core.c
> sparse:    expected unsigned int static [addressable] [toplevel] [usertype] crashk_base
> sparse:    got restricted __be32 [usertype]
> sparse: warning: incorrect type in assignment (different base types)
> sparse:    expected unsigned int static [addressable] [toplevel] [usertype] crashk_size
> sparse:    got restricted __be32 [usertype]
> sparse: warning: incorrect type in assignment (different base types)
> sparse:    expected unsigned long long static [addressable] [toplevel] mem_limit
> sparse:    got restricted __be32 [usertype]
> sparse: warning: incorrect type in assignment (different base types)
> sparse:    expected unsigned int static [addressable] [toplevel] [usertype] kernel_end
> sparse:    got restricted __be32 [usertype]
>
> No functional change intended.
>
> Fixes: ea961a828fe7 ("powerpc: Fix endian issues in kexec and crash dump code")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512221405.VHPKPjnp-lkp@intel.com/
> Cc: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Sachin Sant <sachinp@linux.ibm.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---


Tested this patch, by applying on top of mainline repo and it fixes the 
reported issue.

Please add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Logs:


make -C /root/linux O=/root/build_dir ARCH=powerpc CC=clang W=1 C=1 
CHECKFLAGS="-Wbitwise -Wcast-to-as -Waddress-space" V=1 arch/powerpc/kexec/
make: Entering directory '/root/linux'
make  -C /root/build_dir \
-f /root/linux/Makefile arch/powerpc/kexec/
make[1]: Entering directory '/root/build_dir'
make --no-print-directory -C /root/build_dir \
-f /root/linux/Makefile arch/powerpc/kexec/
ln -fsn /root/linux source
# GEN     Makefile
   { echo "# Automatically generated by /root/linux/Makefile: don't 
edit"; echo "export KBUILD_OUTPUT = /root/build_dir"; echo "include 
/root/linux/Makefile"; } > Makefile
test -e .gitignore || \
{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
make -f /root/linux/scripts/Makefile.build 
obj=arch/powerpc/kernel/syscalls all
make -f /root/linux/scripts/Makefile.build obj=scripts/basic
make -f /root/linux/scripts/Makefile.build obj=scripts/dtc
make -f /root/linux/scripts/Makefile.build obj=scripts
set -e; mkdir -p include/config/; trap "rm -f 
include/config/.tmp_kernel.release" EXIT; { 
/root/linux/scripts/setlocalversion /root/linux; } > 
include/config/.tmp_kernel.release; if [ ! -r 
include/config/kernel.release ] || ! cmp -s 
include/config/kernel.release include/config/.tmp_kernel.release; then : 
'  UPD     include/config/kernel.release'; mv -f 
include/config/.tmp_kernel.release include/config/kernel.release; fi
make -f /root/linux/scripts/Makefile.asm-headers 
obj=arch/powerpc/include/generated/uapi/asm \
generic=include/uapi/asm-generic
make -f /root/linux/scripts/Makefile.asm-headers 
obj=arch/powerpc/include/generated/asm \
generic=include/asm-generic
set -e; mkdir -p include/generated/uapi/linux/; trap "rm -f 
include/generated/uapi/linux/.tmp_version.h" EXIT; {     if [ 0 -gt 255 
]; then echo \#define LINUX_VERSION_CODE 398335; else echo \#define 
LINUX_VERSION_CODE 398080; fi; echo '#define KERNEL_VERSION(a,b,c) (((a) 
<< 16) + ((b) << 8) + ((c) > 255 ? 255 : (c)))'; echo \#define 
LINUX_VERSION_MAJOR 6; echo \#define LINUX_VERSION_PATCHLEVEL 19; echo 
\#define LINUX_VERSION_SUBLEVEL 0; } > 
include/generated/uapi/linux/.tmp_version.h; if [ ! -r 
include/generated/uapi/linux/version.h ] || ! cmp -s 
include/generated/uapi/linux/version.h 
include/generated/uapi/linux/.tmp_version.h; then : '  UPD 
  include/generated/uapi/linux/version.h'; mv -f 
include/generated/uapi/linux/.tmp_version.h 
include/generated/uapi/linux/version.h; fi
set -e; mkdir -p include/generated/; trap "rm -f 
include/generated/.tmp_utsrelease.h" EXIT; {     if [ `echo -n 
"6.19.0-rc3-00153-g662be6163c58" | wc -c ` -gt 64 ]; then echo 
'"6.19.0-rc3-00153-g662be6163c58" exceeds 64 characters' >&2; exit 1; 
fi; echo \#define UTS_RELEASE \"6.19.0-rc3-00153-g662be6163c58\"; } > 
include/generated/.tmp_utsrelease.h; if [ ! -r 
include/generated/utsrelease.h ] || ! cmp -s 
include/generated/utsrelease.h include/generated/.tmp_utsrelease.h; then 
: '  UPD  include/generated/utsrelease.h'; mv -f 
include/generated/.tmp_utsrelease.h include/generated/utsrelease.h; fi
set -e; mkdir -p include/generated/; trap "rm -f 
include/generated/.tmp_compile.h" EXIT; { 
/root/linux/scripts/mkcompile_h "ppc" "clang version 18.1.8 (Red Hat, 
Inc. 18.1.8-3.el9)" "ld"; } > include/generated/.tmp_compile.h; if [ ! 
-r include/generated/compile.h ] || ! cmp -s include/generated/compile.h 
include/generated/.tmp_compile.h; then : '  UPD    
  include/generated/compile.h'; mv -f include/generated/.tmp_compile.h 
include/generated/compile.h; fi
/root/linux/scripts/remove-stale-files
make -f /root/linux/scripts/Makefile.build obj=scripts/mod
set -e; mkdir -p scripts/mod/; trap "rm -f 
scripts/mod/.tmp_devicetable-offsets.h" EXIT; {      echo "#ifndef 
__DEVICETABLE_OFFSETS_H__"; echo "#define __DEVICETABLE_OFFSETS_H__"; 
echo "/*"; echo " * DO NOT MODIFY."; echo " *"; echo " * This file was 
generated by Kbuild"; echo " */"; echo ""; sed -ne 
  's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; 
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) 
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < 
scripts/mod/devicetable-offsets.s; echo ""; echo "#endif"; } > 
scripts/mod/.tmp_devicetable-offsets.h; if [ ! -r 
scripts/mod/devicetable-offsets.h ] || ! cmp -s 
scripts/mod/devicetable-offsets.h 
scripts/mod/.tmp_devicetable-offsets.h; then : '  UPD 
  scripts/mod/devicetable-offsets.h'; mv -f 
scripts/mod/.tmp_devicetable-offsets.h scripts/mod/devicetable-offsets.h; fi
make -f /root/linux/scripts/Makefile.build obj=. prepare
set -e; mkdir -p include/generated/; trap "rm -f 
include/generated/.tmp_timeconst.h" EXIT; { echo 250 | bc -q 
/root/linux/kernel/time/timeconst.bc; } > 
include/generated/.tmp_timeconst.h; if [ ! -r 
include/generated/timeconst.h ] || ! cmp -s 
include/generated/timeconst.h include/generated/.tmp_timeconst.h; then : 
'  UPD     include/generated/timeconst.h'; mv -f 
include/generated/.tmp_timeconst.h include/generated/timeconst.h; fi
set -e; mkdir -p include/generated/; trap "rm -f 
include/generated/.tmp_bounds.h" EXIT; {      echo "#ifndef 
__LINUX_BOUNDS_H__"; echo "#define __LINUX_BOUNDS_H__"; echo "/*"; echo 
" * DO NOT MODIFY."; echo " *"; echo " * This file was generated by 
Kbuild"; echo " */"; echo ""; sed -ne 
  's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; 
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) 
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < kernel/bounds.s; echo ""; 
echo "#endif"; } > include/generated/.tmp_bounds.h; if [ ! -r 
include/generated/bounds.h ] || ! cmp -s include/generated/bounds.h 
include/generated/.tmp_bounds.h; then : '  UPD    
  include/generated/bounds.h'; mv -f include/generated/.tmp_bounds.h 
include/generated/bounds.h; fi
set -e; mkdir -p include/generated/; trap "rm -f 
include/generated/.tmp_asm-offsets.h" EXIT; {      echo "#ifndef 
__ASM_OFFSETS_H__"; echo "#define __ASM_OFFSETS_H__"; echo "/*"; echo " 
* DO NOT MODIFY."; echo " *"; echo " * This file was generated by 
Kbuild"; echo " */"; echo ""; sed -ne 
  's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; 
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) 
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < 
arch/powerpc/kernel/asm-offsets.s; echo ""; echo "#endif"; } > 
include/generated/.tmp_asm-offsets.h; if [ ! -r 
include/generated/asm-offsets.h ] || ! cmp -s 
include/generated/asm-offsets.h include/generated/.tmp_asm-offsets.h; 
then : '  UPD  include/generated/asm-offsets.h'; mv -f 
include/generated/.tmp_asm-offsets.h include/generated/asm-offsets.h; fi
set -e; mkdir -p include/generated/; trap "rm -f 
include/generated/.tmp_rq-offsets.h" EXIT; {      echo "#ifndef 
__RQ_OFFSETS_H__"; echo "#define __RQ_OFFSETS_H__"; echo "/*"; echo " * 
DO NOT MODIFY."; echo " *"; echo " * This file was generated by Kbuild"; 
echo " */"; echo ""; sed -ne 
  's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; 
/^->/{s:->#\(.*\):/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) 
\(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < 
kernel/sched/rq-offsets.s; echo ""; echo "#endif"; } > 
include/generated/.tmp_rq-offsets.h; if [ ! -r 
include/generated/rq-offsets.h ] || ! cmp -s 
include/generated/rq-offsets.h include/generated/.tmp_rq-offsets.h; then 
: '  UPD  include/generated/rq-offsets.h'; mv -f 
include/generated/.tmp_rq-offsets.h include/generated/rq-offsets.h; fi
# CALL    /root/linux/scripts/checksyscalls.sh
   sh /root/linux/scripts/checksyscalls.sh clang 
-Wp,-MMD,./.missing-syscalls.d -nostdinc 
-I/root/linux/arch/powerpc/include -I./arch/powerpc/include/generated 
-I/root/linux/include -I./include 
-I/root/linux/arch/powerpc/include/uapi 
-I./arch/powerpc/include/generated/uapi -I/root/linux/include/uapi 
-I./include/generated/uapi -include 
/root/linux/include/linux/compiler-version.h -include 
/root/linux/include/linux/kconfig.h -include 
/root/linux/include/linux/compiler_types.h -D__KERNEL__ 
--target=powerpc64le-linux-gnu -fintegrated-as 
-Werror=unknown-warning-option -Werror=ignored-optimization-argument 
-Werror=option-ignored -Werror=unused-command-line-argument -mbig-endian 
-m32 -I /root/linux/arch/powerpc -DHAVE_AS_ATHIGH=1 
-fmacro-prefix-map=/root/linux/= -Wundef -DKBUILD_EXTRA_WARN1 -std=gnu11 
-fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing 
-msoft-float -mcpu=powerpc -mno-prefixed -mno-pcrel -mno-altivec 
-mno-vsx -mno-mma -mno-spe -fno-asynchronous-unwind-tables -mbig-endian 
-fno-delete-null-pointer-checks -O2 -fno-stack-protector 
-fomit-frame-pointer -falign-functions=4 -fstrict-flex-arrays=3 
-fms-extensions -fno-strict-overflow -fno-stack-check 
-fno-builtin-wcslen -Wall -Wextra -Wundef 
-Werror=implicit-function-declaration -Werror=implicit-int 
-Werror=return-type -Werror=strict-prototypes -Wno-format-security 
-Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member 
-Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=1024 
-Wno-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf 
-Wno-format-truncation-non-kprintf -Wno-pointer-sign 
-Wcast-function-type -Wimplicit-fallthrough -Werror=date-time 
-Werror=incompatible-pointer-types -Wenum-conversion -Wunused 
-Wmissing-format-attribute -Wmissing-include-dirs 
-Wunused-const-variable -Wno-missing-field-initializers -Wno-type-limits 
-Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare 
-Wno-unused-parameter -I/root/linux/. -I.    
-DKBUILD_MODFILE='"./missing-syscalls"' 
-DKBUILD_BASENAME='"missing_syscalls"' 
-DKBUILD_MODNAME='"missing_syscalls"' -D__KBUILD_MODNAME=missing_syscalls
mkdir -p ./tools
make O=/root/build_dir subdir=tools -C /root/linux/tools/ objtool
mkdir -p /root/build_dir/tools/objtool && make O=/root/build_dir 
subdir=tools/objtool --no-print-directory -C objtool
make -C /root/linux/tools/build CFLAGS= LDFLAGS= 
/root/build_dir/tools/objtool/fixdep
if [ ! -f /root/build_dir/tools/objtool/fixdep ]; then             \
     make -f /root/linux/tools/build/Makefile.build dir=. obj=fixdep 
HOSTCFLAGS="-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 
-fomit-frame-pointer -std=gnu11   -I /root/linux/scripts/include";    \
     rm -f /root/build_dir/tools/objtool/fixdep.o;       \
fi
make -f /root/linux/tools/build/Makefile.build dir=. obj=fixdep 
HOSTCFLAGS="-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 
-fomit-frame-pointer -std=gnu11   -I /root/linux/scripts/include"
make -C /root/linux/tools/lib/subcmd/ 
O=/root/build_dir/tools/objtool/libsubcmd \
     DESTDIR=/root/build_dir/tools/objtool/libsubcmd prefix= subdir= \
     CC="gcc" LD="ld" AR="ar" EXTRA_CFLAGS="-std=gnu11 
-fomit-frame-pointer -O2 -g -Werror -Wall -Wextra -Wmissing-prototypes 
-Wmissing-declarations -Wwrite-strings -Wno-implicit-fallthrough 
-Wno-sign-compare -Wno-unused-parameter -I/root/linux/tools/include 
-I/root/linux/tools/include/uapi 
-I/root/linux/tools/arch/powerpc/include/uapi 
-I/root/linux/tools/arch/powerpc/include 
-I/root/linux/tools/objtool/include 
-I/root/linux/tools/objtool/arch/powerpc/include 
-I/root/build_dir/tools/objtool/libsubcmd/include   " \
     /root/build_dir/tools/objtool/libsubcmd/libsubcmd.a install_headers
make -C /root/linux/tools/build CFLAGS= LDFLAGS= 
/root/build_dir/tools/objtool/libsubcmd/fixdep
if [ ! -f /root/build_dir/tools/objtool/libsubcmd/fixdep ]; then         
               \
     make -f /root/linux/tools/build/Makefile.build dir=. obj=fixdep 
HOSTCFLAGS="-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 
-fomit-frame-pointer -std=gnu11   -I /root/linux/scripts/include";    \
     rm -f /root/build_dir/tools/objtool/libsubcmd/fixdep.o;             
     \
fi
make -f /root/linux/tools/build/Makefile.build dir=. obj=fixdep 
HOSTCFLAGS="-Wall -Wmissing-prototypes -Wstrict-prototypes -O2 
-fomit-frame-pointer -std=gnu11   -I /root/linux/scripts/include"
make[5]: 'install_headers' is up to date.
sh ./sync-check.sh
make -f /root/linux/tools/build/Makefile.build dir=. obj=objtool 
CC="gcc" LD="ld" AR="ar" CFLAGS="-std=gnu11 -fomit-frame-pointer -O2 -g 
-Werror -Wall -Wextra -Wmissing-prototypes -Wmissing-declarations 
-Wwrite-strings -Wno-implicit-fallthrough -Wno-sign-compare 
-Wno-unused-parameter -I/root/linux/tools/include 
-I/root/linux/tools/include/uapi 
-I/root/linux/tools/arch/powerpc/include/uapi 
-I/root/linux/tools/arch/powerpc/include 
-I/root/linux/tools/objtool/include 
-I/root/linux/tools/objtool/arch/powerpc/include 
-I/root/build_dir/tools/objtool/libsubcmd/include   " \
     LDFLAGS="/root/build_dir/tools/objtool/libsubcmd/libsubcmd.a -lelf   "
make -f /root/linux/tools/build/Makefile.build dir=./arch/powerpc 
obj=objtool
make -f /root/linux/scripts/Makefile.build obj=arch/powerpc/kernel/vdso 
include/generated/vdso32-offsets.h
make -f /root/linux/scripts/Makefile.build obj=. need-builtin=1 
need-modorder=1 ./arch/powerpc/kexec/
make -f /root/linux/scripts/Makefile.build obj=arch/powerpc \
need-builtin=1 \
need-modorder=1 \
arch/powerpc/kexec/
make -f /root/linux/scripts/Makefile.build obj=arch/powerpc/kexec \
need-builtin=1 \
need-modorder=1 \
arch/powerpc/kexec/
make[1]: Leaving directory '/root/build_dir'
make: Leaving directory '/root/linux'


Regards,

Venkat.


>   arch/powerpc/kexec/core.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index 104c05520bf0..dc44f11be353 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -23,6 +23,7 @@
>   #include <asm/firmware.h>
>   
>   #define cpu_to_be_ulong __PASTE(cpu_to_be, BITS_PER_LONG)
> +#define __be_word __PASTE(__be, BITS_PER_LONG)
>   
>   #ifdef CONFIG_CRASH_DUMP
>   void machine_crash_shutdown(struct pt_regs *regs)
> @@ -146,25 +147,25 @@ int __init overlaps_crashkernel(unsigned long start, unsigned long size)
>   }
>   
>   /* Values we need to export to the second kernel via the device tree. */
> -static phys_addr_t crashk_base;
> -static phys_addr_t crashk_size;
> -static unsigned long long mem_limit;
> +static __be_word crashk_base;
> +static __be_word crashk_size;
> +static __be_word mem_limit;
>   
>   static struct property crashk_base_prop = {
>   	.name = "linux,crashkernel-base",
> -	.length = sizeof(phys_addr_t),
> +	.length = sizeof(__be_word),
>   	.value = &crashk_base
>   };
>   
>   static struct property crashk_size_prop = {
>   	.name = "linux,crashkernel-size",
> -	.length = sizeof(phys_addr_t),
> +	.length = sizeof(__be_word),
>   	.value = &crashk_size,
>   };
>   
>   static struct property memory_limit_prop = {
>   	.name = "linux,memory-limit",
> -	.length = sizeof(unsigned long long),
> +	.length = sizeof(__be_word),
>   	.value = &mem_limit,
>   };
>   
> @@ -193,11 +194,11 @@ static void __init export_crashk_values(struct device_node *node)
>   }
>   #endif /* CONFIG_CRASH_RESERVE */
>   
> -static phys_addr_t kernel_end;
> +static __be_word kernel_end;
>   
>   static struct property kernel_end_prop = {
>   	.name = "linux,kernel-end",
> -	.length = sizeof(phys_addr_t),
> +	.length = sizeof(__be_word),
>   	.value = &kernel_end,
>   };
>   

