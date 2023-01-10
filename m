Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E49663B8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:45:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrksl6dxCz3c81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 19:45:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dGtPgYgA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dGtPgYgA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrkrn0Z0Hz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 19:44:40 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30A8gAsS007110;
	Tue, 10 Jan 2023 08:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=EpqUMRQNbQVkguCV83VR+a0FtNuRjMVdeJ6lT+jMF0k=;
 b=dGtPgYgAc9dL+uqjkC94rXwaBySc2G6wQ2IvJ6GQ6urzgOUVFEq+nFd6kMxh2gkjPlST
 vuzbBge0z4N/75N+rRiRxGzFulclE5td0O4824qzNy8Xvhhi7BVmBirCbDMFclLq+19L
 6Ma3fcLDwvGa7bHf2jvYg1+vzYFLsIiF64EgOoSbzFbeGQ8Dv3n1dTH8oPyOvptgpfTD
 geFGEup56zCeo2Pxx/5Q5ag6CevjEfvW+cHA5Lf25Q+8gaRgn5zX9FfUjwzmzhLoaEBw
 gGoUHOEsvR9CXrEHeNFJ9utvP8GVnWuIGI8UVaU8uDSnZPuiblH1XMoTAMra7D93ZPjS Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n14qx01h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 08:44:25 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30A8iPlH013239;
	Tue, 10 Jan 2023 08:44:25 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n14qx01ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 08:44:25 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309MAEJn005380;
	Tue, 10 Jan 2023 08:44:22 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3my0c6b7m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jan 2023 08:44:22 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30A8iKaK21627626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jan 2023 08:44:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 498A420043;
	Tue, 10 Jan 2023 08:44:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5A4920040;
	Tue, 10 Jan 2023 08:44:19 +0000 (GMT)
Received: from localhost (unknown [9.124.31.92])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jan 2023 08:44:19 +0000 (GMT)
Date: Tue, 10 Jan 2023 12:20:41 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries: fix potential memory leak in
 init_cpu_associativity()
To: christophe.leroy@csgroup.eu, mpe@ellerman.id.au, npiggin@gmail.com,
        Wang Yufen <wangyufen@huawei.com>
References: <1671003983-10794-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1671003983-10794-1-git-send-email-wangyufen@huawei.com>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1673333374.4nbdwhtox2.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W8wklehey7_SnR4mq2x-LLQqPs93d1Xi
X-Proofpoint-GUID: 4WWp7_O3hKlSWxMT_0FEF1fcooVYqOR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_02,2023-01-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=802 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100051
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
>  arch/powerpc/platforms/pseries/lpar.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

- Naveen

