Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF02C317C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 20:56:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZX94pLRzDqXY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gAGDYzFs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZQv1MFFzDqLT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 06:51:34 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOJX2fH101598; Tue, 24 Nov 2020 14:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=Ifth+TJCelaA3ZjPgo8Idwa32A+j7cupSzNNiUmUIls=;
 b=gAGDYzFsBG0q+mKwNgV5C76F7vYrgeECj4V+TdLTQyuBBC66miD++6OeeP44Oy9WHaSg
 8LqGJ+JRSluia4qxe5wiIcYAx3ALYeKId6+wiyAqKzhYiswatwtvsk1BATFdqSlilMF3
 LMC3W9NVSLjsyaGYnZJDfvBT4UHsDtcf/fFERUTHVqUYlxNVEiqDH9koGTUxErVOfoJf
 WdEcY/oOaxD/X5YRlFZ9Luv0xHNURVNDJVBupFnWWASE5q0dpG55W/kueuEuMzBCfAEa
 /Zy9rPQKsYtUGurxjOv4H7epojXw2jSttmTRFfUvq9MGYVtvLt1MuhO860qgOZMiZFrg HQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350rnb86u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 14:51:24 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOJgTBd018392;
 Tue, 24 Nov 2020 19:51:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 34yy8r1588-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 19:51:23 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AOJpKRB11272682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 19:51:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C821F42041;
 Tue, 24 Nov 2020 19:51:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEC1542045;
 Tue, 24 Nov 2020 19:51:19 +0000 (GMT)
Received: from localhost (unknown [9.85.88.148])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 19:51:19 +0000 (GMT)
Date: Wed, 25 Nov 2020 01:21:14 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: eBPF on powerpc
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <d69650b0-4024-5759-3ccb-ede5c0394500@csgroup.eu>
 <1606234192.xvkulhfr3y.naveen@linux.ibm.com>
 <4d588481-0c8d-6adf-53f5-e7332ddca7c4@csgroup.eu>
In-Reply-To: <4d588481-0c8d-6adf-53f5-e7332ddca7c4@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/v0.15-13-gb675b421 (https://github.com/astroidmail/astroid)
Message-Id: <1606247281.yz5qee0fl7.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_06:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240112
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 24/11/2020 =C3=A0 17:35, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Hi Christophe,
>>=20
>> Christophe Leroy wrote:
>>> Hi Naveen,
>>>
>>> Few years ago, you implemented eBPF on PPC64.
>>>
>>> Is there any reason for implementing it for PPC64 only ?
>>=20
>> I focused on ppc64 since eBPF is a 64-bit VM and it was more straight-fo=
rward to target.
>>=20
>>> Is there something that makes it impossible to have eBPF for PPC32 as w=
ell ?
>>=20
>> No, I just wasn't sure if it would be performant enough to warrant it. S=
ince then however, there=20
>> have been arm32 and riscv 32-bit JIT implementations and atleast the arm=
32 JIT seems to be showing=20
>> ~50% better performance compared to the interpreter (*). So, it would be=
 worthwhile to add support=20
>> for ppc32.
>=20
> That's great.
>=20
> I know close to nothing about eBPF. Is there any interesting documentatio=
n on it somewhere that=20
> would allow me to easily understand how it works and allow me to extend t=
he 64 bit powerpc to 32 bits ?

I don't think there was ever a formal spec written for the eBPF VM. Here=20
are a few resources which should help, alongside the existing JIT=20
implementations:
- BPF Kernel Internals: =20
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/networking/filter.rst#n604
- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/bpf
- BPF and XDP Reference Guide: https://docs.cilium.io/en/stable/bpf/


- Naveen

