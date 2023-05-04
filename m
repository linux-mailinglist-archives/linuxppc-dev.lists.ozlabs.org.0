Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CBA6F71B6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 May 2023 20:04:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC1tJ0jnrz3fMm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:04:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thjGq0fK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=thjGq0fK;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC1sQ5g8Mz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 04:03:54 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 344I3Aj8019189;
	Thu, 4 May 2023 18:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cRiXMiy9V9o+Y+j4ny8/GiuFSqj1YUZkp2Y+00F/OAw=;
 b=thjGq0fKoj/a10ADOTJApS21KmPJ7QrRyv86LnxRzIeCmxkrso7Mfl1kpi/RCTBTQRKR
 ocGOlFJ1bhLsRKTujGtfH2GwhQrKF6wfLnKD2XvjCpgCXV+UULkQ1iq+jLf5fgcqYgeb
 MamIXgGOOO7qWVLNunAvDHPBGcb6pdI0dlit9AkVpoV2Ointb2+POEs7YZ5rckrAdDxA
 oTFUXAH1FkBSHwc98/y3QxxXy8HenkApKfhzaykea7cy8/T3AqF2tXe7KAvt1fo6ibPN
 plmQ4hAUzgCV23Jv6C3MbZ6qeNcrKqMUXC3S8ESGaK5PtSj8Q/tSphrEXSV06YRDIp6j ew== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qchhn05k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 18:03:39 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 344HnSSd005219;
	Thu, 4 May 2023 18:03:30 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3q8tv8hbc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 May 2023 18:03:30 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 344I3Tvg1508034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 May 2023 18:03:29 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A2DB58054;
	Thu,  4 May 2023 18:03:29 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7BFC5803F;
	Thu,  4 May 2023 18:03:28 +0000 (GMT)
Received: from [9.24.27.252] (unknown [9.24.27.252])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 May 2023 18:03:28 +0000 (GMT)
Message-ID: <307aae51-1619-79d6-5743-be828e62ccba@linux.vnet.ibm.com>
Date: Thu, 4 May 2023 13:03:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
 <87leimfuk0.fsf@mail.concordia>
 <1ce16c05-b492-fed8-06af-0bbba9de9053@linux.vnet.ibm.com>
 <87354c8yx5.fsf@mail.lhotse>
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <87354c8yx5.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mkDnZYT-2E6zKjEKCJ9amOtL8-fU3eSe
X-Proofpoint-ORIG-GUID: mkDnZYT-2E6zKjEKCJ9amOtL8-fU3eSe
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=870
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040142
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

I agree with your concerns regarding a device been able to access memory 
that doesn't belong to it. That exposure we have today with 2MB TCEs. 
With 2MB TCEs, DMA window size will be big enough, for dedicated 
adapters, that whole memory is going to be mapped "direct". Which 
essentially means, that a "rogue" device/driver has the potential to 
corrupt LPAR wide memory.

I have sent you v3.

Thanks,

Gaurav

On 5/4/23 12:10 AM, Michael Ellerman wrote:
> Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
>> Hello Michael,
>>
>> I was looking into the Bug: 199106
>> (https://bugzilla.linux.ibm.com/show_bug.cgi?id=199106).
>>
>> In the Bug, Mellanox driver was timing out when enabling SRIOV device.
>>
>> I tested, Alexey's patch and it fixes the issue with Mellanox driver.
>> The down side
>>
>> to Alexey's fix is that even a small memory request by the driver will
>> be aligned up
>>
>> to 2MB. In my test, the Mellanox driver is issuing multiple requests of
>> 64K size.
>>
>> All these will get aligned up to 2MB, which is quite a waste of resources.
> OK. I guess we should use your patch then.
>
> It's not ideal as it means the device can potentially read/write to
> memory it shouldn't, but 2MB is a lot to waste for a 64K alloc.
>
>> In any case, both the patches work. Let me know which approach you
>> prefer. In case
>>
>> we decide to go with my patch, I just realized that I need to fix
>> nio_pages in
>>
>> iommu_free_coherent() as well.
> Can you send a v3 with that fixed please.
>
> cheers
