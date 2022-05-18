Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323752BFD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 18:49:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3JqF3BtKz3cDq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 02:49:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D5zEioSJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D5zEioSJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3JpV0Shpz2xnL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 02:48:33 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24IGfkUK011224;
 Wed, 18 May 2022 16:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=E/KJiJDZWVaEZCn40lud7/8o1j+K/VJuslMugUXGBiM=;
 b=D5zEioSJUJ8vkCIdHAi4TDMrK4U4XhfCug2DAIR8zX2OuVMUWSkyZzjuHfI9rSIy4+kd
 eZW5F8gvD7juFBW6sa+H1otOJkWbEYfdbJjNMTmOTaHkeZYyvd2uTlie9W6LoCH9oibf
 WR3TAjr4ZPnezjeWet/7ZJAzZ7ExG57LcBJIZcN6KkbEZHbCRC0dTSuquzjlHgb0OUbv
 Q9vmO0p/8zwSyf0egtDUEON6stpzye+4ZEvtTeCoVcs3f7AfzC/RJNEAanP4oAjROO+Q
 xq28LrMILcO/84fKEJdjmkWUcQZCtIak3rX30jfzRelFaQLFMkO/ns9bGPLgPBKoDznm PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g54hyg4ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 16:48:21 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24IGgE5E012824;
 Wed, 18 May 2022 16:48:20 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g54hyg4mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 16:48:20 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24IGXlaw012021;
 Wed, 18 May 2022 16:48:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428vvps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 16:48:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24IGmFSV48824774
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 16:48:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B77D04C046;
 Wed, 18 May 2022 16:48:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C1E74C044;
 Wed, 18 May 2022 16:48:15 +0000 (GMT)
Received: from localhost (unknown [9.43.19.36])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 16:48:15 +0000 (GMT)
Date: Wed, 18 May 2022 22:18:13 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
To: "Eric W. Biederman" <ebiederm@xmission.com>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
 <YoNqJ/MOSIVwKP/o@MiWiFi-R3L-srv>
 <1652782155.56t7mah8ib.naveen@linux.ibm.com>
 <8735h8b2f1.fsf@email.froward.int.ebiederm.org>
 <87v8u3o9tk.fsf@mpe.ellerman.id.au>
 <875ym2aoc7.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <875ym2aoc7.fsf@email.froward.int.ebiederm.org>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652892300.1k6kqwc17y.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XO4RXk88ZrBBP6VnIK7Xps7fUVZDizXw
X-Proofpoint-GUID: x_NDsOGiwNsBgH-jBOd0QAcoHw3VvYLa
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180099
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
Cc: linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric W. Biederman wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>=20
>> "Eric W. Biederman" <ebiederm@xmission.com> writes:
>>> Looking at this the pr_err is absolutely needed.  If an unsupported case
>>> winds up in the purgatory blob and the code can't handle it things
>>> will fail silently much worse later.
>>
>> It won't fail later, it will fail the syscall.
>>
>> sys_kexec_file_load()
>>   kimage_file_alloc_init()
>>     kimage_file_prepare_segments()
>>       arch_kexec_kernel_image_load()
>>         kexec_image_load_default()
>>           image->fops->load()
>>             elf64_load()        # powerpc
>>             bzImage64_load()    # x86
>>               kexec_load_purgatory()
>>                 kexec_apply_relocations()
>>
>> Which does:
>>
>> 	if (relsec->sh_type =3D=3D SHT_RELA)
>> 		ret =3D arch_kexec_apply_relocations_add(pi, section,
>> 						       relsec, symtab);
>> 	else if (relsec->sh_type =3D=3D SHT_REL)
>> 		ret =3D arch_kexec_apply_relocations(pi, section,
>> 						   relsec, symtab);
>> 	if (ret)
>> 		return ret;
>>
>> And that error is bubbled all the way back up. So as long as
>> arch_kexec_apply_relocations() returns an error the syscall will fail
>> back to userspace and there'll be an error message at that level.
>>
>> It's true that having nothing printed in dmesg makes it harder to work
>> out why the syscall failed. But it's a kernel bug if there are unhandled
>> relocations in the kernel-supplied purgatory code, so a user really has
>> no way to do anything about the error even if it is printed.
>=20
> Good point.  I really hadn't noticed the error code in there when I
> looked.
>=20
> I still don't think changing the functionality of the code because of
> a tool issue is the right solution.

Ok.

