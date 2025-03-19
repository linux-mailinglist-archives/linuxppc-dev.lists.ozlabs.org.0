Return-Path: <linuxppc-dev+bounces-7196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD5A6840A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 05:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHZk03lwSz2yqF;
	Wed, 19 Mar 2025 15:00:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742356824;
	cv=none; b=QqB8lXrkslweEPFhbRlwVdfAsL06qgR68BoGw3vkCr5jsUtKNDS0QXn8Uy/s9a9XxBVLA1BUpLWOSaqFld6Kp7hLL5S2oSdngWOX5pHmdRx/Xi6tmWqhUu4lsotSoWZzvl27KSxNu4i2q26wbP3DwApp3vlFdjZ9kpr5KOChbhL+icJi7ZbeD68PGbbWC1bmQ+DNp9oy+rXh/NGPJpNRMB2ZItB78byqQlHsRbE+KBRiVKk+xjfNN0lK7bZJQniiyuRHJG+I97U5GHLlVYGr5DIFaA0h86ZMbVjCDBXgQeB4myJvpUZTRHHlOpTnSxD3njSItC7RjrgVbVW3NVc8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742356824; c=relaxed/relaxed;
	bh=U9ggS/V2nO1Rhhkzcm5mSRFrtmA3+QyvnI2V2aIpsDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kEFR7EOHLyM8OxcMWPbZUpZRkStlS5Tdo5MyNbC5fTrci+qEmC7VDUNk7aZj4ngQCN+TpsGN4L7okVJvKV/sGYd8dBqmp1JSpWmZwS93gH7BOGtcHqVDep5iTTd+w4RTuYG9EPZNweqy3PcM7cgMa8BSfAWjbgsSOnQw+CLaeujkum4FWoGNzNsF8fwP//aqg5DznADFKngJGTsxd9szgMNr4zixs98t78JLVE/S67MYkRisuJmVADB7Zbc6mEaobOtKxsqfDE/toUDoE6tnW4YJo5rEOghE9Aj3RRIEK1MfYGBrP9duZyvdCtIQAt577lRzJTGotSf6DYC5RwsSVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CewSuzC6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CewSuzC6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHZjz2321z2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 15:00:22 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IKcbZP008032;
	Wed, 19 Mar 2025 04:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=U9ggS/
	V2nO1Rhhkzcm5mSRFrtmA3+QyvnI2V2aIpsDk=; b=CewSuzC6OooHncAOQCq/fv
	tyOaUhBUnJ9adCFVAjPjvaB+1X1jonsr0LT7xAlqsymenitM5tIMSZ5tDm+UiIbR
	vTKCudU1KZ6tfnunbXpMFZTBIVGV60MsT8eN1xeFJ8l29TE3pnagIMjByU+FC19I
	HjJj1b7gB63yCCXP+zRwm5R4xo8jLCgev4+IjbUZ7q9taBVmVbvJtUeNkBSyI8Wp
	ro6tcogsNPUH/AEMKRWJgXPF2GKPq7McprOlX80cc82NKJcSNkb7zvIWM6BW2OB4
	8KlhRAfvXrTnXZiFjU3w2Ag9aSpeQIwD3cYEn4CLEAEjUd2O5OCTiXyMi29JLacA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg1yhchk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:00:07 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J3tbJf029481;
	Wed, 19 Mar 2025 04:00:07 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg1yhchf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:00:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52J3viBb032373;
	Wed, 19 Mar 2025 04:00:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dkvtfs35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:00:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52J405p750200926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 04:00:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E767E20043;
	Wed, 19 Mar 2025 04:00:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 772AB20040;
	Wed, 19 Mar 2025 04:00:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Mar 2025 04:00:04 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A0D6B6014F;
	Wed, 19 Mar 2025 15:00:00 +1100 (AEDT)
Message-ID: <324b4b5c6f1f0a777a217fdc05c8d01d4e0302ea.camel@linux.ibm.com>
Subject: Re: [PATCH 5/6] powerpc: powenv: oxcl: use lock guard for mutex
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, fbarrat@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Wed, 19 Mar 2025 14:59:38 +1100
In-Reply-To: <d6999d74-45f6-413a-8881-90473b322dfa@linux.ibm.com>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
	 <20250314054544.1998928-6-sshegde@linux.ibm.com>
	 <d6999d74-45f6-413a-8881-90473b322dfa@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nCc6gFsqSOhvHBf2xFLZlI8uxRrcj7xA
X-Proofpoint-ORIG-GUID: ib4WQQqdA4LcZCIp9-Y4wC4XR44jQnBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=507
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190024
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-03-14 at 15:00 +0530, Shrikanth Hegde wrote:
>=20
> Hi. Andrew,
>=20
> After this change below dev_dbg will be called with mutex held still.
> Is=20
> that a concern? I don't see the mutex being used in that path.
>=20
> Since using scoped_guard cause more code churn here, I would prefer
> not=20
> use it.

I think this is fine.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

