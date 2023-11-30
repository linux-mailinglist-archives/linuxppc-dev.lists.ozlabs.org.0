Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B67FFC02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 21:10:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AzSqNfXz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sh6kN1LhCz3dBZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 07:10:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AzSqNfXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sh6jT4mN6z2yDY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 07:09:33 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUJcUsD021868;
	Thu, 30 Nov 2023 20:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=98gq09CooVWsfeW6JxTgU0Y61q995jkeRnD0cQhI9k4=;
 b=AzSqNfXz+g8kWwxrOw7RcNb2CTTayB7M3OvVgSAJvXGFXM3ichbQGkW5EX3LcLHL1DXk
 Jwp9s4t8842igcP/1xbXdwm2IIi4NiWlfPsBF7u6L7TgbSqJwQVoF/MjXoCgoNCK9Ol+
 umY0sjEybXTKrZhEbtIX6uul/6f9NxmWMtadCzz74hOLTTiwMUyoWjTk1RHuAmZHN1w/
 4rg5IppTeIqLJrLTz15av7+6wFvuTu163cbuukMZEBSl1ixkY2ZLUWZp66rb6zO79GNw
 ko0zvTdbpV/MvkRq3Y1q7gaazfj5c6ZdegrRdmp/seKtcltG9CD+F9s5VDU+qSX+RQ6h rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq0qk0s9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 20:09:23 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AUK8xB5002026;
	Thu, 30 Nov 2023 20:09:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq0qk0s8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 20:09:22 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUJhbaI012514;
	Thu, 30 Nov 2023 20:09:21 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8p0jk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 20:09:21 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AUK9Kv01442468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 20:09:21 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3E3F58058;
	Thu, 30 Nov 2023 20:09:20 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7832858057;
	Thu, 30 Nov 2023 20:09:20 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.162.243])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Nov 2023 20:09:20 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 2/3] powerpc/pseries/memhp: Remove unbalanced
 dlpar_release_drc() call
From: Scott Cheloha <cheloha@linux.ibm.com>
In-Reply-To: <8734wq2c33.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Date: Thu, 30 Nov 2023 15:09:00 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B49F4CA-E110-4C67-924D-AFC4D1C60DA2@linux.ibm.com>
References: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
 <20231114-pseries-memhp-fixes-v1-2-fb8f2bb7c557@linux.ibm.com>
 <18be4145-732a-4e28-b7f1-94d367a54bd7@linux.ibm.com>
 <8734wq2c33.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9uaN8XS2ILnNnHT49fsF5ekPj8AtqP7J
X-Proofpoint-ORIG-GUID: sRWOneOYYNJx8ulu94lTHUAd8NkSjebL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_19,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=911
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1011 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300148
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
Cc: Nick Child <nnac123@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Nov 28, 2023, at 9:21=E2=80=AFAM, Nathan Lynch =
<nathanl@linux.ibm.com> wrote:
>=20
> Nick Child <nnac123@linux.ibm.com> writes:
>> Hi Nathan,
>> Patches 1 and 3 LGTM
>=20
> thanks.
>=20
>> Regarding this patch, dlpar_memory_remove_by_count() calls=20
>> dlpar_add_lmb() and does not free drc on add error.
>> dlpar_add_lmb() is called here in error recovery so probably
>> not a big deal.
>>=20
>> This is all new code to me but it looks like if the requested
>> number of lmbs cannot be removed then it attempts to add back
>> the ones that were successfully removed. So if you cannot add
>> an lmb that WAS successfully removed, it seems sane to also
>> release the drc.
>=20
> Maybe I'll drop this one for now and turn my attention to removing all
> the high-level rollback logic in this code. There's no reliable way to
> accomplish what it's trying to do (i.e. restore the original quantity =
of
> LMBs) and it just complicates things.

Removing all of the rollback code is a wonderful idea.

