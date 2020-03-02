Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE21760C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 18:11:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WRVy4cq2zDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 04:11:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WRSr5B9nzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 04:09:15 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022GxZ99129712
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 12:09:13 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmu4270u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 12:09:12 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.ibm.com>;
 Mon, 2 Mar 2020 17:09:11 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 17:09:09 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022H98mL57344244
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 17:09:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24BCD52051;
 Mon,  2 Mar 2020 17:09:08 +0000 (GMT)
Received: from localhost (unknown [9.199.48.41])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A98FC5204E;
 Mon,  2 Mar 2020 17:09:07 +0000 (GMT)
Date: Mon, 02 Mar 2020 22:39:06 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: eh_frame confusion
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
In-Reply-To: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 20030217-0020-0000-0000-000003AFAB6F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030217-0021-0000-0000-00002207D78C
Message-Id: <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_06:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020115
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

Rasmus Villemoes wrote:
> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
> to gcc-8 all object files now end up having .eh_frame section. For
> vmlinux, that's not a problem, because they all get discarded in
> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
> modules, which doesn't seem to be useful - given that everything worked
> just fine with gcc-7, and I don't see anything in the module loader that
> handles .eh_frame.
>=20
> The reason I care is that my target has a rather tight rootfs budget,
> and the .eh_frame section seem to occupy 10-30% of the file size
> (obviously very depending on the particular module).
>=20
> Comparing the .foo.o.cmd files, I don't see change in options that might
> explain this (there's a bunch of new -Wno-*, and the -mspe=3Dno spelling
> is apparently no longer supported in gcc-8). Both before and after, there=
's
>=20
> -fno-dwarf2-cfi-asm
>=20
> about which gcc's documentation says
>=20
> '-fno-dwarf2-cfi-asm'
>      Emit DWARF unwind info as compiler generated '.eh_frame' section
>      instead of using GAS '.cfi_*' directives.
>=20
> Looking into where that comes from got me even more confused, because
> both arm and unicore32 say
>=20
> # Never generate .eh_frame
> KBUILD_CFLAGS           +=3D $(call cc-option,-fno-dwarf2-cfi-asm)
>=20
> while the ppc32 case at hand says
>=20
> # FIXME: the module load should be taught about the additional relocs
> # generated by this.
> # revert to pre-gcc-4.4 behaviour of .eh_frame

Michael opened a task to look into this recently and I had spent some=20
time last week on this. The original commit/discussion adding=20
-fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being=20
handled by our module loader:
http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org

However, that is now handled thanks to commit 9f751b82b491d:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D9f751b82b491d

I did a test build and a simple module loaded fine, so I think=20
-fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen=20
some breakages with it. Michael?

>=20
> but prior to gcc-8, .eh_frame didn't seem to get generated anyway.
>=20
> Can .eh_frame sections be discarded for modules (on ppc32 at least), or
> is there some magic that makes them necessary when building with gcc-8?

As Segher points out, it looks like we need to add=20
-fno-asynchronous-unwind-tables. Most other architectures seem to use=20
that too.


- Naveen

