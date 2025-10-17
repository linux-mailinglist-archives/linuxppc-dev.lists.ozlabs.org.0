Return-Path: <linuxppc-dev+bounces-12976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65069BE668E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 07:26:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cntZy0qF8z3cQx;
	Fri, 17 Oct 2025 16:26:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760678761;
	cv=none; b=dVnRjthw6nanNZo4ToQYWpQhWKQ9Kb93D5eJWKQpQLdEsp8QxU1AGwYP0KQyqF8lTaN4ubkVSqgdDLmYX+xjIeMn1psIG8PUdtbnPNGkAyCrK6at4ivnKKYIpCY0trmv0RN5TXg8BQouK0VvpZ30GLctokw8ycRh5ZhxGpoxkFsww4JXkvFXuRwQuLpOJnDSSZRdKdeHKj9KmTu5BFn3a6UnDyinv4A8Okb3P5ZPJz0yztoHjgM4/ZU8XXCYSjEP7zHNJQct1ah6iNlibA84v2WIRWF86ZGtolvTcaPzB5Op5hMXQK6p28auGcDWYIkPZfx5sDeM7aprl85mggB8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760678761; c=relaxed/relaxed;
	bh=nN7TiAZ/MGjE7/97TqtyN6BIKmWAZdJXWKjKQPiHAFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwYjzFs7EL1Cr6glulKCoELAjNwZrNlioyTsCAUXhHtwEF4pWqqavuqTNEocyXk+TwOVTY96a9eT5nCk1yujaitekBk3YySnUWsbji3p2tnrCsyDTpxCTWJ9HFClonwxOhBCO7fwM57pOdQtst793RiTvvtnvlE+xsvaqcaxk1yg21wPXxQ7f81u3ObHQhSivM/Ik6EJh1UGno5EH5ehE95CKPV3tcLyYvpM3RvcIWoOIUX42VsHeNKRJKhZxmc+6XTmXvc0dzsc26YcJoLA70qXwwxzPeRq1cuq80PeEFXz8V5bVlslj6pzDmkqkKZnP/v5jwT+/k8gGlrbquh1cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HObBw0uN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HObBw0uN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cntZx2Tllz3069
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 16:26:00 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GIm0tQ021709;
	Fri, 17 Oct 2025 05:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nN7TiA
	Z/MGjE7/97TqtyN6BIKmWAZdJXWKjKQPiHAFo=; b=HObBw0uNuMIMUfvHVlr9Ah
	QbdYTWYTsEt4SVh/I2jPSi5ADASxYNCxVZ/Xcd+YmacvwhmlRsFesXpdfpp5RlL5
	Qta93r8srROcm3niCb7DYJTT0VNkpM6d0vemO0lf3wdvpIrDTPHvYCHqBhNNKCrw
	w8O281tKaB4VoCyoaysNqNDlYpVsCRCOkaODZrlgRG2csCPAXD58DchPT8bFgi5k
	ky+wueyruJh2kE4j9ky4DOHMXyfg6CsNMohUWrbR9/pPFNk/ovK1K/9z0Yv9M+SW
	A3VdY9xaCXp9BuaBQB/zwyGcJgEAYRoXSZ//ByPqIjQ4m1EV5oT/8FTGri0mRfyQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey96ynh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:25:48 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59H5PYws022298;
	Fri, 17 Oct 2025 05:25:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey96yne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:25:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59H0i75i028035;
	Fri, 17 Oct 2025 05:25:46 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49tdg9gp4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:25:46 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59H5Pipc33620358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 05:25:44 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA6F058062;
	Fri, 17 Oct 2025 05:25:44 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1CED5805D;
	Fri, 17 Oct 2025 05:25:38 +0000 (GMT)
Received: from [9.124.220.117] (unknown [9.124.220.117])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Oct 2025 05:25:38 +0000 (GMT)
Message-ID: <29051a26-d0c5-4ec0-97e8-e32e17a9a6ba@linux.ibm.com>
Date: Fri, 17 Oct 2025 10:55:37 +0530
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
Subject: Re: [PATCH v2 1/2] drivers/base/node: Fold register_node() into
 register_one_node()
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>
References: <cover.1760097207.git.donettom@linux.ibm.com>
 <910853c9dd61f7a2190a56cba101e73e9c6859be.1760097207.git.donettom@linux.ibm.com>
 <ed99ffc0-4a70-416d-9bf3-58c4a3ebe566@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <ed99ffc0-4a70-416d-9bf3-58c4a3ebe566@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xL6UujgZrapbJuP98DZf3K-Jzahsg6az
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMSBTYWx0ZWRfX6tW0gdb9eF+u
 NAv4+LuGdkIRfOPXperOzmunxpsCGYvs/UJGU92YP4QtUt+QStkTILJT4rcRXedz5AvvgAG4K8w
 l5TT5j4wIm8gfPXwkbOub8335Xa9FUK863fVMC8VrU0R6dsOa2+fK4zr9gLnPlYRXlnTwnQOGBo
 HJPyrGlr+Hd6OZYk5AA7zh2IF2vNenv0zsyVlJIh6ljdMv5jZeXGLk+k32VYAVLjwc+1yb/8MI2
 Kj5c1xWYTC/9FkD6SC/4luGVgGisdYQuK5fQSEstlBolValozO12Cypk7aI0/hCZL0xupWtP7Mx
 ishjIZGV9M2M2Hp8xO1OJGRb/rPPgMC96LymYUccHn/yO+l6asMkscjJLTtF5A0+bd6ASk8xoPA
 5TLwDPLELFXOCDAEtuwD9aWqcgP0oQ==
X-Proofpoint-GUID: MRs_fUSnLc8GKSOeDOtnOPvNauEZyTiz
X-Authority-Analysis: v=2.4 cv=QZ5rf8bv c=1 sm=1 tr=0 ts=68f1d35c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=p1EqsZHEuOmFBkmSmkgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110011
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 10/15/25 6:06 PM, David Hildenbrand wrote:
> On 14.10.25 17:39, Donet Tom wrote:
>> The function register_node() is only called from register_one_node().
>> This patch folds register_node() into its only caller and renames
>> register_one_node() to register_node().
>>
>> This reduces unnecessary indirection and simplifies the code structure.
>> No functional changes are introduced.
>>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
> [...]
>
>>   /**
>>    * unregister_node - unregister a node device
>>    * @node: node going away
>> @@ -907,7 +880,13 @@ void 
>> register_memory_blocks_under_node_hotplug(int nid, unsigned long 
>> start_pfn,
>>   }
>>   #endif /* CONFIG_MEMORY_HOTPLUG */
>>   -int register_one_node(int nid)
>> +/**
>> + * register_node - Initialize and register the node device.
>> + * @nid - Node number to use when creating the device.
>>
>
> I assume that should be "@nid: ..." to silence the warning.
>
>

Thank you, David, for pointing this out. Andrew has already applied the fix.

>
> Acked-by: David Hildenbrand <david@redhat.com>
>

