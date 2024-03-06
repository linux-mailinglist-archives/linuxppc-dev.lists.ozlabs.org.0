Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ECF873BBA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 17:09:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RXPwStUE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqcnQ2dzbz3dWg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 03:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RXPwStUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tqcmf65H8z3d3Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 03:08:34 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 426G7fqJ022425;
	Wed, 6 Mar 2024 16:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0j9gJbumXd6zptHGYG2RBhG8qWhL+f6Mp6U0BlqtkhY=;
 b=RXPwStUE1l4/wZgEkrc1LzWck6QKS+znwOCma8fT0r5vBCSy1tkjh1omF5jozzzHx1fY
 TuPU0IzL4BQ+sKYx211xuc6bE0/0eUkluujE0PkEX6w/AbaghM3wvuGDE2X6OYdYjrxc
 bsT2OfPsOOjGA/UenXqpzouYbvyODCdn84Gvgd34WxGsGGcKgOsTYvZyrgAvWXvyjQdy
 YIWWGJVr5AMypETus7hGk7sH+JKpeU4ojN2qoT8LZQR15UXjsrDu5vVwzGBpGQ7TAwqD
 TccavYQpS3hPgliUeZWgMNEQ4zxCJH6G4fCzPMiG1tc0SMQOr/HSCjoGxPcbg0PXC9Q6 sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wpuqn01fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 16:08:26 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 426G8JD7025311;
	Wed, 6 Mar 2024 16:08:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wpuqn01f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 16:08:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 426FtCAc006067;
	Wed, 6 Mar 2024 16:08:25 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmeet7xj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 16:08:25 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 426G8L8W27459926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 6 Mar 2024 16:08:23 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A5158067;
	Wed,  6 Mar 2024 16:08:21 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0BF558052;
	Wed,  6 Mar 2024 16:08:20 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  6 Mar 2024 16:08:20 +0000 (GMT)
Message-ID: <b6f74cd0-d1c8-4a6f-a05d-364595c5b079@linux.ibm.com>
Date: Wed, 6 Mar 2024 11:08:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Preserve TPM log across kexec
Content-Language: en-US
To: mpe@ellerman.id.au, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20240306155511.974517-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CizILsSMrSfNKbP7kCQ9XhxIyaOzFfT8
X-Proofpoint-GUID: Vt9-ZaL_JWo0hGOQxy1b3juNtgpFLarn
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_10,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=895 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403060130
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
Cc: jarkko@kernel.org, viparash@in.ibm.com, linux-kernel@vger.kernel.org, peterhuewe@gmx.de, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/6/24 10:55, Stefan Berger wrote:
> This series resolves an issue on PowerVM and KVM on Power where the memory
> the TPM log was held in may become inaccessible or corrupted after a kexec
> soft reboot. The solution on these two platforms is to store the whole log
> in the device tree because the device tree is preserved across a kexec with
> either of the two kexec syscalls.
> 
FYI: This was the previous attempt that didn't work with the older kexec 
syscall: 
https://lore.kernel.org/lkml/4afde78d-e138-9eee-50e0-dbd32f4dcfe0@linux.ibm.com/T/#m158630d214837e41858b03d4b025e6f96cb8f251

> Regards,
>     Stefan
> 
> Stefan Berger (2):
>    powerpc/prom_init: Replace linux,sml-base/sml-size with linux,sml-log
>    tpm: of: If available Use linux,sml-log to get the log and its size
> 
>   arch/powerpc/kernel/prom_init.c |  8 ++------
>   drivers/char/tpm/eventlog/of.c  | 36 ++++++++++-----------------------
>   2 files changed, 13 insertions(+), 31 deletions(-)
> 
