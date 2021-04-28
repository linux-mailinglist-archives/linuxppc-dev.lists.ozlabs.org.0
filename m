Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A5B36D96E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 16:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVgjl15wwz30Cy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 00:19:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oBdjrfPU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oBdjrfPU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVgjG4nQ6z2xfl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 00:18:42 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SE4Pi9100350; Wed, 28 Apr 2021 10:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=B1ueZsAoxf+WOv7JV3G3yr/eySa29U4BZNE4SVFEBdE=;
 b=oBdjrfPUe4VBQaoAfap6oGxx1HRY5DNZdlPiPngjR0ZNiv48tyHbgxCf/8xJ8hF006uT
 3TN4jE4IpjYpXrOxrybCX6JszO1g3eaGJuozkzS5QvWPHZTkDIIpRVhmtoWWlD2ZsjNa
 ogcVxfDV1E74GADqa09fIM2sSteyPpjvaeuPnJEV8AXtUWDQIFzipMdTADQnE2i8hNhc
 4O3xHrkZDRLiwDjLP3TOdlJJ2adQy4s8ClVCfD4dkWhg8XpoWIRLo0jLD8dMygR9IYxT
 lpi4ozLoswsdR/88Ku0cpdDi2JjSXHUA2XPU3OxjKZMjaT8azoSIw5HeyvhkODUsk4Q8 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38790g8w2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:18:27 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SE554R105192;
 Wed, 28 Apr 2021 10:18:27 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38790g8w2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:18:27 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SEHA6e020762;
 Wed, 28 Apr 2021 14:18:26 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 384ay9ngce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 14:18:26 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SEIPNE25756142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 14:18:25 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 997A87805E;
 Wed, 28 Apr 2021 14:18:25 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EDD778063;
 Wed, 28 Apr 2021 14:18:25 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.38.222])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 14:18:25 +0000 (GMT)
Message-ID: <745fce2ca4bac4cd768ced999954ea827357d235.camel@linux.ibm.com>
Subject: Re: PPC476 hangs during tlb flush after calling /init in crash
 kernel with linux 5.4+
From: Eddie James <eajames@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Date: Wed, 28 Apr 2021 09:18:24 -0500
In-Reply-To: <711a9a60-264b-9b86-6772-6585622a5bd4@csgroup.eu>
References: <b973fa4768140021719e7cc3123ee873d8b2a3f1.camel@linux.ibm.com>
 <a24e9e0d-1d4f-506b-9303-4b995815d3c4@csgroup.eu>
 <2f7587b1986d597a63169567124438325cbedfd7.camel@linux.ibm.com>
 <711a9a60-264b-9b86-6772-6585622a5bd4@csgroup.eu>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zqUtghhgLmZih4QwfufZ2z3CYOVhNzle
X-Proofpoint-GUID: HH03YEPPoBeuxVGMBQX4MtBzm27pHsa8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_06:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104280096
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

