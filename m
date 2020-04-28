Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED041BC58D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 18:44:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BSDG57QLzDqdv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 02:44:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BRZY4fw9zDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 02:15:33 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SG2nLe020082; Tue, 28 Apr 2020 12:15:23 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9nsjnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 12:15:23 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03SGFMDJ079299;
 Tue, 28 Apr 2020 12:15:23 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh9nsjmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 12:15:22 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SGAQ3r002759;
 Tue, 28 Apr 2020 16:15:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 30mcu590wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 16:15:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03SGFF2D59638144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 16:15:16 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D40E111C04C;
 Tue, 28 Apr 2020 16:15:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 470CB11C054;
 Tue, 28 Apr 2020 16:15:15 +0000 (GMT)
Received: from localhost (unknown [9.85.73.214])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Apr 2020 16:15:14 +0000 (GMT)
Date: Tue, 28 Apr 2020 21:45:08 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/7] consolidate PowerPC instruction encoding macros
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200424070853.443969-1-bala24@linux.ibm.com>
In-Reply-To: <20200424070853.443969-1-bala24@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1588090451.55tcacz2g5.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_11:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004280121
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Balamuruhan S wrote:
> ppc-opcode.h have base instruction encoding wrapped with stringify_in_c()
> for raw encoding to have compatibility. But there are redundant macros fo=
r
> base instruction encodings in bpf, instruction emulation test infrastruct=
ure
> and powerpc selftests.
>=20
> Currently PPC_INST_* macros are used for encoding instruction opcode and =
PPC_*
> for raw instuction encoding, this rfc patchset introduces PPC_RAW_* macro=
s for
> base instruction encoding and reuse it from elsewhere. With this change w=
e can
> avoid redundant macro definitions in multiple files and start adding new
> instructions in ppc-opcode.h in future.
>=20
> Changes in v2:
> -------------
> Fix review comments/suggestions from Naveen and Michael Ellerman,
>=20
> * Rename PPC_ENCODE_* to PPC_RAW_* for base instruction encoding macros.
> * Split the patches that does mass renaming and make them simpler that ju=
st
>   adds new macros.
> * Keep the patch to update all the existing names later (patch 6).
> * Lot of PPC_INST_* macros are used only in ppc-opcode.h for PPC_*  macro=
s,
>   fold PPC_INST_* encoding into PPC_RAW_* to avoid using them accidentall=
y.
> * Fixed clipped macros that was due to a typo/copy-paste
> * Consolidated all the instruction encoding macros from bpf_jit.h to
>   ppc-opcode.h
> * squashed patch that removes the duplicate macro PPC_MR() in bpf_jit.h
> * merge few changes in bpf_jit files from patch 2 into patch 3
> * few fixes in powerpc selftest stringloops Makefile
> * build tested for ppc64le_defconfig, ppc64e_defconfig and pmac32_defconf=
ig
> * Rebased on next branch of linuxppc tree
>=20
> Testing:
> -------
> * Tested it by compiling vmlinux and comparing objdump of it with and wit=
hout
>   the patchset and observed that it remains same,
>=20
>   # diff vmlinux_objdump vmlinux_rfc_objdump=20
>   2c2
>   < vmlinux:     file format elf64-powerpcle
>   ---
>   > vmlinux_rfc:     file format elf64-powerpcle
>=20
> * Tested building it with this changes for Fedora30 config, booted VM
>   with powerpc next and powerpc next + patchset to run powerpc selftest a=
nd
>   ftrace selftest. There were couple of failures that were common and
>   patchset did not introduce any new failures.
>=20
>   ftrace selftest:
>   ---------------
> 	# # of passed:  96
> 	# # of failed:  1
> 	# # of unresolved:  7
> 	# # of untested:  0
> 	# # of unsupported:  1
> 	# # of xfailed:  1
> 	# # of undefined(test bug):  0
> 	not ok 1 selftests: ftrace: ftracetest # exit=3D1
>=20
>   powerpc selftest:
>   ----------------
>         not ok 7 selftests: powerpc/dscr: dscr_sysfs_thread_test # exit=
=3D1
>         not ok 20 selftests: powerpc/pmu/ebb: lost_exception_test # TIMEO=
UT
>         not ok 2 selftests: powerpc/security: spectre_v2 # exit=3D1
>=20
> Thanks to Naveen, Sandipan and Michael on overall suggestions/improvement=
s.
>=20
> I would request for review and suggestions to make it better.
>=20
> v1: https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-March/206494.htm=
l
>=20
> Balamuruhan S (7):
>   powerpc/ppc-opcode: introduce PPC_RAW_* macros for base instruction
>     encoding
>   powerpc/ppc-opcode: move ppc instruction encoding from
>     test_emulate_step
>   powerpc/bpf_jit: reuse instruction macros from ppc-opcode.h
>   powerpc/ppc-opcode: consolidate powerpc instructions from bpf_jit.h
>   powerpc/ppc-opcode: reuse raw instruction macros to stringify
>   powerpc/ppc-opcode: fold PPC_INST_* macros into PPC_RAW_* macros
>   powerpc/selftest: reuse ppc-opcode macros to avoid redundancy
>=20
>  arch/powerpc/include/asm/ppc-opcode.h         | 706 +++++++++++-------
>  arch/powerpc/lib/test_emulate_step.c          | 155 ++--
>  arch/powerpc/net/bpf_jit.h                    | 184 +----
>  arch/powerpc/net/bpf_jit32.h                  |  34 +-
>  arch/powerpc/net/bpf_jit64.h                  |  16 +-
>  arch/powerpc/net/bpf_jit_comp.c               | 134 ++--
>  arch/powerpc/net/bpf_jit_comp64.c             | 298 ++++----
>  .../selftests/powerpc/stringloops/Makefile    |  34 +-
>  .../powerpc/stringloops/asm/asm-const.h       |   1 +
>  .../powerpc/stringloops/asm/ppc-opcode.h      |  36 +-
>  10 files changed, 762 insertions(+), 836 deletions(-)
>  create mode 120000 tools/testing/selftests/powerpc/stringloops/asm/asm-c=
onst.h
>  mode change 100644 =3D> 120000 tools/testing/selftests/powerpc/stringloo=
ps/asm/ppc-opcode.h

This LGTM. Except the last patch:
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


Thanks!
- Naveen

