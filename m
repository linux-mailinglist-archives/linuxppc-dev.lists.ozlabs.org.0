Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE1D63C3D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 16:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NM5x14rz7z3bVq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 02:34:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sozMX/I/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sozMX/I/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM5w33P6Nz2xZ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 02:33:39 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATEPeTX019313
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=QhOKZ5phveqI+Vu96YAYQNXJ8+SDnzie/ZywENVH4RE=;
 b=sozMX/I/QcuCdxsvWbTofz0gEXxjsxDy5kHSr1MHpDXvfp/DXpDGwqRq7v5wN3Pgs4MR
 qVtiyDoA2wAXlkOMKP84//rHd+LynnYXGnJHsPVZTtso6DPqz4qJpN3QayOf+JtDWTuI
 NISvnCwtC2cpS+7eQsqw36MvcB0Eo9E1/wIvMOg+JAPw/aCw8akW8d6X5lP9xZDiDHAn
 +fNG7sruHhVwYZcTnRbiev0CkFmwzy88GujJx+7W0aIMFlhm4KSzHRNgWVkr1oDA5JQd
 EfCMIV2HC+MJikToAEWX0vUkUurKVbEfYdyKw2z2XC1j1ZHSjQ5/lTkCGCfO4kMiA2X5 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5k6q3k30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:33:36 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATEaOBL010004
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 15:33:36 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5k6q3k27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 15:33:36 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATF5bMQ012082;
	Tue, 29 Nov 2022 15:33:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma03wdc.us.ibm.com with ESMTP id 3m3ae9de23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 15:33:35 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATFXXLj10355406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 15:33:34 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7639D58060;
	Tue, 29 Nov 2022 15:33:33 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D08B5805C;
	Tue, 29 Nov 2022 15:33:33 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 15:33:33 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
In-Reply-To: <099d99683c12b137ec2a4b0158ae3fd390fc1cd3.camel@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-11-nathanl@linux.ibm.com>
 <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
 <87r0xm8vvy.fsf@linux.ibm.com>
 <099d99683c12b137ec2a4b0158ae3fd390fc1cd3.camel@linux.ibm.com>
Date: Tue, 29 Nov 2022 09:33:32 -0600
Message-ID: <87o7sp93n7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zNOTRNZQPfvOsUC_cStB-75MXqd6T8J9
X-Proofpoint-GUID: GfRaiVZxWDcLe9ZAAGlpRCR_SjqyhqlM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_10,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211290086
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On Mon, 2022-11-28 at 18:08 -0600, Nathan Lynch wrote:
>> Andrew Donnellan <ajd@linux.ibm.com> writes:
>> > On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
>> > > Convert rtas_token() to use a lockless binary search on the
>> > > function table. Fall back to the old behavior for lookups against
>> > > names that are not known to be RTAS functions, but issue a
>> > > warning.  rtas_token() is for function names; it is not a general
>> > > facility for accessing arbitrary properties of the /rtas
>> > > node. All known misuses of rtas_token() have been converted to
>> > > more appropriate of_ APIs in preceding changes.
>> >=20
>> > For in-kernel users, why not go all the way: make rtas_token()
>> > static and use it purely for the userspace API, and switch kernel
>> > users over to using rtas_function_index directly?
>>=20
>> Well, I have work in progress to transition all rtas_token() users to
>> a different API, but using opaque symbolic handles rather than
>> exposing the indexes. Something like:
>>=20
>> /*
>> =C2=A0* Opaque handle for client code to refer to RTAS functions. All
>> valid
>> =C2=A0* function handles are build-time constants prefixed with RTAS_FN_.
>> =C2=A0*/
>> typedef struct {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum rtas_function_index=
 index;
>> } rtas_fn_handle_t;
>>=20
>> #define rtas_fn_handle(x_) (const rtas_fn_handle_t) { .index =3D
>> rtas_fnidx(x_), }
>>=20
>> #define RTAS_FN_CHECK_EXCEPTION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> rtas_fn_handle(CHECK_EXCEPTION)
>> #define RTAS_FN_DISPLAY_CHARACTER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
>> rtas_fn_handle(DISPLAY_CHARACTER)
>> #define RTAS_FN_EVENT_SCAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
>> rtas_fn_handle(EVENT_SCAN)
>>=20
>> ...
>>=20
>> /**
>> =C2=A0* rtas_function_token() - RTAS function token lookup.
>> =C2=A0* @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
>> =C2=A0*
>> =C2=A0* Context: Any context.
>> =C2=A0* Return: the token value for the function if implemented by this
>> platform,
>> =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 otherwise RTAS_U=
NKNOWN_SERVICE.
>> =C2=A0*/
>> s32 rtas_function_token(const rtas_fn_handle_t handle)
>> {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const size_t index =3D h=
andle.index;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const bool out_of_bounds=
 =3D index >=3D
>> ARRAY_SIZE(rtas_function_table);
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ONCE(out_of_bou=
nds, "invalid function index %zu",
>> index))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return RTAS_UNKNOWN_SERVICE;
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rtas_function_tab=
le[index].token;
>> }
>>=20
>> But that's a tree-wide change that would touch various drivers, and I
>> feel like the current series is what I can reasonably hope to get
>> applied right now.
>
> It's not clear to me what the benefit of adding this additional layer
> of indirection would be.

One benefit would be that the type system won't let you use a token
(int) where you meant to use a handle (struct), and vice versa. I
anticipate that property being valuable for making API changes. But also
it's just good interface hygiene: how the token lookup is implemented
isn't the concern of code outside of rtas.c.
