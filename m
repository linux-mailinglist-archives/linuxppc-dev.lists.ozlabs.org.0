Return-Path: <linuxppc-dev+bounces-11816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF41B46ABE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 12:07:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJpms5zFvz30Tc;
	Sat,  6 Sep 2025 20:07:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757153261;
	cv=none; b=IqRK5Z3gjhMPtt8FrxRQkLZYDQg83gCyAigds/qpM3wbwdE8Ew6jfLXKVDvHo6b1/S0I3/RXZIpoueYnyHu3k9uOUr+KVvXVztEzsZo/7BH8q1jYJfzfeU47LuzMx3lL4kCzbkh9L21Jz7Kr2xX4rndjubsFJRm5q7AI/sXCHzNePV6piSzCWVGzkEEGUSJJXR4Kwq2aIXKPIKd0zDl7h8LrQtGW8WKYYhf1lf+qRFa1blQJqt0b/Q25LjQQAOpsn51VLk50cEIvQwaxfQlWw64bN5PPdghumgqlaAdv+Bd7AKbgPAtk8uCq9NeELUkbujoG3exESorMo44Ve7GBYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757153261; c=relaxed/relaxed;
	bh=XM5IWjDYFs5iP8xU4FHw2AzF3VZQqNK+RfOWuThS9qA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSPfo/hsfRRRzgIVZv2n/qV7JtYiRnuo4sEJjuyeXRF5j2xFQQ3Ks1gpvcYG6XpVyNeS4CN7/pEB5VwqkXZIdESOXNh35V+pNcPpBQUhw3oijgngPTlpNtbb4vHIThugMX665YV4XpmNWX/8WUUKGWhCJvGmeXgyqf8KXF9eeSY7odfHyTphRxSQ0UUQYU/NhUUDG49bxyeT/8/cUR8w+1fRYcx0aRQHcgkzkTq/GxMzzk4rZGTv9mEsAsez0rTBnKk+ccR6wa11O5i8kqIQyUtDGc30iunSsX1A8eKq0sPECQ5Smqy5GjrdqdQ+i7jCdAjLoFDvBTi2EGKgQI1Hdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwDrcVov; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TwDrcVov;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJpms1NRGz30Pl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 20:07:40 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5868dAHv017830;
	Sat, 6 Sep 2025 10:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XM5IWj
	DYFs5iP8xU4FHw2AzF3VZQqNK+RfOWuThS9qA=; b=TwDrcVovYBZxMI7SrEHjpg
	IvCJ+STkREjW1A2X9pBVJPVB91WUrNNY0gIwuBrkdV5dPwrGYz3uZmm+6BNOMtqM
	7JF3ud8U/XcxR84bmjVg+kLcDKosZZ2vNIvdTUYegtEkQ2huoY1P1yNq2buxoDl5
	VyE/S/4VzadCNaf2PpLJyvobHmgOdAdT4YSlw9BUaAZG6PGbx8tQy781DKLMMSSs
	0iX1FBqUXDs1X4hQjW+Vns6ewKh7N2n4DzorPPUWQqJkMA+omNTvZKXYO8fTRN8u
	8Eh4mx05PMlrjr+zqBhXt9PWy4H3MlKUXc0aCQ57YvHdlOrqM8cVrkrfBbqnKj6g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfes4sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:31 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 586A7U3W003447;
	Sat, 6 Sep 2025 10:07:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfes4s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5867i83O017634;
	Sat, 6 Sep 2025 10:07:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vc115hwp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 06 Sep 2025 10:07:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 586A7RaX50069792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 6 Sep 2025 10:07:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B70E82004D;
	Sat,  6 Sep 2025 10:07:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 140412005A;
	Sat,  6 Sep 2025 10:07:25 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.107.45])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  6 Sep 2025 10:07:24 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Ruben Wauters <rubenru09@aol.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: replace sizeof calculations with ARRAY_SIZE macro
Date: Sat,  6 Sep 2025 15:37:23 +0530
Message-ID: <175715312006.95031.5006275254669812702.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719225225.2132-2-rubenru09@aol.com>
References: <20250719225225.2132-2-rubenru09.ref@aol.com> <20250719225225.2132-2-rubenru09@aol.com>
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
X-Proofpoint-ORIG-GUID: Dw_AWvdnXuADRrs4RmMoejs71uI3fhaN
X-Proofpoint-GUID: fSE4ttplxU5ajZ4cBSErM7bH6g3l0N8U
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68bc07e3 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Ywra0r3s6krg0ml2qjgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX2EchD60NTnOL
 efEEjpcBsfdVFsoOQ5V4ZVtCUWL//NvCxbFCWWQsEsaGZ6Uw7uXXSbMTvWSMCTm+6yRMPfy0pc/
 X3khIWFTE8B9vnyLt+KMaMZxWUt/innZ1fude6WA06TbMkVmGOMaFsKJ9kImOEV+bVmibWAXw0O
 o8C8EJLYpVKXN7PCF4TFq02rsJuvZ6rVi17RKEipYpwf7qBPEfcJv4TfimEtZ1HFYjVLBTCZJZZ
 frlsD8Rqm+yo9EUk9NeOUstVHMawy2Bw0I3V2fJRUUt8jlJGTum08MkEDNhEjK0FyPfYMcic/n6
 zYbVXyVPS3MTnAyxGx3zbwidu1f7LzrsyR68N1rPqvAES1kVVZFvdnR72sc+niAe71oOgM4zjIZ
 en4qrb/e
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

On Sat, 19 Jul 2025 23:43:10 +0100, Ruben Wauters wrote:
> The calculations for operand/opcode/macro numbers are done in an
> identical manner to the already existing ARRAY_SIZE macro in
> linux/array_size.h
> 
> This patch replaces the sizeof calculations with the macro to make the
> code cleaner and more immediately obvious what it is doing.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xmon: replace sizeof calculations with ARRAY_SIZE macro
      https://git.kernel.org/powerpc/c/3d9c9e1da9886d91c24d97ca20c854c29212b736

Thanks

