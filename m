Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7A8D7D5D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 10:30:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ixGWhgcF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt6PL1Nq2z3cQq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2024 18:30:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ixGWhgcF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt6Nb1dgnz3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2024 18:30:06 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4538MBB8026092;
	Mon, 3 Jun 2024 08:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=eWH5bLGCUpIUBw3aYsfuetIptN2dR03ub3UD4L5dxgk=;
 b=ixGWhgcF4vrEJd1WYVo153O4c89aLev/RVgZHfAdaeBP4rkbMXlt7oABgG0FhbupaVwd
 2OQgZG2IunqEKzXvenzMOFiECdC7GW0IgIBOPNFwO01ooU+y8s1lzEiuh6tmwg+ztIO0
 W+DLzeygGADWM7sdsOh3V30r3i4rFr3hhL8yVQ5YEJofq6TQaCaYtiZiL14iBAm6TyNy
 GQrWSxv8/FdqMHEL9zvq+wDkKCLBAsjv3Ke9q/UsMgYs+uYMU7b0wcKau1/DVcMy/Hxj
 RhxpnCfKyVv/2lmdIXmI/dTezljlF7N4E/jX6tb7+Xr1xrzDG23MLLRaFe6YLuWXGefX kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yha8r80mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 08:29:40 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4538SjeJ006962;
	Mon, 3 Jun 2024 08:29:39 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yha8r80mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 08:29:39 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4537mKP7026513;
	Mon, 3 Jun 2024 08:29:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yggp2p9x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 08:29:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4538TWFN52953448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Jun 2024 08:29:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CACDA2004E;
	Mon,  3 Jun 2024 08:29:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF7920040;
	Mon,  3 Jun 2024 08:29:29 +0000 (GMT)
Received: from [9.199.155.138] (unknown [9.199.155.138])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Jun 2024 08:29:29 +0000 (GMT)
Message-ID: <9393df04-403d-4530-8f13-c8a5c6d302d2@linux.vnet.ibm.com>
Date: Mon, 3 Jun 2024 13:59:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
To: Nathan Chancellor <nathan@kernel.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>
References: <20240422092206.147078-1-sv@linux.ibm.com>
 <20240422092206.147078-2-sv@linux.ibm.com>
 <20240423002833.GA1436185@dev-arch.thelio-3990X>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <20240423002833.GA1436185@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HKTp6dWdjXnm9fJx9q3JmAmORBUNFqq8
X-Proofpoint-ORIG-GUID: F9Hmk5DWuY7udzyUJCT_319cKzwzStQ0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_04,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406030070
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, peterz@infradead.org, masahiroy@kernel.org, mahesh@linux.ibm.com, mingo@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

