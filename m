Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F3637A83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 14:50:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHzsn4VC9z3dvD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Nov 2022 00:50:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HJ20RjgQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HJ20RjgQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHzrp0fqXz3cNJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Nov 2022 00:50:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOBvlrN016263;
	Thu, 24 Nov 2022 13:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=CKBTzyYz4k5+pwEvAeINjs848dzyyjMsSd6z7ezPC1o=;
 b=HJ20RjgQE6wEmLhGtx2hhex8mJm0hjemLVcdnVKq8j9p5LaNlpZyvw0/DlyPVHefm9Va
 cvMgNNxKXlNC1bXZT/xvjKy7RKN389p+WGorDqdo+bES44HLwovARNg8eNzzxNWDvu1d
 WVTACeo9hOPRmSiyjoU2fjZzwdqN7j8lCAMDCZ2l00YulobHTqNzDwABdKXiQO+4eeZc
 a35vEyMsECYYZ+piEIYMI1C26XUwsWXodPt7Ebjnqt1Ys6OmY3eUDP8MKDvl6cBTFJY9
 rdO0d0cUFpr0DLb9FtgH+sRYB/ofJhPTLcZ3bFcxOIUflpd9yc2bYJbTWhhjj7p68iQF fA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w6skpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 13:49:36 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AOD8Tcc031065;
	Thu, 24 Nov 2022 13:49:36 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10w6skp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 13:49:36 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AODZTmh012896;
	Thu, 24 Nov 2022 13:49:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3kxps8wye5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 13:49:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AODhEXh7144008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Nov 2022 13:43:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9B35A4055;
	Thu, 24 Nov 2022 13:49:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23B38A4051;
	Thu, 24 Nov 2022 13:49:31 +0000 (GMT)
Received: from localhost (unknown [9.43.36.53])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Nov 2022 13:49:31 +0000 (GMT)
Date: Thu, 24 Nov 2022 19:19:29 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: Only update ldimm64 during extra pass when
 it is an address
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman
	<mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: 	<3f6d302a2068d9e357efda2d92c8da99a0f2d0b2.1669278892.git.christophe.leroy@csgroup.eu>
	<1669284441.66eunvaboi.naveen@linux.ibm.com>
	<9f17237f-94da-f58f-4f4b-0068851b4123@csgroup.eu>
In-Reply-To: <9f17237f-94da-f58f-4f4b-0068851b4123@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1669297066.kxu8xl391n.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8R5RM1Sg9FNLOIPesftNdoPdw9MqmtEP
X-Proofpoint-ORIG-GUID: ghvVsLyCUsPc8rn2_dn7-PFU18bhALVR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_10,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240104
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
Cc: Hao Luo <haoluo@google.com>, Daniel Borkmann <daniel@iogearbox.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Jiri Olsa <jolsa@kernel.org>, KP Singh <kpsingh@kernel.org>, =?iso-8859-1?q?Yonghong=0A?= Song <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 24/11/2022 =C3=A0 11:13, Naveen N. Rao a =C3=A9crit=C2=A0:
>> Christophe Leroy wrote:
>>> ldimm64 is not only used for loading function addresses, and
>>=20
>> That's probably true today, but I worry that that can change upstream=20
>> and we may not notice at all.
>=20
> Not sure what you mean.
>=20
> Today POWERPC considers that ldimm64 is _always_ loading a function=20
> address whereas upstream BPF considers that ldimm64 is a function only=20
> when it is flagged BPF_PSEUDO_FUNC.

Not sure why you think we consider ldimm64 to always be loading a=20
function address. Perhaps it is due to the poorly chosen variable name=20
func_addr in bpf_jit_fixup_addresses(), or due to the fact that we=20
always update the JIT code for ldimm64. In any case, we simply overwrite=20
imm64 load instructions to ensure we are using the updated address.

>=20
> In what direction could that change in the future ?
>=20
> For me if they change that it becomes an API change.

More of an extension, which is exactly what we had when BPF_PSEUDO_FUNC=20
was introduced. Took us nearly a year before we noticed.

Because we do not do a full JIT during the extra pass today like other=20
architectures, we are the exception - there is always the risk of bpf=20
core changes breaking our JIT. So, I still think it is better if we do a=20
full JIT during extra pass.


- Naveen

