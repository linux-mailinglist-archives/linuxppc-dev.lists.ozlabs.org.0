Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641238BE714
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 17:11:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QPc2lD4J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYhZ66P9Tz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 01:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QPc2lD4J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYhYP0JK6z3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 01:10:48 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 447Em1DS018420;
	Tue, 7 May 2024 15:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VMnu+pDmL+oYK7xiki7kzb8soYvaBtZJpE+R7cKcFxY=;
 b=QPc2lD4JTvtN0dOCusf02LiAEeVIKQODE0mSW35TJxQ5vrTqx+UMkAh0gmsf73NJ73ng
 WlXvDL5yZGwnzPar137I8oybZ29oTtih3lLodvw++S3HycN+Si2MTycqZLyGlKQaXmf0
 K8OxXGJkfwXOhKdBJCXmVHHuTIQjHIX+AlOxRul/MoDEnstoIuttFFlerjIOXEfpzPtE
 5qvPgsB7tUkJEyXa4/LDoFCcA7K6lVFPTeYOfD7wKJHsnyeN37RCkyFC+fQcqzi/c12p
 kQuyiHpLdGVaQDPX9JJzXqLM8XzK4BbH1WO34z2kwpObYPBeSp5x/kcVqmV3GONr10wL jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xypc6g25h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 15:10:35 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 447FAYij024802;
	Tue, 7 May 2024 15:10:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xypc6g25d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 15:10:34 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 447Eg5bt028576;
	Tue, 7 May 2024 15:10:33 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xwyr070js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 15:10:33 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 447FAR8820906388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2024 15:10:29 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3D8820043;
	Tue,  7 May 2024 15:10:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7E782004E;
	Tue,  7 May 2024 15:10:23 +0000 (GMT)
Received: from [9.79.183.213] (unknown [9.79.183.213])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 May 2024 15:10:23 +0000 (GMT)
Message-ID: <1c277ae0-14cc-4d79-a7a1-455ed996b67a@linux.ibm.com>
Date: Tue, 7 May 2024 20:40:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/6] powerpc: pSeries: vfio: iommu: Re-enable
 support for SPAPR TCE VFIO
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
 <20240501140942.GA1723318@ziepe.ca>
 <703f15b0-d895-4518-9886-0827a6c4e769@amd.com>
 <8c28a1d5-ac84-445b-80e6-a705e6d7ff1b@linux.ibm.com>
 <20240506174357.GF901876@ziepe.ca>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <20240506174357.GF901876@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J4Gsgo8V3_3M_QYRnBmu-upxnqO-CmvX
X-Proofpoint-ORIG-GUID: TasHpAtQk2MCFNjakLGTISoKhTN09Sii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_08,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 mlxlogscore=960
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2405070104
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
Cc: kvm@vger.kernel.org, aik@ozlabs.ru, linux-kernel@vger.kernel.org, oohall@gmail.com, ruscur@russell.cc, brking@linux.vnet.ibm.com, robh@kernel.org, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, joel@jms.id.au, naveen.n.rao@linux.ibm.com, msuchanek@suse.de, jroedel@suse.de, gbatra@linux.vnet.ibm.com, npiggin@gmail.com, alex.williamson@redhat.com, mahesh@linux.ibm.com, tpearson@raptorengineering.com, Alexey Kardashevskiy <aik@amd.com>, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,


On 5/6/24 23:13, Jason Gunthorpe wrote:
> On Sat, May 04, 2024 at 12:33:53AM +0530, Shivaprasad G Bhat wrote:
>> We have legacy workloads using VFIO in userspace/kvm guests running
>> on downstream distro kernels. We want these workloads to be able to
>> continue running on our arch.
> It has been broken since 2018, I don't find this reasoning entirely
> reasonable :\

Though upstream has been broken since 2018 for pSeries, the breaking

patches got trickled into downstream distro kernels only in the last few

years. The legacy workloads that were running on PowerNV with these

downstream distros are now broken on the pSeries logical partitions

without the fixes in this series.

>> I firmly believe the refactoring in this patch series is a step in
>> that direction.
> But fine, as long as we are going to fix it. PPC really needs this to
> be resolved to keep working.

Thanks, We are working on it.


Regards,

Shivaprasad

>
> Jason
