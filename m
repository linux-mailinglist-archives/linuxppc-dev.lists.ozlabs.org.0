Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAC117A585
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 13:44:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y9Rl2CvvzDqk7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 23:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y9NN18jxzDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 23:41:23 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025Ccv46003198
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Mar 2020 07:41:21 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yk043kaqq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 07:41:20 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Thu, 5 Mar 2020 12:41:13 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 12:41:10 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025Cf9I551576978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 12:41:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2949A4067;
 Thu,  5 Mar 2020 12:41:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C51A4054;
 Thu,  5 Mar 2020 12:41:08 +0000 (GMT)
Received: from localhost (unknown [9.199.53.44])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 12:41:07 +0000 (GMT)
Date: Thu, 05 Mar 2020 18:11:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: eh_frame confusion
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
 <877e01spfa.fsf@mpe.ellerman.id.au>
In-Reply-To: <877e01spfa.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20030512-4275-0000-0000-000003A8A160
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030512-4276-0000-0000-000038BDB137
Message-Id: <1583411741.zbaz5p86qy.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_03:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050082
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>> Rasmus Villemoes wrote:
>>> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-=
7
>>> to gcc-8 all object files now end up having .eh_frame section. For
>>> vmlinux, that's not a problem, because they all get discarded in
>>> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
>>> modules, which doesn't seem to be useful - given that everything worked
>>> just fine with gcc-7, and I don't see anything in the module loader tha=
t
>>> handles .eh_frame.
>>>=20
>>> The reason I care is that my target has a rather tight rootfs budget,
>>> and the .eh_frame section seem to occupy 10-30% of the file size
>>> (obviously very depending on the particular module).
>>>=20
>>> Comparing the .foo.o.cmd files, I don't see change in options that migh=
t
>>> explain this (there's a bunch of new -Wno-*, and the -mspe=3Dno spellin=
g
>>> is apparently no longer supported in gcc-8). Both before and after, the=
re's
>>>=20
>>> -fno-dwarf2-cfi-asm
>>>=20
>>> about which gcc's documentation says
>>>=20
>>> '-fno-dwarf2-cfi-asm'
>>>      Emit DWARF unwind info as compiler generated '.eh_frame' section
>>>      instead of using GAS '.cfi_*' directives.
>>>=20
>>> Looking into where that comes from got me even more confused, because
>>> both arm and unicore32 say
>>>=20
>>> # Never generate .eh_frame
>>> KBUILD_CFLAGS           +=3D $(call cc-option,-fno-dwarf2-cfi-asm)
>>>=20
>>> while the ppc32 case at hand says
>>>=20
>>> # FIXME: the module load should be taught about the additional relocs
>>> # generated by this.
>>> # revert to pre-gcc-4.4 behaviour of .eh_frame
>>
>> Michael opened a task to look into this recently and I had spent some=20
>> time last week on this. The original commit/discussion adding=20
>> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being=20
>> handled by our module loader:
>> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org
>=20
> I opened that issue purely based on noticing the wart in the Makefile,
> not because I'd actually tested it.
>=20
>> However, that is now handled thanks to commit 9f751b82b491d:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D9f751b82b491d
>=20
> Haha, written by me, what an idiot.
>=20
> So the Makefile hack can presumably be dropped, because the module
> loader can handle the relocations.
>=20
> And then maybe we also want to turn off the unwind tables, but that
> would be a separate patch.
>=20
>> I did a test build and a simple module loaded fine, so I think=20
>> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen=20
>> some breakages with it. Michael?
>=20
> No, as I said above it was just reading the Makefile.

Ok, thanks for clarifying. To test, I did 'allmodconfig' builds across=20
three environments:
- gcc (Ubuntu 9.2.1-9ubuntu2) 9.2.1 20191008 -- ppc64le
- gcc (SUSE Linux) 7.5.0 -- ppc64le
- gcc (GCC) 8.2.1 20181215 (Red Hat 8.2.1-6) -- ppc64 (BE)

Then, used the below command to list all relocations in the modules:
$ find . -name '*.ko' | xargs -n 1 readelf -Wr  | grep -v "Relocation " | g=
rep -v "Offset " | cut -d' ' -f4 | sort | uniq

R_PPC64_ADDR32
R_PPC64_ADDR64
R_PPC64_ENTRY
R_PPC64_REL24
R_PPC64_REL32
R_PPC64_REL64
R_PPC64_TOC
R_PPC64_TOC16_HA
R_PPC64_TOC16_LO
R_PPC64_TOC16_LO_DS

All three environments show up similar set of relocations, all of which=20
we handle in the module loader today.

If Rasmus/Christophe can confirm that this is true for ppc32 as well,=20
then we should be fine.

- Naveen

