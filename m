Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DE87E8B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 12:34:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bKyio+GX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tyt6f6wP2z3dd4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 22:34:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bKyio+GX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tyt5v64fTz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 22:33:38 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42I4Gqh7023380;
	Mon, 18 Mar 2024 11:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=xeTKzwCl4Wi3erLetE/p4EapN8V6yA4fDZLbO4gQw28=;
 b=bKyio+GXD2Hi06ueF611k6NImrXL6yeuxUgCcGYNTwJnp7tSsih0uit/1MdA12bMAi32
 2b0wHtwNrPTCh562Z4a+8u5SX9QL7psBiRh3DfaCQAJxB/7pzrijoplDS5mpirEGj99R
 6iuJiG1e5b8u7Gn65YiaSNvr73M7f0EzNlpdPy2Pw0C54P0k4liFFY5P+/Hzk/14HD3o
 6KCIw0Bx6Wb17KHMT8GnsxupEQwoVXFrRwx+v1dlCx6pUSpKMVL/AcA3Q/h0yePS0124
 iuAZc05Pb891jzkxqBejEz1vs6rGi/L6AVKwA/Rd/dFkHtRhrN3MtQeMIPzQJt8KVs+K gg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wwabf1kcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 11:33:25 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42IBMhsO029469;
	Mon, 18 Mar 2024 11:33:25 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wwabf1kcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 11:33:25 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42I9wlhe011539;
	Mon, 18 Mar 2024 11:33:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wwq8krdjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 11:33:23 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42IBXI2V34800126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Mar 2024 11:33:20 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4677A2005A;
	Mon, 18 Mar 2024 11:33:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D40720043;
	Mon, 18 Mar 2024 11:33:16 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.215.91])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 18 Mar 2024 11:33:16 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 2/3] tools/erf/util/annotate: Set register_char and
 memory_ref_char for powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20240309174326.GU19790@gate.crashing.org>
Date: Mon, 18 Mar 2024 17:03:04 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <C25ABF94-218E-4B9D-AE43-3B522908EA57@linux.vnet.ibm.com>
References: <20240309072513.9418-1-atrajeev@linux.vnet.ibm.com>
 <20240309072513.9418-3-atrajeev@linux.vnet.ibm.com>
 <20240309174326.GU19790@gate.crashing.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IUNOEUg12OKHaVOkYpq7O4TMrN6w5QfD
X-Proofpoint-ORIG-GUID: haY41AjGA1UDLcEAFfuifGMJ8FFWIMcO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-18_02,2024-03-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=918
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403140000 definitions=main-2403180086
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
Cc: Ian Rogers <irogers@google.com>, maddy@linux.ibm.com, kjain@linux.ibm.com, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 09-Mar-2024, at 11:13=E2=80=AFPM, Segher Boessenkool =
<segher@kernel.crashing.org> wrote:
>=20
> All instructions with a primary opcode from 32 to 63 are memory insns,
> and no others.  It's trivial to see whether it is a load or store, too
> (just bit 3 of the insn).  Trying to parse disassembled code is much
> harder, and you easily make some mistakes here.

Hi Segher

Thanks for checking the patch and sharing review comments.

Ok, I am checking on this part.

>=20
> On Sat, Mar 09, 2024 at 12:55:12PM +0530, Athira Rajeev wrote:
>> To identify if the instruction has any memory reference,
>> "memory_ref_char" field needs to be set for specific architecture.
>> Example memory instruction:
>> lwz     r10,0(r9)
>>=20
>> Here "(" is the memory_ref_char. Set this as part of arch->objdump
>=20
> What about "lwzx r10,0,r19", semantically exactly the same =
instruction?
> There is no paren in there.  Not all instructions using parens are
> memory insns, either, not in assembler code at least.
Yes, right Segher.

So, for the basic foundational patches, I targeted for instructions of =
this form (D form)
There are still samples, which comes as unknown and in that, X form =
instructions also needs to be checked.
Targeted to first get these basic foundational patches to add support in =
powerpc and get the remaining =E2=80=9Cunknowns=E2=80=9D addressed in =
follow up.
But yes, X-form instructions also will be covered as part of the changes =
needed for powerpc.

>=20
>> To get register number and access offset from the given instruction,
>> arch->objdump.register_char is used. In case of powerpc, the register
>> char is "r" (since reg names are r0 to r31). Hence set register_char
>> as "r".
>=20
> cr0..cr7
> r0..r31
> f0..f31
> v0..v31
> vs0..vs63
> and many other spellings.  Plain "0..63" is also fine.
Ok=20
>=20
> The "0" in my lwzx example is a register field as well (and it stands
> for "no register", not for "r0").  Called "(RA|0)" usually =
(incidentally,
> see the parens there as well, oh joy).
>=20
> Don't you have the binary code here as well, not just a disassembled
> representation of it?  It is way easier to just use that, and you'll =
get
> much better results that way :-)
>=20

Thanks Segher for the suggestion on this. I will check on this as well.

Thanks
Athira Rajeev

>=20
> Segher

