Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 388CA292227
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 07:28:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF4z13fMHzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 16:27:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PIHM+ntz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CF4xN4f9KzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 16:26:32 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09J53JYc069816; Mon, 19 Oct 2020 01:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uzkqErjeNqwQx+7pJF/5/F7vENlKNJCUN5Tt+L3Ucw4=;
 b=PIHM+ntz7NCIwOyAbFyZy7PcM1kwY5f05VItWboBgnPJhvvWRG7upmHdpaDZjpaFQ+sy
 BPZJOOo5ya4YK5zoEqcL9w0ySfdGVxrKIhsydXuVOzOstTdlEGKadsziZpUQC7sEDbeM
 zvsBdoymNzYzMFIPHx7Esx8b6KOvqWg8y1ZxRMbsryO9bpLmbv73Lb6Dz4nlsWAWB+vY
 jRFeomWh53qZ04QvMAvex/6wXuAKTiJc+RECxNEnJTVbqCl+QEn4kG46PG2WBneWz0RD
 RW9gbk+bRgKT/HPNoby+J5YYlTFH1ovCuxaTSibxlbBa+hUhZGEe9UxF02Cb7629BLiW nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3490banc9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 01:26:26 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09J53Vjp070577;
 Mon, 19 Oct 2020 01:26:26 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3490banc8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 01:26:26 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09J5MqpR005521;
 Mon, 19 Oct 2020 05:26:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 347r880vjw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Oct 2020 05:26:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09J5QLgZ22872554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Oct 2020 05:26:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 822BAA4060;
 Mon, 19 Oct 2020 05:26:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 174DDA405C;
 Mon, 19 Oct 2020 05:26:19 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.18.74])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 19 Oct 2020 05:26:18 +0000 (GMT)
Subject: Re: [PATCH v4 0/2] powerpc/mce: Fix mce handler and add selftest
To: Michael Ellerman <patch-notifications@ellerman.id.au>, mpe@ellerman.id.au, 
 linuxppc-dev@lists.ozlabs.org
References: <20201009064005.19777-1-ganeshgr@linux.ibm.com>
 <160284791867.1794337.3709853894956238598.b4-ty@ellerman.id.au>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <b31a5269-98d4-fb78-9a10-47995dcd55de@linux.ibm.com>
Date: Mon, 19 Oct 2020 10:56:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160284791867.1794337.3709853894956238598.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-18_13:2020-10-16,
 2020-10-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=910 lowpriorityscore=0 adultscore=0 clxscore=1011 mlxscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010190041
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
Cc: msuchanek@suse.de, mahesh@linux.ibm.com, npiggin@gmail.com,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/16/20 5:02 PM, Michael Ellerman wrote:

> On Fri, 9 Oct 2020 12:10:03 +0530, Ganesh Goudar wrote:
>> This patch series fixes mce handling for pseries, Adds LKDTM test
>> for SLB multihit recovery and enables selftest for the same,
>> basically to test MCE handling on pseries/powernv machines running
>> in hash mmu mode.
>>
>> v4:
>> * Use radix_enabled() to check if its in Hash or Radix mode.
>> * Use FW_FEATURE_LPAR instead of machine_is_pseries().
>>
>> [...]
> Patch 1 applied to powerpc/fixes.
>
> [1/2] powerpc/mce: Avoid nmi_enter/exit in real mode on pseries hash
>        https://git.kernel.org/powerpc/c/8d0e2101274358d9b6b1f27232b40253ca48bab5
>
> cheers
Thank you, Any comments on patch 2.
