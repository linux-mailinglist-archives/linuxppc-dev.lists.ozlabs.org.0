Return-Path: <linuxppc-dev+bounces-8640-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D15ABADA5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:45:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RXs4WKNz2yjN;
	Sun, 18 May 2025 13:45:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539917;
	cv=none; b=eFoJI6w0ZZEOfmkE/hSpYWLNgvauW/Ul+gAMsoaTRkoE8sEN6kZ0CB1HL0anBtfYxgUc5ulDJZpK2RSYWytypcCW78e6tDBRmESlMv4QqaqoinBqWkYhrbtxugT/R3M0dEQM7rML0GSP8YEuoYWrRyNremZukWek20E4hA35Lp03WFruoDLBNom97qSFsl8hoDD0D/KzVQHNa13F6sxTcvhk1l2kpNfLywxqX272cvfbmLFC0kYcPWcpq4r5XjLi6gPm5QR9RxuRQV93piFL+GkdJDYPU0N0nc4i0yLjrzL4wMtHIjiIwDfr4ypDTgKmqDE76j7C+TU0I4dfUaWptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539917; c=relaxed/relaxed;
	bh=aZtmTGuflra3XQVqC7v0ICfxIsZOQr6+/0iaKk31lS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTO1jztunIQrwhqy+aigt+kzAKKifAE91mTsqcoVhPITSVDENbCADNuzwkuOYytAirdTflD6KDY0XyzY8Jfp48AptcCfAFoZ7GNupeNCyO7ArSHFuhLvrttcN0Fkfuf38FCNj9DvlPiqvnrUV70oF/eWND2+x+IQVTdg7XILXM8SmVbxMotBBJDnQ+vTrOsPa80Fjbn6+Pl9832/+QLP8cwzQaTSo2Va/qCNrRP9pHhPp0df4JwiQcGvSXxumlyv4QrhKLNOYNLhDg8Ido1hvxrnZljz6u3xWiWIS6SwLVjwFHgAOlPqjt7kc+CpTYcE/k4t/VUcsT5D3Je+vxHIgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olu/mG3I; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=olu/mG3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RXr5Qjhz2ydx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:45:16 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HIoasv021981;
	Sun, 18 May 2025 03:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aZtmTG
	uflra3XQVqC7v0ICfxIsZOQr6+/0iaKk31lS0=; b=olu/mG3IfIv17rcgX4APMI
	f/K2oCKwBA+GHYMXi+DvHC8mvZFeFsvSv+uLLn99eXox+tIuUXffTdQbCs0+1W5h
	Yd32J+d1VdHtDzgYK56PBa9kkt+ZMoK4xDPc1sQEi+0vo5805Z9bhDyaxwDSxtdJ
	NRI0ASiAhgt5bFk7ooYWKabv+hzOf0v3RyBSRlbS59M48IWVwoE+kYHkJUVil5nJ
	n5K4La+AsOIuRULGO1lqa7La80w9iTVVnnOpq4IPRMWJ1/9Nea5KL220zvqXkuev
	T29kEijgtrfajpmWDE/Ce5DusdvCNP1XyeCj5tjC+licdAy5subZIBLk/dP9Xx3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q038993s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:57 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3ed53018886;
	Sun, 18 May 2025 03:44:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q038993q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3FLdC015916;
	Sun, 18 May 2025 03:44:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q7g202cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:56 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3isvm23134680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:54 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0253200D2;
	Sun, 18 May 2025 03:44:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB491200CF;
	Sun, 18 May 2025 03:44:49 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:49 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/mm/fault: Use str_write_read() helper function
Date: Sun, 18 May 2025 09:14:47 +0530
Message-ID: <174753967076.24504.9800144102405614800.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250210100648.1440-2-thorsten.blum@linux.dev>
References: <20250210100648.1440-2-thorsten.blum@linux.dev>
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
X-Proofpoint-GUID: W1GS7rNX1QndHClFRraKYhYJJ4AKktJ2
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=682957ba cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=WxiWINnPiWsfygINOCMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfXwtjuWQkk99QC JK+dLPNC+mVuL0Av1tHF9xVPpmT2XulF0YNoSEKtwAkuxaijdZG5g/EG8xr9MPZWav2E5WPqGBD hImXKH480eTNVEgYxCa6f5uKYfZB025a9T7lfMDEmMHXiJvYxEOaFq6K55xHNT6U/vaafcU3QF8
 BBfZfHpbOBLd5A63BxMbKmcx0ZITA29+IakFY4JVELgOHOk54OnGs8YL1iMJd7gGNbSNNFyp27E sXFH3se3gXbddAp3y33gROoyMkkZgth5cCztbtcDC3pfS+2u3fwAyRvdKvcJHeZh6V8/f7sJ82L 2FfVi9aS/Sh61pz9sUDr1txBjwqJbDxWYGCMTehJpzJlhV8lc5y8nFFz4QxXxb6aB7Z38Tcuj1K
 /Kw3ZRMhX/Vu8FxR9aVBdWvMQ4sVvAFNu8k+oSx/uU7PqYodncWgWmWZuh0W4Gc362rE2nlF
X-Proofpoint-ORIG-GUID: vhA1PrCJPWQxnmC8Xnw8bs2qF9tQK1-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=569 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 10 Feb 2025 11:06:46 +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_write_read() helper function.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/mm/fault: Use str_write_read() helper function
      https://git.kernel.org/powerpc/c/ff27a9a0c66cfeb6a15d8f2ab4754f312ecd71e7

Thanks

