Return-Path: <linuxppc-dev+bounces-10169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCBAFFABE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 09:23:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bd5t50PVKz30MY;
	Thu, 10 Jul 2025 17:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752132205;
	cv=none; b=GS00tODVqomLO5HB4RCq6r/eEsNgsW0TrRoV4ca06Zqjuki3NvGc8Gwm42mHnk+A2PGshi/rC8Gw6rs5O9YzbgS7HWPRXzeM7sK4K8BaxdD2ILc5PAd6gJ3TJZME2t+Wf1z0EMjgopY8x6DpGN07c6qtPyAPatiswbL7Qf0EHw1rEK0c8ef7LLX+oxwuRfGqOTJZfiAkSFzPg5l2emv+WgT0QvRXL8oTuykQRWXUxsA1mVNGuKwGeSCivodqZUIER73d/vT7aDyIRzJaFMOa1hr1glyC+uM0m9S045zEIlKB5GoE2HwIwZnD4xsorI8Z//OiJmv3T2PcbFaP9eqcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752132205; c=relaxed/relaxed;
	bh=jNdjqexWD9dvYK3FbcoWaXW00tzKthPqJvN4dLJv1oc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XxdB4SQ9MeudWT0fqzN3OCOuTyMG63p5bRyD4fs+jw/bbHe1dVZnIeBoEFgURIvMuAgMnJF4l35rPNraw8Cozszvd//TK4srpLTC6JAbQBbMd2rHl1nO6J/YDKugxeehPHmn2KoZaIsvvQuCd62GmsAViz0y1Y1on2l/L5EoDbyWg2ASeGIFRuq/mZQlBRU/0g0QD92+u5RUzlil48tUJWWXCH13V519Chx2cIZVtyp6pd1P+Po+RYg3DolSLMjvrrnf+kMV5lI3DOBYWrvvGG3wiyAP41nDMPSWMsnqNy9bHx/ivljGYk9Wjx9dVn7abnVQ9R6fQLHWMT/oJ1vWew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GDLLPJK0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GDLLPJK0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bd5t41FKDz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jul 2025 17:23:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569MmLxD019358;
	Thu, 10 Jul 2025 07:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jNdjqe
	xWD9dvYK3FbcoWaXW00tzKthPqJvN4dLJv1oc=; b=GDLLPJK0KPWUnpOHh57cTl
	jQH1DOrwKVl9jNRne9xgV03rbi22JyIeoCem54a0Pl3BjTkK/fMXGibRjwLrAVb9
	8qd+h94kOZ1kRnLH/U5ALlVOvRZrFVNo2Q9DW4Mm+FHGWWLiI8FHu/uDEncAgj12
	f1nt+RkZL+FtgaDritrc6IecCdEt5QtLjVGvymgGtzOP7tVV2RYqVGd3JSTARRyh
	mVG7C/HvDRWyTo3BozHv4KU9pIXSITyTItu3Ds8X3jTvKmwuz2T+n7y+AMeh4uIg
	F6d5PQmK/zavK4Z2IEIdLSTjK3Pw6RLbOAeTNfavbreNt0gpKweuz2Qwgxq/cCuw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puk4bbpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 07:23:18 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56A7KgN9010608;
	Thu, 10 Jul 2025 07:23:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puk4bbpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 07:23:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56A5enaX021561;
	Thu, 10 Jul 2025 07:23:16 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47qectvn80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 07:23:16 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56A7NGgK32375300
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Jul 2025 07:23:16 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A37D58053;
	Thu, 10 Jul 2025 07:23:16 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCC2058043;
	Thu, 10 Jul 2025 07:23:13 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 10 Jul 2025 07:23:13 +0000 (GMT)
Message-ID: <8bda71d7c25900616beb706c73a04bd54830252b.camel@linux.ibm.com>
Subject: Re: [PATCH] ocxl: sysfs.c: Replace scnprintf() with sysfs_emit()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Ryan Chung <seokwoo.chung130@gmail.com>, fbarrat@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Jul 2025 17:23:12 +1000
In-Reply-To: <20250710071815.351069-1-seokwoo.chung130@gmail.com>
References: <20250710071815.351069-1-seokwoo.chung130@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA2MSBTYWx0ZWRfX3cpkbFpWlich 7VKpJrRtWSHtUtVoeCxuZ9CZ0HTjL+wRrHVZvA8le2faTE/WMVRduSw7JnZI6GcbQnBd3k8u0Of ZxTw22AHCUZvtISWQUXG8vCCPxNcTDxMHZfuzfxU5wJubLlv6wCY5XdAtzZtdNGnI6937OSAHFM
 dTluHK4/PUlwKn5tdZ/0U1OtFkcS1pzfyxeBt6zUP+Zf4Vtao8byFWlPvKPF6QmIj6ATP8LZAUM fVoYOX1lzcEKhNJoD33QORg8xaErSYnU0tsCwUdgQ11RwqGKsyOoG/+1OxDD2osMBVfnU1WTxpq u5jgy+JftOwkNNjHDTXcN4Q4wRYHwePCr83RLzEx1oClbY1j8/HHD6CA6qbt0lcoNKxayUyE7kP
 HwmL26I4s/Jb08nMJNGG6R2teEBkxhnJ/ZvWs/eRKmpAPYHbAhJaZEMUdXBfXoBBisTHivpZ
X-Authority-Analysis: v=2.4 cv=XYeJzJ55 c=1 sm=1 tr=0 ts=686f6a66 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=ywHtLLQGUfgKd5ouuJYA:9
 a=QEXdDO2ut3YA:10 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: xK_GEAAhqq0p9QJ5-w3E_7rDrPGfAyLU
X-Proofpoint-GUID: 04QUFcX3Cf19Hy3NCJIhVqO8slIh68Kp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxlogscore=531 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100061
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-07-10 at 16:18 +0900, Ryan Chung wrote:
> This change uses sysfs_emit() API usage for sysfs 'show'
> functions as recommended from Documentation/filesystems/sysfs.rst.
> Intended for safety and consistency.
>=20
> No functional change intended.
>=20
> Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>

An identical patch has already been merged in char-misc-next:

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20250620024705.1132=
1-1-ankitchauhan2065@gmail.com/


Andrew

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

