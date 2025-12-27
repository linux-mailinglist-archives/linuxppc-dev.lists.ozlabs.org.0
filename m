Return-Path: <linuxppc-dev+bounces-15015-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932BCDF3EF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Dec 2025 05:24:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ddTrl5lLjz2yFQ;
	Sat, 27 Dec 2025 15:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766809447;
	cv=none; b=G2m6ghs8RakuAOA0OmR+vsleGFFXaSfQTHC5Q04V91mR3Cx3Mw5/85MYDhzg8N1rZcIZdJkeI4AVxg8H2zgG+Xy9BrfcILtwHmX8r7CP+26/+XRIpM06wjw3miAfF3ImpL86TntrOjD7AcPWsCfeeRteWMjQI2cRs/TFK5DI2+x7GqiNy0/sf6cH5xP7oIjwuw4OYSWwyS4o4Y/OGdnvhDaPLlrPZVGisxrW8ISqAQJzPZARTfpYIRW1+KOKOJpeeoYQ5ybkoUnwglqwSLbh1+b+v095OFe+JORnXraU6f3cg7ASZ0I5V1StfNyoRIvlIGK3VY33dA3qOAKYD+P1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766809447; c=relaxed/relaxed;
	bh=WReELiPrwhOeVdIpMKMR37AiLkjmosx8UjeH/l3HF10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jz4S4V3+akmNyak2e47GF4qasZSwuOy3AnSUTPeFBwN0nqd7yRBK1h9SzBYzEcCZfUC2IHPB9r0iJfY708FV0rqtS2NIapGaJU5dUVqXH6igZoWytPUi+gYRkAmojjm3SuPVJ6EGd99frvBL2UBKhGeRuXjAdlOKCxww3ns5aQR3BuPEsn+9a8Yr4rPCdFL9xIlwzsSngBKynNY0cq+q451FT9ng2tirfaZDSa1f0YwYq4N14szwzA2f8p5MXt5BUohyccED5uQUxAtxrjpraq3+pHOwbJO9xhgqg+o8oZeCdCp1GZZIQwopL+CiViq+DJ+/oq9+KZqJk+tVBYTv3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B4O2DnGS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B4O2DnGS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ddTrk0J5Xz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Dec 2025 15:24:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BR2wfTb014733;
	Sat, 27 Dec 2025 04:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WReELi
	PrwhOeVdIpMKMR37AiLkjmosx8UjeH/l3HF10=; b=B4O2DnGStQMvI/k6ftD4Ma
	ItHDgweIEuAsx556XDIavYBxmulrrZlVeNekONREYMHeiJRvDjYagLsUrq4eIjfo
	3qQ3YyvzssE/lyNYWoqmuphRlZblTXQd9sPyNSsB9Oiks8MkELE3aaxILk7luJzQ
	kwVMToz4tSpFLlBDtGlkb/qToUvoV6hr6bNktGaJQtmzB0YE6hcaysTzV4cY4ghp
	+JMl3T4RnqksJiXaQNR/GBjY6z0YE3FqxAtESJmCcH6OzoXPdbhGJMfgSdjHydeu
	bwomKm4YJhhaUHQRfhQZ3XrblbVSBHxlsO2uBM+smzi4ratb1DUcpOMckWgISP5w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74tr4xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BR4MEQi026339;
	Sat, 27 Dec 2025 04:23:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74tr4xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BQN0LvK032332;
	Sat, 27 Dec 2025 04:23:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b68u1j9ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 04:23:54 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BR4NoAL37945824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Dec 2025 04:23:50 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8501920043;
	Sat, 27 Dec 2025 04:23:50 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4757C20040;
	Sat, 27 Dec 2025 04:23:48 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.212.100])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Dec 2025 04:23:48 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: mahesh@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        naveen@kernel.org, linux-kernel@vger.kernel.org,
        Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH v2] powerpc/powernv: Enable cpuidle state detection for POWER11
Date: Sat, 27 Dec 2025 09:53:46 +0530
Message-ID: <176680916370.22434.3072624602301188394.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250908085123.216780-1-aboorvad@linux.ibm.com>
References: <20250908085123.216780-1-aboorvad@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: nTEaOz_LoSJLKDyYxyPcU9jabGkdcLsE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDAzNSBTYWx0ZWRfX4QByeE45rUv1
 HOXQA3zDFbkeubKcwazNeEAVES2nKDWo73ehQjuiatdZC6iXkmInSCGlrqU1COfCwzMut9eFYqz
 SGS/R2VcJHOf+XlAiL2lHFEyPYaEtGqPW1SNTJ0JxIkwkDqSUjsHmvu5vVde74WttqgPzReTtsK
 PDrD5i8yfOWGVILzpyvJgYNDEXBKhAM4Yiv32BHI+pgNW/Ht6EKqnoKnkkwlcJpjQJPbe+zGr4n
 VmpeJ5MioAiVGGffNTUWv+GcRtABg7medsKw/iiHh26TNT4b2jV+SY7oUyAQfGXzrpRCezCAuPc
 EeeqPURuIS5N9BRgFusaD+d5m1t9XcrzOGz3luHz4vMLeCmtTE1PV4Lh2T/vrgJrO/zO0GSqDkj
 5mClT6z647EgZqVFOaLKfrDJ3c7FevBmBGSqkmRNMTNCbom1nyZ3xFjmx6E+Q7BTJ0rVGRMbEjp
 UfNTEk1Qg6706WuhTjw==
X-Authority-Analysis: v=2.4 cv=AN8t5o3d c=1 sm=1 tr=0 ts=694f5f5b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=SNXSE3Pfd6caFg0pjrEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vk0wcMCwt3cezhXhMgnoRB0rgWvqOORW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512270035
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 08 Sep 2025 14:21:23 +0530, Aboorva Devarajan wrote:
> Extend cpuidle state detection to POWER11 by updating the PVR check.
> This ensures POWER11 correctly recognizes supported stop states,
> similar to POWER9 and POWER10.
> 
> Without Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 927:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/powernv: Enable cpuidle state detection for POWER11
      https://git.kernel.org/powerpc/c/fbe409d138b1d8a8b91cdad19cf95495e8ebe1ee

cheers

