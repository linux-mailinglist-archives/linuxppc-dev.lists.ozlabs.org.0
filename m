Return-Path: <linuxppc-dev+bounces-8373-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3847AAAD5FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 08:25:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zsld15LbTz2ynf;
	Wed,  7 May 2025 16:25:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746599141;
	cv=none; b=GQsMYQVQNlKUpJKNyOfXSwiYVnRifmmMi0h1aBFNUy5pwf5kF2h0CXvTOSd1IZ0TyuJTHTLhTcKmiMzJ4oilb3i/mCAS6YqrmIH9hNNcSxYGVoHOE+bGXmy5wZNg0l4UcaLhAmBGFQXo8ssc3ZrnSxscXLffDCydhZ8v766L2EFmT1JfPM1MbZDqHZJE8Ok0AYq/DXLyZud6lk2lPXkKMfKeFgPlY/hRBYogq0DgHQ8amSxu1nBJxLSRgplfjb0wIbxnurjmfLvj4JUg8m8YChtzAf2PZWI/bOeHC1ePPaWwfLmBZhVwyIfl5DwprMHUu1xRGY8g/StXCbCAy/ujOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746599141; c=relaxed/relaxed;
	bh=1H2SKdw/CJ1oFZysP7AbA7rtWkaow9Z02aBk9jm2tJY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WZ/kIeFJzsGzHfENt+qqj57BdihO8ZH6XD8btkKlEa7aNIaO6VrXi5hlzIf63cLDbAGK6+a4cFHh2JMFBk/r5jDqpQ1SJ1xysCAd06nOGsnFbV0iprjTUs/0VoJI6e02goMHr4fjO1dYVdn5G9SXLDvyeOoYqOuNSNhJbitJRG3YMTEF/vEZng1BQz331INhrUwYqLjGfkIAtGg7QB7z8y16F6Zve35XcxLk8kNV5MHG6ioWx0VFurSBRYwd+B6xEMe02SqqGndAN0U+k5vY8TMhEC8g9CrGaiFoBTkFNzHv9wLwKoZ/gRvVA8EA+M4AZt4ZULm1REVJPSIx+w1DAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSax7/gr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dSax7/gr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zsld06jFyz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 16:25:40 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546J06iH011055;
	Wed, 7 May 2025 06:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1H2SKd
	w/CJ1oFZysP7AbA7rtWkaow9Z02aBk9jm2tJY=; b=dSax7/grc7WqB/w/bpL/qP
	srxnysIRxGGAAXDI6H07wewjbDmW9dQAKxo3hIx0sAJuRV4Y3UnGCqJTo0TGTh+E
	CSEx4GKSUi74QnnzVHwsttQdyRdXhKiL8GPcX/daPcm1e6gYwCycshMQGispPPPo
	Cuou3Vg4l+Ua0iF6+JtMrw1ue5LgVKtNzLH80ZHBo09C3DONozFyXjRJfWxxp0qw
	WFFAIhDbdC9B38s7KpNzdI9Se8DzWOJZVYBtM5pu6AyAERGdgfNKz2IB+6n/VwcM
	qqusOBll8cO+kIt09bxOjxi8Xwf7a0F9ilw9zWT5w4orqwJl1ZSsTzX2R/7xlUPw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgvsmunb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:25:28 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5476M1Rq015839;
	Wed, 7 May 2025 06:25:27 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46fgvsmun8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:25:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5475xk1u014583;
	Wed, 7 May 2025 06:25:27 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkq40a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:25:27 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5476PPXP40436050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 06:25:25 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69C4420082;
	Wed,  7 May 2025 06:04:01 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 011B520081;
	Wed,  7 May 2025 06:04:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 May 2025 06:04:00 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 37A13600BB;
	Wed,  7 May 2025 16:03:57 +1000 (AEST)
Message-ID: <f950789abaad0e854c4e60c7316b675c712c386f.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, Srish Srinivasan
 <ssrish@linux.ibm.com>,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 16:03:57 +1000
In-Reply-To: <3fe59767-954b-4c2c-a602-9801f1c1080a@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
	 <20250430090350.30023-2-ssrish@linux.ibm.com>
	 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
	 <3fe59767-954b-4c2c-a602-9801f1c1080a@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=CLAqXQrD c=1 sm=1 tr=0 ts=681afcd8 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=VI1NQ0rgZN61wkHHH4kA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: QD1K8PZ3uYzMJ7kPAvcb9JP4VkJn7oLp
X-Proofpoint-ORIG-GUID: rztLrWR4sWMaBLVOXO8rmeAHuH-8u504
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA1NSBTYWx0ZWRfX4xfKB8NZ6lMj ZtfYnsUNf0YlOGsCxzKwCSwj0/7ZlN3V0rIXgktRbJk96/zqTwFBQ7qJYF8HaIgiF/JLG/ZXHLP fwfAFfN8Egegx3Azq06LVxs0lFt5rN7e20WRWDH2PJ3ZltAxbeAfNv2yKK1Djc7/QOjuHCBDB+B
 5kjED0cI8vLL0DVSGP5e0sePnn0Zn4n8YUhQCUGXYqBadtJUHz05ns+OmaSiTCqwQ03cWzz3mbc ZSoHS2RpPBuOSbR0JXN5VxkSA0GXQMDRy3/p40WWRIyvVAp3fa6p/Thlb5JJUm6JYhz/shzMNMK CWAxRkmqguwkzSHnyNA11yoiZ5Opo5bHsCKgKXHCxg87TcMZPlcFirIXEg+1Ty4YPN7di82VJqJ
 DuXhzSc/Oz4AuIOl9chIMEvHa+o4omFhDcj61hplespwcl4lrvYa9iPXXvMWDUUCs9zOhGDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=678 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 2025-05-06 at 15:27 -0400, Nayna Jain wrote:
>=20
> > It might be better to use something like "ibm,plpks-sb-static" in
> > place
> > of "ibm,plpks-sb-v0" to make it instantly clear that static mode
> > doesn't use the same version numbering scheme as dynamic mode.
>=20
> Yes, "ibm,plpks-sb-static" is more clear compared to "ibm,plpks-sb-
> v0".=C2=A0=20
> However, I am not sure why "static mode doesn't use the same version=20
> numbering scheme as dynamic mode". Infact, as per my understanding,=C2=A0
> it=20
> is part of same versioning system. "0 represent static, 1 represent=20
> dynamic and anything beyond 1 would mean dynamic with additional
> features".
>=20
> Also, wouldn't having "ibm,pkpks-sb-static" and then "ibm,pkpk-sb-v1"
> for dynamic would be bit confusing? I mean being static is clear, but
> what they relate v1 to? Or did you mean to have "ibm,plpks-sb-static"
> and "ibm,plpks-sb-dynamic"=C2=A0 for the two modes?
>=20

I don't feel strongly about this, as long as it's well documented.

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

