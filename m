Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0983C9E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 18:23:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fUpfh2GG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLSNY2wD0z3cTx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 04:23:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fUpfh2GG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLSMk62YNz3bvy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 04:23:14 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40PFP5Bj020477;
	Thu, 25 Jan 2024 17:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cVNZc9q+8FpFe2O4iOfcB2Ytb8pJl3WIDZBMmN8QFYQ=;
 b=fUpfh2GGOZamZfOMp60HbAORjYgppIZEi461TG0BSRxax4nFCecUJhWKodN2jE7EN3Or
 j/hcZc1y4DZgNOdygLF+B5udMwAJf6U9n1vrosUaA74NhSHXSQ2UCPqDvsnu/mz76w6R
 8vNGezDHsO3tOobTAFqRRNxE29xdaD3dL8Yd50gz8Ll1kMxPd9+466vCe3yiiJ+zX9Fe
 cphbFdHOAHGRKSPOqyueIW4J2sw4kBIXQosY+t6aPQkpeSR/i5dm/UKWE50kLjlh0Nja
 JLVx/7lzBS56t1DBEhrMr5YmNGAvDJk12pvey98qykjQFdmsNItQiKCzAbdIPLgmTq/M 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vusbjd9e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 17:23:05 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40PGtse5026194;
	Thu, 25 Jan 2024 17:23:05 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vusbjd9du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 17:23:05 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40PH1fAH028287;
	Thu, 25 Jan 2024 17:23:04 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vru72w6p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 17:23:04 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40PHN3pH2687650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jan 2024 17:23:03 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 728725805F;
	Thu, 25 Jan 2024 17:23:03 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50BBC5805A;
	Thu, 25 Jan 2024 17:23:03 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jan 2024 17:23:03 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 8/8] powerpc/rtas: consume retry statuses in sys_rtas()
In-Reply-To: <316c43e9-cffe-46fc-b21f-50596bcd60aa@csgroup.eu>
References: <20230220-rtas-queue-for-6-4-v1-0-010e4416f13f@linux.ibm.com>
 <20230220-rtas-queue-for-6-4-v1-8-010e4416f13f@linux.ibm.com>
 <33ca48b8-f847-4d2b-b95f-741f0e082d2d@csgroup.eu>
 <87wmrxqsnh.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <316c43e9-cffe-46fc-b21f-50596bcd60aa@csgroup.eu>
Date: Thu, 25 Jan 2024 11:23:03 -0600
Message-ID: <87ttn1qqdk.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XXaygBsN8MXdxHIRKuIYe23xtONPnOlN
X-Proofpoint-ORIG-GUID: 5ZAo4tuffUn4Rf5nnE0aRkptwiA_79C4
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_10,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=853 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401250124
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 25/01/2024 =C3=A0 17:33, Nathan Lynch a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Hi Nathan,
>>>
>>> Le 06/03/2023 =C3=A0 22:33, Nathan Lynch via B4 Relay a =C3=A9crit=C2=
=A0:
>>>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>>>
>>>> The kernel can handle retrying RTAS function calls in response to
>>>> -2/990x in the sys_rtas() handler instead of relaying the intermediate
>>>> status to user space.
>>>
>>>   From this series with still have patches 5, 7 and 8 awaiting in
>>> patchwork, see
>>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=3D857=
47
>>> and patch 8 doesn't apply anymore.
>>>
>>> Are those 3 patches still relevant or should they be discarded ?
>>=20
>> Thanks for checking - 5 and 7 can be discarded.
>>=20
>> I intend to return to 8/8 ("consume retry statuses...") when time
>> allows. So that could be put in "changes requested" state I suppose, but
>> if it's easier on the maintainer side to discard it that's fine with me
>> too.
>
> Ok, thanks for answering, I rejected 5 and 7 and requested changes to 8.
>
> While at it, what about patch 2 of series=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D382195&s=
tate=3D*

Drop it, thanks.
