Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B68990A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Apr 2024 23:58:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8GAzFD1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9b8R4xjZz3dVq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 08:57:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8GAzFD1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9b7g0tmjz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 08:57:18 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 434LUmUv003750;
	Thu, 4 Apr 2024 21:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2bKRgmdUOMYS/hhbKEQFlgBWC9yfwgqWculk1r2WkSk=;
 b=P8GAzFD1SdN5b9rDC7PDpl+LhPNJUHxXF2sKD4YPo49IKYO+Bo7Zwh4X1HL9vEnnsdUY
 reVURF1j1NozeudVzhVypNXuZnXr3RPEYQNBjSMemLhD4QFdA8Edb8QnS29xt0AJMT15
 NR4BCrmZt3rW3MkO2cqrOHYqrKq7UdZS2wDpI1dfQoYsQWbHJ20PKJMozG6XD9nYjKPx
 D5uynJn0hNtJLrxG9sfyPeCv4UN9Uco1CNluy1KzLY1HHL2D5hJRgwEIonmGZn0Dlnhn
 oPx4Firf4f3FqrfkaP5x+g1hXzhPl1GgFZZn2FQHDVVpznlhSOriJxxxCcZR4v5VJekD 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xa461g1e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 21:57:08 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 434Lv7wP010688;
	Thu, 4 Apr 2024 21:57:07 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xa461g1e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 21:57:07 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 434JG1N6003659;
	Thu, 4 Apr 2024 21:57:07 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x9epyeut3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Apr 2024 21:57:06 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 434Lv4Kh18678378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Apr 2024 21:57:06 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4121458066;
	Thu,  4 Apr 2024 21:57:04 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F90058053;
	Thu,  4 Apr 2024 21:57:04 +0000 (GMT)
Received: from localhost (unknown [9.61.85.102])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Apr 2024 21:57:04 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] selftests/powerpc/papr-vpd: Fix missing variable
 initialization
In-Reply-To: <20240404-papr-vpd-test-uninit-lc-v1-1-04cc22d7f799@linux.ibm.com>
References: <20240404-papr-vpd-test-uninit-lc-v1-1-04cc22d7f799@linux.ibm.com>
Date: Thu, 04 Apr 2024 16:57:03 -0500
Message-ID: <87sf007pw0.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zoP-AoqsnyU1cmzVV6GMV39M1xvaxBNg
X-Proofpoint-GUID: 0_rCOZ4-aa5U1Rzmp08cnrOiLYCnoIWA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-04_18,2024-04-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=756 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404040157
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> The "close handle without consuming VPD" testcase has inconsistent
> results because it fails to initialize the location code object it
> passes to ioctl() to create a VPD handle. Initialize the location code
> to the empty string as intended.
>
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Sorry, this wants Fixes: and Reported-by: tags. v2 coming.
