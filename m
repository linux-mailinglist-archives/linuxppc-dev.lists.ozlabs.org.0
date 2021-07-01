Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B13B969B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 21:32:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GG7fK2ZPTz30Fw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 05:32:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=msSWs66r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=msSWs66r; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GG7dp2QnVz2yjJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 05:32:29 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161JDg7u142517; Thu, 1 Jul 2021 15:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=ucVIZRmO/r1ORYHrWv/gTzX22cOSynQRd8Xv3GZ1MM0=;
 b=msSWs66rD9tSAKpTc0o2E6q1vu0YWTAuaYcpycmYKH/b8MGGEFltpi5iceg+Eo5uVqPM
 AyIxrIPe+p6+x7ZyOzkbqYWwXmyfY/Z7HEKRy83gLP9A5X8UsW0hGZwWdQ9LCjX8qUPd
 YKQi2ngsLZ1u3HxONBtxm0+V30DVHzGyZctpm/DoH8DV+rVQUYD1mk9GjN2p/WvW6ba+
 xvBsnTjqdFjfZ9ufgWMVaFQdtyjWk/iu3XXZfGfduOO1UYnkpte9+7BwjhQz+F5MJO0h
 uaHNDk65gi/O2rsC5Jjh4Khg/1uCGSwzDEiLybNvLaGmBP13qW8t+PPWYvpDx+CM8ICA uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hkp1ge0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 15:32:10 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 161JDg83142433;
 Thu, 1 Jul 2021 15:32:10 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hkp1gdxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 15:32:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161J2oU8025074;
 Thu, 1 Jul 2021 19:32:07 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv8aj84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 19:32:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 161JUQbT34013532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 19:30:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E18311C05B;
 Thu,  1 Jul 2021 19:32:05 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40F2F11C06C;
 Thu,  1 Jul 2021 19:32:04 +0000 (GMT)
Received: from localhost (unknown [9.85.115.110])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 19:32:03 +0000 (GMT)
Date: Fri, 02 Jul 2021 01:02:02 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/bpf: Fix detecting BPF atomic instructions
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <cover.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
 <4117b430ffaa8cd7af042496f87fd7539e4f17fd.1625145429.git.naveen.n.rao@linux.vnet.ibm.com>
 <CAADnVQ+78iDs7N=8xA6BZVBnPx78Q-Ljp860nmb8cOq7V_6qtQ@mail.gmail.com>
In-Reply-To: <CAADnVQ+78iDs7N=8xA6BZVBnPx78Q-Ljp860nmb8cOq7V_6qtQ@mail.gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1625167613.6vloxo7l3w.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R1lGZ42motlCUrfa-5eM63jYlaZWS2Kd
X-Proofpoint-ORIG-GUID: RFI9WuObTOcwXByZjVO5gF35eaTHQIyv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_12:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010112
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
 Brendan Jackman <jackmanb@google.com>, bpf <bpf@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexei Starovoitov wrote:
> On Thu, Jul 1, 2021 at 8:09 AM Naveen N. Rao
> <naveen.n.rao@linux.vnet.ibm.com> wrote:
>>
>> Commit 91c960b0056672 ("bpf: Rename BPF_XADD and prepare to encode other
>> atomics in .imm") converted BPF_XADD to BPF_ATOMIC and added a way to
>> distinguish instructions based on the immediate field. Existing JIT
>> implementations were updated to check for the immediate field and to
>> reject programs utilizing anything more than BPF_ADD (such as BPF_FETCH)
>> in the immediate field.
>>
>> However, the check added to powerpc64 JIT did not look at the correct
>> BPF instruction. Due to this, such programs would be accepted and
>> incorrectly JIT'ed resulting in soft lockups, as seen with the atomic
>> bounds test. Fix this by looking at the correct immediate value.
>>
>> Fixes: 91c960b0056672 ("bpf: Rename BPF_XADD and prepare to encode other=
 atomics in .imm")
>> Reported-by: Jiri Olsa <jolsa@redhat.com>
>> Tested-by: Jiri Olsa <jolsa@redhat.com>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> ---
>> Hi Jiri,
>> FYI: I made a small change in this patch -- using 'imm' directly, rather
>> than insn[i].imm. I've still added your Tested-by since this shouldn't
>> impact the fix in any way.
>>
>> - Naveen
>=20
> Excellent debugging! You guys are awesome.

Thanks. Jiri and Brendan did the bulk of the work :)

> How do you want this fix routed? via bpf tree?

Michael has a few BPF patches queued up in powerpc tree for v5.14, so it=20
might be easier to take these patches through the powerpc tree unless he=20
feels otherwise. Michael?

This also needs to be tagged for stable:
Cc: stable@vger.kernel.org # 5.12+


- Naveen
