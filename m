Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0764E96C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 11:26:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYQHR01qsz3bb6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 21:26:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZnnX8pHU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYQGR2ZVzz30RR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 21:25:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZnnX8pHU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NYQGR1yRBz4xGT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 21:25:19 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NYQGR1vTlz4xGP; Fri, 16 Dec 2022 21:25:19 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZnnX8pHU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NYQGQ5rByz4x3w;
	Fri, 16 Dec 2022 21:25:18 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG8i5TM009059;
	Fri, 16 Dec 2022 10:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Dvt6dwgmfnyLLV/FmIfHZ508EmfAMqyiJMgnCHGLB+Y=;
 b=ZnnX8pHUdMN52E3stPp5DeUIcnAINqMJ3rBHzxu7OcchXeB7MFj06fYI5/yFVQB+olK6
 LSyYRg8rbJGVmveU44ub/8Y/20NasympLBgUPTQdr4we3i9TUwGp4Mi91TwYCLX5Q2hZ
 iwxwxEWz6TsLumhjUN6sNwUlkMXZgAajKim8m2rNUmr0iLNwmwV+KP7Ffge4HHRLaTvK
 PO77320AF0q5yktuye6IMy027pzXKcFA2uGEp+X7oE7DtKCbz4cIZJ6huJvYUOnzV+tZ
 WERc3b/q9485/tpSR29wDxjTnUSGImvSmnwvAqDo1vkETrQz1s+JixUeinfQEoe2Wiyj EQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mgndv2a71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 10:25:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BG2ZXAp027521;
	Fri, 16 Dec 2022 10:25:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3meyjbma98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Dec 2022 10:25:13 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BGAPBoo44892540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Dec 2022 10:25:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C6792007E;
	Fri, 16 Dec 2022 10:25:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD0A32007C;
	Fri, 16 Dec 2022 10:25:09 +0000 (GMT)
Received: from [9.43.82.55] (unknown [9.43.82.55])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Dec 2022 10:25:09 +0000 (GMT)
Message-ID: <bf32e6b4-1271-e20a-3eb7-003c9b7b4935@linux.ibm.com>
Date: Fri, 16 Dec 2022 15:55:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] powerpc/kexec_file: account hot-pluggable memory while
 estimating FDT size
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
 <8253623b-bf9b-4407-999f-506aa8c7e38f@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <8253623b-bf9b-4407-999f-506aa8c7e38f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: l7fTHDuyoBd8wzhUhZfOr0CvQhhPCXpN
X-Proofpoint-GUID: l7fTHDuyoBd8wzhUhZfOr0CvQhhPCXpN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_06,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160088
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
Cc: mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 16/12/22 11:45, Hari Bathini wrote:
>
>
> On 15/12/22 2:08 pm, Sourabh Jain wrote:
>> On Systems where online memory is lesser compared to max memory, the
>> kexec_file_load system call may fail to load the kdump kernel with the
>> below errors:
>>
>>      "Failed to update fdt with linux,drconf-usable-memory property"
>>      "Error setting up usable-memory property for kdump kernel"
>>
>> This happens because the size estimation for usable memory properties
>> for the kdump kernel's FDT is based on the online memory whereas the
>> usable memory properties include max memory. In short, the hot-pluggable
>> memory is not accounted for while estimating the size of the usable
>> memory properties.
>>
>> The issue is addressed by calculating usable memory property size using
>> max hotplug address instead of the last online memory address.
>>
>> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for 
>> kdump kernel")
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> Thanks for the fix, Sourabh. Looks good to me.
>
> Acked-by: Hari Bathini <hbathini@linux.ibm.com>

Thanks Hari.

- Sourabh Jain

