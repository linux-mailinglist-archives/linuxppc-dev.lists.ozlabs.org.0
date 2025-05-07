Return-Path: <linuxppc-dev+bounces-8372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A69AAD5D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 08:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZslRl41pRz2ydl;
	Wed,  7 May 2025 16:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746598659;
	cv=none; b=UXP+JMmWYjUv7WDVrZa2dq/g2lpEbzN8oBu1zNukewV+py6TDtSFI3umsvFtGBTPTPNFbcr0IEKqtiN9jBorrLsXXIFQuquCqb4TFDB0TVbrnsmZg5yGrbsuaV7KuReEp+Y26+dr5nflVYtpk7QjvYXTjrBsl12XHYmkV/hVD1LKRAdgMkpsUYHpCKKGVkpDb9LA6apfrdMVYVUt9xBXJTaYhY6db1+tp4T7t7B5VwxUzIBhoT88V818y/80iOV9oMShb1zBpT56gLzaOtFFspW2ybVuZiEvbw9fT7ZzNtXiIDSaUumMyyaSybnTD5i5B/boSjuotGPnI932XP9HuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746598659; c=relaxed/relaxed;
	bh=q2mJKUg1tUiVhDgsXqIjw0hWzdyfFMnBvVtWrB+aK1o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=grqAkD/zyvquXlxHdTBC+g+5xZ2kHJqN248EQfy6/OLQXuWsas0knvowAlHvdfHWkuJs8HhH6esMbGe3RPb/QpuEMBLgeI3RBQn3tTVTTQ2sqz7MNwOFO+Que80wVxcUJC+hYyAx5+oxI9h/vC9Db0oim2yORkWYhdhnxrf3EGYrAug7OGTFGYzBTEvawTNU5/tvzlnKv81WS8axoHLfG8QhkYmy/aqAa13jqWKrQ+K27u/lhch+Yq9qaKdVO0cStAtw54o7hdv8II0pkxdTAOllbW8mQmT6OyWDV/p6mLBZaFWJAW+EaKBuzYw5WROLccLDPz+qwRA9Q2pfTmC6cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p18VrMVR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p18VrMVR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZslRj6CZ4z2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 16:17:37 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546Lgbsi017652;
	Wed, 7 May 2025 06:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=q2mJKU
	g1tUiVhDgsXqIjw0hWzdyfFMnBvVtWrB+aK1o=; b=p18VrMVRhaAqLLJchkjXJd
	GTsHu6RuGy35S2KImfWTbDMxolCEBTYPi9JwofZ9K6N8bm10BlldGAma3DEsuls3
	OPN4qv59KGkv0ZrLMdIr2UH+6cNIxZusI/amAjYAVoJlkVPk9AoZwW8RiY7q8nZ4
	vTlqjklcdAx2l6myoVpmE1yBzjHJnRLfowUqCbR9hF2hYa+KequdEZgY5I2aKFU6
	/gHTX5tG0F4l1A9VcuUFkAVxi0kH1ts8+MYB/tOuMY2PkWBWBFXKgOdJjnf3hG58
	ONEO9ZnR+9Y3vXII2Wp1mUCX4p08EIUOMgtRJ+usmkoAtDjnao4pSKKPssuGy1ug
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ftjw1qr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:17:23 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54769wMm009335;
	Wed, 7 May 2025 06:17:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ftjw1qr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:17:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54747RF1001272;
	Wed, 7 May 2025 06:17:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dwftfgm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:17:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5476HKsW51970520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 06:17:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C419A20191;
	Wed,  7 May 2025 06:17:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6057820194;
	Wed,  7 May 2025 06:17:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 May 2025 06:17:20 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 157CE600BB;
	Wed,  7 May 2025 16:17:18 +1000 (AEST)
Message-ID: <24106430db9693f580c3765206257677c10e4375.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 16:17:17 +1000
In-Reply-To: <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
	 <20250430090350.30023-2-ssrish@linux.ibm.com>
	 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
	 <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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
Precedence: list
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T2zuHdKPoneGx6U0Oag-MWwuSf1oy_IE
X-Proofpoint-ORIG-GUID: dYDczGWAl_g1Yeu0mEYo2aRaGcQqzvg-
X-Authority-Analysis: v=2.4 cv=R4ADGcRX c=1 sm=1 tr=0 ts=681afaf3 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=1mVJ_uiqAAAA:8 a=VnNF1IyMAAAA:8 a=ZL5jSCTfk5O3AX6_IFcA:9 a=QEXdDO2ut3YA:10
 a=h67g7WpEjx8dfGT80pje:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA1NSBTYWx0ZWRfX3bjV2ZTOBwZI AoZee1AuWXHL3mEOVESyROCsB8QVcI191swW8dFRPXbvA1vNtAxpVuu+9WFt7fjz6JpQcUdXubo wPFkuM2fN70bmTaEboG5YEtpSuy102YWQnotoo10ZYv+ZaiHxdPuLL1V2VU43BcJqyyhsO8cLbZ
 M/yqVwqbj258hYXKoeFovDyYDCqGOUS0Q5pfwi9yVpHSAIz1Pn5O21PQKul8m4v6Z7sMyf7WYCc tIQoG9HUDDIXPU1suhNl1wjlzssX6QCAtXyqD6iphGdOFXS+pYutxgLDf7HUBEBBVXhE3f9Eclv epYvWyx7ubFKO3C8Y+hp/GNbHLgunLGG4VgG5tye3AtxdDamWQbcVxl0TkZ267lqajre4S8NBaq
 WzyVp3Ec5zvLG9YSqezNG3QAv48XAA0JK5kfoEAqNWs9uCZWZ+D1fGqWKhy8TsZS0lCzB7JH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-05-07 at 00:29 +0530, Srish Srinivasan wrote:
> > > +	rc =3D plpks_read_fw_var(&var);
> > > +	if (rc) {
> > > +		pr_info("Error %ld reading SB_VERSION from
> > > firmware\n", rc);
> > We need to check for -ENOENT, otherwise this message is going to be
> > printed every time you boot a machine in static mode.
> Yes, I agree with your concern. I just want to add that, as per my=20
> understanding, we need to check for both -ENOENT and -EPERM,
> as explained below:
>=20
> As per H_PKS_READ_OBJECT semantics described in the PAPR v10.60=20
> (https://files.openpower.foundation/s/XFgfMaqLMD5Bcm8),
>=20
> * If the object is not world readable, verify that the consumer
> password=20
> matches the stored value in the hypervisor. Else return H_AUTHORITY.
> * Verify if the object exists, else return H_NOT_FOUND.
> * Verify if the policy for the object is met, else return
> H_AUTHORITY.
>=20
> So, the hypervisor returns H_NOT_FOUND only for the authenticated=20
> consumer. For unauthenticated consumers, which is the case here,
> it would return H_AUTHORITY.

We expect SB_VERSION to always be world-readable, I think? In which
case it shouldn't return H_AUTHORITY / -EPERM, ever, and if it does
that's an error which should be handled as an error. Or am I
misinterpreting the spec here?


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

