Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A02734AC3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 05:49:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUfZiOwv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qkwk76zHsz30h2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 13:49:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUfZiOwv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkwjB4hWyz300p
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 13:48:30 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Qkwj96nFRz4x0K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 13:48:29 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Qkwj96jjwz4x0G; Mon, 19 Jun 2023 13:48:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NUfZiOwv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Qkwj94NZVz4wg8;
	Mon, 19 Jun 2023 13:48:29 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J3ejpg029706;
	Mon, 19 Jun 2023 03:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YosYr3x3yhRFfEvOyL2yVGwDu0ILZDKlZ5FeN1mlCQM=;
 b=NUfZiOwvaqX1DbT6LlRMZkiHxMTnbl/awuseWoyW0K+jmEq8eBWMQaSA3igXNlBqquH3
 U2bFJHHUfbWvJF4cq+Zp+w0PAy6aIdc9Ew2361jr14sxx9qDdPrawFCMTHY0wKTLrk4S
 V4IRnqvp+TzisusES+rN2PW2LmCjyvXMvPMTVKrcFV7a3T/ytEpk56l22//yAf8UEYT3
 jn3QEX9eAoiCH/rvVUCeK95qrZsC/V4VZNVXr+s8xCeUBEXpJARW2pAeixREFb33ou6r
 zcl2T7dNOq5+sh/lKKceYxfBBDQzp2xOWBUT0dV0iAL0yIXIU9DKioucjL4V0HcSc8dh 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3raeyjrebh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:48:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35J3fTiU001187;
	Mon, 19 Jun 2023 03:48:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3raeyjreb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:48:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35INlB0c011930;
	Mon, 19 Jun 2023 03:48:23 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r94f513xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:48:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35J3mKKW44695856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jun 2023 03:48:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B4D92004B;
	Mon, 19 Jun 2023 03:48:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B24B420040;
	Mon, 19 Jun 2023 03:48:18 +0000 (GMT)
Received: from [9.43.124.167] (unknown [9.43.124.167])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 19 Jun 2023 03:48:18 +0000 (GMT)
Message-ID: <334e6694-e4e4-dce4-9443-2aaccdb86f04@linux.ibm.com>
Date: Mon, 19 Jun 2023 09:18:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 1/1] powerpc: update ppc_save_regs to save current
 r1 in pt_regs
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230615091047.90433-1-adityag@linux.ibm.com>
 <CTD7OOB3NTH8.1QSVBACQ2VI3V@wheely>
Content-Language: en-IN, en-US
From: Aditya Gupta <adityag@linux.ibm.com>
In-Reply-To: <CTD7OOB3NTH8.1QSVBACQ2VI3V@wheely>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ug38F7c-9WkEwKcGVan-9OUkYQDmPUio
X-Proofpoint-ORIG-GUID: epeQ96kwF4SQ9FSqUMn73_LvqfpGUcjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_02,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1015 spamscore=0 bulkscore=0 mlxlogscore=468 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190031
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/06/23 17:40, Nicholas Piggin wrote:
> On Thu Jun 15, 2023 at 7:10 PM AEST, Aditya Gupta wrote:
>> ppc_save_regs() skips one stack frame while saving the CPU register states.
>> Instead of saving current R1, it pulls the previous stack frame pointer.
>>
>> ...
>>
>> So this now saves regs as though it was an interrupt taken in the
>> caller, at the instruction after the call to ppc_save_regs, whereas
>> previously the NIP was there, but R1 came from the caller's caller
>> and that mismatch is what causes gdb's dwarf unwinder to go haywire.
>>
>> Nice catch, and I think I follow the fix and I think I agree with it.
>> Before the bug was introduced, NIP also came from the grandparent.
>> Which is what xmon presumably wanted, but since then I think maybe it
>> makes more sense to just have the parent caller.
>>
>> Reivewed-by: Nicholas Piggin <npiggin@gmail.com>
>> Fixes: d16a58f8854b1 ("powerpc: Improve ppc_save_regs()")

Thanks for reviewing this, and providing a Fixes tag too.

Thanks
- Aditya

