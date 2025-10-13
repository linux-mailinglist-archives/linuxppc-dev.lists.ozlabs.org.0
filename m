Return-Path: <linuxppc-dev+bounces-12794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C67BD2930
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 12:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clYVz6Wpfz2yrm;
	Mon, 13 Oct 2025 21:29:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760351371;
	cv=none; b=BikalYvii+97fN95Py/q4/J22GL8sBnC4DXzD1aWKxD1GoVtpFtshoKtHeWiNOhzbN61khIIOQxpbv2sdhABdNacUbPrLUnXKxRFGS2VS2akKoOlMC05Lvmi7jvcJe41C7/zHWjknNBvESAaduQ8ctg/pJwxJOpjHCfOTPVVdrkeN57NRUGUO1J/TS2TAutSTD9p0wmbGQert40B3zpHgoa3sBJWvW8I8kRLJoz5xcbYawwwNXWtTOEwKyNjN2ks/3eP9iPX3QAGBCY4M/dDBLhOdw1lOJ49JgR0dskGGSYNLp01GHoqZJaCNJ+jJp8oYXIlpqFQLSW9S2yPr8csQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760351371; c=relaxed/relaxed;
	bh=AfGQqri2a4po2taSAV4I25Z2mcB3VfBkrdk7Z/AhhSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV+csfSewmzb2FVEaM5K1mDoiKSx4pIBdzgdbTBBYsPbxc0Acu2x1ebPPF3r4AfECynDXKZOZTdJY8EivT2urUR3ya7XTB8ezfNVW0UIUJq3FV6BptLdC+76d2zbhjo1/AU+J/FqcC3tEffFHyaFdtvJ52kM+7aq9SPYRxiwxqtIZj7/zu6Xz6RzNA77UZ9q+JOyIsgRwN2hxsJIwvyKpbNryH+knSnF5jdYp6hnwY6t31O5OXP1Ff9DgQYIJJJq0iCQLIxGICjQQi8VRKHOAf/S5yf4v9vaJgHAIr9Qa1nxnFCqyqgGLdqAO+bveU+x+SUsC47jEOL7uRNhnyUFIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VHX/SoW5; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VHX/SoW5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clYVy5w1cz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 21:29:30 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CLF802007315;
	Mon, 13 Oct 2025 10:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AfGQqr
	i2a4po2taSAV4I25Z2mcB3VfBkrdk7Z/AhhSk=; b=VHX/SoW5Oe/QlrzyHsrloP
	7manNDBlGJaEu5HMps1vkzo2qL+q9RpV7WggDyysYQuC9skf00wzarrfwHbIuyOO
	YEHDDzyhNrq3JLJhH2hXpcbeKLatICaE+bGAUhrV5gy1hiurK/jTcZ38ipdCNz1O
	9x1wdLBjr8NHnM+pJuicySCkrGO/5yyE67eCzJd0Vlce5m/dKNZqnMDPL4W3ori5
	wUHK0tA5WW09PxJE7RLITwCSOsPrS0uJ38QNRJe3xgmczWxC3ELd/6np6JfJnKvS
	DmVf9A2XHw2I7ZhKkL2AVlBA4apN2OdYvtWs3mavDDbxcQ+45YBRLYOqhpuCvs9A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qevyr5bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 10:28:52 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59DA60D4013691;
	Mon, 13 Oct 2025 10:28:51 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qevyr5bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 10:28:51 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DA0P3o018917;
	Mon, 13 Oct 2025 10:28:51 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r2jmdc0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 10:28:51 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59DASnrJ32702850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 10:28:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E92B58051;
	Mon, 13 Oct 2025 10:28:49 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3578D5805A;
	Mon, 13 Oct 2025 10:28:45 +0000 (GMT)
Received: from [9.67.162.81] (unknown [9.67.162.81])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Oct 2025 10:28:44 +0000 (GMT)
Message-ID: <01f7b9fc-7398-4a28-ae78-e7b4e1c6ca0f@linux.ibm.com>
Date: Mon, 13 Oct 2025 15:58:43 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report][PPC]: rmod nvme driver causes the kernel panic
To: Nam Cao <namcao@linutronix.de>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, tglx@linutronix.de, maz@kernel.org,
        gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
References: <31838b50-e420-405a-af23-6c6ede281386@linux.ibm.com>
 <87h5w3f7ed.fsf@yellow.woof>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <87h5w3f7ed.fsf@yellow.woof>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F6cV-UV_QR2MuYqfLZ0aM5S912tkmXFH
X-Authority-Analysis: v=2.4 cv=eJkeTXp1 c=1 sm=1 tr=0 ts=68ecd464 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=sZNwUNTCad_J9JpMvOQA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX05TKRTHb9HTu
 hmVuK8FlFyk7VAPXkhK9ShubIQNF5kxSWY0CS/AYeTDcfEfW1v6V9fEP2PfgS2X/08G3ob3b6bW
 GnOu3zD54kX+Ox9Uz/8yyJvIf4uVW7psModd9MN/HtvCLctcLuFyVVVEf9lA8+4vjYO0flYmSIh
 RbswUasaH4hmZUVFCVh4FUqNWWrp7sCoVAXuKC1c4WvZYg2hVLXvlHecojICB1CVDDrgLW85/kO
 ICiMWemujeYELxXJhpKfjsi1dnhZhNcL52j4ge7NPu/Ps6d/5HP/1ahEbTlgOXm96QQ80YDPQ7J
 zFfW2UqzslhoICFGhJkbDMk5Qw4OJD92NY6fwkToD+CHOxvHWQpzwX0HG+YOLVk94byd7eYNJVx
 UL3hxMwAmb1vgBwIcaikln1GFRwNlA==
X-Proofpoint-GUID: zLNgnSe9ULUTe0yqUThnKXdsaGy71AZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110014
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/13/25 3:30 PM, Nam Cao wrote:
> Nilay Shroff <nilay@linux.ibm.com> writes:
>> Hi Nam,
> Hi Nilay,
> 
>> On the latest upstream mainline kernel, I am encountering a kernel
>> crash when attempting to unload the NVMe driver module (rmmod nvme)
>> on a POWER9 system. The crash appears to be triggered by the recent
>> work on using MSI parent domains, discussed here: 
>> https://lore.kernel.org/all/cover.1754903590.git.namcao@linutronix.de/
> 
> Thanks for the detailed analysis. This should be fixed by:
> https://lore.kernel.org/linuxppc-dev/20251010120307.3281720-1-namcao@linutronix.de/T/#u
> 
> which currently is in powerpc/fixes-test

Thanks for the fix! This works well... 

--Nilay

