Return-Path: <linuxppc-dev+bounces-10432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22465B14B18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 11:21:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brqbr11LSz30P3;
	Tue, 29 Jul 2025 19:21:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753780904;
	cv=none; b=nd44yc8tSVZdS9V+Atb6VGf3Nx6OXqiYxgkUAh6hcE4hs9e2LnefgCsL511Rwyhc7XV+BzYqedmwNJPO8QV8UaEqvWw3QtlKKq48gSKIwtW/ckvYrakD6iuCjOiUmZzd5Q3RR2/VoPv8llvQSLbRhKiI5lNJ7wGyjSSBYnvxBrI0IxH2tkL0lrxeJkF3Ztfv7hSwx+BbtIZjmHhsam4fFXXHFOs4tIcXWKXsiww9ezeLIygFw8IDMlibyw9iyMjesnXuABOiEWdKXUxqqPsNUEusCY2B9SYW571Zy/TC1jcYaNMkdfLEbZ+rJr9zfP7TRMLiePZ8RYZru1ORaKR0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753780904; c=relaxed/relaxed;
	bh=gvx4sDVtIijHH79iHM/tx+Lbn7U20NDsLl8m0FSg8J0=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=g74sobLHAzYaUr1DXsArS7ed5KrQQxrX7fTQo4zwmN+axgPjaIfOnLuOn87a/j/O5yI1Frlfd38yzb9kmsAYld1gAvTvKwrCzZy1JmGvORTwOwES+oJ6lJrk8FIzeaotQYI0gAmqHGxKkjmbBQQo1yBq33YoZQDc47PMqin5E0VRKTMl/P3NtDVRPX9q0hVKTfv1+MhEpyl40jA/ZAmUekVg8Sxpkz+w2nZSaGSlcS5tmNPOK2tmK8Vd2HkPbF7Ckf4yWZP3Oyk/rx9OiAKVH4fEaqAQ76H4fYQrFjaZbEMsekE4+GvEjX9SNwIDKdehbmzZpQc0wkj/RuGWyZEHdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DHnZ88IY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DHnZ88IY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brqbp1KpZz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 19:21:41 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T4Z3ie002269;
	Tue, 29 Jul 2025 09:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=gvx4sDVtIijHH79iHM/tx+Lbn7U2
	0NDsLl8m0FSg8J0=; b=DHnZ88IYGvdmCZkJDTANc0nF1mF1WRocU7u6/wj2RyMj
	WSJkSPJ+WyAY/dS/utdmaOmXk06XTQxNz5o+9+uixvA+upSJwL6l24sUwCaty663
	j9Q2M89SGq/D6t2GT2bfGBGHHSz0tc/v2hVqv0tyT66MHW0sNHv7spTWrEg4vkv0
	qLrptrt7DFmeUDS+Ilit81gf44N0AUOVRNpTOwOR6Bb3pnn36q5LpsTw+CFneGPM
	JJ6O3QSpN+DS3GnV5jUFTApOl1MXziLZImf65K8HcBJtTEwPW41eIC5/bYtLoq86
	A/RG5Ul6ing/dAvWUHIiy7ql1sSYmFnkjAVK36KJkA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6hkrmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 09:21:19 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56T9C2ZS013405;
	Tue, 29 Jul 2025 09:21:18 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 486c6hkrmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 09:21:18 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56T5JtTQ016016;
	Tue, 29 Jul 2025 09:21:17 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 485aumhmmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 09:21:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56T9L9hM1245950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Jul 2025 09:21:09 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12E8458051;
	Tue, 29 Jul 2025 09:21:16 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0DC45805C;
	Tue, 29 Jul 2025 09:21:12 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.204.205.241])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 29 Jul 2025 09:21:12 +0000 (GMT)
From: Venkat <venkat88@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] pseries/lparcfg: Add resource group monitoring
Message-Id: <C34B5D6D-0141-4E83-BB1B-6E3AF517AA72@linux.ibm.com>
Date: Tue, 29 Jul 2025 14:51:00 +0530
Cc: christophe.leroy@csgroup.eu, LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        Michael Ellerman <mpe@ellerman.id.au>, naveen@kernel.org,
        npiggin@gmail.com, tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        tyreld@linux.ibm.com
To: srikar@linux.ibm.com
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mcX5rOK0rny3dT4zC3p0ld-jucipMzjy
X-Authority-Analysis: v=2.4 cv=Mbtsu4/f c=1 sm=1 tr=0 ts=6888928f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=J52luZ3L32VaiGxZi9YA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: U0Jad4U_OHCv57znFnXOZs33AkRMp7Lf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA3MiBTYWx0ZWRfX80fNK7/Q79dx
 P0aPtYsJNaXg9TY8kqFVbPiaFFe1rqGzvJejue+YQXD5Lc6vqcF8+3snOt33hDf+Kdqa00s9dBM
 Gd07FbCh9lBr49C/wOcstIR467NalgdUzN9CFaxH+UrRQ041sdlVN9bBglFpi/S4q5hKMm709Xm
 757hSH8CGeEQHv1HdZor+Q38gdoGlB6n2QFbM8mYSLfG7crhQLj/ytb5RJUD288DnMMj2m95SrO
 JkYr30IocHScSCNhL/Q81em2dQxn4pRCzSi7bvVeysohIR3lUOtnf97n29puaWN6iG09BHWe3mv
 hf++DFK4HTlHkTIWdfOXyM+GiFJX/NnMHksaKxhxC609dL8lt8gGGmf/D5/tRDZkK/v2vedpHYU
 wCAu2sVJ3QBC0AOKis1ND0wNoZa5tnHPbBRGfJL7faeZCRKozQRLAD24m7HoMRxMfeX1I+7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=461
 lowpriorityscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Greetings!!!

Tested this patch by applying on 6.16 kernel. Build and boot was fine.

Assigned the LPAR to different RG, and with this patch, RG Index and =
active_procs in RG reported the correct information. Hence,

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

