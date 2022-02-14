Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4F4B4CB4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1Ns5BRGz3fNp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:56:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NbUO0ttL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NbUO0ttL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy1By5YlZz3cnK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:47:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E9EAmc006904; 
 Mon, 14 Feb 2022 10:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ib57o6XEDx2zL4tfXsEqyFcGD5EI0qTqjW2ch/AjXtc=;
 b=NbUO0ttLLQa+Y8fG3i4KaTn/tGeltTrnu5eRSukZjWgU09hR2JWd3caDvB4ZG/oWbkpF
 YEfXO4C9t902ylaz4sqOuHCc4aonMjPtLCmLaXXJ+DEYMXsCAe/ysbWKV5atpjZUI4Ss
 AKbgRbUfL/p+bbrjkYokgydyfsOEtqKFNeA8fAoP4NXOtXrk4HAMHzXOf+g2gD9v93SC
 +3ViOPH8nJpDT2sUZzdS49rMzbxzAyfGDG0+LHJImVjLI9QMRHq8azYElAgt6Ddb8Osx
 JmzTSwZxnvDoxcMDXPlsze+yVPkhh6Dut665SzuWxkwYSkvqj+yq6CNEqMADgc8Ahmg7 kQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7ath437p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:47:08 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EAcgw8032248;
 Mon, 14 Feb 2022 10:47:07 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7ath436f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:47:07 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXVN5012196;
 Mon, 14 Feb 2022 10:47:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3e64h9m1ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:47:04 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAl2Xf42336576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:47:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67912A4060;
 Mon, 14 Feb 2022 10:47:02 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF9BDA405B;
 Mon, 14 Feb 2022 10:47:01 +0000 (GMT)
Received: from localhost (unknown [9.43.124.167])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:47:01 +0000 (GMT)
Date: Mon, 14 Feb 2022 16:17:00 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 0/3] powerpc64/bpf: Add support for BPF Trampolines
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Daniel Borkmann <daniel@iogearbox.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1644216043.git.naveen.n.rao@linux.vnet.ibm.com>
 <918b842d-f674-bbdb-c772-b43a00f1b155@csgroup.eu>
In-Reply-To: <918b842d-f674-bbdb-c772-b43a00f1b155@csgroup.eu>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1644835471.mm5694ds8t.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SVBsdeW2rPuPsaiU_U_Pv4tGdWrT5rZU
X-Proofpoint-GUID: L62ehD2I5ZMrJx9P1LNnET6rBYPxqt2i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140064
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
Cc: Yauheni Kaliuta <yauheni.kaliuta@redhat.com>,
 Jordan Niethe <jniethe5@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy wrote:
>=20
>=20
> Le 07/02/2022 =C3=A0 08:07, Naveen N. Rao a =C3=A9crit=C2=A0:
>> This is an early RFC series that adds support for BPF Trampolines on
>> powerpc64. Some of the selftests are passing for me, but this needs more
>> testing and I've likely missed a few things as well. A review of the
>> patches and feedback about the overall approach will be great.
>>=20
>> This series depends on some of the other BPF JIT fixes and enhancements
>> posted previously, as well as on ftrace direct enablement on powerpc
>> which has also been posted in the past.
>=20
> Is there any reason to limit this to powerpc64 ?

I have limited this to elf v2, and we won't be able to get this working=20
on elf v1, since we don't have DYNAMIC_FTRACE_WITH_REGS supported there.=20
We should be able to get this working on ppc32 though.


- Naveen

