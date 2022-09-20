Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C49835BDDC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 09:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWswN4p51z30Mn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 17:04:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J86VtZ7D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J86VtZ7D;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWsvc6HYRz3010
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:03:24 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K6mpvd013490;
	Tue, 20 Sep 2022 07:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6ipkTzr998lW+u7cbHmjDVBwGBe64mgeUk8YOKYuPas=;
 b=J86VtZ7DJDArCbv+JG2RYwl9pmjhwYhOPVRyVlaqkYIIGPEV3ANzYjkGyeJyv5GTudRd
 4w4u2T8njShZWgPfsHFSjG3R5IB4AuJZnLZsbGMehIzgmjtG2eDFcpSi5U0Q6rCBJHFr
 CdVxGiGMNWUagBPaP4AI1yDxJtiyYiLnMUxHIFhCOx8q2gFAx3BpEb8cpn8H8Px2AtPm
 w1yJaEOzk0nc3ouUh0du6PB2WhUJH/Z4m9wq97Cn9+aQhh7oL1rWF8uPdQswb0wAb+6f
 xgAHAWYNQm/YSTW9/kvPV+JEeRNui79MYksKKeyieOPaU4CEQ6xg5fCwpp/CJ/P8PFu7 Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jq8k3gakc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 07:01:57 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28K6nQxB017373;
	Tue, 20 Sep 2022 07:01:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jq8k3gahw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 07:01:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28K6p6Q9024274;
	Tue, 20 Sep 2022 07:01:54 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3jn5v93e9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Sep 2022 07:01:53 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28K71pa928180958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Sep 2022 07:01:51 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A3DE11C0E5;
	Tue, 20 Sep 2022 07:01:51 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEC7811C0F4;
	Tue, 20 Sep 2022 07:01:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 20 Sep 2022 07:01:50 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BBB5F6013C;
	Tue, 20 Sep 2022 17:01:49 +1000 (AEST)
Message-ID: <d417798da458c542a37a802d4319db0923813139.camel@linux.ibm.com>
Subject: Re: [PATCH 1/6] powerpc/code-patching: Implement generic text
 patching function
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 20 Sep 2022 17:01:49 +1000
In-Reply-To: <0a5f74cc-7eb6-ab85-8ebe-36d628974ca1@csgroup.eu>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
	 <20220916062330.430468-2-bgray@linux.ibm.com>
	 <4c19a0fa-6af0-e71a-deaf-b150eeec6381@csgroup.eu>
	 <ff06e95c7f85f0b33e3573c46f9d9fe7ddffba2d.camel@linux.ibm.com>
	 <f3ff19a1-4e78-0201-0241-ae8e0b9baa1e@csgroup.eu>
	 <857e6e30d88454d45d8ad191e4ecb64b4484ec0b.camel@linux.ibm.com>
	 <0a5f74cc-7eb6-ab85-8ebe-36d628974ca1@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _t8FkcgYXVLEMOBU7x9wmTkp8JGyL7Gd
X-Proofpoint-ORIG-GUID: cyLFE4sOc6VI8a0bqLU9rY81VkPMkqsz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_02,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 mlxscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209200042
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

On Tue, 2022-09-20 at 05:44 +0000, Christophe Leroy wrote:
>=20
> As far as I know, cachelines are minimum 64 bytes on PPC64 aren't
> they ?

In practice maybe. I don't know what the convention is in the kernel in
cases where the ISA is less specific than what the supported machines
do.

> > Related to EA based flushing,=C2=A0data patching ought to run 'dcbst' o=
n
> > the
> > 'exec_addr' too. So given the icache flush only needs to be applied
> > to
> > instruction patching, and data flush only to data patching, I plan
> > to
> > move those exec_addr syncs outside of __patch_text to the relevant
> > public instruction/data specific entry points.
>=20
> Why should it run 'dcbst' on the 'exec_addr' at all ? We have not=20
> written anything there.
>=20
> Anyway, powerpc handles cachelines by physical address, so no matter=20
> which EA you use as far as it is done.
>=20
> And dcbst is handled as a write by the MMU, so you just can't apply
> it=20
> on the read-only exec address.

I was talking with Michael Ellerman and he said that, for instructions
at least, the cache operations apply to the EA. So the exec address and
the text poke address are not interchangeable. Flushing the icache
needs to be done on the exec address, not the text poke address.

The ISA uses identical wording for icache and dcache blocks ("block
containing the byte addressed by EA"), so I assume the same applies for
data too. I am trying to flush a cached value for the data EA to ensure
that the value in main memory from the text-poke EA is correctly loaded
(that's the goal, I guess that was the wrong instruction).

Or given that multiple processes sharing a physical page for RW data is
a common scenario, it could just be expected that the hardware handles
virtual address aliases for data cache.

So I don't know, and the ISA doesn't look any different to me. I'll
need some kind of confirmation either way on this.

> Today raw_patch_instruction() is :
>=20
> c0017ebc <raw_patch_instruction>:
> c0017ebc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A090 83 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0stw=C2=A0=C2=A0=C2=A0=C2=A0 r4,0(r3)
> c0017ec0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07c 00 18 6c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0dcbst=C2=A0=C2=A0 0,r3
> c0017ec4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07c 00 04 ac=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0hwsync
> c0017ec8:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07c 00 1f ac=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0icbi=C2=A0=C2=A0=C2=A0 0,r3
> c0017ecc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A07c 00 04 ac=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0hwsync
> c0017ed0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04c 00 01 2c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0isync
> c0017ed4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A038 60 00 00=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3,0
> c0017ed8:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04e 80 00 20=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0blr
> c0017edc:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A038 60 ff ff=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0li=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r3,-1
> c0017ee0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04e 80 00 20=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0blr
>=20
> Here r4 is the value to be written.
>=20
>=20
> With your patch, extract from __patch_text() is:
>=20
> [...]
>=20
> So as you can see, r4 now is a memory pointer and the data has to be=20
> loaded from there.

For this version of raw_patch_instruction

int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
{
	int err;

	if (!ppc_inst_prefixed(instr)) {
		u32 val =3D ppc_inst_val(instr);
		err =3D __patch_text(addr, &val, sizeof(val));
	} else {
		u64 val =3D ppc_inst_as_ulong(instr);
		err =3D __patch_text(addr, &val, sizeof(val));
	}

	icbi(addr);
	mb(); /* sync */
	isync();

	return err;
}

This is the 32-bit machine code my compiler generated

c0040994 <raw_patch_instruction>:
c0040994:   7c 69 1b 78     mr      r9,r3
c0040998:   90 83 00 00     stw     r4,0(r3)
c004099c:   7c 00 18 6c     dcbst   0,r3
c00409a0:   7c 00 04 ac     hwsync
c00409a4:   38 60 00 00     li      r3,0
c00409a8:   7c 00 4f ac     icbi    0,r9
c00409ac:   7c 00 04 ac     hwsync
c00409b0:   4c 00 01 2c     isync
c00409b4:   4e 80 00 20     blr
c00409b8:   38 60 ff ff     li      r3,-1
c00409bc:   4b ff ff ec     b       c00409a8
                                      <raw_patch_instruction+0x14>

It seems GCC is able to use the register automatically. But I agree
that the __patch_text generation is better, and GCC can automatically
elide the pointer stuff, so will change for v2.
