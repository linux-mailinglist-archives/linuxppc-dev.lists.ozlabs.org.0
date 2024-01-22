Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45183659B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 15:38:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O8TnIYlY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJXsK0JNYz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 01:38:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O8TnIYlY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJXrT0vkhz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 01:38:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40MDB74L027059;
	Mon, 22 Jan 2024 14:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9eZRduKNvGVeB9aJIyquvVMwc8fAl3YaIxTQDqo1WTg=;
 b=O8TnIYlYGZfyYQL8P3i0C8yxN4DRQvasrWwLr0b4OqgDmaI75iRcqmBnf3Lf51wHvqTx
 prcbnFbRJj/s9eg5rNrRlh1L8zxgBRYDnsrWnsOMQb6WOpQpZeEGa5BaiKxu08FOIGPd
 QkER6Y2zHzffdGfKmCzXaCJPvrMb/YP5ZFZF4ygTpjOoKoCiuuunx22Z6KgtXoJL0FWn
 Q0oWbhDZ3Ym/d9Jfq7CnIkpqpx26B8hnUROolFW2Z/1WHG2mgAmyeVDApW2U+F2uNakq
 XEoPnP5uIZJIK1JrBLPQkoHLvGyr8wy/3+1g6JK3SQMssybZulRVfGyZ/LuZwYEKE+Lo GQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vsrycjk32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 14:37:40 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40MBSVlX025636;
	Mon, 22 Jan 2024 14:37:39 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrsgnruju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 14:37:39 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40MEbcMb18285072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jan 2024 14:37:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 527DB58055;
	Mon, 22 Jan 2024 14:37:38 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C46F5804B;
	Mon, 22 Jan 2024 14:37:35 +0000 (GMT)
Received: from [9.43.53.45] (unknown [9.43.53.45])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Jan 2024 14:37:34 +0000 (GMT)
Message-ID: <218f08f9-bc12-47db-aa04-c2058c901986@linux.ibm.com>
Date: Mon, 22 Jan 2024 20:07:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] fs: remove duplicate ifdefs
To: Chandan Babu R <chandanbabu@kernel.org>
References: <20240118080326.13137-1-sshegde@linux.ibm.com>
 <20240118080326.13137-3-sshegde@linux.ibm.com>
 <87cyttedjj.fsf@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <87cyttedjj.fsf@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wwsiLOWQFOWpM58VonwYO5JiFtGQQtRe
X-Proofpoint-GUID: wwsiLOWQFOWpM58VonwYO5JiFtGQQtRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_05,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=620
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401220099
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
Cc: linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org, anton@tuxera.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/22/24 6:20 PM, Chandan Babu R wrote:
> On Thu, Jan 18, 2024 at 01:33:25 PM +0530, Shrikanth Hegde wrote:
>> when a ifdef is used in the below manner, second one could be considered as
>> duplicate.
>>
>> ifdef DEFINE_A
>> ...code block...
>> ifdef DEFINE_A
>> ...code block...
>> endif
>> ...code block...
>> endif
>>
>> There are few places in fs code where above pattern was seen.
>> No functional change is intended here. It only aims to improve code
>> readability.
>>
> 
> Can you please post the xfs changes as a separate patch along with Darrick's
> RVB tag? This will make it easy for me to apply the resulting patch to the XFS
> tree.

Ok. will split the fs patches into two and send v2 soon. 

Thanks.

> 
