Return-Path: <linuxppc-dev+bounces-8499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA70AB33FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 11:51:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zwvy40hKQz2xlQ;
	Mon, 12 May 2025 19:51:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747043484;
	cv=none; b=bwYF+Qhh9XQfwCeEGPhu7Nhuzbb3MqihFrUA0K9WtJOKa8yrChSCs9XceDaffOokDWhIc3Ye2H+2vfPvq0hqL3qoVisELh8Re6MSViqNk8fECa6ByJnTWJia/X1diZahlVGVeEWF8EHZ6y+OvUYfLsm3BF65AQUxjWa1tNyFug/QtzwrBQE08GxgMBld/THip2cMlpvuimnHqVgGoGJwJUbZhCNY+UTUjFXKQK5cNf28L2SYT+GekTSZ+ZtLVV4OCuxlXuh3RYLproXI2F/BwMbaBpllcGR+eqvcc8+okZoJPV4jbuZCspdyrR3X0m0ltHTb4JLOPp1+0FmkPYNFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747043484; c=relaxed/relaxed;
	bh=StebqRiYq/ajV6Ebilq0GoKOhhCVhDSrElqu38WL0rE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=icIEJZxaaHSIz3sYcDYJz4AmAwpHopiqbZQXM5OBgrZjLj1FHZyfmFjsexEcppyXqsIanSeHFYSG51KMplKC9bvcyYYNRBgyT73ACoCcDtmWvJadtbttMotPU6fUK0RqXWeJX8uGRnC7gTow8ojU4Gka8UsjRtUTkO1bloLMKz0jYwP/FVQe3Lwxr13TtSTNriJWVjZGspF2mrV7asiojqMUKDSZzx71axKJQhnB8Kby8o5LZVqtZZlMjnpVxKAg6iDLCdAdj6ymFFr1jJLWdmg0Ui0cMRZ6ApNIK5HjupHpVGt2O4tZhxgqfO9nTchkfHJj8PkNsKXlyS1JjxuyiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5H0PpXT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C5H0PpXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zwvy22SMVz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 19:51:22 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C6IYHc024139;
	Mon, 12 May 2025 09:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=StebqR
	iYq/ajV6Ebilq0GoKOhhCVhDSrElqu38WL0rE=; b=C5H0PpXT+Gvr5kl80N8tKz
	Yyi1yU3qExBmAvSogdskB5wJXZNeiaGBQp+6yAni81Vjpgtr/l4hLUZXANYG+SyW
	ow1aXGotRNOk6ixo6rjd3TTAQhsBAgRsdZ0wrOXtl7Xm0+FsBiCerjXSE6JyYGh5
	NsmoFNMnK/wEum8uvQUPl/Qo49DvRQbKrX//nxFgpjCq9AP/F7u+hMmq7w6Ig3/4
	SLWTlaDVZNx4rpbE8n4Mezv9B1dNYiR3zrKj4JqQgq0e9Xx+Q/eGYdpnp1Nw94WU
	gGDS3fFgP62NBe740UcoprMW5kV6dtSCOQwcJS5NjXRyjvoFAK6OkTNJoVORrUqQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46kbksrvqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 09:51:08 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54C9gOP6016866;
	Mon, 12 May 2025 09:51:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46kbksrvqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 09:51:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9LNRE025954;
	Mon, 12 May 2025 09:51:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jj4nnatd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 09:51:06 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54C9p4A354985204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 09:51:04 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE73420075;
	Mon, 12 May 2025 09:51:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C76C20072;
	Mon, 12 May 2025 09:51:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 09:51:04 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6F5BB6057F;
	Mon, 12 May 2025 19:51:00 +1000 (AEST)
Message-ID: <0c0daff7b3674d2520e0fe24af4afcac49b53049.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/pseries: Correct secvar format
 representation for static key management
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Srish Srinivasan <ssrish@linux.ibm.com>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, zohar@linux.ibm.com,
        nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Date: Mon, 12 May 2025 19:51:00 +1000
In-Reply-To: <e80c83a1-77db-452e-8a5d-d435e61bd544@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
	 <20250430090350.30023-2-ssrish@linux.ibm.com>
	 <87e1185273ce21e5fd69ff071a1be986c2a0301a.camel@linux.ibm.com>
	 <2b7145a2-1cfb-4b1a-929c-10a03747119e@linux.ibm.com>
	 <24106430db9693f580c3765206257677c10e4375.camel@linux.ibm.com>
	 <e80c83a1-77db-452e-8a5d-d435e61bd544@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=DrhW+H/+ c=1 sm=1 tr=0 ts=6821c48c cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=C5xzFnOTFPq8S06TRoEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEwMCBTYWx0ZWRfXzVZkhw+yTy+A M5jizEdOED5m0IcC3vyJZvje28UsrBI3a+h1h8a1YhA0pRRIGUXwsaNQGcoaqqBC35mhzr/fZR4 gaeRXB/9fFuYHgfcRislT3fA8eRu5gcVRS2EIjr0BKlALvDHBQkvjAwymNvNFN6tKbBxrDXKWXP
 I1jMPdfRGE5vDt0s7ThfWlxvTecnbv4sQ00lSQK3n/g60R3UlFRIfnM/qkahd4Y5YK6VezmYoLZ FdTGFapmGISsrQPEWos303nL1DiR2EQavZmktYC0K1XrPSxwOuuVoB/TLPQUx707oPVQ8UXHIgK ZRZxR78LwnpQQRys/GcL+Mdkqd5Hw+vVlAuLpTVX8Xn0v6Cahn8wOjzlfH8uRrt6/qmcTnEOgcf
 ryzVINFz5EQzhf3Tpo36Hw8+1w9NMomOvM24EB6KRsnoIuOJNNs5CvHF7iDuWWjUeRGJAOey
X-Proofpoint-GUID: SDHQGz6jmyBWzSs1kw_OvZcKdte8zTvC
X-Proofpoint-ORIG-GUID: ZMKHPW1qGe7sDeCHOu0qskAGPbwcPAlS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=990
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120100
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-05-07 at 21:18 +0530, Srish Srinivasan wrote:
> > We expect SB_VERSION to always be world-readable, I think? In which
> > case it shouldn't return H_AUTHORITY / -EPERM, ever, and if it does
> > that's an error which should be handled as an error. Or am I
> > misinterpreting the spec here?
>=20
> Yes, SB_VERSION is world-readable and should not return H_AUTHORITY
> in=20
> the case of dynamic key management mode. However, in
> the case of static key management mode, when SB_VERSION does not
> exist,=20
> the hypervisor tries to authenticate the consumer. If the
> authentication is successful, H_NOT_FOUND is returned, else
> H_AUTHORITY=20
> is returned. The intention behind authenticating the
> consumer when the object is not found is to ensure that a=20
> non-authenticated consumer is unable to conclude on the absence of
> the object. Here, when the kernel tries to read the non-existent=20
> SB_VERSION, it fails the authentication check and therefore,
> gets the H_AUTHORITY error code.

Ah, I see my confusion: if the object *doesn't exist*, then it
obviously can't be a world-readable object, thus triggering the
password verification. In which case, we do need to catch -EPERM.

Thanks for correcting me!

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

