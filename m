Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD744896C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 11:53:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXVzY4qMbz3bPS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 21:53:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MUDBP9kC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MUDBP9kC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXVyn571Tz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 21:52:33 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AAgktC022279; 
 Mon, 10 Jan 2022 10:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=MHSYtK1t1qTzP5B98nVv74V4WQvLYItmjMVkqb64VSM=;
 b=MUDBP9kCFu2q8IDuwlmG/iVH6Lq4vG6MFac5w3AkqwIIVGJ7pUTEQcWwCe8h0NoccN+I
 L6eaRuHo5yThRb8dE+I7YLCjHGnIPtxiKNkco5e4mp4s1KBs/g3NV5qx05xnOJCq8YtT
 bGtvu82ni6A14h0Yp+XU20BONOBFBUFlGybo+HMHJEw8gD1AEyhPQqvqvO/ucM0xEa7u
 yMz5hhDbgl0cthsiYFaPBDUnez4mOss7fLb27/d/HzHW+dgmlxFc45OqlryJvz9RjugU
 49iWvTjZUi5dOKje0gwv124TT6ERXCPpzm5v2WZoHHwuREsqw+XEWE6jjBi5BjGXetcJ Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3df37wtqpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:52:12 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AAgsqP022681;
 Mon, 10 Jan 2022 10:52:12 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3df37wtqpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:52:11 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AAm5Na015230;
 Mon, 10 Jan 2022 10:52:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3df2892u64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 10:52:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20AAq7KA18481536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 10:52:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88669AE045;
 Mon, 10 Jan 2022 10:52:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 148B0AE053;
 Mon, 10 Jan 2022 10:52:07 +0000 (GMT)
Received: from localhost (unknown [9.43.115.31])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Jan 2022 10:52:06 +0000 (GMT)
Date: Mon, 10 Jan 2022 16:22:05 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 02/13] powerpc32/bpf: Fix codegen for bpf-to-bpf calls
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <52d8fe51f7620a6f27f377791564d79d75463576.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
 <4f7b021e-0527-0113-ca99-8c63b43ca21c@csgroup.eu>
In-Reply-To: <4f7b021e-0527-0113-ca99-8c63b43ca21c@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.16-1-g4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1641811059.76dcmed7ki.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: THt_vLLvHYsUXgeVQui0t7o7RJ08l0x5
X-Proofpoint-ORIG-GUID: LVVkbRLFRI-xCpoMN9ABYAy1h4aeLXjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_04,2022-01-10_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=938
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100074
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
Cc: "ykaliuta@redhat.com" <ykaliuta@redhat.com>,
 "johan.almbladh@anyfinetworks.com" <johan.almbladh@anyfinetworks.com>,
 Jiri Olsa <jolsa@redhat.com>, "song@kernel.org" <song@kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 06/01/2022 =C3=A0 12:45, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Pad instructions emitted for BPF_CALL so that the number of instructions
>> generated does not change for different function addresses. This is
>> especially important for calls to other bpf functions, whose address
>> will only be known during extra pass.
>=20
> In first pass, 'image' is NULL and we emit the 4 instructions sequence=20
> already, so the code won't grow after first pass, it can only shrink.

Right, but this patch addresses the scenario where the function address=20
is only provided during the extra pass. So, even though we will not=20
write past the end of the BPF image, the emitted instructions can still=20
be wrong.

>=20
> On PPC32, a huge effort is made to minimise the situations where 'bl'=20
> cannot be used, see commit 2ec13df16704 ("powerpc/modules: Load modules=20
> closer to kernel text")
>=20
> And if you take the 8xx for instance, a NOP a just like any other=20
> instruction, it takes one cycle.
>=20
> If it is absolutely needed, then I'd prefer we use an out-of-line=20
> trampoline for the unlikely case and use 'bl' to that trampoline.

Yes, something like that will be nice to do, but we will still need this=20
patch for -stable.

The other option is to redo the whole JIT during the extra pass, but=20
only if we can ensure that we have provisioned for the maximum image=20
size.


- Naveen

