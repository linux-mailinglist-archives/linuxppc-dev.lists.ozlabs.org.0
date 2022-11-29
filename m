Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5EF63C35A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 16:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM5V90QlYz3bYL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 02:14:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mc1mq92b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mc1mq92b;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM5T96DB9z307T
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 02:13:49 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATF5BLa007838;
	Tue, 29 Nov 2022 15:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6DM+s6wNaCi7olYeyp2LZ8PKgJ1P1Ksw181EifA6oxE=;
 b=mc1mq92bTJoaeKiyFeaY3lLG6+NUU4aeg6hAze4ZHzuwHVk7cuLtaUi1GMwTOLeYjrdi
 VvSiEYHPEEzGeo1glTlZ3dntAgk2WNLwMzLGXqpXDV/z4G25VO/hEFo3P1MmvvJGw0pK
 0KhNiIqRcPpr0cS+8am/i3h33mo0BBslda1bJB1Hyrmp/TTc2GNrmcAj3Of4lhRVIb2u
 VEB39LlSGytmtVk0Zse97DrZm1x+HGricSFM5tMVy1XdkwGzF5t+OBYlCJsR5DIpCJ3/
 CNiEbd6tc4Y1uEA0wsPiq3APO+Q32/2Y3/c7rbj9OC3iXbS9Rb4wgiuLoL8Z7ejAxEZl oA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5mdhg6p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 15:13:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATF5aCK005278;
	Tue, 29 Nov 2022 15:13:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9c8gb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 15:13:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATFDTtn1180394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 15:13:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAA2D11C04A;
	Tue, 29 Nov 2022 15:13:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 01D8B11C04C;
	Tue, 29 Nov 2022 15:13:27 +0000 (GMT)
Received: from [9.109.198.140] (unknown [9.109.198.140])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 15:13:26 +0000 (GMT)
Message-ID: <6cdad32e-782d-5bb5-f7e9-a44fb0b6444d@linux.ibm.com>
Date: Tue, 29 Nov 2022 20:43:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: linux-next: build warnings after merge of the powerpc-objtool
 tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20221125143012.6426c2b9@canb.auug.org.au>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20221125143012.6426c2b9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F2lH_XEpazIbiNeK9BvuK-gXke5aRu4x
X-Proofpoint-GUID: F2lH_XEpazIbiNeK9BvuK-gXke5aRu4x
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_09,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290083
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

On 25/11/22 09:00, Stephen Rothwell wrote:
> Hi all,
>
> After merging the powerpc-objtool tree, today's linux-next build (powerpc
> pseries_le_defconfig) produced these warnings:
>
> arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): can't find starting instruction
> arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
>
> I have no idea what started this (they may have been there yesterday).
I was able to recreate the above mentioned warnings with 
pseries_le_defconfig and powernv_defconfig. The regression report also 
mentions a warning 
(https://lore.kernel.org/oe-kbuild-all/202211282102.QUr7HHrW-lkp@intel.com/) 
seen with arch/powerpc/kernel/kvm_emul.S assembly file.

  [1] arch/powerpc/kernel/optprobes_head.o: warning: objtool: 
optprobe_template_end(): can't find starting instruction
  [2] arch/powerpc/kernel/kvm_emul.o: warning: objtool: 
kvm_template_end(): can't find starting instruction
  [3] arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): 
can't find starting instruction

The warnings [1] and [2] go away after adding 'nop' instruction. Below 
diff fixes it for me:

diff --git a/arch/powerpc/kernel/optprobes_head.S 
b/arch/powerpc/kernel/optprobes_head.S
index cd4e7bc32609..ea4e3bd82f4f 100644
--- a/arch/powerpc/kernel/optprobes_head.S
+++ b/arch/powerpc/kernel/optprobes_head.S
@@ -134,3 +134,4 @@ optprobe_template_ret:

         .global optprobe_template_end
  optprobe_template_end:
+       nop

diff --git a/arch/powerpc/kernel/kvm_emul.S b/arch/powerpc/kernel/kvm_emul.S
index 7af6f8b50c5d..41fd664e3ba0 100644
--- a/arch/powerpc/kernel/kvm_emul.S
+++ b/arch/powerpc/kernel/kvm_emul.S
@@ -352,3 +352,4 @@ kvm_tmp_end:

  .global kvm_template_end
  kvm_template_end:
+       nop

For warning [3], objtool is throwing can't find starting instruction 
warning because it finds that the symbol (end_first_256B) is zero sized, 
and such symbols are not added to the rbtree. I tried to fix it by 
adding a 'nop' instruction (pasted diff below), but that resulted in a 
kernel build failure.

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 874efd25cc45..d48850fe159f 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -192,6 +192,7 @@ __secondary_hold:
         EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
  #endif
  CLOSE_FIXED_SECTION(first_256B)
+nop

  /*
   * On server, we include the exception vectors code here as it

diff --git a/arch/powerpc/kernel/exceptions-64s.S 
b/arch/powerpc/kernel/exceptions-64s.S
index 26f8fef53c72..f7517d443e9b 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -3104,9 +3104,13 @@ __end_interrupts:
  DEFINE_FIXED_SYMBOL(__end_interrupts, virt_trampolines)

  CLOSE_FIXED_SECTION(real_vectors);
+nop
  CLOSE_FIXED_SECTION(real_trampolines);
+nop
  CLOSE_FIXED_SECTION(virt_vectors);
+nop
  CLOSE_FIXED_SECTION(virt_trampolines);
+nop

  USE_TEXT_SECTION()

I'm not very sure on how to address this particular warning 
(arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): 
can't find starting instruction). Given that there are no calls to 
_mcount, one workaround is to skip objtool from running on 
arch/powerpc/kernel/head_64.o file. The below diff works for me:

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9b6146056e48..9ef6a040d875 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -219,3 +219,5 @@ $(obj)/vdso64_wrapper.o : $(obj)/vdso/vdso64.so.dbg

  # for cleaning
  subdir- += vdso
+
+OBJECT_FILES_NON_STANDARD_head_64.o := y


Thanks,
Sathvika