On Wed, 2021-04-28 at 08:08 +0200, Christophe Leroy wrote:
> 
> Le 28/04/2021 à 00:42, Eddie James a écrit :
> > On Tue, 2021-04-27 at 19:26 +0200, Christophe Leroy wrote:
> > > Hi Eddies,
> > > 
> > > Le 27/04/2021 à 19:03, Eddie James a écrit :
> > > > Hi all,
> > > > 
> > > > I'm having a problem in simulation and hardware where my PPC476
> > > > processor stops executing instructions after callling /init. In
> > > > my
> > > > case
> > > > this is a bash script. The code descends to flush the TLB, and
> > > > somewhere in the loop in _tlbil_pid, the PC goes to
> > > > InstructionTLBError47x but does not go any further. This only
> > > > occurs in
> > > > the crash kernel environment, which is using the same kernel,
> > > > initramfs, and init script as the main kernel, which executed
> > > > fine.
> > > > I
> > > > do not see this problem with linux 4.19 or 3.10. I do see it
> > > > with
> > > > 5.4
> > > > and 5.10. I see a fair amount of refactoring in the PPC memory
> > > > management area between 4.19 and 5.4. Can anyone point me in a
> > > > direction to debug this further? My stack trace is below as I
> > > > can
> > > > run
> > > > gdb in simulation.
> > > 
> > > Can you bisect to pin point the culprit commit ?
> > 
> > Hi, thanks for your prompt reply.
> > 
> > Good idea! I have bisected to:
> > 
> > commit 9e849f231c3c72d4c3c1b07c9cd19ae789da0420 (b8-bad,
> > refs/bisect/bad)
> > Author: Christophe Leroy <christophe.leroy@c-s.fr>
> > Date:   Thu Feb 21 19:08:40 2019 +0000
> > 
> >      powerpc/mm/32s: use generic mmu_mapin_ram() for all blocks.
> >      
> >      Now that mmu_mapin_ram() is able to handle other blocks
> >      than the one starting at 0, the WII can use it for all
> >      its blocks.
> >      
> >      Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> > 
> > I also confirmed that reverting this commit resolves the issue in
> > 5.4+.
> > 
> > Now, I don't understand why this is problematic or what is really
> > happening... Reverting is probably not the desired solution.
> > 
> 
> Can you provide the 'dmesg' or a dump of the logs printed by the
> kernel at boottime ?
> 
> The difference with this commit is that if there are several
> memblocks, all get mapped. Maybe your 
> target doesn't like it.
> 
> You are talking about simulation, are you using QEMU ? If yes can you
> provide details so that I can 
> try and reproduce the issue ?

Milton mentioned the kexec debug output might be useful:

lzma_decompress_file: read on uImage of 65536 
bytes failed
kernel: 0xb75b3010 kernel_size: 0x4f1231
0000000000000000-0000000040000000 : 0
get base memory ranges:1
usable memory rgns size:1 base:0 size:10000000
exclude_range sorted exclude_range[0] start:0, end:bb7000
setup_memory_ranges memory_range[0] start:bb7001, end:30000000
CRASH MEMORY RANGES
0000000000000000-0000000000010000
0000000000010000-000000000c000000
0000000010000000-000000002d600000
get_crash_notes_per_cpu: crash_notes addr = 2ce84e00, size = 300
Elf header: p_type = 4, p_offset = 0x2ce84e00 p_paddr = 0x2ce84e00
p_vaddr = 0x0
 p_filesz = 0x12c p_memsz = 0x12c
