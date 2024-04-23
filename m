Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC56E8AE9EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 16:56:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X4y3uUdx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP4vs2lsjz3cNN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 00:56:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X4y3uUdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP4v50mxyz3cRr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 00:56:16 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43NEns4S022107;
	Tue, 23 Apr 2024 14:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n3FibSyhqeqNBMqlU4DUPCJOy+2RIesEFMLjIGdVnS0=;
 b=X4y3uUdxUeEeyGEPhrnrav7X3pS2ZUrBP+Gu6sIaZsRPTOUQILuk2Q0ku3drDHQ4iogT
 PHuE8UqWEUttKQrUUxGRCkzp5xZjQwLuJetJj5PLype0RPmms5Xtq7MWuPyBLtJZ/dTg
 Mwf2eHwinG5HADIdaZhoLUQGI18vn2dRKetO1Ywh+hf54sMeNeVXoqJHfwaMG02C/sGP
 VUEkbbPBC7+StFVp1O6qSYKglLtjqvEoniSSTnJSJIbFEyvm1Ch7b8VES35NwSsMriNr
 0n4bpZmyJmEN/5d1BdD93yuuRMppfEhMb6iBnP+8Xzg4J6QACy8ix78p8cMH6NXSU5dW lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xpf3200eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 14:56:02 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43NEu1hO030103;
	Tue, 23 Apr 2024 14:56:01 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xpf3200en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 14:56:01 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43NEr6Tr015277;
	Tue, 23 Apr 2024 14:56:00 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xmshm61js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Apr 2024 14:56:00 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43NEtv9o17564218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Apr 2024 14:55:59 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 813985805E;
	Tue, 23 Apr 2024 14:55:57 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BD3458066;
	Tue, 23 Apr 2024 14:55:57 +0000 (GMT)
Received: from [9.24.5.26] (unknown [9.24.5.26])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 23 Apr 2024 14:55:57 +0000 (GMT)
Message-ID: <7e3f43a3-98e0-40ed-8820-2f1eef8742ba@linux.ibm.com>
Date: Tue, 23 Apr 2024 09:55:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ibmvnic: Use -EBUSY in __ibmvnic_reset()
To: Dan Carpenter <dan.carpenter@linaro.org>, Paolo Abeni <pabeni@redhat.com>
References: <4cff158d-b5ac-4dca-9fbb-626237c1eafe@web.de>
 <f493e39063ee52a3d263de27bfd240149d910a88.camel@redhat.com>
 <da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
Content-Language: en-US
From: Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <da19d324-3c66-4bb1-8fa2-dc26dbea622b@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W3whKt0gJALV53n61XLBMtyhTMQ4uEBE
X-Proofpoint-GUID: QfRQoGfEpIA_zIycNlg5y3GEeMz7Y15v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-23_12,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404230036
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
Cc: netdev@vger.kernel.org, Rick Lindsley <ricklind@linux.ibm.com>, kernel-janitors@vger.kernel.org, Thomas Falcon <tlfalcon@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Eric Dumazet <edumazet@google.com>, Markus Elfring <Markus.Elfring@web.de>, Haren Myneni <haren@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/23/24 06:55, Dan Carpenter wrote:
> On Tue, Apr 23, 2024 at 12:54:55PM +0200, Paolo Abeni wrote:
>> On Fri, 2024-04-19 at 16:08 +0200, Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Fri, 19 Apr 2024 15:46:17 +0200
>>>
>>> Add a minus sign before the error code “EBUSY”
>>> so that a negative value will be used as in other cases.
>>>
>>> This issue was transformed by using the Coccinelle software.
>>>
>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>> ---
>>>   drivers/net/ethernet/ibm/ibmvnic.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
>>> index 5e9a93bdb518..737ae83a836a 100644
>>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>>> @@ -3212,7 +3212,7 @@ static void __ibmvnic_reset(struct work_struct *work)
>>>   		    adapter->state == VNIC_REMOVED) {
>>>   			spin_unlock_irqrestore(&adapter->state_lock, flags);
>>>   			kfree(rwi);
>>> -			rc = EBUSY;
>>> +			rc = -EBUSY;
>>>   			break;
>>>
>>
>> AFAICS the error is always used as bool, so this will not change any
>> behavior in practice. I tend to think we should not merge this kind of
>> change outside some larger work in the same area, but I'd love a second
>> opinion from the driver owners.
> 
> I missed the original patch due to my procmail filters...
> 
> You're right that it doesn't affect the behavior of the driver except
> for the debug output when we do:
> 
> 	netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
> 
> But the - was left off uninitentionally so I think we should apply it.
> 
> I have been trying to look for similar bugs where the - is left off.
> It's a bit challenging because there places where we use positive
> error codes deliberately.  But in this case a static checker could
> easily detect the bug with a low false positive ratio by saying, "We're
> mixing normal negative error codes with positive EBUSY".
> 
> regards,
> dan carpenter

Hello, small clarification, this patch will not effect the debug print 
statement due to the break statement immediately following:
	while () {	
		if () {
			rc = -EBUSY;
			break;
		}
		netdev_dbg(adapter->netdev, "Reset failed, rc=%d\n", rc);
	}
Though this return code can be passed to adapter->reset_done_rc, which 
is only treated as a boolean.

So, the point of the patch not doing any behavioral differences is still 
true.
Personally, I don't have strong opinions on this.
Reviewed-by: Nick Child <nnac123@linux.ibm.com>
