Return-Path: <linuxppc-dev+bounces-11818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33DB46AC4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 12:08:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJpn94Wc2z2ywv;
	Sat,  6 Sep 2025 20:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757153277;
	cv=none; b=cgtGEkq6+op9l8B/jLrFpPWGIWl0m7wYBRl3MvXsF/ZaSxJRN/uxdY54FEswOwKbJl5g027OHVLgixSZ/EsmdX0q2SgCRM0H7cTCO7JTH3SH04zy7IAr1h+Lz8NsqV+dzP+Y1G6vaqZpn/lHVJJDz73F3FN09FdibXrzL+KG3YASB8sekS6secB9c3wAIQkUv09iv19J6J5+qTA2fW5Ji6Z8dCiyeLBI34r1WfaKR1SNvHWK1P8wgkfu5pX1UaghHP0XiPRH3rceGqju1nzlIhVEXbaXtWURnaHs9V8hZQrQMPg4urWERkj9zTBkJ+PchZJYGm5mHDcp9kGczckr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757153277; c=relaxed/relaxed;
	bh=D2K6WADPfyzF1q6psUiFGQ/kUjPlrOypEDH+Sv7nKw8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fDRLkmVFSkbRBF32jQcmd0x1AWrbDsHYEnJKuIrJgUGT/ZkwaGt36lu8y+YMX4fFakqCibj2+2VHdjZ1ZR8+VL+CtgBZC0mdlreO7RtfL+IqEoIxjdIC35bFryVOB32cEYNmYPn4XUcrZqJdLGDW9pSfmh6HtZ/KZdTHPbwpvIOjPbNWC09ZWSZJXP9zJKwyXG9f6iANOyrC/MXj088HN9eUNRXZk4NSI9R/gzcOuw3vK61/78L+vY/Ebim8/A0V6OklMcEM4bsgDz7Q+b3BvibvmR42Muf45iwJ8doO/rNw8I4niEnSMzAYWLPAvE8RVY6dLXwnI1UjNHGSYLXnlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OJJtA2DA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OJJtA2DA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJpn86KBHz3050
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 20:07:56 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5864eb2m017518;
	Sat, 6 Sep 2025 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=D2K6WA
	DPfyzF1q6psUiFGQ/kUjPlrOypEDH+Sv7nKw8=; b=OJJtA2DAoDKvu6geyd3kIm
	BMn2Gu9qCOpzF6ziWyfFaVRVjEmftpM3piOD8GjKshqh0eRUyzFliFWWsrtOwGS7
	hvhhpRU4JMJvYrGZqRE1XOuKe0R5qFXsrNTKfnIJftZ5ShcLOPfE+rTZjxn2bs04
	71NVUV7fkHM0f3Nby0IfZAmqOFTwc2pYx41pfQ57fkhvsxTfdixQRtdndcu+lB5J
	0FmgEaBKIXa21Z9Io/snOiM1VM/5IWWzNuZ34czyZmONdsC+C/Y2WyQXbFakcHgh
	wDUBBjG2Ja/O5p4q+/U1RFabr1/yn5FwCz++DWyqaNTMCfNrLLAuRgCHeP25mTiA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfes4rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:22 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586A7LWR003043;
	Sat, 6 Sep 2025 10:07:21 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfes4rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:21 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5864Xon6014038;
	Sat, 6 Sep 2025 10:07:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48veb3w4fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586A7Jnw50921814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 10:07:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A3DD20063;
	Sat,  6 Sep 2025 10:07:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11E532004E;
	Sat,  6 Sep 2025 10:07:16 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.107.45])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 10:07:15 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gautam Menghani <gautam@linux.ibm.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 0/2] powerpc: Fix integer underflow & leak
Date: Sat,  6 Sep 2025 15:37:14 +0530
Message-ID: <175715312006.95031.18312967895718915434.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754300646.git.namcao@linutronix.de>
References: <cover.1754300646.git.namcao@linutronix.de>
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
X-Proofpoint-ORIG-GUID: 4gvLGvKcbmaw3umDgGbo51QpLT67bZS9
X-Proofpoint-GUID: 1OIDBU-VTOMSl_r5wYuRk3p2k-DTLKAO
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bc07da cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=ZiPmK-8AuTT3vM0SIfQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfXx+b4GHjNA7nV
 z83Q7YBTcTBRDa7JQsvJy29fgFibTNhqL+kUFZDv1vi0MErUXUKLXcoKBS9/FMQ+SWbLbge147r
 yJAegcubFOufCUfLRPtfGz3ItHEf6KF8aVgVdAIZ+p6FRs+rbFadao7UvjvrWAAB57fwa3mjOdx
 8TyMa0194znE4ZujR5gsJi+wI7niweESN+6YpJbSoSXC8e7Vgnn374Vu7WEx2s1foNifrEc+iyz
 Osjf0TWk7FeNAR2RVZE23KDWwwgaJZuGP2QpKadoRW9b0ySxuwr9lEf92SytAzifcKhKRWq15Lk
 5Vh1x94ZLqTtRYGpxLn7CLiM+fo1KnUVPgSMkUh8inlybtopBb2pcf47C/lrc8sd8KRtQgamep1
 L7ayFWjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-06_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 04 Aug 2025 12:07:26 +0200, Nam Cao wrote:
> This series fixes integer overflow & leak problem. I noticed this problem
> when Gautam reported a kernel bug with another patch series of mine:
> https://lore.kernel.org/linuxppc-dev/aH9Na8ZqrI0jPhtl@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com/
> 
> The root cause of that report is a bug in that series. However, that bug
> triggered another existing bug, causing the reported end results.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries/msi: Fix potential underflow and leak issue
      https://git.kernel.org/powerpc/c/3443ff3be6e59b80d74036bb39f5b6409eb23cc9
[2/2] powerpc/powernv/pci: Fix underflow and leak issue
      https://git.kernel.org/powerpc/c/a39087905af9ffecaa237a918a2c03a04e479934

Thanks

