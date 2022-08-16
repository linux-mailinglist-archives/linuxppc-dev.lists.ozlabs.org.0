Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56FB5960CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 19:06:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6cxy1GK3z3c4Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 03:06:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YL3OJlfJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YL3OJlfJ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6cxB2p08z3bZ2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 03:06:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GGiLUQ005227;
	Tue, 16 Aug 2022 17:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GjjxBkmOT7kfjjNUvdcUnZZdNAdgE5EWLferPMUXAnA=;
 b=YL3OJlfJ14C/KPkJRH8fKhPKtxIOlqOJCCgFbLlBfYmMkMVlPwl1iHQEcGvVjiGMJsXo
 yO9JGi5Mip9t30SQtzLm7bG2lseHrj967Kdgd5+z0DoVUkLuqBmERm+owzOgze1gPTci
 bUn1XWIJ9+3/wtPDjt2/OWXJvXD9bqeKpK6XqSYRKn9RYfPr+FHHd9GtLEj0/1pnHNdW
 ml8JmcSALUfRyXMglrSbQtCMj56n2OeR9UImqhMG3DmpdYe8g0/D75pGT7LWK1sOYczT
 pUwR1/hJD7YS1iTDHzA1y/2gDaQ+rWpgipepo4Qcf1UO35BDDeUoiK/tMe4XbTh9Bd7J Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0f0y0kd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 17:05:41 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27GGjE2Q008425;
	Tue, 16 Aug 2022 17:05:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0f0y0kc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 17:05:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27GH5LZN002388;
	Tue, 16 Aug 2022 17:05:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3hx37jbgk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 17:05:38 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27GH5a8b26608022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Aug 2022 17:05:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5780611C04A;
	Tue, 16 Aug 2022 17:05:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E38E011C04C;
	Tue, 16 Aug 2022 17:05:35 +0000 (GMT)
Received: from localhost (unknown [9.43.58.12])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 16 Aug 2022 17:05:35 +0000 (GMT)
Date: Tue, 16 Aug 2022 22:35:34 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] ftrace/recordmcount: Handle object files without
 section symbols
To: Steven Rostedt <rostedt@goodmis.org>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
	<20220816100423.5ee2e17c@gandalf.local.home>
In-Reply-To: <20220816100423.5ee2e17c@gandalf.local.home>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1660668823.oegvwl2214.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OzR97rxPfkN_j2hNnQzGXDMJE-1aixqM
X-Proofpoint-ORIG-GUID: PYoTJVUk2zunDwCz72cxwia_qgxH99mO
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-16_08,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160065
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Steven,

Steven Rostedt wrote:
> On Wed, 27 Apr 2022 15:01:20 +0530
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:
>=20
>> This solves a build issue on powerpc with binutils v2.36 and newer [1].
>> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
>> symbols") [2], binutils started dropping section symbols that it thought
>> were unused. Due to this, in certain scenarios, recordmcount is unable=20
>> to find a non-weak symbol to generate a relocation record against.
>>=20
>> Clang integrated assembler is also aggressive in dropping section=20
>> symbols [3].
>>=20
>> In the past, there have been various workarounds to address this. See=20
>> commits 55d5b7dd6451b5 ("initramfs: fix clang build failure") and=20
>> 6e7b64b9dd6d96 ("elfcore: fix building with clang") and a recent patch:
>> https://lore.kernel.org/linuxppc-dev/20220425174128.11455-1-naveen.n.rao=
@linux.vnet.ibm.com/T/#u
>>=20
>> Fix this issue by using the weak symbol in the relocation record. This=20
>> can result in duplicate locations in the mcount table if those weak=20
>> functions are overridden, so have ftrace skip dupicate entries.
>>=20
>> Objtool already follows this approach, so patch 2 updates recordmcount=20
>> to do the same. Patch 1 updates ftrace to skip duplicate entries.
>>=20
>> - Naveen
>>=20
>>=20
>> [1] https://github.com/linuxppc/issues/issues/388
>> [2] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dd1bc=
ae833b32f1
>> [3] https://github.com/ClangBuiltLinux/linux/issues/981
>>=20
>>
>=20
> There's been work to handle weak functions, but I'm not sure that work
> handled the issues here. Are these patches still needed, or was there
> another workaround to handle the problems this addressed?

I'm afraid these patches are still needed to address issues in=20
recordmcount.

I submitted patches to remove use of weak functions in the kexec=20
subsystem, but those have only enabled building ppc64le defconfig=20
without errors:
https://lore.kernel.org/all/20220519091237.676736-1-naveen.n.rao@linux.vnet=
.ibm.com/
https://lore.kernel.org/all/cover.1656659357.git.naveen.n.rao@linux.vnet.ib=
m.com/

The patch adding support for FTRACE_MCOUNT_MAX_OFFSET to powerpc only=20
helps ignore weak functions during runtime:
https://lore.kernel.org/all/20220809105425.424045-1-naveen.n.rao@linux.vnet=
.ibm.com/

We still see errors from recordmcount when trying to build certain=20
powerpc configs.

We are pursuing support for objtool, which doesn't have the same issues:
https://lore.kernel.org/all/20220808114908.240813-1-sv@linux.ibm.com/


- Naveen
