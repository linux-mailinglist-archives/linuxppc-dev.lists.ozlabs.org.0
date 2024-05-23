Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 862D58CD55D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 16:06:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BOHcS9wb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlVCg0W8sz799X
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2024 23:59:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BOHcS9wb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlVBx0FBCz78x1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 23:58:48 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NDsIEY010126;
	Thu, 23 May 2024 13:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=UufEkCm+NcuUDCmXknl+quFIU0IZuPd7dYdYaodiizE=;
 b=BOHcS9wb2PiaLoez9C/u1NgGDRCCRnZVEsdcePWxv6KzLbbAemqkym3AwsgyHS3IfBwc
 KpTnQshsvntarkbVVrlfFggYTyGLQ365GQAc8JILzM6m7DiWZx4W8ABTCQQtb4S4Hw+R
 jek2kKdliqr3raM8YOw4owntmiZsLxLgh/0DaRkesMu27Mm6vhdP5XmA5bGVFjbWsQDf
 gbvFIaR43eKHRBBB97sU1PLJxPd/A9tPYSlqSopLiHLGmPwJRp+SSGTXeEhAk8QnqBom
 Iwha60wwe5mveMneATzfzAQKWDiAY9lbF9jkAwPDJpHQu7llC02WCPJzCeyBKRBNjAqg xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ya73700jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:58:39 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44NDwdqu016364;
	Thu, 23 May 2024 13:58:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ya73700jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:58:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44NAu9bj023498;
	Thu, 23 May 2024 13:58:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77npjbqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 13:58:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44NDwWUM52166938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2024 13:58:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 959F92004B;
	Thu, 23 May 2024 13:58:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2107A20049;
	Thu, 23 May 2024 13:58:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.97.166])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 23 May 2024 13:58:29 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH V2 6/9] tools/perf: Update instruction tracking for
 powerpc
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <d26d353b-2f89-42fc-a247-4c0a072990de@csgroup.eu>
Date: Thu, 23 May 2024 19:28:18 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <43537D0D-0D89-404C-B0E0-E9182E2BD97B@linux.vnet.ibm.com>
References: <20240506121906.76639-1-atrajeev@linux.vnet.ibm.com>
 <20240506121906.76639-7-atrajeev@linux.vnet.ibm.com>
 <d26d353b-2f89-42fc-a247-4c0a072990de@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YDo3MDOfpyN7BBGSvY6R6122bKgCNngr
X-Proofpoint-GUID: i-vL49ysoqgSzyDgtgqc6DKLB_ldx-WL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_08,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405230096
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
Cc: "irogers@google.com" <irogers@google.com>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "acme@kernel.org" <acme@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "jolsa@kernel.org" <jolsa@kernel.org>, "akanksha@linux.ibm.com" <akanksha@linux.ibm.com>, "namhyung@kernel.org" <namhyung@kernel.org>, "disgoel@linux.vnet.ibm.com" <disgoel@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 7 May 2024, at 3:22=E2=80=AFPM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
>=20
>=20
> Le 06/05/2024 =C3=A0 14:19, Athira Rajeev a =C3=A9crit :
>> Add instruction tracking function "update_insn_state_powerpc" for
>> powerpc. Example sequence in powerpc:
>>=20
>> ld      r10,264(r3)
>> mr      r31,r3
>> <<after some sequence>
>> ld      r9,312(r31)
>=20
> Your approach looks fragile.
>=20
> mr is a simplified instruction which in fact is  "or r31, r3, r3"
>=20
> By the way, the compiler sometimes does it different, like below:
>=20
> lwz r10,264(r3)
> addi r31, r3, 312
> lwz r9, 0(r31)
>=20
> And what about sequences with lwzu ?
Hi Christophe,

This patch added =E2=80=9Cmr=E2=80=9D. In next patch in same series, add =
instruction also is added to instruction tracking.
I will be posting a V3 with some changes to the logic for annotating add =
instructions.

Thanks
Athira
>=20
>>=20
>> Consider ithe sample is pointing to: "ld r9,312(r31)".
>> Here the memory reference is hit at "312(r31)" where 312 is the =
offset
>> and r31 is the source register. Previous instruction sequence shows =
that
>> register state of r3 is moved to r31. So to identify the data type =
for r31
>> access, the previous instruction ("mr") needs to be tracked and the
>> state type entry has to be updated. Current instruction tracking =
support
>> in perf tools infrastructure is specific to x86. Patch adds this for
>> powerpc and adds "mr" instruction to be tracked.
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

