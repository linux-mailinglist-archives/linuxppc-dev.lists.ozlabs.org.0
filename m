Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F599841F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 21:14:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DHQW2gVDzDr1b
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 05:14:11 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DHNR41lgzDqV8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 05:12:22 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LIqR0h192284
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 15:12:19 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uha2w4ams-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 15:12:19 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 21 Aug 2019 20:12:17 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 20:12:15 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LJCE5f48169192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 19:12:14 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D7D64C044;
 Wed, 21 Aug 2019 19:12:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3280F4C040;
 Wed, 21 Aug 2019 19:12:14 +0000 (GMT)
Received: from localhost (unknown [9.85.72.179])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 19:12:13 +0000 (GMT)
Date: Thu, 22 Aug 2019 00:42:12 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: Regression fix for bpf in v5.3 (was Re: [RFC PATCH] bpf: handle
 32-bit zext during constant blinding)
To: Jiong Wang <jiong.wang@netronome.com>, Michael Ellerman
 <mpe@ellerman.id.au>
References: <20190813171018.28221-1-naveen.n.rao@linux.vnet.ibm.com>
 <87d0gy6cj6.fsf@concordia.ellerman.id.au> <87k1b6yeh1.fsf@netronome.com>
In-Reply-To: <87k1b6yeh1.fsf@netronome.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
x-cbid: 19082119-0028-0000-0000-0000039234C0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082119-0029-0000-0000-000024545D62
Message-Id: <1566414605.l9kcxxdjo7.naveen@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=782 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210183
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jiong Wang wrote:
>=20
> Michael Ellerman writes:
>=20
>> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>>> Since BPF constant blinding is performed after the verifier pass, there
>>> are certain ALU32 instructions inserted which don't have a correspondin=
g
>>> zext instruction inserted after. This is causing a kernel oops on
>>> powerpc and can be reproduced by running 'test_cgroup_storage' with
>>> bpf_jit_harden=3D2.
>>>
>>> Fix this by emitting BPF_ZEXT during constant blinding if
>>> prog->aux->verifier_zext is set.
>>>
>>> Fixes: a4b1d3c1ddf6cb ("bpf: verifier: insert zero extension according =
to analysis result")
>>> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
>>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>>> ---
>>> This approach (the location where zext is being introduced below, in=20
>>> particular) works for powerpc, but I am not entirely sure if this is=20
>>> sufficient for other architectures as well. This is broken on v5.3-rc4.
>>
>> Any comment on this?
>=20
> Have commented on https://marc.info/?l=3Dlinux-netdev&m=3D156637836024743=
&w=3D2
>=20
> The fix looks correct to me on "BPF_LD | BPF_IMM | BPF_DW", but looks
> unnecessary on two other places. It would be great if you or Naveen could
> confirm it.

Jiong,
Thanks for the review. I can now see why the other two changes are not=20
necessary. I will post a follow-on patch.

Thanks!
- Naveen

