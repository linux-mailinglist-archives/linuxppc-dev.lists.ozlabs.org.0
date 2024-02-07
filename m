Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2484C5CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 08:50:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e89edPGm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVC373YnCz3cPt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Feb 2024 18:50:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e89edPGm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVC2J5f2Bz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Feb 2024 18:50:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4177d02q007093;
	Wed, 7 Feb 2024 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Zv4rk/tiCoZ67nGNpsfw66RthfCklXJyCIeO3u1G998=;
 b=e89edPGmEtvWUmxERDtDpuOiLmpWHimqV8dLPqYh6whxTHbuk3kBF++MmqQ3N9mOwQ8S
 ah320dUGwH2occpXQtu09cSEOlhe88FPzfRInIuEPfCBsmSrocCpmPZTvrQrwSt9Fitn
 UP+HuDDvyge7X8sxOhh+hc1MvOI2Neo6mkMEyD5y4fAV0Vmfc2sCR6EjR8q+JSE+L3IR
 AbMAl3FFtiA1XZ77QWVhyslNUEASURwstuOhgh4xTK/KlozD2nrwOeCANbZ0k6T1HjeR
 j2m+2/oyMcFXcbZ6eaEAMnrQudUABCYzcJwFE2tBzwvp+VowHrm/LDcIAmYVSSGDToI8 AA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w45fxger0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 07:49:50 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4175KHGF008494;
	Wed, 7 Feb 2024 07:49:49 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w221k4167-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 07:49:49 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4177nl7M39059976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Feb 2024 07:49:48 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11525805A;
	Wed,  7 Feb 2024 07:49:47 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7025B58051;
	Wed,  7 Feb 2024 07:49:44 +0000 (GMT)
Received: from [9.43.10.191] (unknown [9.43.10.191])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Feb 2024 07:49:44 +0000 (GMT)
Message-ID: <6d9c66ea-3ec0-40b9-a0f1-14734d5b221f@linux.vnet.ibm.com>
Date: Wed, 7 Feb 2024 13:19:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [revert commit 9f079dda1433] [mainline] [6.8.0-rc3] [NVME] OOPS
 kernel crash while booting
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>
References: <a54c8860-18c7-474d-95e2-a0153a2da885@linux.vnet.ibm.com>
 <ZcJxyjfBniERIWiq@kbusch-mbp.mynextlight.net>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <ZcJxyjfBniERIWiq@kbusch-mbp.mynextlight.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LG8PRONSo3pif8ImlHncm7EYDh3fW3nx
X-Proofpoint-GUID: LG8PRONSo3pif8ImlHncm7EYDh3fW3nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=762 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070057
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
Cc: "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, kch@nvidia.com, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, alan.adamson@oracle.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Keith for the patch. I have tested the patch without reverting 
old commits. The patch fixes the issue.

Tested-by: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>

On 2/6/24 23:22, Keith Busch wrote:
> On Tue, Feb 06, 2024 at 10:05:20PM +0530, Tasmiya Nalatwad wrote:
>> Greetings,
>>
>> [revert commit 9f079dda1433] [mainline] [6.8.0-rc3] [NVME] OOPS kernel crash
>> while booting to kernel
>>
>> Reverting below commit fixes the problem
>>
>> commit 9f079dda14339ee87d864306a9dc8c6b4e4da40b
>>      nvme: allow passthru cmd error logging
> Thanks for the report. Let's take a shot at fixing it before considering
> a revert. I copied you on the patch proposal.
>
-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

