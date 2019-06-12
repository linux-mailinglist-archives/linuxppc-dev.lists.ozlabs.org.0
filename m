Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35A41BE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 08:00:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nx7S1MjgzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 16:00:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nx5K6Z7YzDqGx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 15:59:01 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5C5uoUC106503
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 01:58:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t2tu7a1tn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 01:58:58 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Wed, 12 Jun 2019 06:58:57 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 06:58:54 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5C5wkma26935742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 05:58:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E1CC42045;
 Wed, 12 Jun 2019 05:58:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B5DE4203F;
 Wed, 12 Jun 2019 05:58:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.156.130])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Jun 2019 05:58:52 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/perf: Use cpumask_last() to determine the
 designated cpu for nest/core units.
To: Leonardo Bras <leonardo@linux.ibm.com>, mpe@ellerman.id.au
References: <20190610063229.32560-1-anju@linux.vnet.ibm.com>
 <181424243e879218b732034f6014ac4af5c68285.camel@linux.ibm.com>
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Date: Wed, 12 Jun 2019 11:28:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <181424243e879218b732034f6014ac4af5c68285.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19061205-4275-0000-0000-000003418F1C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061205-4276-0000-0000-00003851A405
Message-Id: <389178de-1d00-d29b-6825-c0be0861d55b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120041
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
Cc: ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Leonardo,

On 6/11/19 12:17 AM, Leonardo Bras wrote:
> On Mon, 2019-06-10 at 12:02 +0530, Anju T Sudhakar wrote:
>> Nest and core imc(In-memory Collection counters) assigns a particular
>> cpu as the designated target for counter data collection.
>> During system boot, the first online cpu in a chip gets assigned as
>> the designated cpu for that chip(for nest-imc) and the first online cpu
>> in a core gets assigned as the designated cpu for that core(for core-imc).
>>
>> If the designated cpu goes offline, the next online cpu from the same
>> chip(for nest-imc)/core(for core-imc) is assigned as the next target,
>> and the event context is migrated to the target cpu.
>> Currently, cpumask_any_but() function is used to find the target cpu.
>> Though this function is expected to return a `random` cpu, this always
>> returns the next online cpu.
>>
>> If all cpus in a chip/core is offlined in a sequential manner, starting
>> from the first cpu, the event migration has to happen for all the cpus
>> which goes offline. Since the migration process involves a grace period,
>> the total time taken to offline all the cpus will be significantly high.
> Seems like a very interesting work.
> Out of curiosity, have you used 'chcpu -d' to create your benchmark?

Here I did not use chcpu to disable the cpu.

I used a script which will offline cpus 88-175 by echoing  `0` to

/sys/devices/system/cpu/cpu*/online.


Regards,

Anju


