Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 714CA86DAEA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 06:08:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hWHz49sl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmGLj66TZz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 16:07:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hWHz49sl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tasmiya@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmGKw1k9sz3cQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 16:07:15 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42155Vs9017716;
	Fri, 1 Mar 2024 05:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NU9hrphE/xAUchWvNGg6lkTEDPLfy0Uf5/Lks1Qk2VQ=;
 b=hWHz49sl3RdVPnzg8Z9xX7oMArJn12v+sIiafTy4kZW0BkNwiv4nQBwyEYS0BOV+eVN7
 B+xW7jkFRwpdQSFVUoNQ+6wyDGI/ZBVJdEGTSANsRcNArDPRfwEKOoHdagxyiomB/tYd
 qf6e1F8lueiBQ87hFS7/8JizOcY5yjf3XmGybnYmCwUCcwGxRQ3O3SX/b8nFRuf0Qo+z
 ks1Zw3uqhSVmi+gYwaRp83ONeukmS54EJWW/sg5OV9MTtXzFDJywdGkzDMiCkGGRngaD
 0xOFmA8EswqE5b9/hLNTZrEhEUw7B+kF/G5l0US2bQkF1PhDXB5HEzk//ZaXaMxY9aLI 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk8jh014k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 05:06:52 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42156TZx019581;
	Fri, 1 Mar 2024 05:06:51 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk8jh014b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 05:06:51 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42133BM3024151;
	Fri, 1 Mar 2024 05:06:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0ksxqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 05:06:51 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42156mx832899574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Mar 2024 05:06:50 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACFEB58069;
	Fri,  1 Mar 2024 05:06:46 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F9455805F;
	Fri,  1 Mar 2024 05:06:43 +0000 (GMT)
Received: from [9.43.13.218] (unknown [9.43.13.218])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Mar 2024 05:06:43 +0000 (GMT)
Message-ID: <32b39767-2ba7-436c-8f76-01d07f01193b@linux.vnet.ibm.com>
Date: Fri, 1 Mar 2024 10:36:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [revert 0d60d8df6f49] [net/net-next] [6.8-rc5] Build Failure
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>
References: <3fcf3a2c-1c1b-42c1-bacb-78fdcd700389@linux.vnet.ibm.com>
 <85b78dad-affa-47c3-9cd0-79a4321460b8@linux.dev>
 <CANn89iJEzTjwxF7wXSnUR+NyDu-S-zEOYVXA+fEaYs_1o1g5HQ@mail.gmail.com>
 <a1fdd2c2-4443-458e-86db-280e7cbd4a36@linux.vnet.ibm.com>
 <CANn89iKdaMFCKnGRL4ffnbyrr2PUaKn1hoiu4VZ=sRyX=Vy0Wg@mail.gmail.com>
 <20240229064742.36c2f476@kernel.org>
From: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
In-Reply-To: <20240229064742.36c2f476@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eyRaQEkncOqs4a4_VggIsyY9JK13iHua
X-Proofpoint-ORIG-GUID: wZVV2CgquUvU7nVb6yHaGKkMqZzzEJYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2403010041
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
Cc: venkat88@linux.vnet.ibm.com, Vadim Fedorenko <vadim.fedorenko@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, arkadiusz.kubalewski@intel.com, jiri@nvidia.com, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

This is tied to gcc version. Build failure is seen while using gcc-8.5.x

On 2/29/24 20:17, Jakub Kicinski wrote:
> On Thu, 29 Feb 2024 09:55:22 +0100 Eric Dumazet wrote:
>> I do not see other solution than this, otherwise we have to add more
>> pollution to include/linux/netdevice.h
> Right :(
>
>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>> index a9c973b92294bb110cf3cd336485972127b01b58..40797ea80bc6273cae6b7773d0a3e47459a72150
>> 100644
>> --- a/include/linux/netdevice.h
>> +++ b/include/linux/netdevice.h
>> @@ -2469,7 +2469,7 @@ struct net_device {
>>          struct devlink_port     *devlink_port;
>>
>>   #if IS_ENABLED(CONFIG_DPLL)
>> -       struct dpll_pin __rcu   *dpll_pin;
>> +       void __rcu *dpll_pin;
>>   #endif
> If DPLL wants to hide its type definitions the helpers must live
> in dpll? IOW move netdev_dpll_pin() to drivers/dpll/dpll_core.c
>
> BTW Tasmiya, please do tell us what compiler you're using.
>
-- 
Regards,
Tasmiya Nalatwad
IBM Linux Technology Center

