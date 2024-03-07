Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04B875A50
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 23:33:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MDJVHqRc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrPFx4NBLz3vb4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 09:33:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MDJVHqRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrPF75wz5z3dRd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 09:32:27 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 427MP8Sl014312;
	Thu, 7 Mar 2024 22:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7KJaeb4WPG6XTg1zWaL5lAvmQqbTahirLRchW6PR/yY=;
 b=MDJVHqRctt51+2y8MPZus1Qbz/yn3RdldHAVOpXwDxJOT1u7VQpZ08spXwcrc/7toSAE
 PSUyVJzhg64pAAToBic4Q1nyQj53YqqcG2vq2TpoRSTWIYgb0OyuzT6b0Qmu2q5CT4Am
 CvVRVdV9xvFdn2wZqpc0f5rXtwwAhkbeHfxRbep0NgoGwBgRSRSWAhwD6O/31JxNDqU+
 frv/qNJQS3SWhtbDW8jIZlP2V6xn6glDAG3L3f4vjVa2PhtMZ2aRUC/GxkgwxeWe700H
 wHmtIrsxqw/zcdNDSJjag7jy1cmvNbMenNR0jyDfmBZaQdCRdnQiwMaMVlX80EacFfMo 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqpbtr4u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 22:32:16 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 427MQIcl016977;
	Thu, 7 Mar 2024 22:32:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqpbtr4th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 22:32:15 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 427LARAX024211;
	Thu, 7 Mar 2024 22:32:15 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wpjwskx2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 22:32:15 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 427MWBuk30343646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Mar 2024 22:32:14 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C67F558059;
	Thu,  7 Mar 2024 22:32:11 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB2F658063;
	Thu,  7 Mar 2024 22:32:10 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Mar 2024 22:32:10 +0000 (GMT)
Message-ID: <38981112-9091-46d4-a815-8a5f47e15bb2@linux.ibm.com>
Date: Thu, 7 Mar 2024 17:32:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Preserve TPM log across kexec
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <b6f74cd0-d1c8-4a6f-a05d-364595c5b079@linux.ibm.com>
 <20240307214245.GA3110385-robh@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20240307214245.GA3110385-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gfox5Ao2_x58Z2tumrcR_iJRlYjt0JFa
X-Proofpoint-ORIG-GUID: z6y-P8Opt4OzWbVuDpYT0M4qYmYm-6dZ
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_17,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=858 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403070162
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
Cc: rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, linux-integrity@vger.kernel.org, viparash@in.ibm.com, linuxppc-dev@lists.ozlabs.org, peterhuewe@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/7/24 16:42, Rob Herring wrote:
> On Wed, Mar 06, 2024 at 11:08:20AM -0500, Stefan Berger wrote:
>>
>>
>> On 3/6/24 10:55, Stefan Berger wrote:
>>> This series resolves an issue on PowerVM and KVM on Power where the memory
>>> the TPM log was held in may become inaccessible or corrupted after a kexec
>>> soft reboot. The solution on these two platforms is to store the whole log
>>> in the device tree because the device tree is preserved across a kexec with
>>> either of the two kexec syscalls.
>>>
>> FYI: This was the previous attempt that didn't work with the older kexec
>> syscall: https://lore.kernel.org/lkml/4afde78d-e138-9eee-50e0-dbd32f4dcfe0@linux.ibm.com/T/#m158630d214837e41858b03d4b025e6f96cb8f251
> 
> Doesn't everyone else still need that? Is powerpc the only ones that
Are you referring to the old series with 'that' ? I more or less had to 
abandon it because it wouldn't solve the problem for the old kexec 
syscall, so that's why I am embedding the whole log now in the 
devicetree since the DT is properly carried across the kexec soft reboot 
on PowerVM and KVM for Power. Maybe other platforms will (have to) 
follow, but I don't know.

> care about the old kexec syscall?
> 
> Rob
