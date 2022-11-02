Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD7617165
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 00:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2j9q15stz3cMb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bVul2ZJu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bVul2ZJu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2j8w2G7Sz2xkD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 10:02:56 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A2MMj8K026682;
	Wed, 2 Nov 2022 23:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5sPXrueZvBjZWraspNBHWhGMr9uV3wjSpJwramMfWfI=;
 b=bVul2ZJucCTuOx49zrbH+enWeBb0utMgJlEVp/7kaWkPLK1e5y5M3pWxKlHWllrkhMgj
 asdmREvPKpYy/S8lQQlGO3uNqH/cLASLVsPoEl4q42w1T2i+PSfKUlvImhvZ4KjNd74J
 7zEI1q3xE021lfz/gRFqEPKySfpMLRi0lPnxGIP6jqUQEY5yvxGSH0ZVjE/XUQeEiHoQ
 zrakaryPwBkS3BVyKErh1mxIsEA7vBzmTq923CAFRbJeD+EEk4SK/rLCkA8F2N6MfAP+
 y2thkf9W+S8H2RUCjRe83/oyYgqw18fmeCpBVnvJ/hXjztHwArFh0jh+W9v2evmVjhJt +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km19v0x0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 23:02:43 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2MP0Yn032266;
	Wed, 2 Nov 2022 23:02:42 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km19v0wyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 23:02:42 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A2MqjeB020041;
	Wed, 2 Nov 2022 23:02:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguehyq9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 23:02:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A2N2bI61049126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 23:02:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D82215204E;
	Wed,  2 Nov 2022 23:02:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8297A52050;
	Wed,  2 Nov 2022 23:02:37 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8B0C66010C;
	Thu,  3 Nov 2022 10:02:34 +1100 (AEDT)
Message-ID: <4e1de0ca6885ff297a19a0ef17fc4446a4231f75.camel@linux.ibm.com>
Subject: Re: [PATCH v9 4/7] powerpc/code-patching: Verify instruction patch
 succeeded
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Date: Thu, 03 Nov 2022 10:02:34 +1100
In-Reply-To: <20a4382b-089a-442a-ad05-af893823c9dc@csgroup.eu>
References: <20221025044409.448755-1-bgray@linux.ibm.com>
	 <20221025044409.448755-5-bgray@linux.ibm.com>
	 <83e63455-95d8-88bf-82b2-c72bfe288fab@csgroup.eu>
	 <20a4382b-089a-442a-ad05-af893823c9dc@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DlwcBDMDYOo8U5jIP21xC_fE0smoDcqA
X-Proofpoint-GUID: 6Dle5aw0xunOXk58Q12S0xYkg7TXLXX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_15,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020154
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-11-02 at 11:13 +0100, Christophe Leroy wrote:
> Le 02/11/2022 =C3=A0 10:43, Christophe Leroy a =C3=A9crit=C2=A0:
> > Le 25/10/2022 =C3=A0 06:44, Benjamin Gray a =C3=A9crit=C2=A0:
> > > Verifies that if the instruction patching did not return an error
> > > then
> > > the value stored at the given address to patch is now equal to
> > > the
> > > instruction we patched it to.
> >=20
> > Why do we need that verification ? Until now it wasn't necessary,
> > can=20
> > you describe a failure that occurs because we don't have this=20
> > verification ? Or is that until now it was reliable but the new
> > method=20
> > you are adding will not be as reliable as before ?
> >=20
> > What worries me with that new verification is that you are reading
> > a=20
> > memory address with is mostly only used for code execution. That
> > means:
> > - You will almost always take a DATA TLB Miss, hence performance
> > impact.
> > - If one day we want Exec-only text mappings, it will become
> > problematic.
> >=20
> > So really the question is, is that patch really required ?
> >=20
> > >=20
> > > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > > ---
> > > =C2=A0 arch/powerpc/lib/code-patching.c | 2 ++
> > > =C2=A0 1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/arch/powerpc/lib/code-patching.c=20
> > > b/arch/powerpc/lib/code-patching.c
> > > index 3b3b09d5d2e1..b0a12b2d5a9b 100644
> > > --- a/arch/powerpc/lib/code-patching.c
> > > +++ b/arch/powerpc/lib/code-patching.c
> > > @@ -192,6 +192,8 @@ static int do_patch_instruction(u32 *addr,=20
> > > ppc_inst_t instr)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D __do_patch_instruction(addr, i=
nstr);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_restore(flags);
> > > +=C2=A0=C2=A0=C2=A0 WARN_ON(!err && !ppc_inst_equal(instr,
> > > ppc_inst_read(addr)));
> > > +
>=20
> Another point: you are doing the check outside of IRQ disabled
> section,=20
> is that correct ? What if an interrupt changed it in-between ?
>=20
> Or insn't that possible ? In that case what's the real purpose of=20
> disabling IRQs here ?

Disabling IRQ's also serves to prevent the writeable mapping being
visible outside of the patching function from my understanding. But I
would move the check inside the disabled section if I were keeping it.
