Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D491F875297
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 16:02:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKjuyOrZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrCFf4VLfz3dxN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:02:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKjuyOrZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrCDx086Rz3brc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 02:01:35 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 427EhKq9004082;
	Thu, 7 Mar 2024 15:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=INNS7wXY+uyGYWsmpIcvwWMcJdOC94K2KLNkCD8oXrw=;
 b=iKjuyOrZKMPHy2SF+lj9F/lmlcc6wGtxI0ycOrUXbPhxvo2QviUOEh6nO2wFQc0TYwX8
 JXqnzuIsAaN9wqvUYnN7ADJzYDwlPejigzgf+xNXFzBqa1kJxkdQATBrho3gZhQe7A9f
 oa+K7yu94VYC7tzzqmENMzwN0S8Mbjsqs592UnH3AOhJ6zcM1Gixpv/9j5BzX8OOwvY8
 ugdB9lJvPqOWylDPoaVl/nphLBYg300PchNfUiY3JdbEU4ZUF5W+HdAVoViFpBmt877b
 c33MDOx//7i/9j3QJVEAMzK2Y4tlaCDGTQdCRqQwv9NECNfZamwM+c0eWRPvd1umlABx Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqfdkhmw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 15:01:20 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 427EX8eu019521;
	Thu, 7 Mar 2024 15:01:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqfdkhm9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 15:01:15 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 427CLCic006046;
	Thu, 7 Mar 2024 15:00:58 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wmeetegms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 15:00:58 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 427F0s7017498850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Mar 2024 15:00:56 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F36058064;
	Thu,  7 Mar 2024 15:00:54 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C712C5806F;
	Thu,  7 Mar 2024 15:00:53 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Mar 2024 15:00:53 +0000 (GMT)
Message-ID: <90a14b5f-6976-4941-a623-ae31dfa33899@linux.ibm.com>
Date: Thu, 7 Mar 2024 10:00:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tpm: of: If available Use linux,sml-log to get the
 log and its size
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-integrity@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-3-stefanb@linux.ibm.com> <87h6hinwzw.fsf@mail.lhotse>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <87h6hinwzw.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gv38LkoCS3PkLxRFplGlkVvN24IeWssB
X-Proofpoint-ORIG-GUID: GqBNiazuMisAY30rZktBh8dnkqQY6ci-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_08,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=917 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403070087
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



On 3/7/24 05:42, Michael Ellerman wrote:
> Stefan Berger <stefanb@linux.ibm.com> writes:
>> If linux,sml-log is available use it to get the TPM log rather than the
>> pointer found in linux,sml-base. This resolves an issue on PowerVM and KVM
>> on Power where after a kexec the memory pointed to by linux,sml-base may
>> have been corrupted. Also, linux,sml-log has replaced linux,sml-base and
>> linux,sml-size on these two platforms.
> 
> It would be good to mention that powernv platforms (sometimes called
> Open Power or bare metal) still use linux,sml-base/size, via skiboot.

Will do in v2.