On 4/23/24 5:58 AM, Nathan Chancellor wrote:
> Hi Sathvika,
>
> On Mon, Apr 22, 2024 at 02:52:06PM +0530, Sathvika Vasireddy wrote:
>> Implement build-time fixup of alternate feature relative addresses for
>> the out-of-line (else) patch code. Initial posting to achieve the same
>> using another tool can be found at [1]. Idea is to implement this using
>> objtool instead of introducing another tool since it already has elf
>> parsing and processing covered.
>>
>> Introduce --ftr-fixup as an option to objtool to do feature fixup at
>> build-time.
>>
>> Couple of issues and warnings encountered while implementing feature
>> fixup using objtool are as follows:
>>
>> 1. libelf is creating corrupted vmlinux file after writing necessary
>> changes to the file. Due to this, kexec is not able to load new
>> kernel.
>>
>> It gives the following error:
>>          ELF Note corrupted !
>>          Cannot determine the file type of vmlinux
>>
>> To fix this issue, after opening vmlinux file, make a call to
>> elf_flagelf (e, ELF_C_SET, ELF_F_LAYOUT). This instructs libelf not
>> to touch the segment and section layout. It informs the library
>> that the application will take responsibility for the layout of the
>> file and that the library should not insert any padding between
>> sections.
>>
>> 2. Fix can't find starting instruction warnings when run on vmlinux
>>
>> Objtool throws a lot of can't find starting instruction warnings
>> when run on vmlinux with --ftr-fixup option.
>>
>> These warnings are seen because find_insn() function looks for
>> instructions at offsets that are relative to the start of the section.
>> In case of individual object files (.o), there are no can't find
>> starting instruction warnings seen because the actual offset
>> associated with an instruction is itself a relative offset since the
>> sections start at offset 0x0.
>>
>> However, in case of vmlinux, find_insn() function fails to find
>> instructions at the actual offset associated with an instruction
>> since the sections in vmlinux do not start at offset 0x0. Due to
>> this, find_insn() will look for absolute offset and not the relative
>> offset. This is resulting in a lot of can't find starting instruction
>> warnings when objtool is run on vmlinux.
>>
>> To fix this, pass offset that is relative to the start of the section
>> to find_insn().
>>
>> find_insn() is also looking for symbols of size 0. But, objtool does
>> not store empty STT_NOTYPE symbols in the rbtree. Due to this,
>> for empty symbols, objtool is throwing can't find starting
>> instruction warnings. Fix this by ignoring symbols that are of
>> size 0 since objtool does not add them to the rbtree.
>>
>> 3. Objtool is throwing unannotated intra-function call warnings
>> when run on vmlinux with --ftr-fixup option.
>>
>> One such example:
>>
>> vmlinux: warning: objtool: .text+0x3d94:
>>                          unannotated intra-function call
>>
>> .text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4
>>
>> c0000000000081d4: 45 24 02 48  bl c00000000002a618
>> <system_reset_exception+0x8>
>>
>> c00000000002a610 <system_reset_exception>:
>> c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
>>                          c00000000002a610: R_PPC64_REL16_HA    .TOC.
>> c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
>>                          c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
>> c00000000002a618:       a6 02 08 7c     mflr    r0
>>
>> This is happening because we should be looking for destination
>> symbols that are at absolute offsets instead of relative offsets.
>> After fixing dest_off to point to absolute offset, there are still
>> a lot of these warnings shown.
>>
>> In the above example, objtool is computing the destination
>> offset to be c00000000002a618, which points to a completely
>> different instruction. find_call_destination() is looking for this
>> offset and failing. Instead, we should be looking for destination
>> offset c00000000002a610 which points to system_reset_exception
>> function.
>>
>> Even after fixing the way destination offset is computed, and
>> after looking for dest_off - 0x8 in cases where the original offset
>> is not found, there are still a lot of unannotated intra-function
>> call warnings generated. This is due to symbols that are not
>> properly annotated.
>>
>> So, for now, as a hack to curb these warnings, do not emit
>> unannotated intra-function call warnings when objtool is run
>> with --ftr-fixup option.
>>
>> TODO:
>> This patch enables build time feature fixup only for powerpc little
>> endian configs. There are boot failures with big endian configs.
>> Posting this as an initial RFC to get some review comments while I work
>> on big endian issues.
>>
>> [1]
>> https://lore.kernel.org/linuxppc-dev/20170521010130.13552-1-npiggin@gmail.com/
>>
>> Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> When I build this series with LLVM 14 [1] (due to an issue I report
> below), I am getting a crash when CONFIG_FTR_FIXUP_SELFTEST is disabled.
>
> diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
> index 544a65fda77b..95d2906ec814 100644
> --- a/arch/powerpc/configs/ppc64_defconfig
> +++ b/arch/powerpc/configs/ppc64_defconfig
> @@ -427,7 +427,6 @@ CONFIG_BLK_DEV_IO_TRACE=y
>   CONFIG_IO_STRICT_DEVMEM=y
>   CONFIG_PPC_EMULATED_STATS=y
>   CONFIG_CODE_PATCHING_SELFTEST=y
> -CONFIG_FTR_FIXUP_SELFTEST=y
>   CONFIG_MSI_BITMAP_SELFTEST=y
>   CONFIG_XMON=y
>   CONFIG_BOOTX_TEXT=y
>
>    $ make -kj"$(nproc)" ARCH=powerpc LLVM=$PWD/llvm-14.0.6-x86_64/bin/ ppc64le_defconfig vmlinux
>    ...
>      LD      vmlinux
>      NM      System.map
>      SORTTAB vmlinux
>      CHKHEAD vmlinux
>      CHKREL  vmlinux
>    make[4]: *** [scripts/Makefile.vmlinux:38: vmlinux] Error 139
>    make[4]: *** Deleting file 'vmlinux
>    ...
>
> I do not see the objtool command in V=1 output but I do see the end of
> scripts/link-vmlinux.sh, so it does seem like it is crashing in objtool.
>
> [1]: from https://mirrors.edge.kernel.org/pub/tools/llvm/

