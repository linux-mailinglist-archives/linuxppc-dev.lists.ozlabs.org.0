Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 534DD54F8E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPgn31qMkz3cCP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 00:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aretrqeS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aretrqeS;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPgmH0d7Jz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 00:05:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HDuhhw013449;
	Fri, 17 Jun 2022 14:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cQ/SwfImF0iKXyQ+vRdYEwPl1VNj0ID776cob3LAmOE=;
 b=aretrqeSZKp7wgWEOxg50nRj4FBz3vcj4gT3dTNu/bTdtDt/5hMETEBTP7QbfQ3ePjz4
 8tWTS9QCOeEz6SVkqGaN/+sPybp4WOxcvf4hvIOfEUgA3gHhkM253pMFZ8iU48Cz4MaD
 N/ng8smAimVmFYhdmqelNxSfvBlsKDcJH4j3mrlEiee0nLEkygx3EFGAivB5s+K/SX1m
 u6R1PqxNmwbNAF+PB3VRAdeb/EQTI6DSQX3GoT18q62kkck7yL8UqyMKodGZuWnMzt/P
 /yJNwALFezrgSpPRqYuEkgrGl3FBgZ4DrZ84fnrHL3hocVovJUycZSzmNGWd2wtffcUM cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grtxnr61r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 14:04:55 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25HDvHiV018747;
	Fri, 17 Jun 2022 14:04:55 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grtxnr614-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 14:04:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25HDov0X007041;
	Fri, 17 Jun 2022 14:04:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3gmjp8xxrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 14:04:53 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25HE4o4E19071304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jun 2022 14:04:50 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A48B4C046;
	Fri, 17 Jun 2022 14:04:50 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 327204C040;
	Fri, 17 Jun 2022 14:04:50 +0000 (GMT)
Received: from localhost (unknown [9.43.107.233])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 17 Jun 2022 14:04:50 +0000 (GMT)
Date: Fri, 17 Jun 2022 19:34:48 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Peter Zijlstra
	<peterz@infradead.org>
References: <20220523175548.922671-1-sv@linux.ibm.com>
	<20220523175548.922671-5-sv@linux.ibm.com>
	<6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
	<59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
	<578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
	<f1decbb7-b441-a241-469a-4ba118e08212@csgroup.eu>
	<c1e2cf35-2a8d-87e6-3a7e-7f144392db23@csgroup.eu>
	<1655386289.uh0k7sgl1r.naveen@linux.ibm.com>
	<30f3791c-0fdd-e635-4a85-ec457f990fae@csgroup.eu>
	<Yqs235037JrOOhBA@hirez.programming.kicks-ass.net>
	<d095fe9d-e713-def1-6096-540c0d0da298@csgroup.eu>
In-Reply-To: <d095fe9d-e713-def1-6096-540c0d0da298@csgroup.eu>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1655474054.lvnbqfz64f.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _eAZPF0wTyF7jvfU_B1dMSxze1-sffUC
X-Proofpoint-ORIG-GUID: MZdaLXiAsAdUOPu_g21V41VhfRtfUdST
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170060
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, Chen Zhongjin <chenzhongjin@huawei.com>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 16/06/2022 =C3=A0 15:57, Peter Zijlstra a =C3=A9crit=C2=A0:
>> On Thu, Jun 16, 2022 at 01:40:34PM +0000, Christophe Leroy wrote:
>>> sizeof(u64) is always 8 by definition.
>>>
>>> So if size is 8 we are working on a binary file for a 64 bits target, if
>>> not it means we are working for a 32 bits target.
>>=20
>> Cross-builds invalidate this I think. Best to look at something like:
>>=20
>>    elf->ehdr.e_ident[EI_CLASS] =3D=3D ELFCLASS32
>>=20
>>=20
>=20
> Yes that's what it does indirectly:
>=20
> 	int size =3D elf_class_size(elf);
>=20
>=20
> With
>=20
> static inline int elf_class_size(struct elf *elf)
> {
> 	if (elf->ehdr.e_ident[EI_CLASS] =3D=3D ELFCLASS32)
> 		return sizeof(u32);
> 	else
> 		return sizeof(u64);
> }

Ok, those come from the below patch:
https://lore.kernel.org/all/c4b06b5b314183d85615765a5ce421a057674bd8.165339=
8233.git.christophe.leroy@csgroup.eu/T/#u

I guess it would have been clearer if 'size' was named differently:=20
'addr_size' perhaps?


- Naveen
