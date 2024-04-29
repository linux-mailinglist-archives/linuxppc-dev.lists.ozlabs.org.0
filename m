Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35E98B50DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 07:55:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flLnUOTA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSXcq4lWvz3cTw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 15:55:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=flLnUOTA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSXc52D1wz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 15:55:16 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43T5b2KQ010649;
	Mon, 29 Apr 2024 05:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Kwrz3Li8rkB58+IgaCeSffxvyaICV0Zf5uEFgiWIsVw=;
 b=flLnUOTAVr5NiqyY5hYTOQF6SZvMfyiWhe4FCcVoyAgHItZ2P8hmfNZFvI2XbbULKPok
 FICV/cnqaKdOssZi8LjNSMSK5zqVBpjDl0zTN9Xo4wRZLseFE28yDncj6ZaW4YnbLyV1
 XJEkQ0GteEvzgEnMLQ6+wSnafmfqTw/eITwykoL/arfGaVbs2qt8RQCj8/k/fVfU6Tq9
 NSr04ZCDQnQnM7PNdNyikfZWU7mdR80z03/nypShq9BBYmPcLZRlGbE8tWs5pLFohvXV
 2/+sFFy6gPM31qdV6nPq07TaWZHt17FEbr1DgwHrrOz4q3v7f2mXDWyFfBFCN8ihw1Di zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xt5g3012x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 05:55:09 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43T5t81H008318;
	Mon, 29 Apr 2024 05:55:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xt5g3012w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 05:55:08 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43T20i5W015603;
	Mon, 29 Apr 2024 05:55:07 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xsed2n5yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 05:55:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43T5t4Ek26018336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2024 05:55:06 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EB6758070;
	Mon, 29 Apr 2024 05:55:04 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 470C158073;
	Mon, 29 Apr 2024 05:55:02 +0000 (GMT)
Received: from [9.195.38.46] (unknown [9.195.38.46])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Apr 2024 05:55:01 +0000 (GMT)
Message-ID: <cabc8249-4ef4-4d57-afb4-93b95120a51e@linux.ibm.com>
Date: Mon, 29 Apr 2024 11:25:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] powerpc/pseries: Fixes for lparstat boot reports
To: mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <20240412092047.455483-1-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20240412092047.455483-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Holnq5ccN0kls4cX9Km16L_q7wjey6y
X-Proofpoint-GUID: CAEu6OjDU8yeBVT_kWlTbbihXOgvUW9j
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_03,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=919
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404290038
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
Cc: naveen.n.rao@linux.ibm.com, tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/12/24 2:50 PM, Shrikanth Hegde wrote:
> Currently lparstat reports which shows since LPAR boot are wrong for
> some fields. There is a need for storing the PIC(Pool Idle Count) at
> boot for accurate reporting. PATCH 1 Does that.
> 
> While there, it was noticed that hcall return value is long and both
> h_get_ppp and h_get_mpp could set the uninitialized values if the hcall
> fails. PATCH 2 does that.
> 
> v1 -> v2:
> - Nathan pointed out the issues surrounding the h_pic call. Addressed
> those.
> - Added a pr_debug if h_pic fails during lparcfg_init
> - If h_pic fails while reading lparcfg, related files are not exported.
> - Added failure checks for h_get_mpp, h_get_ppp calls as well.
> 
> v1: https://lore.kernel.org/all/20240405101340.149171-1-sshegde@linux.ibm.com/
> 
> Shrikanth Hegde (2):
>   powerpc/pseries: Add pool idle time at LPAR boot
>   powerpc/pseries: Add fail related checks for h_get_mpp and h_get_ppp
> 
>  arch/powerpc/include/asm/hvcall.h        |  2 +-
>  arch/powerpc/platforms/pseries/lpar.c    |  6 ++--
>  arch/powerpc/platforms/pseries/lparcfg.c | 45 +++++++++++++++++-------
>  3 files changed, 37 insertions(+), 16 deletions(-)
> 
> --
> 2.39.3
> 

Ping. 

Michael, Nathan, Naveen
Any comments on these patches? 
