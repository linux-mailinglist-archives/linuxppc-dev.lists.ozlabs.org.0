Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C529C9C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 09:03:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H2zB3wsXzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 17:03:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H2tF22gtzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 16:59:17 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7Q6wOJi120473
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 02:59:13 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2um6ujxecg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 02:59:13 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 26 Aug 2019 07:59:11 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 26 Aug 2019 07:59:09 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7Q6x8gc37028070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 06:59:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31AD1A4059;
 Mon, 26 Aug 2019 06:59:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCBD5A405B;
 Mon, 26 Aug 2019 06:59:07 +0000 (GMT)
Received: from localhost (unknown [9.124.35.18])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 06:59:07 +0000 (GMT)
Date: Mon, 26 Aug 2019 12:29:05 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] bpf: handle 32-bit zext during constant blinding
To: Jiong Wang <jiong.wang@netronome.com>, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>
References: <20190821192358.31922-1-naveen.n.rao@linux.vnet.ibm.com>
 <87zhk2faqg.fsf@netronome.com>
In-Reply-To: <87zhk2faqg.fsf@netronome.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19082606-4275-0000-0000-0000035D680B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082606-4276-0000-0000-0000386F9425
Message-Id: <1566802541.7onbueyw0d.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260077
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jiong Wang wrote:
>=20
> Naveen N. Rao writes:
>=20
>> Since BPF constant blinding is performed after the verifier pass, the
>> ALU32 instructions inserted for doubleword immediate loads don't have a
>> corresponding zext instruction. This is causing a kernel oops on powerpc
>> and can be reproduced by running 'test_cgroup_storage' with
>> bpf_jit_harden=3D2.
>>
>> Fix this by emitting BPF_ZEXT during constant blinding if
>> prog->aux->verifier_zext is set.
>>
>> Fixes: a4b1d3c1ddf6cb ("bpf: verifier: insert zero extension according t=
o analysis result")
>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>=20
> Thanks for the fix.
>=20
> Reviewed-by: Jiong Wang <jiong.wang@netronome.com>
>=20
> Just two other comments during review in case I am wrong on somewhere.
>=20
>   - Use verifier_zext instead of bpf_jit_needs_zext() seems better, even
>     though the latter could avoid extending function argument.
>=20
>     Because JIT back-ends look at verifier_zext, true means zext inserted
>     by verifier so JITs won't do the code-gen.
>=20
>     Use verifier_zext is sort of keeping JIT blinding the same behaviour
>     has verifier even though blinding doesn't belong to verifier, but for
>     such insn patching, it could be seen as a extension of verifier,
>     therefore use verifier_zext seems better than bpf_jit_needs_zext() to
>     me.
>   =20
>   - JIT blinding is also escaping the HI32 randomization which happens
>     inside verifier, otherwise x86-64 regression should have caught this =
issue.

Jiong,
Thanks for the review.

Alexei, Daniel,
Can you please pick this up for v5.3. This is a regression and is=20
causing a crash on powerpc.


- Naveen

