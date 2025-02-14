Return-Path: <linuxppc-dev+bounces-6166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983BA35567
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 04:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvHwr4WVfz2ywC;
	Fri, 14 Feb 2025 14:44:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739504668;
	cv=none; b=XSFit2w87nL8dAUxamVS4eHyF0eVl1rRzFp5w6d+9V1ITOHP8XlNHIbS5r/a4TJNa8SPRNMD8/wK9BbjpX1p8rRWDnzxm62TximGtkXsOrL281PA+2B8gHCgotJ2WwQADy4VFFTjl8gE4/CnHgjRMiF71MO/ICYvxR6SVn3UGWD2cCqkZtVB+ZO2TXz5bXNErVgTAUdMilMiYwou1IhJJ6QWXSIe0BbB65G6X5G5zs2yvma8MCH3kUVzWvTN7NuR6s+IaTD3WMlx/SCd/jHTPiYMdA98MfZK3sOoDSsjqpbwsGmCFLrLy5fUigg3TifLluRauYehu3d4S01CV+cyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739504668; c=relaxed/relaxed;
	bh=9MQAbGXpXA68E2ZJDNg599icK9mYCuj8iCWgPBB4/lU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JJm7zyZ3MVA+cjXAQF/7Hy27LsrNYG4wxiHCL4qBhUf6JLBkrLV8GszjezJh/kBPCObYaGNyYZ5B82SbgM6K3evQ/imYVuzdADNiB6mTL1PynLl8+0vkInGKlzo6rWqj6QJHAdBE8S7qKGcgUH4ba5mkaJ6PScwPWrndG0jFl6CldpkwOtu0jdp7Q73B3671EoTphdtcRwLmfJe60tHhv784TKRnO7gq+FNbXK8YJUs0B7KFN4qzHdANe3/lWPT5U8pR83+PxZt7SEX9apeHN+eZCO5z46q/EwQGimMXLyHEKW6mYl/jTD6OC2Mbz5Zv4UsJ11wIDnYgwuZXFw8LPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XBY/bmj+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XBY/bmj+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvHwq3WdXz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 14:44:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E219TM016465;
	Fri, 14 Feb 2025 03:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9MQAbG
	XpXA68E2ZJDNg599icK9mYCuj8iCWgPBB4/lU=; b=XBY/bmj+9Q2+lbMovhuXg5
	x4C+XB32kIvK6ZlGs/QaeECwPwVjg3qL14Gohl6abvrYSKKCj2xAne21XDv7TYwU
	P0oVYKo01XB1xu6v2moYeh91TALS47ZqiUbCQPfwhW6JDtdtRUWnefgZ7oc8qdb7
	OVKawYuU1aVYIWrVmjwe1FRE/SXpbQE5CnZCi+H7Si/o3fi3dhyddJwkgsZ66rdw
	GyxAs4JSmsKnjvGvNg+Q3nrYNfG4dGPtjho0uLZnlNBUfTdL7fdUkwMoSeY8qI6s
	+QvOKGCT8hzZT1FiQU3iRYhLsp5dRW5bOkW5uFCR6RkjThmF1A9/zeY8/w0u+qqA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44skjuu23n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 03:44:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51E32LQj001051;
	Fri, 14 Feb 2025 03:44:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjknhphk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 03:44:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51E3iL7c38469952
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 03:44:21 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 335AA20043;
	Fri, 14 Feb 2025 03:44:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A4F020040;
	Fri, 14 Feb 2025 03:44:20 +0000 (GMT)
Received: from [9.43.98.203] (unknown [9.43.98.203])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 03:44:19 +0000 (GMT)
Message-ID: <bdc8c274-960e-4f66-9790-736e9bd0eb76@linux.ibm.com>
Date: Fri, 14 Feb 2025 09:14:19 +0530
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
References: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PYIGCqekOGocHD3qbqDxany28q78N8Kh
X-Proofpoint-ORIG-GUID: PYIGCqekOGocHD3qbqDxany28q78N8Kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502140024
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Venkat,


On 13/02/25 20:34, Venkat Rao Bagalkote wrote:
> Greetings!!!
>
> From kernel next-20250210, I am observing syscall kexec_file_load not 
> available, there by kdump service is failing to start.
>

powerpc do have support for kexec_file_load system. Seems like there is 
an issue.

Thanks for reporting the issue.

I will debug and find what went wrong with next-20250210 or the kexec 
you used to load the kdump kernel.

Thanks,
Sourabh Jain

>
> Logs:
>
> [root@ltc-zzci-1 ~]# kexec -p 
> --initrd=/boot/initramfs-6.14.0-rc2-next-20250212kdump.img 
> /boot/vmlinuz-6.14.0-rc2-next-20250212 -c
> Warning: append= option is not passed. Using the first kernel root 
> partition
> Modified cmdline: elfcorehdr=311424K 
> root=UUID=b5b1f89c-d479-48b3-90e2-744a2fd05667
> [root@ltc-zzci-1 ~]# kexec -p 
> --initrd=/boot/initramfs-6.14.0-rc2-next-20250212kdump.img 
> /boot/vmlinuz-6.14.0-rc2-next-20250212 -s
> syscall kexec_file_load not available.
> [root@ltc-zzci-1 ~]# kexec -v
> kexec-tools 2.0.27
> [root@ltc-zzci-1 ~]# uname -r
> 6.14.0-rc2-next-20250212
>
>
> Regards,
>
> Venkat.
>


