Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B300421602
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 20:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNT922ThHz3c5s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 05:03:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l8Q5kTGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l8Q5kTGE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNT8D1Kv9z2xr1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 05:02:36 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194HWKeb010808; 
 Mon, 4 Oct 2021 14:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=RnV3+h5Max6EldFuTuRv3VABoj79M7uo/mztThZUDKA=;
 b=l8Q5kTGE4TTl2NLZyBN7+NrXNyWzC4riCFkIMD6XejWROJHkjhVQXhh0htJwrYIwOvKK
 7FI19UckauDyjzuaYBYfG5lKtfXpvglaG5kQC1eNWOfjfCt6cyCbDfWJK6BDcN9G1b0+
 /lgCy6rPMmyhgh0E4A456LoYt0I5nu+j2LLquZxeGauOAIE55jbj1mGKtf24X2M7p+xJ
 n6EXW27eq76PiLjdf4m7FFUD1+xjscNfW8CZd0UXZlC1+u5CzIKYkXMfeMllWk8i5WgG
 bXfvzaKYh1GpuHn3BnSxk9pBECrkurFc6lxwfP5AUHuRp+nCFWwYb4YFtFThyw7mhrfl 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg63r0hqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:02:17 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 194Hd6kf026186;
 Mon, 4 Oct 2021 14:02:16 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bg63r0hp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 14:02:16 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 194HxDJV028948;
 Mon, 4 Oct 2021 18:02:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3bef29gqrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 18:02:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 194I2AmT64684460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Oct 2021 18:02:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE2111C05B;
 Mon,  4 Oct 2021 18:02:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 337A111C05C;
 Mon,  4 Oct 2021 18:02:10 +0000 (GMT)
Received: from localhost (unknown [9.43.21.28])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Oct 2021 18:02:09 +0000 (GMT)
Date: Mon, 04 Oct 2021 23:32:08 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/9] powerpc/lib: Add helper to check if offset is within
 conditional branch range
To: Song Liu <song@kernel.org>
References: <cover.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <f8d581e6a5d9555180c38e009f90d236f310f85e.1633104510.git.naveen.n.rao@linux.vnet.ibm.com>
 <CAPhsuW4Qv5e=x6WMV1EYy+NUdu+i+i+kGY2E3WAhV66a115C=Q@mail.gmail.com>
In-Reply-To: <CAPhsuW4Qv5e=x6WMV1EYy+NUdu+i+i+kGY2E3WAhV66a115C=Q@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1633369681.x4mi0btlmn.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sH_chmF2MQW6yVipTMKynw4I1KUMidAH
X-Proofpoint-GUID: lVtgDSP1QUmxzzG-AD2rcgjqbh0W9qg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_05,2021-10-04_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110040125
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Song,
Thanks for the reviews.


Song Liu wrote:
> On Fri, Oct 1, 2021 at 2:16 PM Naveen N. Rao
> <naveen.n.rao@linux.vnet.ibm.com> wrote:
>>
>> Add a helper to check if a given offset is within the branch range for a
>> powerpc conditional branch instruction, and update some sites to use the
>> new helper.
>>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>=20
> Acked-by: Song Liu <songliubraving@fb.com>
>=20
> With one nitpick:
>=20
>> ---
>>  arch/powerpc/include/asm/code-patching.h | 1 +
>>  arch/powerpc/lib/code-patching.c         | 7 ++++++-
>>  arch/powerpc/net/bpf_jit.h               | 7 +------
>>  3 files changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/inc=
lude/asm/code-patching.h
>> index a95f63788c6b14..4ba834599c4d4c 100644
>> --- a/arch/powerpc/include/asm/code-patching.h
>> +++ b/arch/powerpc/include/asm/code-patching.h
>> @@ -23,6 +23,7 @@
>>  #define BRANCH_ABSOLUTE        0x2
>>
>>  bool is_offset_in_branch_range(long offset);
>> +bool is_offset_in_cond_branch_range(long offset);
>>  int create_branch(struct ppc_inst *instr, const u32 *addr,
>>                   unsigned long target, int flags);
>>  int create_cond_branch(struct ppc_inst *instr, const u32 *addr,
>> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-pa=
tching.c
>> index f9a3019e37b43c..e2342b9a1ab9c9 100644
>> --- a/arch/powerpc/lib/code-patching.c
>> +++ b/arch/powerpc/lib/code-patching.c
>> @@ -228,6 +228,11 @@ bool is_offset_in_branch_range(long offset)
>>         return (offset >=3D -0x2000000 && offset <=3D 0x1fffffc && !(off=
set & 0x3));
>>  }
>>
>> +bool is_offset_in_cond_branch_range(long offset)
>> +{
>> +       return offset >=3D -0x8000 && offset <=3D 0x7FFF && !(offset & 0=
x3);
>> +}
>=20
> Why not inline this one?

Good point. This was modeled after the existing=20
is_offset_in_branch_range(), and I guess both of those helpers can be=20
inlined. I'll do a separate patch for that.


- Naveen

