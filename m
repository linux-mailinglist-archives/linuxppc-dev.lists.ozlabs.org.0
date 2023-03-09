Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2446B3245
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 00:48:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXm8W3tvzz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 10:48:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Btfe/GDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Btfe/GDJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXm7X67dVz3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 10:47:20 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 329M1YOj029031;
	Thu, 9 Mar 2023 23:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3LlCvWW+Akb1tfv1EBs/FH6bYOv3lSRDD6cr8CZQbDU=;
 b=Btfe/GDJ45O7PsWyLD21OV9Zm41FA2sWZOchlnCJuusIout0UdQDkydDxSgA5tO5j9g+
 jsphngDrz08mIq04EkgXySEnuOokUWE8QACsF+eWd6O5ogLMDK5DxhDUw4rC9AZpjaeV
 +Cz18aRP+vtvsvtMLnXby/4c5+HuQaz3YIf/ripPcSJd7c5Y7wqjAG1QFgzwWuTd+8oM
 O7P5rkffrQiDgIhr5HtWoVRzXAFCMTv+ZBxqRM3CfJD5o45pg83EDxMBvQzoEfbRh+oi
 F4cOlzV8le6B5XyeTa1OxVPZxnocQ8Tgf3uGHPcluF2gTlxcRf9ig9u2j5KkV1WMMnjy RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6rh4mxrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 23:47:10 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 329Ni906017235;
	Thu, 9 Mar 2023 23:47:10 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6rh4mxqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 23:47:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 329FvDmV019985;
	Thu, 9 Mar 2023 23:47:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p6ftvk2e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 23:47:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 329Nl5aS2753070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Mar 2023 23:47:05 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3BA62004B;
	Thu,  9 Mar 2023 23:47:04 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7348E20043;
	Thu,  9 Mar 2023 23:47:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Mar 2023 23:47:04 +0000 (GMT)
Received: from [9.177.5.37] (unknown [9.177.5.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6A4AD60112;
	Fri, 10 Mar 2023 10:46:56 +1100 (AEDT)
Message-ID: <393a03b2b681d12edfd864b3d02a7378611a4bcf.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 02/13] powerpc: Add initial Dynamic Execution
 Control Register (DEXCR) support
From: Benjamin Gray <bgray@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 10 Mar 2023 10:46:51 +1100
In-Reply-To: <CQZVLQQBO6K9.2A71BY640ZH5P@bobo>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
	 <20221128024458.46121-3-bgray@linux.ibm.com>
	 <CQZVLQQBO6K9.2A71BY640ZH5P@bobo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jt79bXgDpk57GoLDPDbqVeQGpncDzsU7
X-Proofpoint-ORIG-GUID: jxeoHBgHrA6cYF_A4AzZO9TNWr7MUu04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_12,2023-03-09_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090189
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
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-03-07 at 14:45 +1000, Nicholas Piggin wrote:
> On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> > diff --git a/arch/powerpc/include/asm/cputable.h
> > b/arch/powerpc/include/asm/cputable.h
> > index 757dbded11dc..03bc192f2d8b 100644
> > --- a/arch/powerpc/include/asm/cputable.h
> > +++ b/arch/powerpc/include/asm/cputable.h
> > @@ -192,6 +192,10 @@ static inline void cpu_feature_keys_init(void)
> > { }
> > =C2=A0#define
> > CPU_FTR_P9_RADIX_PREFETCH_BUG=C2=A0=C2=A0LONG_ASM_CONST(0x0002000000000=
000)
> > =C2=A0#define
> > CPU_FTR_ARCH_31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0LONG_ASM_CONST(0x00040000000
> > 00000)
> > =C2=A0#define
> > CPU_FTR_DAWR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0LONG_ASM_CONST(0x0008000=
000000000)
> > +#define
> > CPU_FTR_DEXCR_SBHE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0LONG_ASM_CONST(0x0010000000000000)
> > +#define
> > CPU_FTR_DEXCR_IBRTPD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0LONG_ASM_CONST(0x0020000000000000)
> > +#define
> > CPU_FTR_DEXCR_SRAPD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0LONG_ASM_CONST(0x0040000000000000)
> > +#define
> > CPU_FTR_DEXCR_NPHIE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0LONG_ASM_CONST(0x0080000000000000)
>=20
> We potentially don't need to use CPU_FTR bits for each of these. We
> only really want them to use instruction patching and make feature
> tests fast. But we have been a bit liberal with using them and they
> are kind of tied into cpu feature parsing code so maybe it's easier
> to go with them for now.

For the static only DEXCR series I've only got CPU_FTR_DEXCR_NPHIE
because that's needed for hashkey updates. The others don't really
matter; they are only interesting for masking out unsupported bits.
Masking itself seems to be unnecessary; the DEXCR will just ignore
unsupported bits. Attempting to set all bits on a P10 showed the first
8 were set and the remainder stayed 0'd, and the kernel worked fine.

It's definitely easier to use CPU_FTR_* for feature detection from the
PAPR specified blob though. Maybe it would be possible to support a
callback on a match instead of setting a feature flag.
@@ -1802,7 +1809,7 @@ int copy_thread(struct task_struct *p, const
>=20
>=20

> > @@ -1802,7 +1809,7 @@ int copy_thread(struct task_struct *p, const
> > struct kernel_clone_args *args)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0setup_ksp_vsid(p, sp);
> > =C2=A0
> > -#ifdef CONFIG_PPC64=20
> > +#ifdef CONFIG_PPC64
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (cpu_has_feature(CPU=
_FTR_DSCR)) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0p->thread.dscr_inherit =3D current-
> > >thread.dscr_inherit;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0p->thread.dscr =3D mfspr(SPRN_DSCR);
> > @@ -1939,6 +1946,10 @@ void start_thread(struct pt_regs *regs,
> > unsigned long start, unsigned long sp)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0current->thread.tm_tfia=
r =3D 0;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0current->thread.load_tm=
 =3D 0;
> > =C2=A0#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (cpu_has_feature(CPU_FTR_=
ARCH_31))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0mtspr(SPRN_DEXCR, get_thread_dexcr(&current-
> > >thread));
> > +#endif /* CONFIG_PPC_BOOK3S_64 */
>=20
> You possibly don't need the ifdef here because CPU_FTR_ARCH_31 should
> fold away. Some of the others do because they're using open-coded
> access to struct members, but if you're using accessor functions to
> get and set such things, there may be no need to.
>=20
> I think my preference is for your style.

I've been revisiting where the DEXCR is initialised and updated. With
the static DEXCR, the thread value is just a field on the task struct
like the others.
