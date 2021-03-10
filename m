Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A63338FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:43:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwRvk584tz3d3S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 20:42:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TIFk5uHk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aik@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TIFk5uHk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwKHw6BpWz3cJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 15:45:00 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12A4Xns0037576
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Mar 2021 23:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=v8ahVJ3I8VB20nHMMdHQRqtU5CN40APmGiNURYQMidQ=;
 b=TIFk5uHk022WPWLTMO6OPZqgx/jObwJiLy7dzVJbmmVaFPvOkGEdQEP5g8uqHo2Eph2W
 d35apRD4SeFaeWNRgQTa43WGRD5wLAcaPArLAvqX5UjKYIX9Dajgvep9wKfK1LeqjUmB
 TakK8W+p1c1ifidfeL28EaTfgd9hoGQEyjNlpQl9czWk168X9adjB018PSsV7LGyYMjs
 5xv/97nxwUtK2AQdw4FeDA5N1MMrF8XQoOnlpsdUpyoDvAv2oZTQ+lG2qT931I/7FzU8
 NHs4QnH4ql/O+2+HgcuoUMRavz8q0y0lVC5HE7x4mRRzmMUKO6yTWR0ERqsc1faymRix cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 376n9atepm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 23:44:57 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12A4YRHZ039854
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Mar 2021 23:44:56 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 376n9atep7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Mar 2021 23:44:56 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12A4b2Rp007123;
 Wed, 10 Mar 2021 04:44:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3768t4gn0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Mar 2021 04:44:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12A4iZdh28442978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Mar 2021 04:44:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 956D8A404D;
 Wed, 10 Mar 2021 04:44:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 424A1A4040;
 Wed, 10 Mar 2021 04:44:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Mar 2021 04:44:50 +0000 (GMT)
Received: from [9.206.216.192] (unknown [9.206.216.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BAF4A6020F;
 Wed, 10 Mar 2021 15:44:47 +1100 (AEDT)
Subject: Re: PowerPC64 future proof kernel toc, revised for lld
To: Alan Modra <amodra@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210309045638.GI6042@bubble.grove.modra.org>
 <20210310034813.GM6042@bubble.grove.modra.org>
From: Alexey Kardashevskiy <aik@linux.ibm.com>
Message-ID: <3c92968f-7c61-8d36-4001-91f8630de4b1@linux.ibm.com>
Date: Wed, 10 Mar 2021 15:44:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210310034813.GM6042@bubble.grove.modra.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-10_03:2021-03-09,
 2021-03-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103100021
X-Mailman-Approved-At: Wed, 10 Mar 2021 20:42:36 +1100
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
Cc: alexey@au1.ibm.com, ellerman@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/03/2021 14:48, Alan Modra wrote:
> This patch future-proofs the kernel against linker changes that might
> put the toc pointer at some location other than .got+0x8000, by
> replacing __toc_start+0x8000 with .TOC. throughout.  If the kernel's
> idea of the toc pointer doesn't agree with the linker, bad things
> happen.


Works great with gcc (v8, v10), ld (2.23), clang-11, lld-11.


> 
> prom_init.c code relocating its toc is also changed so that a symbolic
> __prom_init_toc_start toc-pointer relative address is calculated
> rather than assuming that it is always at toc-pointer - 0x8000.  The
> length calculations loading values from the toc are also avoided.
> It's a little incestuous to do that with unreloc_toc picking up
> adjusted values (which is fine in practice, they both adjust by the
> same amount if all goes well).
> 
> I've also changed the way .got is aligned in vmlinux.lds and
> zImage.lds, mostly so that dumping out section info by objdump or
> readelf plainly shows the alignment is 256.  This linker script
> feature was added 2005-09-27, available in FSF binutils releases from
> 2.17 onwards.  Should be safe to use in the kernel, I think.
> 
> Finally, put *(.got) before the prom_init.o entry which only needs
> *(.toc), so that the GOT header goes in the correct place.  I don't
> believe this makes any difference for the kernel as it would for
> dynamic objects being loaded by ld.so.  That change is just to stop
> lusers who blindly copy kernel scripts being led astray.  Of course,
> this change needs the prom_init.c changes.
> 
> Some notes on .toc and .got.
> 
> .toc is a compiler generated section of addresses.  .got is a linker
> generated section of addresses, generally built when the linker sees
> R_*_*GOT* relocations.  In the case of powerpc64 ld.bfd, there are
> multiple generated .got sections, one per input object file.  So you
> can somewhat reasonably write in a linker script an input section
> statement like *prom_init.o(.got .toc) to mean "the .got and .toc
> section for files matching *prom_init.o".


For my own education, is .got for prom_init.o still generated by ld or gcc?

In other words, should "objdump -D -s -j .got" ever dump .got for any .o 
file, like below?

===
objdump -D -s -j .got 
~/pbuild/kernel-llvm-ld/arch/powerpc/kernel/prom_init.o 

 

/home/aik/pbuild/kernel-llvm-ld/arch/powerpc/kernel/prom_init.o: 
file format elf64-powerpcle 

 

objdump: section '.got' mentioned in a -j option, but not found in any 
input file
===



-- 
Alexey Kardashevskiy
IBM OzLabs, LTC Team

e-mail: aik@linux.ibm.com
