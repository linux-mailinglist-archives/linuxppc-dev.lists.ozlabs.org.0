Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7E36CE96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 00:34:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVGll3SZJz30D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 08:34:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WguKdcS+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WguKdcS+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV7QQ1j6Fz2xYY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 03:03:57 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RH3dhG169480; Tue, 27 Apr 2021 13:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qxfc2vA5E+xspz4sZeH8i/Bh65VF/GUF/+47fezkICE=;
 b=WguKdcS+eIRu30lAwessbcUQZ30/DunGY06poKOcgrt5OyExO4z5Vi3m38S8zSVIY6VT
 Gu2GqeII4EYXmNBQYvgUiCn1owJTaYP6hTMCb0ORenGg8oAsmtRiTlZWLb8+7Dwr4lDo
 uhJHfT59lMpoV/z6jIvhTA6uytaHjLxnXGgSbAj3XDEztQMXGBRoYkfqLYdcITguODXi
 9CbipsUGj6tYSf/X3QzIsepbSWbWxedKdvk0qRY6GubtzQTUUrLmmJLEWI5y29cBnnO/
 VRq6W855L6I8sgcdw8AVx/cQV9xnhjitEk+wp1VqM+S3Df+xekzFZVNHtSEYyEAlaA2+ +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386jn4s4r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 13:03:42 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RH3fWX169670;
 Tue, 27 Apr 2021 13:03:41 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 386jn4s4ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 13:03:41 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RGvvvD008144;
 Tue, 27 Apr 2021 17:03:26 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 384ay94j55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 17:03:26 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13RH3Qap37814708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 17:03:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 039AEBE051;
 Tue, 27 Apr 2021 17:03:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96919BE054;
 Tue, 27 Apr 2021 17:03:25 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.93.36])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 17:03:25 +0000 (GMT)
Message-ID: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
Subject: PPC476 hangs during tlb flush after calling /init in crash kernel
 with linux 5.4+
From: Eddie James <eajames@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Tue, 27 Apr 2021 12:03:25 -0500
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kpToib2mmTJ-mihH_LrQVsg2OsPGlM3b
X-Proofpoint-ORIG-GUID: bt6YRBpiq8HgoNdAE3rmdn9q1n6NT-Tm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_10:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270115
X-Mailman-Approved-At: Wed, 28 Apr 2021 08:34:03 +1000
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
Cc: miltonm@us.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

I'm having a problem in simulation and hardware where my PPC476
processor stops executing instructions after callling /init. In my case
this is a bash script. The code descends to flush the TLB, and
somewhere in the loop in _tlbil_pid, the PC goes to
InstructionTLBError47x but does not go any further. This only occurs in
the crash kernel environment, which is using the same kernel,
initramfs, and init script as the main kernel, which executed fine. I
do not see this problem with linux 4.19 or 3.10. I do see it with 5.4
and 5.10. I see a fair amount of refactoring in the PPC memory
management area between 4.19 and 5.4. Can anyone point me in a
direction to debug this further? My stack trace is below as I can run
gdb in simulation.

Thanks,
Eddie


#0  _tlbil_pid () at
/usr/src/kernel/arch/powerpc/mm/nohash/tlb_low.S:123
#1  0xca014864 in local_flush_tlb_mm (mm=<optimized out>)
    at /usr/src/kernel/arch/powerpc/mm/nohash/tlb.c:201
#2  tlb_flush (tlb=<optimized out>)
    at /usr/src/kernel/arch/powerpc/mm/nohash/tlb.c:395
#3  0xca161e48 in tlb_flush_mmu_tlbonly (tlb=<optimized out>)
    at /usr/src/kernel/include/asm-generic/tlb.h:408
#4  tlb_flush_mmu_tlbonly (tlb=<optimized out>)
    at /usr/src/kernel/include/asm-generic/tlb.h:403
#5  tlb_flush_mmu (tlb=0xcec2fd18) at
/usr/src/kernel/mm/mmu_gather.c:190
#6  0xca161fa8 in tlb_finish_mmu (tlb=0xcec2fd18, start=<optimized
out>,
    end=<optimized out>) at /usr/src/kernel/mm/mmu_gather.c:272
#7  0xca18e070 in shift_arg_pages (shift=<optimized out>,
vma=<optimized out>)
    at /usr/src/kernel/fs/exec.c:678
#8  setup_arg_pages (bprm=0xcef1a000, stack_top=<optimized out>,
    executable_stack=<optimized out>) at /usr/src/kernel/fs/exec.c:768
#9  0xca1f617c in load_elf_binary (bprm=0xcef1a000)
    at /usr/src/kernel/fs/binfmt_elf.c:867
#10 0xca18f3d4 in search_binary_handler (bprm=<optimized out>)
    at /usr/src/kernel/fs/exec.c:1691
#11 0xca1f458c in next_terminator (last=<optimized out>,
first=<optimized out>)
    at /usr/src/kernel/fs/binfmt_script.c:29
#12 load_script (bprm=0xcef1a000) at
/usr/src/kernel/fs/binfmt_script.c:83
#13 0xca18f3d4 in search_binary_handler (bprm=<optimized out>)
    at /usr/src/kernel/fs/exec.c:1691
#14 0xca190104 in acct_arg_size (bprm=<optimized out>, pages=<optimized
out>)
    at /usr/src/kernel/fs/exec.c:187
#15 __do_execve_file (fd=<optimized out>, filename=0xcec98000,
argv=...,
    envp=..., flags=<optimized out>, file=<optimized out>)
    at /usr/src/kernel/fs/exec.c:1872
#16 0xca19059c in __read_once_size (size=<optimized out>,
res=<optimized out>, p=<optimized out>) at
/usr/src/kernel/include/linux/compiler.h:235
#17 set_dumpable (mm=<optimized out>, value=<optimized out>) at
/usr/src/kernel/fs/exec.c:1983

