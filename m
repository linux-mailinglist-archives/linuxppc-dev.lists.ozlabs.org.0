Return-Path: <linuxppc-dev+bounces-5478-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7842A191A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 13:44:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdP054MnRz2yvk;
	Wed, 22 Jan 2025 23:44:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737549845;
	cv=none; b=EzmcoleHbIx5fehicH/c9/oUvQ4/+3bScxK7wluhf9z5TtIXaN9PXZHh8GuG5fGegRw4DXKsFME03ddVAIk5FQSGnVyg8V6fz3dzKSRgJ/5QBY7jBKX3zUp3/hTyhPYjD8zjbqT/IqLCExxhmvqhNoUcfvNLEBsETcVlCXlxEMEjQ7MupQs0JDaInbAU1dIW9NRcPunuF8ND5qds9FpwVjLTgcNe2uIepZuEndx2POmvd8WbMo6c5BDkl2FvFad1xgL5Ln36ooqjRv+8k3d27CJQWqK1H6BLlCr3OvAxKdufJCecRW0Rho11OCML7vqTVmSM4sVDfcSUSeorEphSew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737549845; c=relaxed/relaxed;
	bh=jh8SVQtreXAd9f2EQdtQsFo9Ny9dfUXCCYV7SLyWmpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q5S5hxoROacAziPlAfzYEYvSvTw3JclqNHUQPgc/p/6EH0H1ABJ2VoGzMZqh8XFD/wzapMXQyw7iy9jWNMvA96NcAZ2u+x3/Tjh+a9oJvPoRRw5A7Yzv1Cute2wo39eFhUISGebN8xZm1o2pUtjxffuvKAVbmWnr0h5HA3UjWvljqxNRhXwaesdfRg3UJ5o11u+WqA/hQhshNW7GI6jgxlZzIU9arhUkcTjy5Nf5XMR1xlbl9lDyECd2K9BbDd+FH90v3bGWvnMYnwu8gPLgiNmcwmvQGSdlThu9fcb2bjOERxu8Bdw5/8aGRizmmf/lYaMQy4b52ORs8EPyBuH3Hw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfiwbnbN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pfiwbnbN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdP045ZdZz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 23:44:04 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M2p20Y001360;
	Wed, 22 Jan 2025 12:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jh8SVQ
	treXAd9f2EQdtQsFo9Ny9dfUXCCYV7SLyWmpk=; b=pfiwbnbNUpfYBycY1VwTNy
	hSr4TBSDrJTsSkYJHCXFmv4fU/PPJiTyY+xC2Of1N+9AHtGNW/AxJYiJP0XNXAyz
	Mji9ydNURwOjHOri5olpv0KfzxpC0jtPYIaNgLxkdP7zhSP3hYJG3WroKgA/vMNY
	L9f0OdqpX7mLs8LxakNSrqgVx1G7KBmHMqvS6B884xJp2BqekTFWtXzaKMXVC3d8
	kVH4kQ1aCYH+QZFzDPKWtkaHZ3C+Lz67EIKAbW3MpAvnJBxMVlcrcrNiRdPqQDjl
	Bn0jrvqWY/v17fl2AVThPXvmmQzIuwSeIvslfJK3pWFHwBvfQq/zmh6ur+M6WGlA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44aduywfk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:43:55 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MBXwnN032290;
	Wed, 22 Jan 2025 12:43:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujr49b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 12:43:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50MChlNU48497144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 12:43:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF27020043;
	Wed, 22 Jan 2025 12:43:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EF4120040;
	Wed, 22 Jan 2025 12:43:44 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.85])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Jan 2025 12:43:44 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Avnish Chouhan <avnish@linux.ibm.com>
Cc: mpe@ellerman.id.au, brking@linux.ibm.com, meghanaprakash@in.ibm.com,
        sourabhjain@linux.ibm.com
Subject: Re: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
Date: Wed, 22 Jan 2025 18:13:41 +0530
Message-ID: <173754932979.1094869.8339209003148586969.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206065545.14815-1-avnish@linux.ibm.com>
References: <20241206065545.14815-1-avnish@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lkscvgzdttowoJ47BLZRMoq1uZAVpSHz
X-Proofpoint-GUID: lkscvgzdttowoJ47BLZRMoq1uZAVpSHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 mlxlogscore=356
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220093
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 06 Dec 2024 12:25:45 +0530, Avnish Chouhan wrote:
> Change RMA size from 512 MB to 768 MB which will result
> in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
> Secure Boot or FADump, the 512 MB RMA memory is not sufficient for
> booting. With this 512 MB RMA, GRUB2 run out of memory and unable to
> load the necessary. Sometimes even usage of CDROM which requires more
> memory for installation along with the options mentioned above troubles
> the boot memory and result in boot failures. Increasing the RMA size
> will resolves multiple out of memory issues observed in PowerPC.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: increase MIN RMA size for CAS negotiation
      https://git.kernel.org/powerpc/c/ae908b87b6bb32c170e9baf5858f2a7553cacc06

Thanks

