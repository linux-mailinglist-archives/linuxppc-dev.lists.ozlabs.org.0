Return-Path: <linuxppc-dev+bounces-6167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FEDA3571F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 07:32:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvMg65yk7z2xPc;
	Fri, 14 Feb 2025 17:32:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739514770;
	cv=none; b=nNZC5a3rUZW0Bq5Whgaj0kSSWJkK46Vhw4w9+XVggplSernthtQfZEYpUpfZV+s76QmaITt8ETElsjCCd4isAMDW1tOUsU0rb9mMNhurUGTjS9Wksb8db50mbKjlLiuPEVWoX3XmH/LH8mHsI8rehE0zuBfrxBQC2WVC07+wsJzYVq0Rm+zKyCNZwCuziDjInwHvKkW+wg1n2erwbWvAF/xIeCaWcT62unosMEB1w508jEoO0Dxjw9rT366UQh5Uz1yKruqaE/0vaG17mxiN9JITQ6kZyG+a4fhozVGmfrLApSh+5fa2mh7yi+QUl9VmyuQ2G+yhYl0M/x5c6+itVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739514770; c=relaxed/relaxed;
	bh=jN4FaQFIv+GkbRwAOYMg9naHXIwVApjxx0TVLhKgmUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7uxIe3zisNgrNrF6uK+vo6ZRbFXsLPl93jvpb9ivzvKL3hQqWA/hiGjB+IdBcj08AVEjMu3M5Cw5ethhAcQHRTbXZD8wI3hXE8rtlBuBHIjbGdorPIWzqrOYvYVx1kTRaDpbEoIg3UyWdGDsNP2zIPyfIvynIl6ebQ4eXnp1Rc9vSaB57a4So16Dw7dr98xFZxJeXEBgyMW03vS1+rrASOunKtIAScWpCEcO34nbSi0+aroXBLgEYWXS/lvNng/3LC3JXIe6KD5/WeoLE6nPW5u5hEDtLpK1zXGcQQsBc5tCAnSvdYbFQ134Vm/Iw2iDoT1Z1Cgztyk2i0Ndg14Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sramY19A; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sramY19A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvMg55v2bz2xBK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 17:32:49 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E217tZ013379;
	Fri, 14 Feb 2025 06:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jN4FaQ
	FIv+GkbRwAOYMg9naHXIwVApjxx0TVLhKgmUM=; b=sramY19AimOPPPGrbVgwjY
	b0S+Ll/CUN8nrwKAdMEd28ssBqpswYTitlRJvm58REd1QFbVqjHvq12otrnW8M1M
	TFc6IzmpgNP8lyYT8n6BWR8kRmp7/MqhtHxcs8JH5bV5MhNPo2esPEj3pu5p0JNz
	H1LJlCvvBY0muFi789DfhEvLez2xPIJNLgtpzITrGQ9K/Ocx6KPAt25iqvqeNuZe
	xLZ7oEx+TZGfOVU35fhNGAfS58Xp9370Q4G+yyudvCYnM7FZarsF5A8KOxuG+FTb
	rA4HCffPMDX+cpVjmA7Q9FnvXMgvcFfxdBaqaoB2WXz+MlswaYjTf73uXJ3UL7hw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44svp08xbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:32:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51E2jV9X016692;
	Fri, 14 Feb 2025 06:32:45 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pk3kj6mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:32:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51E6WhvH41812402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 06:32:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB0E72004D;
	Fri, 14 Feb 2025 06:32:43 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77EFE20040;
	Fri, 14 Feb 2025 06:32:42 +0000 (GMT)
Received: from [9.43.1.221] (unknown [9.43.1.221])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 06:32:42 +0000 (GMT)
Message-ID: <77c11ea2-f3ae-497a-aaba-f7b33f46743d@linux.ibm.com>
Date: Fri, 14 Feb 2025 12:02:41 +0530
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
Subject: Re: [linux-next-20250212] syscall kexec_file_load not available
To: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
References: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8-I0An12dgEe2IHZiXdS89BwQYzIzGcq
X-Proofpoint-GUID: 8-I0An12dgEe2IHZiXdS89BwQYzIzGcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 mlxlogscore=854 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 13/02/25 8:34 pm, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
>  From kernel next-20250210, I am observing syscall kexec_file_load not 
> available, there by kdump service is failing to start.
> 
> 
> Logs:
> 
> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -c
> Warning: append= option is not passed. Using the first kernel root 
> partition
> Modified cmdline: elfcorehdr=311424K root=UUID=b5b1f89c- 
> d479-48b3-90e2-744a2fd05667
> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -s
> syscall kexec_file_load not available.
> [root@ltc-zzci-1 ~]# kexec -v
> kexec-tools 2.0.27
> [root@ltc-zzci-1 ~]# uname -r
> 6.14.0-rc2-next-20250212
> 

Is the kernel built with CONFIG_KEXEC_FILE ?

- Hari


