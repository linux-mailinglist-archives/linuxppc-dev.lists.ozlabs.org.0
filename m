Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DEB87642B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 13:18:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+GKrmv/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrlZk07qsz3vX8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 23:18:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+GKrmv/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrlYy56pvz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 23:18:13 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 428C0TWi022718;
	Fri, 8 Mar 2024 12:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KKMjeR24UGellnxvB5iyXOooY2JUzoMu5FnU+SZGzGI=;
 b=P+GKrmv/0c8DxlSX+1QHKc6Pyqou38ShhCC/PoJi9NLo0VZfgrWvEBTRbg6QasFocO4G
 n+qliY1rf/olC/pBUemgvpa3XwW/nH8jbYUriERZW56TiRyHPOdhqeDDqpF2HCsVDfz4
 EyLA2N0p7359JXG+L/0iTDERj7Z2t8ea2+EDMOzeEGhFZkG82P3n25KmFiLeu/xc8gUU
 5tYFpOmmA26lQcebeHv1f4OgqitJa+vAYoVMOod6CO88LixP67ycN8HzdOkovpCa6JZQ
 40rmG8SAUXOMWKBrUIBj55al3hOL9SXU/E0RVzZ4nfTYUxJHu1MyEFtTtkuhJCrPTHmW AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wr29ygatp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 12:18:00 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 428C0vWU024195;
	Fri, 8 Mar 2024 12:18:00 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wr29ygat7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 12:17:59 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 428AMXsJ010881;
	Fri, 8 Mar 2024 12:17:59 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmh52uucm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 12:17:59 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 428CHt8D44695854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Mar 2024 12:17:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B8D95805D;
	Fri,  8 Mar 2024 12:17:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD52C58057;
	Fri,  8 Mar 2024 12:17:54 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Mar 2024 12:17:54 +0000 (GMT)
Message-ID: <663a3834-056e-4dda-99dd-16ee8734100e@linux.ibm.com>
Date: Fri, 8 Mar 2024 07:17:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>, mpe@ellerman.id.au,
        linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com>
 <CZNS7FO53BHK.6NO93P0C0VY5@kernel.org>
 <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CZNS9K4BJPQ8.2MD4WZS8YMI3W@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fQ0Cg3BPTV8qwm4qw1s1S5qH-6tityYA
X-Proofpoint-ORIG-GUID: sxLXNkFTHmlMFRKfS2nJ5fWkTigrko1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403080098
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
Cc: peterhuewe@gmx.de, viparash@in.ibm.com, linux-kernel@vger.kernel.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/7/24 15:00, Jarkko Sakkinen wrote:
> On Thu Mar 7, 2024 at 9:57 PM EET, Jarkko Sakkinen wrote:
>> in short summary: s/Use/use/
>>
>> On Wed Mar 6, 2024 at 5:55 PM EET, Stefan Berger wrote:
>>> If linux,sml-log is available use it to get the TPM log rather than the
>>> pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
>>> on Power where after a kexec the memory pointed to by linux,sml-base may
>>> have been corrupted. Also, linux,sml-log has replaced linux,sml-base and
>>> linux,sml-size on these two platforms.
>>>
>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>
>> So shouldn't this have a fixed tag, or not?
> 
> In English: do we want this to be backported to stable kernel releases or not?

Ideally, yes. v3 will have 3 patches and all 3 of them will have to be 
backported *together* and not applied otherwise if any one of them 
fails. Can this be 'guaranteed'?

> 
> BR, Jarkko
