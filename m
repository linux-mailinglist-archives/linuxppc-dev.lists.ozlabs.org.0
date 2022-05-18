Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48F52B5A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 11:19:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L36rK2yJtz3cCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 19:19:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Azyq8Pmr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Azyq8Pmr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L36qY3NBZz3bqK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 19:18:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24I9DFS2029211;
 Wed, 18 May 2022 09:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BicRAaUYGZ1Ic/3RHriFY2cM7MPUWW+Bf0scPmmQqyA=;
 b=Azyq8PmrqEKM8KMyaHU7f1tF4QuIvyEfe3qdCbOLvffY1zqxIN9Bec3muW2mCLLyt1/i
 9qxV7Q43n+iVqTyBtMeDcFTTTvptGGpqPaV/r+3zkLQE8bcLawLUFxzJlvbltMhxWWdp
 eTScPSoD644QxmdfHAioiNYRFafw0+xeStYI2i8yDWbU32+mkBKQbHH3Z3woD+Wdjw6T
 +4iYMM00v98glmuw3MRAg/dVq/xh1+nRLT5eosyfKpUjxSSPQ7+hb2quL6vdmbkFKZ/Z
 33Gamq1rSy6MUi8OODdogYDlydL2FtiIJ5RggnH/G6vF+6/SJzsXpOKnDWg6zCHFesC1 OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4wyhg43y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:18:37 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24I9E6UY031199;
 Wed, 18 May 2022 09:18:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g4wyhg43a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:18:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24I9HdsA026675;
 Wed, 18 May 2022 09:18:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3g2429deyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 09:18:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24I9IWNu39584156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 May 2022 09:18:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 597C4AE053;
 Wed, 18 May 2022 09:18:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8EE4AE055;
 Wed, 18 May 2022 09:18:31 +0000 (GMT)
Received: from localhost (unknown [9.43.19.36])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 May 2022 09:18:31 +0000 (GMT)
Date: Wed, 18 May 2022 14:48:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] kexec_file: Drop pr_err in weak implementations of
 arch_kexec_apply_relocations[_add]
To: Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20220425174128.11455-1-naveen.n.rao@linux.vnet.ibm.com>
 <YoNqJ/MOSIVwKP/o@MiWiFi-R3L-srv>
 <1652782155.56t7mah8ib.naveen@linux.ibm.com>
 <8735h8b2f1.fsf@email.froward.int.ebiederm.org>
 <87v8u3o9tk.fsf@mpe.ellerman.id.au> <YoSk+jRjNQtUL50d@MiWiFi-R3L-srv>
In-Reply-To: <YoSk+jRjNQtUL50d@MiWiFi-R3L-srv>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652864763.xpq371r1wx.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tKYdTki0wc-WnUEYbWBU8LFCKteGZ1OT
X-Proofpoint-ORIG-GUID: D567mNwAXtog62W9xqk_romDsRtXvGeH
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-18_03,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205180048
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
Cc: linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Baoquan He wrote:
> On 05/18/22 at 12:26pm, Michael Ellerman wrote:
>>=20
>> It seems that recordmcount is not really maintained anymore now that x86
>> uses objtool?
>>=20
>> There've been several threads about fixing recordmcount, but none of
>> them seem to have lead to a solution.
>>=20
>> These weak symbol vs recordmcount problems have been worked around going
>> back as far as 2020:
>=20
> It gives me feeling that llvm or recordmcount should make adjustment,
> but not innocent kernel code, if there are a lot of places reported.
> I am curious how llvm or recordmcount dev respond to this.

As Michael stated, this is not just llvm - binutils has also adopted the=20
same and "unused" section symbols are being dropped.

For recordmcount, there were a few threads and approaches that have been=20
tried:
- https://patchwork.ozlabs.org/project/linuxppc-dev/patch/cd0f6bdfdf1ee096f=
b2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu/
- https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D297434&s=
tate=3D*

Objtool has picked up a more appropriate fix for this recently, and=20
long-term, we would like to move to using objtool for ftrace purposes:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/t=
ools/objtool/elf.c?id=3D4abff6d48dbcea8200c7ea35ba70c242d128ebf3

While that is being pursued, we want to unbreak some of the CI and users=20
who are hitting this.


- Naveen

