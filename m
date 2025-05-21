Return-Path: <linuxppc-dev+bounces-8797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5CCABEAF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 06:26:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2JJd23TMz2yfV;
	Wed, 21 May 2025 14:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747801569;
	cv=none; b=EZl/0/gWMhy/QOK20DcY40plHQ7mP24Bw/tbZNloausA+vRYtVW3bpv81GyjpJf0jOBDeN+ekEfGKLVKytNFVwmUBxXOGFUKHpPihrICjupdtkWua6G65AntpKAeSi6o4ZamjG25sgYFRKFv9sCQ50eN3A1/fBV1XAYX+/KLuXlc6koLc9f5gq9lrBKCDUqB/dcfA4+HsQo26Z7DsU8a9LBwnpZy6mftMLp41hiq2GOrVCvg+e8BKdnnlS1+KqWvQ5Uc+cL981za8++n8bFQlNg+018VRHRIdcNuY94P7p9sDD5nKqhkcXNp/Cg5iQ4U97EYv1C+4o3Q2T+8hm20eA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747801569; c=relaxed/relaxed;
	bh=ApFN9Z8V669aIkeaf+7kYUvdDCjauQUf37G8ecCQGXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUAERoUuxUSP9rCzG8tUpThLAFat062nIA5asJvGKlRDOp2q5tKpF/bE2BO9Y3K6AiMlDRzC0OvDIjYbrNHK11DkL22heqsY3lfOyaslGguHCuswIGSCrxYcWaQNITLocwsFHgUYwvqfsHEkrLhIYNUy62yPF1J2/+hDMTNW7s2iHa9g8kuiUSCvF6ner5YnuLFVndgSy/3mVYMKvbpVYgV+juG3tAscYulVExrCiiazaudA4WrsDkZteSAkhS5u48GMLvCdxkKb1Ev9kPQSTeD3aatfU74VJyX6UUAUM8927mMWw2iuZk8HDooGrhTJwZ/N1Ggotr7NNLoeD/NOjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/FNGSxP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E/FNGSxP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2JJb1qpXz2ydl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 14:26:07 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KH6pdt024940;
	Wed, 21 May 2025 04:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ApFN9Z
	8V669aIkeaf+7kYUvdDCjauQUf37G8ecCQGXU=; b=E/FNGSxPIY6iv9dGGkQ1F/
	oJSfJyNapqEGS1tPSCJWcmkTta3ypynCx3Guu0sxaYXJXQ3OgH0YnSBOM6aS1+tB
	pdJXaaWXFI20+X7RTPMy+LmodBED+JTDGYUGbysnvJLEeqvkFwjJH/vdu3J7miYh
	fR1BVVcSNXUioRw5MhuvOi7I4noAcNtdOyRqWwdVJsELQCwFQkCVqIniup4nkQox
	e5oIJ07F37RXwGUGg6Pw3EnhmXAN7oAYIR8oIB/vzeslAurt/g3cSWdYppqq2b6j
	WlEVeh8lBc7xGa8kw46ozMMrPg3JjFO4KPB6WChRpi8ApHnQQ3v8El8Fnhde1GNA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rwustfwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 04:25:54 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54L4Psvs021182;
	Wed, 21 May 2025 04:25:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rwustfw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 04:25:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54L0xaXL032076;
	Wed, 21 May 2025 04:25:53 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmaebf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 04:25:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54L4PpTv34341620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 04:25:51 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66CA72004B;
	Wed, 21 May 2025 04:25:51 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BEEC20040;
	Wed, 21 May 2025 04:25:48 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.10.34])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 04:25:47 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, "Naveen N Rao (AMD)" <naveen@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Remove myself as a reviewer
Date: Wed, 21 May 2025 09:55:45 +0530
Message-ID: <174780149789.301359.6072055617151626536.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420163248.1746379-1-naveen@kernel.org>
References: <20250420163248.1746379-1-naveen@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 01wyvQP4kvnU1CMhC0KxO0kYWZ0nIZkq
X-Proofpoint-GUID: uZ62AcZQ6QDv_VjbfYidT2LBilb449u9
X-Authority-Analysis: v=2.4 cv=Lr+Symdc c=1 sm=1 tr=0 ts=682d55d2 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=ymEwmeTLNRlp4B0r1vsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAzNyBTYWx0ZWRfX4S2c9eT0WdJn WUbf8PUIIC/MwZgGCFzFWTSi53MgLhBlA802tdK6U3XDT/0WALrB1xg1CnOE8dax7OVilrNTzNF dK8SeqDmauRn1v4JsVbc72OKvlHfWtb7EpPK+dcQlCSbBuGZHFkMQOe04ocmeDuXme5yNuR++Gl
 LiQR34iNQ7Pht6H/Da8KEmHja6GxClLsdsKOdEYghDjFRmyfb4Tckc0uMjWYDRrUp34kQYRHli9 G1A955motnOrbpRe8FzxNd3rGDYOijVl6qf9cnM3fd1dVNghGhSJwTmLjlx2OM9kUdvAr41NYKR rYVU6oL9IwMEfO5LpsphPqCAwp9JZ4NaFLeJmiINloMFqb8oLAkE/r1gv4rD3yBG5goIFEvvHUI
 sxEWzae3z2zIWPVkXyxo8XznXpDJrBQd/AMdgzJslcSjjvcpXXaltvQQ0D2EAVnJuwuthz2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=642 priorityscore=1501 mlxscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210037
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 20 Apr 2025 22:02:48 +0530, Naveen N Rao (AMD) wrote:
> I haven't been able to participate and help with this as much as I had
> hoped, and it doesn't look like I will be able to spend time on powerpc
> going forward.
> 
> 

Applied to powerpc/next.

[1/1] MAINTAINERS: powerpc: Remove myself as a reviewer
      https://git.kernel.org/powerpc/c/8682a5749a3d2b416b57709115c0351b50c8efcb

Thanks