vmcoreinfo header: p_type = 4, p_offset = 0x2c8d4000 p_paddr =
0x2c8d4000 p_vadd
r = 0x0 p_filesz = 0x1024 p_memsz = 0x1024
Elf header: p_type = 1, p_offset = 0xcc7e000 p_paddr = 0x0 p_vaddr =
0xc0000000 
p_filesz = 0x10000 p_memsz = 0x10000
Elf header: p_type = 1, p_offset = 0x10000 p_paddr = 0x10000 p_vaddr =
0xc001000
0 p_filesz = 0xbff0000 p_memsz = 0xbff0000
Elf header: p_type = 1, p_offset = 0x10000000 p_paddr = 0x10000000
p_vaddr = 0xd
0000000 p_filesz = 0x1d600000 p_memsz = 0x1d600000
Command line after adding elfcorehdr:  elfcorehdr=209464K
sym:      .data info: 03 other: 00 shndx: 7 value: 0 size: 0
sym: .data value: ffffbf0 addr: fffc032
sym:      .data info: 03 other: 00 shndx: 7 value: 0 size: 0
sym: .data value: ffffbf0 addr: fffc03a
sym: sha256_starts info: 12 other: 00 shndx: 2 value: 92c size: 70
sym: sha256_starts value: fffc950 addr: fffc044
sym: sha256_update info: 12 other: 00 shndx: 2 value: 36c4 size: c
sym: sha256_update value: ffff6e8 addr: fffc058
sym: sha256_finish info: 12 other: 00 shndx: 2 value: 36d0 size: 1a4
sym: sha256_finish value: ffff6f4 addr: fffc070
sym:     memcmp info: 12 other: 00 shndx: 2 value: 5fc size: 38
sym: memcmp value: fffc620 addr: fffc080
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff898 addr: fffc08e
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8c8 addr: fffc092
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff898 addr: fffc096
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc09c
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8b8 addr: fffc0a2
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8b8 addr: fffc0a6
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8c8 addr: fffc0aa
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc0ac
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc0b8
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8ce addr: fffc0ca
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8ce addr: fffc0d2
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc0d8
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8d0 addr: fffc0de
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8d0 addr: fffc0e2
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc0e4
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc0f0
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc104
sym: _restgpr_28_x info: 12 other: 00 shndx: 2 value: 888 size: 0
sym: _restgpr_28_x value: fffc8ac addr: fffc110
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8e0 addr: fffc11a
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8e0 addr: fffc122
sym:     printf info: 12 other: 00 shndx: 2 value: 524 size: 68
sym: printf value: fffc548 addr: fffc128
sym: setup_arch info: 12 other: 00 shndx: 2 value: 91c size: 4
sym: setup_arch value: fffc940 addr: fffc12c
sym: skip_checks info: 11 other: 00 shndx: 8 value: 0 size: 4
sym: skip_checks value: ffffd50 addr: fffc132
sym: skip_checks info: 11 other: 00 shndx: 8 value: 0 size: 4
sym: skip_checks value: ffffd50 addr: fffc136
sym: verify_sha256_digest info: 12 other: 00 shndx: 2 value: 0 size: f0
sym: verify_sha256_digest value: fffc024 addr: fffc140
sym: post_verification_setup_arch info: 12 other: 00 shndx: 2 value:
920 size: 4
sym: post_verification_setup_arch value: fffc944 addr: fffc15c
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8f2 addr: fffc16e
sym: .rodata.str1.1 info: 03 other: 00 shndx: 4 value: 0 size: 0
sym: .rodata.str1.1 value: ffff8f2 addr: fffc18a
sym: _restgpr_20_x info: 12 other: 00 shndx: 2 value: 868 size: 0
sym: _restgpr_20_x value: fffc88c addr: fffc1a8
sym:    putchar info: 12 other: 00 shndx: 2 value: 928 size: 4
sym: putchar value: fffc94c addr: fffc1cc
sym:    putchar info: 12 other: 00 shndx: 2 value: 928 size: 4
sym: putchar value: fffc94c addr: fffc244
sym:  __lshrdi3 info: 10 other: 00 shndx: 2 value: 8f8 size: 0
sym: __lshrdi3 value: fffc91c addr: fffc2c4
sym:    putchar info: 12 other: 00 shndx: 2 value: 928 size: 4
sym: putchar value: fffc94c addr: fffc4e4
sym:   vsprintf info: 12 other: 00 shndx: 2 value: 13c size: 38c
sym: vsprintf value: fffc160 addr: fffc534
sym:   vsprintf info: 12 other: 00 shndx: 2 value: 13c size: 38c
sym: vsprintf value: fffc160 addr: fffc59c
sym: my_thread_ptr info: 11 other: 00 shndx: 8 value: 8 size: 4
sym: my_thread_ptr value: ffffd58 addr: fffc76a
sym: my_thread_ptr info: 11 other: 00 shndx: 8 value: 8 size: 4
sym: my_thread_ptr value: ffffd58 addr: fffc76e
sym:      stack info: 11 other: 00 shndx: 8 value: 10 size: 4
sym: stack value: ffffd60 addr: fffc776
sym:      stack info: 11 other: 00 shndx: 8 value: 10 size: 4
sym: stack value: ffffd60 addr: fffc77a
sym:  purgatory info: 12 other: 00 shndx: 2 value: f0 size: 4c
sym: purgatory value: fffc114 addr: fffc784
sym:  dt_offset info: 11 other: 00 shndx: 8 value: c size: 4
sym: dt_offset value: ffffd5c addr: fffc79e
sym:  dt_offset info: 11 other: 00 shndx: 8 value: c size: 4
sym: dt_offset value: ffffd5c addr: fffc7a2
sym:     kernel info: 11 other: 00 shndx: 8 value: 4 size: 4
sym: kernel value: ffffd54 addr: fffc7ba
sym:     kernel info: 11 other: 00 shndx: 8 value: 4 size: 4
sym: kernel value: ffffd54 addr: fffc7be
sym:     memcpy info: 12 other: 00 shndx: 2 value: 5d8 size: 24
sym: memcpy value: fffc5fc addr: ffff648
sym:     memcpy info: 12 other: 00 shndx: 2 value: 5d8 size: 24
sym: memcpy value: fffc5fc addr: ffff65c
sym: sha256_process info: 12 other: 00 shndx: 2 value: 99c size: 2be0
sym: sha256_process value: fffc9c0 addr: ffff66c
sym: sha256_process info: 12 other: 00 shndx: 2 value: 99c size: 2be0
sym: sha256_process value: fffc9c0 addr: ffff6a8
sym:      .data info: 03 other: 00 shndx: 7 value: 0 size: 0
sym: .data value: ffffd10 addr: ffff742
sym:      .data info: 03 other: 00 shndx: 7 value: 0 size: 0
sym: .data value: ffffd10 addr: ffff74a
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc024 addr: ffff920
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc114 addr: ffff94c
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc160 addr: ffff980
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc4ec addr: ffff9c8
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc548 addr: ffff9e8
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc5b0 addr: ffffa1c
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc5dc addr: ffffa30
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc5fc addr: ffffa44
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc620 addr: ffffa58
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc940 addr: ffffa80
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc944 addr: ffffa94
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc948 addr: ffffaa8
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc94c addr: ffffad0
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc950 addr: ffffaf8
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: fffc9c0 addr: ffffb0c
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: ffff5a0 addr: ffffb68
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: ffff6e8 addr: ffffbbc
sym:      .text info: 03 other: 00 shndx: 2 value: 0 size: 0
sym: .text value: ffff6f4 addr: ffffbd0
Modified cmdline:console=ttyS0,115200 loglevel=9 rootwait
root=/dev/mmcblk0p2 el
fcorehdr=209464K maxcpus=1 
reserve regions: 4
0: offset: e3fc000, size: 4000
1: offset: c000000, size: c8f000
2: offset: fffc000, size: 4000
3: offset: f6a7000, size: 955000
debug.dtb written
kexec_load: entry = 0xfffc658 flags = 0x1
nr_segments = 6
segment[0].buf   = 0xb5cb1010
segment[0].bufsz = 0xb7d568
segment[0].mem   = 0xc000000
segment[0].memsz = 0xc7e000
segment[1].buf   = 0x100997b0
segment[1].bufsz = 0x10000
segment[1].mem   = 0xcc7e000
segment[1].memsz = 0x10000
segment[2].buf   = 0x100a97f0
segment[2].bufsz = 0x400
segment[2].mem   = 0xcc8e000
segment[2].memsz = 0x1000
segment[3].buf   = 0x100ae670
segment[3].bufsz = 0x3c5f
segment[3].mem   = 0xe3fc000
segment[3].memsz = 0x4000
segment[4].buf   = 0xb6c5e050
segment[4].bufsz = 0x95409f
segment[4].mem   = 0xf6a7000
segment[4].memsz = 0x955000
segment[5].buf   = 0x100aa8a0
segment[5].bufsz = 0x3d6c
segment[5].mem   = 0xfffc000
segment[5].memsz = 0x4000

> 
> Thanks
> Christophe

