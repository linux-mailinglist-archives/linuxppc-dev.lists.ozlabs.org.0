Return-Path: <linuxppc-dev+bounces-14395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B346C7721B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCL0v1Clrz308g;
	Fri, 21 Nov 2025 14:14:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763694863;
	cv=none; b=gVoI7PMcXa92JGJEYoQSxlQTSI6PIEIEK0yiAg5uL/Cko0gTaceKt76lKiHeTPlS1EYIIdFqlpSrEN4z5rdhM24o3n9aItch/mCMOlZd8kX+Qswrh5hq2VctbpM+PZyKKXB5//YpIJ5PAC+p67bo7MRnZExMDJg8HJFAMfiQvp9OM8CzM5nciGB/abj6KrfS9yEtf10rh9dcV73Fb53HywYJMYh16vdPu0z+ZC+QycYwm7A8vqlbgCIDb1vB2KROaC+/RxkDIlaS+n9RMTXHgBKmSYKIzbdj4zsRr06WlOQDnjD19pAek6fdM6j4PDnQ9xOXH6tuXwZ2kWjO8TcZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763694863; c=relaxed/relaxed;
	bh=Wrab9xJnq8wVj1Bj+Etz9IklWNdPfRMY/bGE7FDxIZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gRWrTuA9RrP+Cb979mxIm6VSyey2T9AKEGC5XFGX7S4NZazyfXir9Ud73KEDRENJbPkSDdo4/yLnleVVClUgvPKH0U0+q3UHYsbOfxyg6VjZ033FjneO4sw5B+ZEbhuPCMOwtbk1Ks0fJk5oKw/6IX2lSKeGEo9iWH8cnn4SW45rzhgz1jqVh+woLIRqbVPhIZ20Oa7x0T1zfGw4EqJTpDsAdYVJVJ4dNqznak9EnxNKF2BPMhkT82ZNZ8h8rAC/tT6Xtn8MlWGPb66s6PDtKootCRCNBKCRVfKYCDsthLYgxqRJjUleN4DWynzqLw1WHb71mPFCHoDskAoRpF7SGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fQtV3bFh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fQtV3bFh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCL0t2Dg1z2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:14:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0eMNx021423;
	Fri, 21 Nov 2025 03:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Wrab9x
	Jnq8wVj1Bj+Etz9IklWNdPfRMY/bGE7FDxIZE=; b=fQtV3bFh1zRy55EC8B9Bep
	1SUeITWS50nm5rx7S70o9xx0IkcEz7sGkW9v3FejT9GkgkzU4wm6b+jCjgiK0LxB
	X4GK0OzbP/8Btc3QHGiosL4YhQQn+73fpHy6qgfhuY6eY5DoGHsAPocAOM2+4CuI
	MoSxjC6QWRJ0OY1WwiZE6FgyJKrIC0NsmzfT9TuWYA/IfcVEk7wOVA3sTTZgKEAg
	I0GJvHWRLAhqnECGXoiuI5mrsI89aFZQdkDQ4HPUJZhAqJMJzJp7Hepawj8FEyul
	4USS6MZJAhmEIZe4Q9nz3TG914BPTQoWWzez4C3I1Bf+X1jo3lHrxS3jEcyTSJ2A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjwhrus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:14:11 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL3DtpE026792;
	Fri, 21 Nov 2025 03:14:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjwhrup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:14:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNEU01010406;
	Fri, 21 Nov 2025 03:14:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usj7xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:14:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3E7mF49086780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:14:07 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB728201E5;
	Fri, 21 Nov 2025 02:54:22 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D60E20230;
	Fri, 21 Nov 2025 02:54:20 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:20 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        =?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] powerpc: Rename wdt@ notes to watchdog@
Date: Fri, 21 Nov 2025 08:23:48 +0530
Message-ID: <176369324786.72695.813847437031179480.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
References: <20250418-watchdog-v1-0-987ff2046272@posteo.net>
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
X-Authority-Analysis: v=2.4 cv=BanVE7t2 c=1 sm=1 tr=0 ts=691fd903 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=DqtfCAEWuzFl7eJMzwoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX9Sc7/LpNCTCi
 mRlTM+cPMhqd8urQUzeosowdXmiNz2NEzOs82Woc00a1bXvajNi8okWRcMdWLn49euplzb2Rtoo
 ilE09GWGswCGfxJq1FjD7BWv+2/YZIamlXI2HaTiee+Cne/rXqTWb46jOsHQX9inAzhEPJYPEAQ
 brDpVeNK4nmfqVVpwZ8hzFczXOUWce+EgRcWxMPIPfqNEIT1ehktH0csJBiPl0yaXU2AQo+/CXw
 aPYrmiQ53Wn4TMyRivVE/i8OFt5UE/GlRHIBJ3elzaYIUilJsEyY9MURsBywZM7/zq8yqpB4wEU
 q4W3ExiG/nWHPeepmmoOiqV1cMRk+WdL1n3czKRFuUE3x0wVhYiNn04JUN1lHbKGn3vR4jPV8Rt
 0eOyTRYaYURcISvDS6cq6f7LOgH1Aw==
X-Proofpoint-GUID: evJ4MlJ_AFNHRiRmB-C9kfvbu8VBR-uW
X-Proofpoint-ORIG-GUID: XgMkQFeo4GppKhcRZaRLBQxnRl6s3QNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 18 Apr 2025 21:28:50 +0200, J. Neuschäfer wrote:
> The watchdog.yaml schema prescribes a node name of "timer" or "watchdog"
> rather than the abbreviation "wdt". This series fixes the node name
> across arch/powerpc/boot/dts.
> 
> 

Applied to powerpc/next.

[1/4] powerpc: 512x: Rename wdt@ node to watchdog@
      https://git.kernel.org/powerpc/c/0070b2cbfe7389159669c3a5bb23d2ef89043055
[2/4] powerpc: 83xx: Rename wdt@ nodes to watchdog@
      https://git.kernel.org/powerpc/c/cc156be1e7566add1f490854133e27f091ae58b6
[3/4] powerpc: 86xx: Rename wdt@ nodes to watchdog@
      https://git.kernel.org/powerpc/c/39fe29e7f2fd38b0fee9bf987d180dee976dd2c7
[4/4] powerpc: p2020: Rename wdt@ nodes to watchdog@
      https://git.kernel.org/powerpc/c/af6850ac9ef3c98e6e8f2929e24ed6fd154fa39e

Thanks

