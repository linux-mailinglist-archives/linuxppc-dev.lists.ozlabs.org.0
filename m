Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287C52EBBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 14:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4QfM0wnmz3bnd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 22:15:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kPtln3di;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kPtln3di; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4Qdd6FpGz2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 22:14:45 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9gUMR027673;
 Fri, 20 May 2022 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=HnkwbgqFBhXvIE4MHL/s7hB16vhUQv5aLp4kKoH7S7k=;
 b=kPtln3dirtbF6vPRs+guw9mOeTRo/TvekfCurIGug0tL/UPnyDqtlLYm+AYThXuVfQey
 nDQqpGADOC0bIZUZMPhq7F2LWq+jAOhMHzUl4GwJ3S3cV/xaGi4Jt46fVwO0JSekc0AF
 Bh364MVlV7CMtWdDmbYE3+JXgtUYC5ILoATR4zogElrvso9YMAY1pRm5amjU7qVqR+kc
 F24lCZE7qoSnMjeR4HEd2CpokTVjgvAiB2P/f+l1l2dh0a3mhFT6z50ZkuA0d679k0qF
 gzDD1ZE3z598R/Hl5yWh4LpeBfnSjTxECu7Fl9L0TCKuE2agMXzkHOB18CVVdXlN59O8 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g68katkn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 12:14:39 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24KBuO2B022899;
 Fri, 20 May 2022 12:14:38 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g68katkm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 12:14:38 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24KCDIFF025235;
 Fri, 20 May 2022 12:14:36 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3g23pjgscm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 12:14:36 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24KCEYjN12648770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 12:14:34 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0DD7111C04A;
 Fri, 20 May 2022 12:14:34 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8195D11C054;
 Fri, 20 May 2022 12:14:33 +0000 (GMT)
Received: from localhost (unknown [9.43.91.35])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 12:14:33 +0000 (GMT)
Date: Fri, 20 May 2022 17:44:32 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
To: Alan Modra <amodra@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
 <1652772528.r6qrwbbda5.naveen@linux.ibm.com>
 <877d6kpcfq.fsf@mpe.ellerman.id.au>
 <YoWdnBdDhd8gk1hV@squeak.grove.modra.org>
In-Reply-To: <YoWdnBdDhd8gk1hV@squeak.grove.modra.org>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1653048520.jl5ckb2u8o.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tfpC7vfTzySSvyTJ8lh6f9tv98FDS5X-
X-Proofpoint-ORIG-GUID: qyAhe_fPClmcY6ZHWnearsTVceiQ4Hd_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200088
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alan Modra wrote:
> On Tue, May 17, 2022 at 10:32:09PM +1000, Michael Ellerman wrote:
>> "Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
>> > Michael Ellerman wrote:
>> >>
>> >> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/k=
ernel/vdso/gettimeofday.S
>> >> index eb9c81e1c218..0aee255e9cbb 100644
>> >> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
>> >> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
>> >> @@ -22,12 +22,15 @@
>> >>  .macro cvdso_call funct call_time=3D0
>> >>    .cfi_startproc
>> >>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> >> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>> >>  	mflr		r0
>> >> -  .cfi_register lr, r0
>> >>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
>> >> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>> >>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
>> >
>> > <snip>
>> >
>> >> @@ -46,6 +50,7 @@
>> >>  	mtlr		r0
>> >>    .cfi_restore lr
>> >>  	addi		r1, r1, 2 * PPC_MIN_STKFRM
>> >> +  .cfi_def_cfa_offset 0
>> >
>> > Should this be .cfi_adjust_cfa_offset, given that we used that at the
>> > start of the function?
>> =20
>> AIUI "adjust x" is offset +=3D x, whereas "def x" is offset =3D x.
>=20
> Yes.
>=20
>> So we could use adjust here, but we'd need to adjust by -(2 * PPC_MIN_ST=
KFRM).
>=20
> Yes.
>=20
>> It seemed clearer to just set the offset back to 0, which is what it is
>> at the start of the function.
>=20
> Yes.  In detail, both .cfi_def_cfa_offset and .cfi_adjust_cfa_offset
> are interpreteted by the assembler into DW_CFA_def_cfa_offset byte
> codes, so you should get the same .eh_frame contents if using Naveen's
> suggestion.  It boils down to style really, and the most common style
> is to use ".cfi_def_cfa_offset 0" here.

Thank you, that clarifies things.


- Naveen

