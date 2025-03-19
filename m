Return-Path: <linuxppc-dev+bounces-7197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5E7A6840C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 05:00:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHZkW4SMcz2yrT;
	Wed, 19 Mar 2025 15:00:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742356851;
	cv=none; b=EEZyRGPpeFFT1hu52G2qpd4gw055THHQW6GdseEqN8j+5RAN7J9I8Ukb4sk9ro1fdjc2PW2xrLEUs4a422MFzToJm4hR5WLxXBth89F1X4J1f2BG5lZarUDIH6nKGXiHSgfABuWxI83iq+EaHNOBiXxOt1pJTv5vy9hiSuP1yoL46qDekQX5rlAmPZ6vrMXpZkPGzMceypRAT+7zWqF+hG4/RUVwZGp7igQ9chAMmS3pEH3uoByw+Ia1E0bhT/PMETFHUnf9arRmGD0pD2SJpL+cp5oSZ89Nw/ecBWG1fjTUz3GteeQ74J7NG9lpSMKBWjusuBoR7GRC1upG/KEqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742356851; c=relaxed/relaxed;
	bh=srljMDXR/b3PlOTBTheVB7qDBh1nRazbG4VMwqXj+wI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J6gSt6jrwsxk2GVwgzDGaWwoo0ziLnew8j2Frmdy0NIBdQ1/ol9n0G8XkU5/Eqw/PBWWWT7Fokowmfx8v2ilEUuBmnkAYlRJPYpqYcDwjSYgJshUkjyPi69Zp/4Fia4ANsunzr33GBqa1v8Q4Z4m9MhYE6VAINOsrgyElhwC1OVCIF6E47jx0EuGOMkx2FHETz2XoPixJk/lOhgzfvMnHsMdAgpscgdNGMji4UeaixFK0WFJaWfWy6Udtrzj7erhAfDUJvObougMtsaCmt8lEuqNZuogMS+euHKYCZ+hQajRTcQ9Wy9xWa2llhBMRdCTJX66Ritxipe6a4/dMfJBvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hcqTaf+a; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hcqTaf+a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHZkV5svpz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 15:00:50 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IKa7Hw014684;
	Wed, 19 Mar 2025 04:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=srljMD
	XR/b3PlOTBTheVB7qDBh1nRazbG4VMwqXj+wI=; b=hcqTaf+aWYkEAE3KOPr1X0
	05ZZWBXWDk3a94XU7mnyJcOnAPOSOcZ/7UkvzYsZA+dTOdMGyRUzGD75Yp1/cTPq
	IhgUqtERV5XYQk0PYIDnkhhrO38bImdOJEw+Rnayv3ypllbHUvCAWBrDavSS/ucO
	2vTr/hg75E90scjeD6SL2mS0QZx9zWtVstMMqmr7d2M7tF53BU6NU+MCO3IJL1JK
	akd3SW2Rah+24SN8G1XwAkhsG1EK/owOvaT/cHSeyk/6CQS3HzOkEd28sxb8kyuA
	/81XIg27hs+6t+isCApDvsDkAiByqs4uUlbrNNBFn25tQBC4lekWg0HmSIOEm8fQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg0psd0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:00:38 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52J3wu5J024274;
	Wed, 19 Mar 2025 04:00:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fg0psd08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:00:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52J1oEvL024440;
	Wed, 19 Mar 2025 04:00:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dncm7ewr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 04:00:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52J40ZK220119866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 04:00:35 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0B8620040;
	Wed, 19 Mar 2025 04:00:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E50120043;
	Wed, 19 Mar 2025 04:00:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Mar 2025 04:00:35 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A623C602D4;
	Wed, 19 Mar 2025 15:00:32 +1100 (AEDT)
Message-ID: <a1e92d89e9ec99a4b20b0f15bede1254b87b95b9.camel@linux.ibm.com>
Subject: Re: [PATCH v2 5/6] powerpc: powernv: ocxl: use lock guard for mutex
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, fbarrat@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org
Date: Wed, 19 Mar 2025 15:00:32 +1100
In-Reply-To: <20250314114502.2083434-6-sshegde@linux.ibm.com>
References: <20250314114502.2083434-1-sshegde@linux.ibm.com>
	 <20250314114502.2083434-6-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: R0N88cqJTSOAuCXgV-U1Tw4Mx2qc5_18
X-Proofpoint-ORIG-GUID: fdXd4xl0T6Ln_vzDPSiPLDnrnX94LhQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_01,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=537 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190024
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2025-03-14 at 17:15 +0530, Shrikanth Hegde wrote:
> use guard(mutex) for scope based resource management of mutex.
> This would make the code simpler and easier to maintain.
>=20
> More details on lock guards can be found at
> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>=20
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

