Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A398CC0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 08:43:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467g5N59rpzDqQl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:43:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467g3W2rvMzDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 16:41:43 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E6ehhn005527
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:41:40 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ucd89811j-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:41:39 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 14 Aug 2019 07:41:38 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 07:41:36 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7E6fZMf51970220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:41:35 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 204E511C05B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:41:35 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EADC11C054
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:41:34 +0000 (GMT)
Received: from [9.102.2.18] (unknown [9.102.2.18])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 06:41:34 +0000 (GMT)
Subject: Re: [PATCH v4 06/25] pseries/fadump: define register/un-register
 callback functions
To: linuxppc-dev@lists.ozlabs.org
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327675811.27462.1334913873575448846.stgit@hbathini.in.ibm.com>
 <20190812160124.jm47eu5pdhkzj2iz@in.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Wed, 14 Aug 2019 12:11:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812160124.jm47eu5pdhkzj2iz@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081406-0028-0000-0000-0000038F993D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081406-0029-0000-0000-00002451AB8A
Message-Id: <e7d75597-7f6b-0eea-f2f0-9d799d59601d@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140062
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/08/19 9:31 PM, Mahesh J Salgaonkar wrote:
> On 2019-07-16 17:02:38 Tue, Hari Bathini wrote:
>> Make RTAS calls to register and un-register for FADump. Also, update
>> how fadump_region contents are diplayed to provide more information.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/kernel/fadump-common.h          |    2 
>>  arch/powerpc/kernel/fadump.c                 |  164 ++------------------------
>>  arch/powerpc/platforms/pseries/rtas-fadump.c |  163 +++++++++++++++++++++++++-
>>  3 files changed, 176 insertions(+), 153 deletions(-)
>>
> [...]
>>  static int rtas_fadump_register_fadump(struct fw_dump *fadump_conf)
>>  {
>> -	return -EIO;
>> +	int rc, err = -EIO;
>> +	unsigned int wait_time;
>> +
>> +	/* TODO: Add upper time limit for the delay */
>> +	do {
>> +		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
>> +				NULL, FADUMP_REGISTER, &fdm,
>> +				sizeof(struct rtas_fadump_mem_struct));
>> +
>> +		wait_time = rtas_busy_delay_time(rc);
>> +		if (wait_time)
>> +			mdelay(wait_time);
>> +
>> +	} while (wait_time);
>> +
>> +	switch (rc) {
>> +	case 0:
>> +		pr_info("Registration is successful!\n");
>> +		fadump_conf->dump_registered = 1;
>> +		err = 0;
>> +		break;
>> +	case -1:
>> +		pr_err("Failed to register. Hardware Error(%d).\n", rc);
>> +		break;
>> +	case -3:
>> +		if (!is_fadump_boot_mem_contiguous(fadump_conf))
>> +			pr_err("Can't hot-remove boot memory area.\n");
>> +		else if (!is_fadump_reserved_mem_contiguous(fadump_conf))
>> +			pr_err("Can't hot-remove reserved memory area.\n");
> 
> Any reason why we changed the error messages here ? it gives an impression as
> if fadump reservation tried to hot remove memory and failed.

Yeah, the message is indeed a bit confusing. Will stick with old message..

Thanks
Hari

