Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9682D680545
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 05:50:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P4wjT2vGGz3ccq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 15:50:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eZTIXnWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P4whV3qC9z2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 15:49:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eZTIXnWK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P4whV3LNHz4xwp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 15:49:46 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P4whV3FgLz4xVG; Mon, 30 Jan 2023 15:49:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eZTIXnWK;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P4whV0Cw8z4x1f;
	Mon, 30 Jan 2023 15:49:45 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30U1uKCS012399;
	Mon, 30 Jan 2023 04:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=srvDrqMpJPKhgzy1k+a0EiyfxrDbTrn2Ds0UwAonu9I=;
 b=eZTIXnWK20CDNg+yoqLu+ijlZ2HjtKUb5EgPHuqyytO7RrlmwZGji/usqMiott7H+qHI
 FGLRvBvX3WX4u55ghAoTebAVDwqJbxA9fW16P37BHsAfg0lVYLFgLXKxIxdlDWniFkBP
 J3QpK60tExeizw3Wu3HhGenK/zuVCXRYCjPievRbdU2eeVNWV6ISypUCPsV1ZzE76kxG
 cGwm3Z6QSP8++WD54OX7frAlPq9mMQqvXTHyi6XJBUGTA78/7MI0jxEwKr/WCjj8cGLQ
 mNIpKNCuHfo7YH71wTjsGpvb0Ziq2+1fAexmeaDAMKlkoMavrKfHafajO/FO/C86VYQU +A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nddv1da3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 04:49:43 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30T5T1c0014521;
	Mon, 30 Jan 2023 04:49:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvty9r6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jan 2023 04:49:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30U4ncmQ44499276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jan 2023 04:49:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C18420040;
	Mon, 30 Jan 2023 04:49:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7175E20043;
	Mon, 30 Jan 2023 04:49:37 +0000 (GMT)
Received: from [9.43.104.24] (unknown [9.43.104.24])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Jan 2023 04:49:37 +0000 (GMT)
Message-ID: <09bf0dfb-d97d-dad7-fb52-9f355077bc06@linux.ibm.com>
Date: Mon, 30 Jan 2023 10:19:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc/kexec_file: account hot-pluggable memory while
 estimating FDT size
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20221215083801.301741-1-sourabhjain@linux.ibm.com>
 <87v8kosoxe.fsf@mpe.ellerman.id.au>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87v8kosoxe.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nFn4PAQ5GfE5sfEQEtUxCVLmt68IHnc1
X-Proofpoint-GUID: nFn4PAQ5GfE5sfEQEtUxCVLmt68IHnc1
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_03,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=962 adultscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300042
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 30/01/23 08:34, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> On Systems where online memory is lesser compared to max memory, the
>> kexec_file_load system call may fail to load the kdump kernel with the
>> below errors:
>>
>>      "Failed to update fdt with linux,drconf-usable-memory property"
>>      "Error setting up usable-memory property for kdump kernel"
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
>> Fixes: 2377c92e37fe ("powerpc/kexec_file: fix FDT size estimation for kdump kernel")
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/kexec/file_load_64.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Can you please rebase it on top of the fix I posted.
>
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230130014707.541110-1-mpe@ellerman.id.au/
Sure I will rebase it and send the next version.

Thanks,
Sourabh
