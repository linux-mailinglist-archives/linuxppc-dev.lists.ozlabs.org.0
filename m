Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7D5EE676
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 22:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md75R5g47z3cB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 06:15:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vi39c+NN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vi39c+NN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md74m38Ylz3bd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 06:14:30 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SJXw3H011684;
	Wed, 28 Sep 2022 20:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5RYLFmCzP98boojvukTBPWBRy+gWhdA53AIJwBr5YO4=;
 b=Vi39c+NNFJ2vCbdO+OSj38BOpx9sEZIJ0HnzcQkEBR9+ZLoC0VI9rtRF/n8M+HS03IUr
 cv2X5aOO0kYdw0o6HXi/zIjBrrZyRjyqM2HX2+VzJoXkb6Xo99jOZs2CK/iqqe1Hj0Sa
 x2md4tD5/qmJW1g2KwWTUuWzvwtc2dQ9JXYIexNYNnMzRTcLnoniMN1DEXQ5P8S2PcdZ
 mbyo5RKy4hsZw02y732XvSfNjHumCCt0Rag1bJhDO+/POfvFESXy09/9Y07czGpZraii
 LI58ZLOEAA7lffN5k3L9FDngDsktqZ1BYDxKSIJmWCIdw/sLGCVzZVY2hpu6fkFZt+1y HA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvs2x071u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 20:14:21 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28SK6pP7030406;
	Wed, 28 Sep 2022 20:14:20 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01dal.us.ibm.com with ESMTP id 3jsshamhss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 20:14:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28SKEIo222151898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Sep 2022 20:14:18 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1FF858059;
	Wed, 28 Sep 2022 20:14:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E081358043;
	Wed, 28 Sep 2022 20:14:18 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Sep 2022 20:14:18 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/pseries: Add firmware details to dump stack
 arch description
In-Reply-To: <20220928134025.1739909-6-mpe@ellerman.id.au>
References: <20220928134025.1739909-1-mpe@ellerman.id.au>
 <20220928134025.1739909-6-mpe@ellerman.id.au>
Date: Wed, 28 Sep 2022 15:14:18 -0500
Message-ID: <87tu4rp885.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mO1ngnIgo9kaz77O17rl6vTjkxkoFlz6
X-Proofpoint-GUID: mO1ngnIgo9kaz77O17rl6vTjkxkoFlz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_09,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209280120
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

> Add firmware version details to the dump stack arch description, which
> is printed in case of an oops.
>
> Currently /hypervisor only exists on KVM, so if we don't find that
> look for something that suggests we're on phyp and if so that's
> probably a good guess. The actual content of the ibm,fw-net-version
> seems to be a full path so is too long to add to the description.

My only reservation is that ibm,fw-net-version seems to be unspecified
and could disappear in future firmware versions.

/ibm,powervm-partition would be the best PAPR-specified property for
this purpose, but I don't see it on a P8/860 partition I checked,
unfortunately. I do see it on a P9. Presumably it's present in device
trees on PowerVM P9 systems and later, but it's probably too new to use
for this.

/ibm,lpar-capable "indicates that the platform is capable of supporting
logical partitioning and is only present on such systems." This one is
present on the P8.

So consider this a weak suggestion to replace the ibm,fw-net-version
check with ibm,lpar-capable. But I don't want to bikeshed it, overall
the series looks good.

>
> eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:phyp

Will this info get printed during boot as well? There are many times it
would have been useful to me when looking at logs from non-oopsed
kernels.
