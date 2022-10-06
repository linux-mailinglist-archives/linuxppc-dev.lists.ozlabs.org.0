Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5325F708E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 23:55:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk4xZ49Bbz3dqj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 08:55:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LSG+PXRW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LSG+PXRW;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk4wY6qyWz305M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 08:54:36 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296LO5xK023003;
	Thu, 6 Oct 2022 21:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0mmSbnP+6DjzEWrkv13SkelocKElJaH6D0IxA2ZwEFk=;
 b=LSG+PXRW6C5cMBD3XIT7MQaZ4q+P+ximgwoFtYsUqB0v7m8g4N5Yz6fyyCIqnAmcNov8
 H7ljl8xdxKUK8SK+4dY8Aq/5cGdZUR/pJyhXfIrVCLAckL0P9QLDF9IZfrO/1SVd3+Y0
 PICmuwvlE2U980WqNfK6WX9hhs9gCdV6Vd0YyyS6DUjmr+4pyhLTw42JPHXd8TncO0hm
 LIr7lPcUZzB2mXkLBzuWZlGHurmi+BIme+Qoj05SrHYyE93i0ztpZVAt9FqxzdptUi0r
 i/INo5+ekVyGnO00DdnwulK7wgAJaunj0fMDVwXf7qhRL7wGQSulyvmt5JS26LeUuKt2 9w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k26wcrkd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 21:54:17 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296LsGXk008064;
	Thu, 6 Oct 2022 21:54:16 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k26wcrkcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 21:54:16 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 296LqqkC022422;
	Thu, 6 Oct 2022 21:54:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06ams.nl.ibm.com with ESMTP id 3jxctj7q77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 21:54:14 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 296LsC3h54985058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 21:54:12 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D5EDA404D;
	Thu,  6 Oct 2022 21:54:12 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0C7AA4040;
	Thu,  6 Oct 2022 21:54:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Oct 2022 21:54:11 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (unknown [9.177.83.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 03F216010A;
	Fri,  7 Oct 2022 08:53:58 +1100 (AEDT)
Message-ID: <136eafe32db573368efa1bd7e0aac8b85aa4ac02.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/6] powerpc/code-patching: Implement generic text
 patching function
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 07 Oct 2022 08:53:53 +1100
In-Reply-To: <b28d8d04-8658-c4be-88e9-80f635debfd7@csgroup.eu>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
	 <20221005053234.29312-2-bgray@linux.ibm.com>
	 <8625116b-4a0a-a9fe-fe81-47c23a58c91f@csgroup.eu>
	 <6642c9085a1b98a4aa8a03383b71d070881afe45.camel@linux.ibm.com>
	 <b28d8d04-8658-c4be-88e9-80f635debfd7@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gDmUSaseFlNlt-guUjNHYcQJzMkQtbeL
X-Proofpoint-ORIG-GUID: H4GfBmBKGkbfux1Oge0yLHlabstcrK76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060127
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
Cc: "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "peterz@infradead.org" <peterz@infradead.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "ardb@kernel.org" <ardb@kernel.org>, "jbaron@akamai.com" <jbaron@akamai.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-10-06 at 09:19 +0000, Christophe Leroy wrote:
>=20
>=20
> Le 06/10/2022 =C3=A0 05:36, Benjamin Gray a =C3=A9crit=C2=A0:
> > On Wed, 2022-10-05 at 17:55 +0000, Christophe Leroy wrote:
> > > I'm on business trip this week so I can't test it on hardware,
> > > but
> > > the
> > > generated code looks horrid and sub-optimal, with a stack frame
> > > and
> > > so
> > > many registers saved into it. That's mpc885_ads_defconfig built
> > > with
> > > GCC
> > > 12, without modules without stackprotector with 4k pages.
> >=20
> > Yeah, that definitely wasn't supposed to happen. I was looking at
> > the
> > 32 and 64 bit machine code closely while actively writing it, but I
> > must have refactored it badly when cleaning up for submission. It
> > was
> > supposed to automatically be inlined, leaving it identical to the
> > original on 32-bit.
> >=20
> > Given inlining is desirable here, and 64-bit inlines anyway, I
> > think I
> > should just mark __patch_memory with __always_inline.
>=20
> FWIW, I get a far better result with :
>=20
> diff --git a/arch/powerpc/lib/code-patching.c=20
> b/arch/powerpc/lib/code-patching.c
> index ba00c550d9d2..447b8de6e427 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -21,7 +21,7 @@ static int __patch_memory(void *patch_addr,
> unsigned=20
> long val, void *exec_addr,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Prefixed instruction m=
ay cross cacheline if cacheline
> smaller than=20
> 64 bytes */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUILD_BUG_ON(IS_ENABLED(C=
ONFIG_PPC64) && L1_CACHE_BYTES <
> 64);
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (unlikely(is_dword))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (IS_ENABLED(CONFIG_PPC64) &=
& unlikely(is_dword))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0__put_kernel_nofault(patch_addr, &val, u64, failed)=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0__put_kernel_nofault(patch_addr, &val, u32, failed)=
;

That's very interesting, as that's what I had originally. I removed the
IS_ENABLED(CONFIG_PPC64) part of the if condition as part of submission
cleanup refactoring because it should be redundant after constant
propagation. The weird thing is that GCC constant propagates either
way, it's just changing it's mind about inlining.

I can add it back, but the optimisation here seems very fragile. It
feels more reliable just to specify it explicitly.
