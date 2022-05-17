Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BC7529BA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 10:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2T9H42WFz3cC6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 18:01:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cr/Gixyx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Cr/Gixyx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2T8c14m5z2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 18:01:19 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H5rYRt001754;
 Tue, 17 May 2022 08:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : cc : references : in-reply-to : mime-version : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=CfCtKzfeDK3q7b1RCiQOlZ+4XVTKRFVHzYoWZpkM0wI=;
 b=Cr/GixyxEvh453l+IXW5nGykx+kU92Uh1vhft0VoN6QL5Oam3L2teAzlRWdxN6vuy6XZ
 +e9ChZEot5thzxbtlA5NTanU8ualE2ooX/+VFlz56quyllkNoPWoBmlkZDWQmk1kqobx
 tffXa2UGprU+SCQCtM3YebRGqd95Zo1agIAIC0L645FKwewIhwSDaMQq5tmFBATNybgk
 8I3xjPalWb8sc/QvvBpQMa3az90aQeXW3W0qeiF4dpHJj/OwkWz9qtgwmVxi6vNb2Rzi
 gWdhN9x+uiusZe/jbsczatpGKywv4aYzJRhKlotqdo2Z39cpFQ2f8WuMGWs7PWgzlP5G dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g45y6ahmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 08:01:13 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24H7U9s2015915;
 Tue, 17 May 2022 08:01:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g45y6ahka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 08:01:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24H7IL5C022007;
 Tue, 17 May 2022 07:33:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3g2429bsfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 07:33:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24H7XNtn45351200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 07:33:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E0C14C040;
 Tue, 17 May 2022 07:33:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A16144C046;
 Tue, 17 May 2022 07:33:22 +0000 (GMT)
Received: from localhost (unknown [9.43.12.56])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 May 2022 07:33:22 +0000 (GMT)
Date: Tue, 17 May 2022 13:03:21 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/vdso: Fix incorrect CFI in gettimeofday.S
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20220502125010.1319370-1-mpe@ellerman.id.au>
In-Reply-To: <20220502125010.1319370-1-mpe@ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1652772528.r6qrwbbda5.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PdtKtaX4cjpg8RKrRArIjVSfw7NN-RmE
X-Proofpoint-ORIG-GUID: fulQpm2Aq5JU8dAQiI-V5NLYfFWBeiaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=969 mlxscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205170048
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
Cc: amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman wrote:
>=20
> diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kerne=
l/vdso/gettimeofday.S
> index eb9c81e1c218..0aee255e9cbb 100644
> --- a/arch/powerpc/kernel/vdso/gettimeofday.S
> +++ b/arch/powerpc/kernel/vdso/gettimeofday.S
> @@ -22,12 +22,15 @@
>  .macro cvdso_call funct call_time=3D0
>    .cfi_startproc
>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>  	mflr		r0
> -  .cfi_register lr, r0
>  	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
>  	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)

<snip>

> @@ -46,6 +50,7 @@
>  	mtlr		r0
>    .cfi_restore lr
>  	addi		r1, r1, 2 * PPC_MIN_STKFRM
> +  .cfi_def_cfa_offset 0

Should this be .cfi_adjust_cfa_offset, given that we used that at the=20
start of the function?


- Naveen

