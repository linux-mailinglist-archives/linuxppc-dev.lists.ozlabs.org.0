Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A90AF6A4F8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 00:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQbmk3HMQz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 10:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gow7bFZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gow7bFZb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQblk1DTNz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 10:08:49 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RMr59X023160;
	Mon, 27 Feb 2023 23:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JkxhI3Eu7mE+clE4L6lwCVDck/Y24zrIkETtQ2ImTmc=;
 b=Gow7bFZbAXj/ym81GYdfCNv0BGQBW5ueCRzCYRmggfIDTMJ0NvyrhnRCzmW/sjZbeV0I
 vapXIOBaQTZ9bmAIpOqWHTrlJyfuGPHGHYSXuuKtxxSQrt77k0NhERPCv2ups291ir0/
 vg5xPwNBa2+L4uEZzCDm4TuSdTllQvSYlD2MdM6EbugvSMnQ+YLhIa0WE89SwbDmhPka
 CaA90CrEP88+gjiOx2Aai1LumU/IyUks9g2qp2Eh3Wjc7/a5KNMDjUGJyQXgH2nProT1
 RvFQfFVgaHfCd7LdPPk4EZFjj03m65/+s50lIg4yWTgoP4fDV4UZN77LPaCI8JoXABGL TA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p15ptr9e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 23:08:35 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RMtce2001376;
	Mon, 27 Feb 2023 23:08:34 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p15ptr9dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 23:08:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31RL2AVD030160;
	Mon, 27 Feb 2023 23:08:33 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3nybcm97xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 23:08:33 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31RN8WaD7078622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Feb 2023 23:08:32 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 145DF58061;
	Mon, 27 Feb 2023 23:08:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FBA15805F;
	Mon, 27 Feb 2023 23:08:31 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 Feb 2023 23:08:31 +0000 (GMT)
Message-ID: <c2afd163-5f23-acab-fd39-3a5593ed6257@linux.ibm.com>
Date: Mon, 27 Feb 2023 18:08:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] powerpc/tpm: Create linux,sml-base/size as big endian
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20230224032508.3331281-1-mpe@ellerman.id.au>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20230224032508.3331281-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Yc6NxcdSScq-6xonT6VoJXlOKM6XXpt1
X-Proofpoint-GUID: 6ER4XI2H3oeszKZ26LNVd9NAEfvNQkgv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270184
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
Cc: eajames@linux.ibm.com, jgg@ziepe.ca, jarkko@kernel.org, yangyingliang@huawei.com, linux-integrity@vger.kernel.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/23/23 22:25, Michael Ellerman wrote:
> There's code in prom_instantiate_sml() to do a "SML handover" (Stored
> Measurement Log) from OF to Linux, before Linux shuts down Open
> Firmware.
> 
> This involves creating a buffer to hold the SML, and creating two device
> tree properties to record its base address and size. The kernel then
> later reads those properties from the device tree to find the SML.
> 
> When the code was initially added in commit 4a727429abec ("PPC64: Add
> support for instantiating SML from Open Firmware") the powerpc kernel
> was always built big endian, so the properties were created big endian
> by default.
> 
> However since then little endian support was added to powerpc, and now
> the code lacks conversions to big endian when creating the properties.
> 
> This means on little endian kernels the device tree properties are
> little endian, which is contrary to the device tree spec, and in
> contrast to all other device tree properties.
> 
> To cope with that a workaround was added in tpm_read_log_of() to skip
> the endian conversion if the properties were created via the SML
> handover.
> 
> A better solution is to encode the properties as big endian as they
> should be, and remove the workaround.
> 
> Typically changing the encoding of a property like this would present
> problems for kexec. However the SML is not propagated across kexec, so
> changing the encoding of the properties is a non-issue.
> 
> Fixes: e46e22f12b19 ("tpm: enhance read_log_of() to support Physical TPM event log")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
