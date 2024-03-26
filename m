Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE4B88B990
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 05:57:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8UAajQM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3cxB5nBZz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 15:57:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R8UAajQM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3cwT2XsYz3cBN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 15:56:56 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42Q3xBZ1027625;
	Tue, 26 Mar 2024 04:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NBOgjNgvGMe34QEDF7gDzP15BhfQn7A3sJSHVdmYu2g=;
 b=R8UAajQMosouNFzn0g97zjG0zc9NFmx8IvPh73c3GXb1i4Y3kE4NfPuBAnCPaNy8ZTdk
 kK96FoZBXIAgJULcMjiKij4avCgtOtUBxIZig31WfcbKSprLzl6QBanjYWXYvs2mtowE
 JulKlInNM0P3Jyqtg6IY0ruhvVSa/PwNGJmVyqXpHj/7+4VzPZxBTyGCfSP3lBGQTAYE
 gaeAE6VvVaa60jNwXyBka7HlfmkUIDhfSIFQZtocE1gtFVqASAG8iEIR5vAJq9TOC3mI
 44GHhPntfXJmz4nP61d8X74AyPY+AhHZui7NJezlwji7HZxWUDROsmhfb2kMAYjLwBbq Og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3krygdyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 04:56:45 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42Q4uiQM013896;
	Tue, 26 Mar 2024 04:56:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3krygdyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 04:56:44 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42Q34Vx4025458;
	Tue, 26 Mar 2024 04:56:43 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2awmng5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 04:56:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42Q4ubng46530840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Mar 2024 04:56:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A956320040;
	Tue, 26 Mar 2024 04:56:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 835432004F;
	Tue, 26 Mar 2024 04:56:33 +0000 (GMT)
Received: from [9.43.56.140] (unknown [9.43.56.140])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 26 Mar 2024 04:56:33 +0000 (GMT)
Message-ID: <b102eb8e-c3b5-4d65-9113-3cc43e980b9b@linux.ibm.com>
Date: Tue, 26 Mar 2024 10:26:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] pseries/iommu: Enable DDW for VFIO TCE create
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
 <171026728072.8367.13581504605624115205.stgit@linux.ibm.com>
 <87zfv22szi.fsf@mail.lhotse>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <87zfv22szi.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H7yzpYNpzHmY0p4JXdLihxeEU_FspdxM
X-Proofpoint-GUID: bFFropFSeiwnwi_t5Nz0u3h9lb-0mPi2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403260029
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
Cc: robh@kernel.org, jroedel@suse.de, kvm@vger.kernel.org, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, linux-kernel@vger.kernel.org, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On 3/13/24 18:23, Michael Ellerman wrote:
> Hi Shivaprasad,
>
> Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:
>> The commit 9d67c9433509 ("powerpc/iommu: Add \"borrowing\"
>> iommu_table_group_ops") implemented the "borrow" mechanism for
>> the pSeries SPAPR TCE. It did implement this support partially
>> that it left out creating the DDW if not present already.
>>
>> The patch here attempts to fix the missing gaps.
>>   - Expose the DDW info to user by collecting it during probe.
>>   - Create the window and the iommu table if not present during
>>     VFIO_SPAPR_TCE_CREATE.
>>   - Remove and recreate the window if the pageshift and window sizes
>>     do not match.
>>   - Restore the original window in enable_ddw() if the user had
>>     created/modified the DDW. As there is preference for DIRECT mapping
>>     on the host driver side, the user created window is removed.
>>
>> The changes work only for the non-SRIOV-VF scenarios for PEs having
>> 2 DMA windows.
> This crashes on powernv.


Thanks for pointing this out.  I will take care of this in v2 of this RFC.


Regards,

Shivaprasad

