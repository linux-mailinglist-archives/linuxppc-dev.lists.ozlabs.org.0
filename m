Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3264AF97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 07:07:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWShj2Y3wz3bhJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 17:07:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mmeHsP+K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mmeHsP+K;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWSgm3Pflz3bfZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 17:07:00 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BD55RPX012850;
	Tue, 13 Dec 2022 06:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=5wN/PZUYIjDgYsWaUnqqe2MulVakpONOUdwWG3g0cOE=;
 b=mmeHsP+KXU5bRx5ywi67W52efQYJwnu5b2tlnIyP7GbXMso4600x5AurYLWC379APSqa
 OjF8W6fd/eknR5zN/d6Yn7IHYtZdKETjcpMTt3QgiJ45WOrV1VRnuzaVxHh6gTfucCuN
 P2p4CJP7OCsZ9uJOUbeaJ/lH1OnVG9RFmwvD/kacohUfvJ07+K4jS4ubY3UtOKGgqVfv
 u+AI/7tzDZDkJwFgh10uegU1+VTUHGMwHRMDknz+6fnd8SUsdC6ZLBwmXmNGl5zich76
 YD7b1fw3EPEA3yOoNxwtJbz7U38QD5aTkJ4vG8eXzqYPX9Xp1l37QkcVtyVix9f0iOMK WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mejrdsfwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 06:06:43 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BD5lnh8012872;
	Tue, 13 Dec 2022 06:06:42 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mejrdsfwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 06:06:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2BCAD4ra028923;
	Tue, 13 Dec 2022 06:06:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3mchcetnru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 06:06:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BD66ba345875536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Dec 2022 06:06:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81CD220049;
	Tue, 13 Dec 2022 06:06:37 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F3D420043;
	Tue, 13 Dec 2022 06:06:37 +0000 (GMT)
Received: from localhost (unknown [9.43.34.217])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Dec 2022 06:06:37 +0000 (GMT)
Date: Tue, 13 Dec 2022 11:36:36 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: fix potential memory leak in
 init_cpu_associativity()
To: christophe.leroy@csgroup.eu, mpe@ellerman.id.au, npiggin@gmail.com,
        Wang Yufen <wangyufen@huawei.com>
References: <1670463165-20589-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1670463165-20589-1-git-send-email-wangyufen@huawei.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1670911471.bu7q0e91m2.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6k7sJ45JDzqgj7kXL76FVmcivfKpYhEM
X-Proofpoint-ORIG-GUID: nGZdASWEPhWB0qyFc4CuMjSB2xFHDvYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130055
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

Wang Yufen wrote:
> If the vcpu_associativity alloc memory successfully but the
> pcpu_associativity fails to alloc memory, the vcpu_associativity
> memory leaks.
>=20
> Fixes: d62c8deeb6e6 ("powerpc/pseries: Provide vcpu dispatch statistics")
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  arch/powerpc/platforms/pseries/lpar.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfor=
ms/pseries/lpar.c
> index 97ef649..501ee6c 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -211,6 +211,7 @@ static int init_cpu_associativity(void)
>=20
>  	if (!vcpu_associativity || !pcpu_associativity) {
>  		pr_err("error allocating memory for associativity information\n");
> +		kfree(vcpu_associativity);

I think we should call destroy_cpu_associativity() here instead. We=20
don't know which allocation failed, so it is better to try and free=20
both, and also to reset the pointers to 0.


- Naveen

