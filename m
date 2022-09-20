Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A67295BDA2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 04:33:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWlwN3ZLHz3bvl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 12:33:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcD7qc9t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gcD7qc9t;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWlvf3JTcz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 12:33:02 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K2WhG4025937;
	Tue, 20 Sep 2022 02:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9gBWHEz7Y/RAn7k+foqkGPb5zZABc7Asw0CNv/zLgaU=;
 b=gcD7qc9t1ILXxm7M9UC2juLijVwq37mtPk6p53waYUTNd5ptsK7V4VzGhMr0Lx3gBuBs
 uI4Q0yu80jXHjqS1bnF3B/DIMlNv4V3W2pWkmG2wc7MVpnbrZqvLTOWhhnoy1OUllB1y
 t7lzMT/t7fwoL3K1PBN9ljXAdYP3d95pThii5EapuNFfpB3B60I/Qni2LiI1cS86JNLI
 vXEn/j8c+cyIn2pKl4rEkSIFOULfCesKBAj5fYIry+tLy/WoOJGUJmG4mQwCNHbgVfjp
 7hx6WqfhgPCOw4tcdw0HIh+SxJPcKAXaVym6h/Ls8CVfDQtUL1oi/E4k9+pBU3cxfMgC 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jq4u0g01x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 02:32:46 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28K2WjIC026054;
	Tue, 20 Sep 2022 02:32:45 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jq4u0g01k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 02:32:45 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28K2LdEu016627;
	Tue, 20 Sep 2022 02:32:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3jn5ghjbrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 02:32:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28K2Wfco39977266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Sep 2022 02:32:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B3BBA4051;
	Tue, 20 Sep 2022 02:32:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFCB8A4040;
	Tue, 20 Sep 2022 02:32:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 20 Sep 2022 02:32:40 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 82517600EE;
	Tue, 20 Sep 2022 12:32:35 +1000 (AEST)
Message-ID: <857e6e30d88454d45d8ad191e4ecb64b4484ec0b.camel@linux.ibm.com>
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 20 Sep 2022 12:32:35 +1000
In-Reply-To: <f3ff19a1-4e78-0201-0241-ae8e0b9baa1e@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
	 <20220916062330.430468-2-bgray@linux.ibm.com>
	 <4c19a0fa-6af0-e71a-deaf-b150eeec6381@csgroup.eu>
	 <ff06e95c7f85f0b33e3573c46f9d9fe7ddffba2d.camel@linux.ibm.com>
	 <f3ff19a1-4e78-0201-0241-ae8e0b9baa1e@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mglwt7ZhyUvXOmAndECQ9KgScGVBS743
X-Proofpoint-GUID: YcmdSPEN6NROCTthIbBQzY3hDL4D83ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200014
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

On Mon, 2022-09-19 at 07:16 +0000, Christophe Leroy wrote:
> Why would it be unpredictable ? Only one page is mapped. If it
> crosses=20
> the boundary, __put_kernel_nofault() will fail in a controled manner.
> I see no point in doing the check before every write.

Oh I didn't see that get_vm_area automatically adds a guard. You're
right then, it's redundant. I had assumed there could be a writeable
mapping directly after.

> And while you are thinking about alignment, don't forget that dcbst
> and=20
> icbi apply on a give cacheline. If your memory crosses a cacheline
> you=20
> may have a problem.

Yeah, though this applies to the existing patch_instruction too (in
theory; prefixed instructions cannot cross a 64 byte boundary, but the
ISA does not specify minimum cacheline size).=C2=A0I don't have a nice
solution right now though. The flush needs to be done on the effective
address (i.e. text poke address) according to the ISA, but the text
poke address is only valid within the IRQ save region. So non-prefixed
instruction patching would either pay for some kind of check, or need
special casing.

Maybe an "is aligned" flag in a generic __patch_text to make the extra
flush conditional is good enough?


Related to EA based flushing,=C2=A0data patching ought to run 'dcbst' on th=
e
'exec_addr' too. So given the icache flush only needs to be applied to
instruction patching, and data flush only to data patching, I plan to
move those exec_addr syncs outside of __patch_text to the relevant
public instruction/data specific entry points.

> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0case 8:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__p=
ut_kernel_nofault(dest, src, u64,
> > > > failed);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bre=
ak;
> > >=20
> > > Is case 8 needed for PPC32 ?
> >=20
> > I don't have a particular need for it, but the underlying
> > __put_kernel_nofault is capable of it so I included it.
>=20
> Well, not including it will allow you to pass the source as a 'long'
> as=20
> mentionned above.

I checked the machine code of a 32 bit build, but it still passes the
pointer in a register. I also checked all 3 ABI docs and they say a
pointer is the same size as a long. Could you clarify when a pointer is
passed on the stack but not a long?

Or do you mean that we could pass the pointed-to data in a register and
skip the pointer altogether? That seems like a good choice, but
__put_kernel_nofault takes a pointer to the source and the
implementation is very complex. I don't think I can safely write the
modified version we'd need at this point.
