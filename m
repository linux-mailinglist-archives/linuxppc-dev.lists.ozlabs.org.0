Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E7840242
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 10:54:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SKSAjcFU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNkCt2YVdz3ck3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 20:54:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SKSAjcFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNkBH2gvVz3cTh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 20:52:55 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T8j5cB009027;
	Mon, 29 Jan 2024 09:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=T8yzjOj6VbfU/AtzvHhpBsK5Qg/KXZet/7IHkYOELGI=;
 b=SKSAjcFUGjyx4ZsO10RCmlgHGlxNt/1wkYtl1gFX+6qGeof/k7siWUWUw3kwippwkt0m
 DeVCqVmZdULrurFKdQvl+tp914+sIaTMfTmkMXb4VP4y/cn3HAyX5wtcIwMCBEb/XL3A
 3M1lmMrZxRiwEh8k/j3WxjGKVVyxO/miRC/4NmMdKuWzxeUyZaSLnLo+b/KfaCemSXte
 vdzeqrj0CO4k5n0t6A0MGxe2wtTTKMUKN+kvHGeqPYtjJevpmfTQhHOzZI2t1rITp2RH
 qPrAufnetdPrViAuj28W6gg/ouwhA/EQJgats8W1/W2EVP+fj6lI6Xs9thOaUe9+vLLb xA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx6e2cqr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:52:48 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40T8XeBx011067;
	Mon, 29 Jan 2024 09:52:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwd5nfd2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:52:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40T9qf6x24511136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 09:52:44 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6973020043;
	Mon, 29 Jan 2024 09:52:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D923920040;
	Mon, 29 Jan 2024 09:52:40 +0000 (GMT)
Received: from osiris (unknown [9.171.85.65])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 29 Jan 2024 09:52:40 +0000 (GMT)
Date: Mon, 29 Jan 2024 10:52:39 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH 5/5] sched/vtime: do not include <asm/vtime.h> header
Message-ID: <20240129095239.6722-C-hca@linux.ibm.com>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <2402f44309e1c9705501bdc9b798e8fe6d73f905.1706470223.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2402f44309e1c9705501bdc9b798e8fe6d73f905.1706470223.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t5dGNDAG7oDR415HEJK8W843mUfuva5W
X-Proofpoint-ORIG-GUID: t5dGNDAG7oDR415HEJK8W843mUfuva5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_05,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=2 spamscore=2
 mlxlogscore=175 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401290070
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 28, 2024 at 08:58:54PM +0100, Alexander Gordeev wrote:
> There is no architecture-specific code or data left
> that generic <linux/vtime.h> needs to know about.
> Thus, avoid the inclusion of <asm/vtime.h> header.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  include/asm-generic/vtime.h | 1 -
>  include/linux/vtime.h       | 4 ----
>  2 files changed, 5 deletions(-)
>  delete mode 100644 include/asm-generic/vtime.h

I guess you need to get rid of this as well:

arch/powerpc/include/asm/Kbuild:generic-y += vtime.h
