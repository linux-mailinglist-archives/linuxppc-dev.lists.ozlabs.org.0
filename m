Return-Path: <linuxppc-dev+bounces-1557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9DB983FFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCXZX3MHfz2yLT;
	Tue, 24 Sep 2024 18:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727165364;
	cv=none; b=oIYCIILCC3rOTKu/sCr8fhyrE92qedLdOxeJ8uDkLcWIePFttZHuTmB6uDxflcH9KrgbBifpbHywbasXTqDuKXzWv0hBiyyasSSN0ON9B7yvqspa/nP/Z1vboDOpPG6eq9V2KpUmsJwaoViAuQBMeKC+8AqBFxmlRZB9oxU6SiRfwJjhV9QZYVkahfRZp1VSAhFwF3ZPmGsFAobh8rTxb7Mpc10DnPtmIToAQpGDvaVMUM5BD9xBO5EBWxavOWHgKVVr6uHBLyEqzFKk2XHvV9JzgwT++af/ZWMGKzVf3UF8TyvQILXgkBj4dBQLi1JYG9yr0PYuaZOvzrfOOoRgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727165364; c=relaxed/relaxed;
	bh=oILC7b+VYGL8iCjP4snxl26072XF0sliYpvFhTTwAnw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HC5DqON7+vXXcs9pHNyGs2PlZC3IiqqAt9N9pmbERIA59yjo3JAcNffre7nhz448y9n9LVyV+JXZeqfFgzUiygXGb95mFplaod8pP+hjTAsmK3ZcrdHiUZPf3/g6NvhzheHIKync0yD9jnnoCeH8WH4b1Tdji5KEorBU+aV3eUjo7pVItThKGwgCRIycfCUW7vJF4QMzoNH9CeFlTvEx7qS5QawBdVgUkEkWVu5Y7yvCRebbNNM8K6yEboKlXoDIvVNfcxmA+XW6jOhqk7lHGRkOr7xCSs4Kk6KXs74aSi5fReHXfLmbZL1OF/UTHJLzv4GT7C9uNTBUUYIX8QuMUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YBniJEN1; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YBniJEN1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCXZW5SBFz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:09:23 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O0UpkL022399;
	Tue, 24 Sep 2024 08:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	oILC7b+VYGL8iCjP4snxl26072XF0sliYpvFhTTwAnw=; b=YBniJEN18BSR4PyP
	NkiZBLnRIXbeyy1Raf881XPhuG5N5G7GhM7FCpAM8JVTFFZb1Y1TdjIJIRH8mUuI
	pJe2f8hEdBv/XnUOPlCfP0DDhmoT2T7ib+EKl5sXQpBBDKlWEuXBLpdGxRekJc+Q
	1ADohLg4Np48nhD2w1QKj5wFEqktFokuyk5GqLeHv5KL1GyShYAXhMkqzbK00hA7
	tGEAXk/wQlpnzG/yOwIN3Bqzl0o1E5Q/r+WBO2GIomPIjnodxy2Znln5i86VPEKF
	aCKxNQ0MaFYBQTgvYMaBxHGSBZQCfZqP+e8OUilF+ChdEnM5x3m903x9y8CZcczg
	ikBkhw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41skjrgmn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:09:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48O78p5s000668;
	Tue, 24 Sep 2024 08:09:08 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41t8fujx7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 08:09:08 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48O897rG13107934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Sep 2024 08:09:08 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 97DB558059;
	Tue, 24 Sep 2024 08:09:07 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1139A58057;
	Tue, 24 Sep 2024 08:09:05 +0000 (GMT)
Received: from [9.204.204.92] (unknown [9.204.204.92])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Sep 2024 08:09:04 +0000 (GMT)
Message-ID: <71971d19-802e-4d42-88d2-512f031ebe56@linux.vnet.ibm.com>
Date: Tue, 24 Sep 2024 13:39:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug][Git-Bisect][6.11.0-next-20240917]BUG: Unable to handle
 kernel data access on read at 0xc00c020000013d88
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akpm@linux-foundation.org, minchan@kernel.org, terrelln@fb.com,
        sfr@canb.auug.org.au
References: <57130e48-dbb6-4047-a8c7-ebf5aaea93f4@linux.vnet.ibm.com>
 <20240923021557.GA38742@google.com>
 <03a55b4b-eb45-4187-9de6-ef06f8176d05@linux.vnet.ibm.com>
 <20240923152333.GB38742@google.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <20240923152333.GB38742@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8tVPCqFal_zpP5LZVPlbyqaekVs3PsBD
X-Proofpoint-ORIG-GUID: 8tVPCqFal_zpP5LZVPlbyqaekVs3PsBD
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=828 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409240053

Hi,

Test passed with the below patch.

Regards,

Venkat.

On 23/09/24 8:53 pm, Sergey Senozhatsky wrote:
> Hi,
>
> On (24/09/23 11:06), Venkat Rao Bagalkote wrote:
>> Hello,
>>
>> Below is the TC, I was running.
>>
>> https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/generic/ltp.py
> Out of curiosity, does this [1] patch fix the issue for you?
>
> [1] https://lore.kernel.org/all/20240923080211.820185-1-andrej.skvortzov@gmail.com/

