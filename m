Return-Path: <linuxppc-dev+bounces-6168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E63CFA35748
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 07:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvMqz2rFKz2xmk;
	Fri, 14 Feb 2025 17:40:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739515231;
	cv=none; b=dCrGdaBF3fGNYtPpJNaecGxBDxp6lPNndqr1aRa3b5YE9Zm5w7HDROmrHHM9kuUu0j5QKH8iYPS/Sz9BO2Tw/qjXUZL74ywSFw5uZ8KbIrIoVZUKkn0ab20R5w+JM0NtULTQniy1lPLSPWPOPlyce+ltSdKpkF4qEIaPg5HVQn8yGwvkRSTfRVXstCUREoPQEpRoc9UJw2kr59LUgWu160I2Vl0W3735WSoFBqggNl5z+yAm9cu7//A6wEn5VCWUy0ZAPxFq7J7Mh3ZykLvEfLfSGU/FWGI9bO2o9TKSe9lC+v1ZbvK0rl3WY8a5bxnHeKGg1UUeEexDT3Kype9RdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739515231; c=relaxed/relaxed;
	bh=MuwEtKLF7ofB4unmQfXvMcEmuv+K68chaMVfpQh/Qbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbBBoQ9F6mGtEZRzG1lNXky8ULTpo7H0KZVE9YM454f2n5JTuPQg6vR/51q/8/iH1KS98X55SESy3RPXYBmGoaI3nz2V/BKxmWuEAT5tPvDfkgTWouKcciOQDDaD0oBiCxnpLjggeug6f78kEGGYHEeLSGAInxGzhqpCwEvQvbFfLfWwI7APk1jMBxKFvkbXLi2zPsLQ2WybKfNLWlSLw7VhyuW5/lyWt3kaiR2cfz8E+NvP3I7ktaEsmYj9c2xJoAzTxaD14m8o6Lv7IVnGjtKhwZ1m4nKl1mVIjJj3RHxYfClpqwlHCo+HBHZYgDFZ8z3a/KyFbOMm1lTmhVMBIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LTd6egzz; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LTd6egzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvMqy3Vd6z2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 17:40:29 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DMnbkQ000644;
	Fri, 14 Feb 2025 06:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MuwEtK
	LF7ofB4unmQfXvMcEmuv+K68chaMVfpQh/Qbk=; b=LTd6egzz2DEtYvVK44IMbb
	wa+BZ8Zj2sSdTLYxVcnmmttrbLPwhom3f7LZ29EYG/d6dgvORLDT0dyDtugWWCdB
	l1TnKFwPZBxbrbW7yirwM7HUBOp52GSK+T6F9rzr/YNXHJcqfU3YEqCI4G5EE7Y/
	b081uenieKQgspCwKwavvscxeDa4XGhbqH9LQD7M9nhX/Y6qo3l6UDDCzeXi60dU
	ZOVDypO2UDm4wEiid2O6lb3CQG5eTttXoSPAlkWH2g5f/6gqkUECORAw44g9SQ/H
	RnIaRQ2NrV464O6Hsyf0fHXVY9LMzfHsSExpVShw/N8vUQvF9j3FyuAx8hKLAqwg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ssva9kyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:40:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51E4ff9o011677;
	Fri, 14 Feb 2025 06:40:25 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pktk9yvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 06:40:25 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51E6eO3n27722354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 06:40:24 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA53F58057;
	Fri, 14 Feb 2025 06:40:24 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 763385805D;
	Fri, 14 Feb 2025 06:40:23 +0000 (GMT)
Received: from [9.61.255.185] (unknown [9.61.255.185])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 06:40:23 +0000 (GMT)
Message-ID: <5a0d9847-54df-47f3-9e96-be393f76b3fb@linux.vnet.ibm.com>
Date: Fri, 14 Feb 2025 12:10:21 +0530
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
Content-Language: en-GB
To: Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
References: <8e73069b-5987-4a08-b13d-13fe691092ad@linux.vnet.ibm.com>
 <77c11ea2-f3ae-497a-aaba-f7b33f46743d@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <77c11ea2-f3ae-497a-aaba-f7b33f46743d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6uYwXQ4X0eJylFIz94UmefSYhxhL2U3D
X-Proofpoint-ORIG-GUID: 6uYwXQ4X0eJylFIz94UmefSYhxhL2U3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_02,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=812 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502140047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Yes Hari, its built with CONFIG_KEXEC_FILE=y

Regards,

Venkat.

On 14/02/25 12:02 pm, Hari Bathini wrote:
>
>
> On 13/02/25 8:34 pm, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>  From kernel next-20250210, I am observing syscall kexec_file_load 
>> not available, there by kdump service is failing to start.
>>
>>
>> Logs:
>>
>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -c
>> Warning: append= option is not passed. Using the first kernel root 
>> partition
>> Modified cmdline: elfcorehdr=311424K root=UUID=b5b1f89c- 
>> d479-48b3-90e2-744a2fd05667
>> [root@ltc-zzci-1 ~]# kexec -p --initrd=/boot/initramfs-6.14.0-rc2- 
>> next-20250212kdump.img /boot/vmlinuz-6.14.0-rc2-next-20250212 -s
>> syscall kexec_file_load not available.
>> [root@ltc-zzci-1 ~]# kexec -v
>> kexec-tools 2.0.27
>> [root@ltc-zzci-1 ~]# uname -r
>> 6.14.0-rc2-next-20250212
>>
>
> Is the kernel built with CONFIG_KEXEC_FILE ?
>
> - Hari
>

