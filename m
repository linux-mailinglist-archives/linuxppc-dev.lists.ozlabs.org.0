Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E035860C242
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 05:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxHY65d9hz3bjF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Oct 2022 14:31:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tJ7eauo1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tJ7eauo1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxHX74cKnz307C
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Oct 2022 14:30:47 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P3EQ8e030601;
	Tue, 25 Oct 2022 03:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CZmBLJFMDAFjalnI2nfqxxiibyZg1GQkaSvl9ROaTbI=;
 b=tJ7eauo1HUZF7DAne9kvjsxTffZiGrv9A1AXH0I62CbQ/mqQbBsQ+bxVuya2aV3y2mCU
 K00Ixe0CwAt6TNHrIgevVvZ96JxAn2V7118Q0MMYaVj4zMIfOzSV5WQaOA8sVdUrZSNV
 kQRJ6vUrTyU3Rvk39AQtFJFx/pGPKB5JdEvBDG5cArXGYIprKmkvDYaPz2Fz9bj84PV7
 uFQRbloMX/LqVg5veq/hwypWVhP56IaTi9g38XsAz/kQbMcoA5oq5qpilyXXmvDHO+rm
 Y0cIg0u9cj2jaUVO9WnZMm8i12R0wpKpuI05qxHHDUw5YMADqiwrK3J7rZDE1UJtx2cJ Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke7qa0aqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 03:30:36 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29P3HFGN037009;
	Tue, 25 Oct 2022 03:30:36 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke7qa0ag9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 03:30:36 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29P3M9gv006657;
	Tue, 25 Oct 2022 03:30:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04fra.de.ibm.com with ESMTP id 3kc859kc8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Oct 2022 03:30:20 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29P3UIDb25559786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Oct 2022 03:30:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5686B52051;
	Tue, 25 Oct 2022 03:30:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 010475204E;
	Tue, 25 Oct 2022 03:30:18 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D408060213;
	Tue, 25 Oct 2022 14:30:16 +1100 (AEDT)
Message-ID: <38598d238bc2b46399a8af17a922b0a6a8dd5b0d.camel@linux.ibm.com>
Subject: Re: [PATCH v8 3/6] powerpc/code-patching: Verify instruction patch
 succeeded
From: Benjamin Gray <bgray@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 25 Oct 2022 14:30:16 +1100
In-Reply-To: <d5febacfc792876848bd4ba58f43b0e24450f250.camel@russell.cc>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-4-bgray@linux.ibm.com>
	 <d5febacfc792876848bd4ba58f43b0e24450f250.camel@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oDk1MHWMkIfDE0p-Le5nDrSwxeLDREn8
X-Proofpoint-GUID: OCbCE1OXKqJhyP6EXcNxf8P-skKNu-TU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_09,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 adultscore=0 mlxlogscore=985 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250016
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, npiggin@gmail.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-10-24 at 14:20 +1100, Russell Currey wrote:
> On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> > diff --git a/arch/powerpc/lib/code-patching.c
> > b/arch/powerpc/lib/code-patching.c
> > index 34fc7ac34d91..9b9eba574d7e 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -186,6 +186,8 @@ static int do_patch_instruction(u32 *addr,
> > ppc_inst_t instr)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0err =3D __do_patch_inst=
ruction(addr, instr);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0local_irq_restore(flags=
);
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0WARN_ON(!err && !ppc_inst_eq=
ual(instr,
> > ppc_inst_read(addr)));
> > +
>=20
> As a side note, I had a look at test-code-patching.c and it doesn't
> look like we don't have a test for ppc_inst_equal() with prefixed
> instructions.=C2=A0 We should fix that.

Yeah, for a different series though I assume. And I think it would be
better suited in a suite dedicated to testing asm/inst.h functions.
