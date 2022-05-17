Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1E529B97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 09:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2T6l1Rxvz3c92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 17:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WL/rW8rR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WL/rW8rR; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2T623Wycz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 17:59:06 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H7hJDH011815;
 Tue, 17 May 2022 07:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=AJZL22UqzSZu0UvrmsNg3hl1xbVu9uMb/EIUOgJ0hrQ=;
 b=WL/rW8rR3oiBE2NMBSWC7TCsK/iE7mbw4tdWIDGTAUnydIfoIBiXEkca3gYIwnaRGU0i
 SokiST0gbfrBuu6I1DzNn3CokSa0fPx1w9EFdWLseh/LIrgCcGgvO/5vNJH4+hB4HYhP
 1qf6PKtjaaTTVxAhitJ1fWmsi/GmyPMNYRE6Hl4IcUnBvBYuwImsQPh1UfqB6dmO9IJs
 ye4SH4y+K2auNpsY0ufT4lNhDPpYqVnPXxDCuGx4aCgJaZ7/eXpjR/eNKnzKIX+dO6qx
 splm8uU4cC1xfPWqzgVc9c6bgERCxaPdjtVn4hQz9Rn+SlodXYYM3suhqSYSGk4xRT0j sQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g47jjgaaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 07:58:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24H7vfao022874;
 Tue, 17 May 2022 07:58:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429bu21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 07:58:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24H7wkW556295818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 07:58:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A6A942042;
 Tue, 17 May 2022 07:58:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BDC942041;
 Tue, 17 May 2022 07:58:45 +0000 (GMT)
Received: from localhost (unknown [9.43.12.56])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 May 2022 07:58:45 +0000 (GMT)
Date: Tue, 17 May 2022 13:28:44 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
To: Eric Biederman <ebiederm@xmission.com>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652773499.wq57us3gto.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: s6DclNqzAeKk5RA5urcRtKgKbz3SoS10
X-Proofpoint-ORIG-GUID: s6DclNqzAeKk5RA5urcRtKgKbz3SoS10
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=647 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170044
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N. Rao wrote:
> kexec_load_purgatory() can fail for many reasons - there is no need to
> print an error when encountering unsupported relocations.
>=20
> This solves a build issue on powerpc with binutils v2.36 and newer [1].
> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> symbols") [2], binutils started dropping section symbols that it thought
> were unused.  This isn't an issue in general, but with kexec_file.c, gcc
> is placing kexec_arch_apply_relocations[_add] into a separate
> .text.unlikely section and the section symbol ".text.unlikely" is being
> dropped. Due to this, recordmcount is unable to find a non-weak symbol
> in .text.unlikely to generate a relocation record against. Dropping
> pr_err() calls results in these functions being left in .text section,
> enabling recordmcount to emit a proper relocation record.
>=20
> [1] https://github.com/linuxppc/issues/issues/388
> [2] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dd1bca=
e833b32f1
>=20
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  kernel/kexec_file.c | 2 --
>  1 file changed, 2 deletions(-)

Eric,
Any comments on this? There have been many reports of build breakages=20
due to this.

FWIW, there have been similar fixes in the past:
- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/init/initramfs.c?id=3D55d5b7dd6451b58489ce384282ca5a4a289eb8d5
- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/include/linux/elfcore.h?id=3D6e7b64b9dd6d96537d816ea07ec26b7dedd397b9


- Naveen

