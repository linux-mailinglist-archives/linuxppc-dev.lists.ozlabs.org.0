Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51F67E59F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 13:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3HJh1g56z3bXQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 23:41:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e5DlyrcS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e5DlyrcS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3HHh6fhHz3bT4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 23:41:04 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30RCCEJH002694;
	Fri, 27 Jan 2023 12:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tTLQRsu7PMIhEhXlO/A+VUILJmk759a+2yBF2j8PaQI=;
 b=e5DlyrcS/xKQmabm3gTs6/GRUPlISbhp4iQiVLQgIlWXBWC6XOlXiEMttJilFmUouEa+
 8KHXAp/lznAS7J8S6+gOSuIi9TfgBO1jyakvvcmoZB4XCuKIy9NjEYVIaNaxFOPK7Apa
 B+tImV0E64kpqHAHHyJ9biZsjpUHSd/a66AHPRgIkENzb85vaKF4LiE2iJXCrH4YOC1s
 nkHa4yx9gd6PHfaFK2kX5nIqMU6nYxzFDl4b60yPhCkF8Npp2hRrY4NAEvszzxbs3ALV
 LGGUwB/o94EpM0BCZSkqqywtznC9LtTjLg2whl5BSA3JG+rPRWbeIiWfOH2ukj16rM31 NA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ncedggr1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 12:40:58 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30R9NaI9006830;
	Fri, 27 Jan 2023 12:40:57 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3n87p7td2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 12:40:57 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30RCeuAW9962198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 12:40:56 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B05F58052;
	Fri, 27 Jan 2023 12:40:56 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5761E5804E;
	Fri, 27 Jan 2023 12:40:56 +0000 (GMT)
Received: from localhost (unknown [9.211.111.131])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Jan 2023 12:40:56 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: Drop unused export symbols
In-Reply-To: <20230127111231.84294-1-mpe@ellerman.id.au>
References: <20230127111231.84294-1-mpe@ellerman.id.au>
Date: Fri, 27 Jan 2023 06:40:56 -0600
Message-ID: <875ycsp2uf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HJkbCz-uLxQUFuOFqPfLI-wCLg3LXawz
X-Proofpoint-ORIG-GUID: HJkbCz-uLxQUFuOFqPfLI-wCLg3LXawz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_08,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=764 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270118
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Some RTAS symbols are never used by modular code, drop their exports.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/rtas.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> FYI: I'll slot this in prior to Nathan's series changing the exports
> to GPL.

LGTM

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
