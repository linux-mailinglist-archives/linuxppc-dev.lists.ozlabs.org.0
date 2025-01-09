Return-Path: <linuxppc-dev+bounces-4904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 719FFA07182
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 10:32:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTKM64r4Nz2x9g;
	Thu,  9 Jan 2025 20:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736415154;
	cv=none; b=ehlKSBfk0YA37MC8sJxt08HjdlP0erfmDBTYsBN4eeD4lQ8FRjyZymKazljmeKERoC5FgtvtrN/oupBpQRZieX3/mzgmbgkyVu2rmxlhELa9kh8rJYs1fLcLyzaiz4ZifyGMeyNxzSeg6579uEWJ3VeL53pPkr0aW3AHgiNHepK3g5DaRyFPjw4fVM//YoEu7oz3Zp1WoVjRzLilk4yqLJhR0RovIcseIXiwDsCYIngLJHhrbfCZd8fR64qqCqHOAcZnaUhTAUYcGC35/occniXW5p4ARLrI/WwFGZoOD/oVVzOCxbiJrxE3tRX3gNUD36DrUiN4Pj9VD4OuAqMQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736415154; c=relaxed/relaxed;
	bh=TM2ClJZutm7Aq3hTBZSfu00wdUkqm0nMCkrCjKxDrvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQ72WNuUpkEbqoxH8aLYwsCKwKzmLb881KPjZ2B+pnM4lLcYCFdQ60wgAbvbSooVfjz30sW5G+PY/2O8mmxBmEFNZwS/Oq8v0E1T+ax7csW3zG9Fc0wKdfrN54uN3bYq9EIGD8CnKZL+aZA0SFVRWmU3IXBTzpsxc5sUU9Z3gaRXJgdCdAnPbNTl95HLmuomHDuK1YXJN80qLG7kuRnyuRmvSWB/MN61COyfDBERvUfAPB7Ak0Fd4Zg5DbUP2onfJIFHSLAxcYuzylWfKnGwL9ZPjgWYfnmbS+cT8fu6puQ7p2dEDvJCk97BhS8WyhsA8oJ3m1q6wpNbIRnBfxNUDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l2KDt8WM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l2KDt8WM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTKM508NHz3bVF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 20:32:32 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Nb6cx027769;
	Thu, 9 Jan 2025 09:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TM2ClJ
	Zutm7Aq3hTBZSfu00wdUkqm0nMCkrCjKxDrvo=; b=l2KDt8WMs+ApDEa7WA354t
	hNhY3uU/6My0ZNHqmXuGOiXQ8pu9DXfBnNNvDm0dHn32u9Y2IHH+ek4RWG3AGUMI
	bQYTGScbJHhuOX4H/fQmXZ9luTSevehBfFLfzjZoEftuQxZ8wGRwLTgEocA+Fy5o
	tU7vSqevupSfTXYy0qJFEDdFzrdDO8k6c4iNOBoXKMd6KmHq7929d3mz1xQUxkl7
	WZAnZnn+xCHpZDcM9A/JKBRSrG0gVJGOsJDZ8JBDOWlPRoQy5mZQJupKf9dwe7kM
	GsDxcoWzJ4pgw+Nu2FEOM8xw/zPXBwxSDU6msag7lQ9P7qmzxhsCN9RWK42opSOg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44236b229r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:32:21 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50994R3V013576;
	Thu, 9 Jan 2025 09:32:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygap4du0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:32:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5099WDJL20119818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 09:32:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C89320049;
	Thu,  9 Jan 2025 09:32:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D196720040;
	Thu,  9 Jan 2025 09:32:11 +0000 (GMT)
Received: from [9.43.18.121] (unknown [9.43.18.121])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jan 2025 09:32:11 +0000 (GMT)
Message-ID: <f378799c-fc7e-4fc0-a766-2960ae58c7fa@linux.ibm.com>
Date: Thu, 9 Jan 2025 15:02:10 +0530
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
Subject: Re: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
To: Michael Ellerman <mpe@ellerman.id.au>,
        Avnish Chouhan <avnish@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: brking@linux.ibm.com, meghanaprakash@in.ibm.com, maddy@linux.ibm.com
References: <20241206065545.14815-1-avnish@linux.ibm.com>
 <87ser05k5z.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87ser05k5z.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fHmFdTraIo5UoWx5LyfAFhq6uC2UCNLK
X-Proofpoint-ORIG-GUID: fHmFdTraIo5UoWx5LyfAFhq6uC2UCNLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=762 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090076
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Michael,

On 07/12/24 07:28, Michael Ellerman wrote:
> Avnish Chouhan <avnish@linux.ibm.com> writes:
>> Change RMA size from 512 MB to 768 MB which will result
>> in more RMA at boot time for PowerPC.
> Did you consider just increasing it to 1GB?

I see an impact of setting RMA to 1GB on fadump. Here’s how:

The minimum reservation recommended by us for fadump is 768MB.
In this case, the boot_mem_top in fadump.c will be 768MB, and the
memory reservation for fadump will start from a 768MB offset.

Now, let’s say the production kernel crashes, and the firmware copies
the 0–768MB region to the fadump reserved area and boots the fadump
kernel to capture the dump.

If RMA is set to 1GB, it will allow GRUB to use memory up to 1GB. In such
a case, there is a possibility that GRUB could corrupt the fadump 
reserved area.

Thanks,
Sourabh Jain

