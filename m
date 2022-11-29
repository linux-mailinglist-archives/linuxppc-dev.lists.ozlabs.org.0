Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D3F63BA87
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 08:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLv3J3c7Sz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 18:24:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heFiyhww;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heFiyhww;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLv2J2xWfz2xl5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 18:23:19 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AT6NFih040298
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 07:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DBLRNbwuthZw2rMQJwEIeItdIEPPtnwiOQ2hV5DMosk=;
 b=heFiyhww8nfN6+hUDvDATND4yDqRc1bw4jR968s7N4t1iWukEauHPgZlG2kEjstXnftg
 FYEHH8sMDKXTL6sQeRacrdcogpQpuCV80gAqM+q8xPzJA5569/YYefm9+aicEG/aROGo
 ehZ6Q18yo8C+ioDpia9Y11MFApYU85jTqRMajJQMq8tNhk6uiLRGGfpPHiTEEm9rQf4X
 PzcNbqQtii5E7g0Wi5RWofsrf9dbqP2IX/0YaXgFyKHEMCcyrtdC12AL4Wbs3B1W1w5+
 4dt9E3mutIdPjHpfyBoW35tkllQiizxrje6r9Q1Z9blZT+HNUzGbzhRMZ5abLZkOhAKf 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5cs497xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 07:23:16 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AT7KUZp039715
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 07:23:16 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5cs497wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 07:23:15 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AT7K0F4003263;
	Tue, 29 Nov 2022 07:23:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3m3ae8tmw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 07:23:14 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AT7NB603998292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 07:23:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D79CEA405B;
	Tue, 29 Nov 2022 07:23:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38FF2A4054;
	Tue, 29 Nov 2022 07:23:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 07:23:11 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 188EB60305;
	Tue, 29 Nov 2022 18:23:10 +1100 (AEDT)
Message-ID: <099d99683c12b137ec2a4b0158ae3fd390fc1cd3.camel@linux.ibm.com>
Subject: Re: [PATCH 10/13] powerpc/rtas: improve function information lookups
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 29 Nov 2022 18:23:09 +1100
In-Reply-To: <87r0xm8vvy.fsf@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-11-nathanl@linux.ibm.com>
	 <5b4c4316bfe88a3f231ffe416ce34192189549db.camel@linux.ibm.com>
	 <87r0xm8vvy.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xro1TpAjb8WGnoG-YAv8tYnPR0rk46uy
X-Proofpoint-ORIG-GUID: J4IWkx1QZrhedacMWnUl_NpF0Ten5KL2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_04,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 mlxscore=0 clxscore=1015 mlxlogscore=833 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290046
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

On Mon, 2022-11-28 at 18:08 -0600, Nathan Lynch wrote:
> Andrew Donnellan <ajd@linux.ibm.com> writes:
> > On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> > > Convert rtas_token() to use a lockless binary search on the
> > > function
> > > table. Fall back to the old behavior for lookups against names
> > > that
> > > are not known to be RTAS functions, but issue a warning.
> > > rtas_token()
> > > is for function names; it is not a general facility for accessing
> > > arbitrary properties of the /rtas node. All known misuses of
> > > rtas_token() have been converted to more appropriate of_ APIs in
> > > preceding changes.
> >=20
> > For in-kernel users, why not go all the way: make rtas_token()
> > static
> > and use it purely for the userspace API,
>=20
> Not sure what userspace API refers to here, can you be more specific?
> I
> don't think rtas_token() is exposed to user space.

Right, what I actually meant to refer to here is the fact that sys_rtas
takes a token, but when I wrote this I forgot that userspace doesn't
pass a string, rather librtas implements rtas_token itself using the
/proc interface to the device tree.

>=20
> > and switch kernel users over
> > to using rtas_function_index directly?
>=20
> Well, I have work in progress to transition all rtas_token() users to
> a
> different API, but using opaque symbolic handles rather than exposing
> the indexes. Something like:
>=20
> /*
> =C2=A0* Opaque handle for client code to refer to RTAS functions. All
> valid
> =C2=A0* function handles are build-time constants prefixed with RTAS_FN_.
> =C2=A0*/
> typedef struct {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum rtas_function_index =
index;
> } rtas_fn_handle_t;
>=20
> #define rtas_fn_handle(x_) (const rtas_fn_handle_t) { .index =3D
> rtas_fnidx(x_), }
>=20
> #define RTAS_FN_CHECK_EXCEPTION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> rtas_fn_handle(CHECK_EXCEPTION)
> #define RTAS_FN_DISPLAY_CHARACTER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> rtas_fn_handle(DISPLAY_CHARACTER)
> #define RTAS_FN_EVENT_SCAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> rtas_fn_handle(EVENT_SCAN)
>=20
> ...
>=20
> /**
> =C2=A0* rtas_function_token() - RTAS function token lookup.
> =C2=A0* @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
> =C2=A0*
> =C2=A0* Context: Any context.
> =C2=A0* Return: the token value for the function if implemented by this
> platform,
> =C2=A0*=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 otherwise RTAS_UN=
KNOWN_SERVICE.
> =C2=A0*/
> s32 rtas_function_token(const rtas_fn_handle_t handle)
> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const size_t index =3D ha=
ndle.index;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const bool out_of_bounds =
=3D index >=3D
> ARRAY_SIZE(rtas_function_table);
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (WARN_ONCE(out_of_boun=
ds, "invalid function index %zu",
> index))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return RTAS_UNKNOWN_SERVICE;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rtas_function_tabl=
e[index].token;
> }
>=20
> But that's a tree-wide change that would touch various drivers, and I
> feel like the current series is what I can reasonably hope to get
> applied right now.

It's not clear to me what the benefit of adding this additional layer
of indirection would be.


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