Thanks for reporting this, and apologies for the delay in response.

This issue is happening while processing __fw_ftr_fixup section, which 
has no data and dereferencing this null pointer is causing segmentation 
fault. I was able to recreate the issue, and the below diff fixes it for me.

diff --git a/tools/objtool/arch/powerpc/special.c 
b/tools/objtool/arch/powerpc/special.c
index 5ec3eed34eb0..67329d44db24 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -53,38 +53,39 @@ int process_fixup_entries(struct objtool_file *file)
                 if (strstr(sec->name, "_ftr_fixup") != NULL) {
                         Elf_Data *data = sec->data;

-                       if (data && data->d_size > 0)
+                       if (data && data->d_size > 0) {
                                 nr = data->d_size / sizeof(struct 
fixup_entry);

-                       for (i = 0; i < nr; i++) {
-                               struct fixup_entry *dst;
-                               unsigned long idx;
-                               unsigned long long off;
-                               struct fixup_entry *src;
+                               for (i = 0; i < nr; i++) {
+                                       struct fixup_entry *dst;
+                                       unsigned long idx;
+                                       unsigned long long off;
+                                       struct fixup_entry *src;

-                               idx = i * sizeof(struct fixup_entry);
-                               off = sec->sh.sh_addr + data->d_off + idx;
-                               src = data->d_buf + idx;
+                                       idx = i * sizeof(struct 
fixup_entry);
+                                       off = sec->sh.sh_addr + 
data->d_off + idx;
+                                       src = data->d_buf + idx;

-                               if (src->alt_start_off == src->alt_end_off)
-                                       continue;
+                                       if (src->alt_start_off == 
src->alt_end_off)
+                                               continue;

-                               fes = realloc(fes, (nr_fes + 1) * 
sizeof(struct fixup_entry));
-                               dst = &fes[nr_fes];
-                               nr_fes++;
+                                       fes = realloc(fes, (nr_fes + 1) 
* sizeof(struct fixup_entry));
+                                       dst = &fes[nr_fes];
+                                       nr_fes++;

-                               dst->mask = __le64_to_cpu(src->mask);
-                               dst->value = __le64_to_cpu(src->value);
-                               dst->start_off = 
__le64_to_cpu(src->start_off) + off;
-                               dst->end_off = 
__le64_to_cpu(src->end_off) + off;
-                               dst->alt_start_off = 
__le64_to_cpu(src->alt_start_off) + off;
-                               dst->alt_end_off = 
__le64_to_cpu(src->alt_end_off) + off;
+                                       dst->mask = 
__le64_to_cpu(src->mask);
+                                       dst->value = 
__le64_to_cpu(src->value);
+                                       dst->start_off = 
__le64_to_cpu(src->start_off) + off;
+                                       dst->end_off = 
__le64_to_cpu(src->end_off) + off;
+                                       dst->alt_start_off = 
__le64_to_cpu(src->alt_start_off) + off;
+                                       dst->alt_end_off = 
__le64_to_cpu(src->alt_end_off) + off;

-                               if (dst->alt_start_off < fe_alt_start)
-                                       fe_alt_start = dst->alt_start_off;
+                                       if (dst->alt_start_off < 
fe_alt_start)
+                                               fe_alt_start = 
dst->alt_start_off;

-                               if (dst->alt_end_off > fe_alt_end)
-                                       fe_alt_end = dst->alt_end_off;
+                                       if (dst->alt_end_off > fe_alt_end)
+                                               fe_alt_end = 
dst->alt_end_off;
+                               }
                         }
                 }
         }
@@ -246,7 +247,6 @@ static struct symbol *find_symbol_at_address(struct 
objtool_file *file,
  int process_alt_relocations(struct objtool_file *file)
  {
         struct section *section;
-       size_t n = 0;
         uint32_t insn;
         uint32_t *i;
         unsigned int opcode;
@@ -276,8 +276,6 @@ int process_alt_relocations(struct objtool_file *file)
                                 target = target + 0x8;
                 }

-               n++;
-
                 fe = find_fe_altaddr(addr);
                 if (fe) {

I'll include these changes in the next version.

Thanks,
Sathvika
