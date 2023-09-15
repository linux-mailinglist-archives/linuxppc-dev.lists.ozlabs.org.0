Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE17A15FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 08:17:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cGz5+VOy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn3rg1d04z3cNY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 16:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cGz5+VOy;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn3ps0JWYz3bwb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 16:16:05 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rn3ph2RY1z4wy1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 16:15:56 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rn3ph2L31z4wxc; Fri, 15 Sep 2023 16:15:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cGz5+VOy;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Rn3pg3r8Xz4wxh;
	Fri, 15 Sep 2023 16:15:55 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F6B1aS005416;
	Fri, 15 Sep 2023 06:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NzBv1SKpFMmCuIoCQLdKb6Amql42t9pJqhlOz3qYI8Y=;
 b=cGz5+VOyOfin/v4Dp354+MuIfOoWVlwQ1eG8aXBIZGeLuNX5Jhv5MKa55CCbyHWKP1Z7
 6qi44KMqC9X486r12G9u/S8f0+SlQbc/Ai0Oxkn8CcvuGln09N1oRi3HbR/13yf1fSox
 aibqTb2aEHaND7lA3x6Bb/ZPlDC1N0PSZi4KPW6dGfIS272trkmE/kcFJGqVrPVd6EQn
 A4E3cyCIWajeUWsYAfwz8dNdHmZ2H46dmO9TiiDZNAxNNUaK3+M8VXgHoFp4kOBpuJdR
 yw91YeUFscUREyOjNhuhtEvNmyJWzXij7Gqz/SenjtsH50SmJ/kku9zPCRjJDl/p8xef Tg== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4h3p11s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 06:15:50 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38F5ErME002932;
	Fri, 15 Sep 2023 06:15:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t14hmgqt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 06:15:49 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38F6Fj0s41419218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 06:15:46 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4FC120040;
	Fri, 15 Sep 2023 06:15:45 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D477B20043;
	Fri, 15 Sep 2023 06:15:44 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Sep 2023 06:15:44 +0000 (GMT)
Message-ID: <7542676d-d9f4-50e9-5324-f916c2472258@linux.ibm.com>
Date: Fri, 15 Sep 2023 11:45:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Aditya Gupta <adityag@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <87v8cc7uva.fsf@mail.lhotse>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <87v8cc7uva.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mgGoaATgNU_efj8eA-y9MMpBrYgRxkeZ
X-Proofpoint-ORIG-GUID: mgGoaATgNU_efj8eA-y9MMpBrYgRxkeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=865
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309150053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/09/23 6:52 pm, Michael Ellerman wrote:
> Aditya Gupta <adityag@linux.ibm.com> writes:
>> Presently, while reading a vmcore, makedumpfile uses
>> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
>> RADIX MMU or not.
>>
>> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
>> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
>> assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
>> MMU to be hash MMU.
>>
>> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
>> is accessible to makedumpfile, without needing the vmlinux file
> 
> This looks fine.
> 
> Seems like cpu_features would be needed or at least pretty useful too?

Yeah. Would be nice to have access to that, to accurately identify the
kind of system vmcore was generated for.

Thanks
Hari
