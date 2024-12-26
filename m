Return-Path: <linuxppc-dev+bounces-4479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87629FC9E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2024 10:24:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YJjrg01l8z2yV6;
	Thu, 26 Dec 2024 20:24:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735205090;
	cv=none; b=C2Z9CYndbi4pfW2YucljwAxIq0DaiwYLOezceO9osA8sUZyih0eHZAegxj4qHPPcUKoM/eKHe/RYm56RXaPln2BOUguJ4HYxwb0ketRnc/PdSXcl+XYP7shrosLQKjH7NwrNIt5UVZjIMOt+VyJHH4vNERw1E2bK3gSiALzu90+x8TM2WQGO+2zL/VnqeI3g4Oxx8ToZIrcA/q/iDzPji/sM9JCzfc0OZy/OnS2LihoYl+D7EGk5KLrG0fPYwOlqcu6k9COGpy40jB2fgMwpug9Ta8z344Rfp8i1SKXCSEFT+sF0Gp7I6cWwt1+llJCLwk8n06zNgsE00Wder00tJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735205090; c=relaxed/relaxed;
	bh=HG/2rLZ96lKXoOhm/FE0fLTX6r570qhTekaN5ef5EsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWJSnZvEQsTjRNJ//pE8Z9Zy1IWOyAfejs5T/WKPpWud8kJaqND5Xcwg16/miWD1ACrZhc8Pd6q6ozlOGbq7nydjfM+4BxlJDxE1gxevsLAQBnE47wiJoZEoRFl6fRoEIzeC+4AMr8ip/fn7jzisOPPD6Of55ZzzdJmM2QKQ50qLb17wO3e/I1SLNkJ8HOx1FdYyv2MfM3y91YGcFj4TCfdagiesISSEfq2FWXqsE2BKVpjEvzwMa/mWJLr/dBNY7GcqWXETFsr924EJpwp2JctOoEx6zn1tp4tutPRj+FIAOCK5dDGTv+nsJyKpHwBIzzm/39NhydWQRkbD5uWx2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heiEhqAJ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=heiEhqAJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YJjrd4gZ1z2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2024 20:24:48 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ3sI6M008911;
	Thu, 26 Dec 2024 09:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HG/2rL
	Z96lKXoOhm/FE0fLTX6r570qhTekaN5ef5EsQ=; b=heiEhqAJF6PB/bM1AYVNla
	qdsA/8GwzTX2cw241Vmn0g/Xkd3Nz33Q/Nx4b+0CkGOnut3swCeK9PSuTgJgb86M
	czX4dF8uH+WiD3EHrQDjBDgBZHbhojwW0RxOLfzZCbU5MEMKiiaQReAP95Sm4LV4
	K4wBjszYgltx/Ow1KF0vDz6GihRSof57or0r+3RWZKlltzjIDdsXqXYsox/gyte1
	hkY6+4IrlQfv8x4bHHWt8Niapik1p1Kjbbl4wG8kfm0z20eVCQEusd6ZYMDbbgpR
	7kmN0KiFA+4ASmHINbQx6gNYpHJ5eEcMw7XGjGwQzyZmUdKUnWwKpKxdVNm2nh1A
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43rymh12t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:23:42 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ5VhGj010570;
	Thu, 26 Dec 2024 09:23:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43p90n9eng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Dec 2024 09:23:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BQ9NcB856689004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Dec 2024 09:23:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE0A52004B;
	Thu, 26 Dec 2024 09:23:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C920320040;
	Thu, 26 Dec 2024 09:23:33 +0000 (GMT)
Received: from [9.124.219.96] (unknown [9.124.219.96])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Dec 2024 09:23:33 +0000 (GMT)
Message-ID: <d0e73e64-cdf7-443b-a8e3-7c1f25533000@linux.ibm.com>
Date: Thu, 26 Dec 2024 14:53:32 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] Support SMT control on arm64
To: Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        linux-kernel@vger.kernel.org, morten.rasmussen@arm.com,
        msuchanek@suse.de, gregkh@linuxfoundation.org, rafael@kernel.org,
        jonathan.cameron@huawei.com, prime.zeng@hisilicon.com,
        linuxarm@huawei.com, yangyicong@hisilicon.com, xuwei5@huawei.com,
        guohanjun@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        sudeep.holla@arm.com, tglx@linutronix.de, peterz@infradead.org,
        mpe@ellerman.id.au, linux-arm-kernel@lists.infradead.org,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        pierre.gondois@arm.com, dietmar.eggemann@arm.com
References: <20241220075313.51502-1-yangyicong@huawei.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20241220075313.51502-1-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TecHftRr10EKN3_ENZX2-3FGtFYZ8j2N
X-Proofpoint-GUID: TecHftRr10EKN3_ENZX2-3FGtFYZ8j2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=904 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260079
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 12/20/24 13:23, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 

EAS is disabled when SMT is present.
I am curious to know how power saving happens here.

> This patchset implements it in the following aspects:
> 
> - Provides a default topology_is_primary_thread()
> - support retrieve SMT thread number on OF based system
> - support retrieve SMT thread number on ACPI based system
> - select HOTPLUG_SMT for arm64
> 
> Tests has been done on our ACPI based arm64 server and on ACPI/OF\
> based QEMU VMs.
> 