>=20
>=20
>>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>>
>>>> Baoquan He wrote:
>>>>> On 04/25/22 at 11:11pm, Naveen N. Rao wrote:
>>>>>> kexec_load_purgatory() can fail for many reasons - there is no need =
to
>>>>>> print an error when encountering unsupported relocations.
>>>>>> This solves a build issue on powerpc with binutils v2.36 and newer [=
1].
>>>>>> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
>>>>>> symbols") [2], binutils started dropping section symbols that it tho=
ught
>>>>> I am not familiar with binutils, while wondering if this exists in ot=
her
>>>>> ARCHes except of ppc. Arm64 doesn't have the ARCH override either, do=
 we
>>>>> have problem with it?
>>>>
>>>> I'm not aware of this specific file causing a problem on other archite=
ctures -
>>>> perhaps the config options differ enough. There are however more repor=
ts of
>>>> similar issues affecting other architectures with the llvm integrated =
assembler:
>>>> https://github.com/ClangBuiltLinux/linux/issues/981
>>>>
>>>>>
>>>>>> were unused.  This isn't an issue in general, but with kexec_file.c,=
 gcc
>>>>>> is placing kexec_arch_apply_relocations[_add] into a separate
>>>>>> .text.unlikely section and the section symbol ".text.unlikely" is be=
ing
>>>>>> dropped. Due to this, recordmcount is unable to find a non-weak symb=
ol
>>>>> But arch_kexec_apply_relocations_add is weak symbol on ppc.
>>>>
>>>> Yes. Note that it is just the section symbol that gets dropped. The se=
ction is
>>>> still present and will continue to hold the symbols for the functions
>>>> themselves.
>>>
>>> So we have a case where binutils thinks it is doing something useful
>>> and our kernel specific tool gets tripped up by it.
>>
>> It's not just binutils, the LLVM assembler has the same behavior.
>>
>>> Reading the recordmcount code it looks like it is finding any symbol
>>> within a section but ignoring weak symbols.  So I suspect the only
>>> remaining symbol in the section is __weak and that confuses
>>> recordmcount.
>>>
>>> Does removing the __weak annotation on those functions fix the build
>>> error?  If so we can restructure the kexec code to simply not use __weak
>>> symbols.
>>>
>>> Otherwise the fix needs to be in recordmcount or binutils, and we should
>>> loop whoever maintains recordmcount in to see what they can do.
>>
>> It seems that recordmcount is not really maintained anymore now that x86
>> uses objtool?
>>
>> There've been several threads about fixing recordmcount, but none of
>> them seem to have lead to a solution.
>=20
> That is unfortunate.
>=20
>> These weak symbol vs recordmcount problems have been worked around going
>> back as far as 2020:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/include/linux/elfcore.h?id=3D6e7b64b9dd6d96537d816ea07ec26b7dedd397b9
>=20
> I am more than happy to adopt the kind of solution that was adopted
> there in elfcore.h and simply get rid of __weak symbols in the kexec
> code.
>=20
> Using __weak symbols is really not the common kernel way of doing
> things.  Using __weak symbols introduces a bit of magic in how the
> kernel gets built that is unnecessary.
>=20
> Can someone verify that deleting __weak is enough to get powerpc to
> build?  AKA:
>=20
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 8347fc158d2b..7f4ca8dbe26f 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -117,7 +117,7 @@ int __weak arch_kexec_kernel_verify_sig(struct kimage=
 *image, void *buf,
>   *
>   * Return: 0 on success, negative errno on error.
>   */
> -int __weak
> +int
>  arch_kexec_apply_relocations_add(struct purgatory_info *pi, Elf_Shdr *se=
ction,
>                                  const Elf_Shdr *relsec, const Elf_Shdr *=
symtab)
>  {
> @@ -134,7 +134,7 @@ arch_kexec_apply_relocations_add(struct purgatory_inf=
o *pi, Elf_Shdr *section,
>   *
>   * Return: 0 on success, negative errno on error.
>   */
> -int __weak
> +int
>  arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *sectio=
n,
>                              const Elf_Shdr *relsec, const Elf_Shdr *symt=
ab)
>  {

Yes, dropping the __weak attribute allows recordmcount to emit a=20
relocation using those symbols, so that resolves the problem.

>=20
> If that change is verified to work a proper patch that keeps x86 and
> s390 building that have actual implementations should not be too
> difficult to write.

Sure, I will post a patch for that.


Thanks,
Naveen

