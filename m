Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D768385
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 08:24:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nD5371QfzDqHm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 16:24:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nD382lMMzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 16:22:27 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6F6M9eh046556
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 02:22:23 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2trj8qbv8b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 02:22:23 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Mon, 15 Jul 2019 07:22:21 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Jul 2019 07:22:19 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6F6MISp39911886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jul 2019 06:22:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9601952057;
 Mon, 15 Jul 2019 06:22:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.126.30.134])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id EDF7152059;
 Mon, 15 Jul 2019 06:22:17 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/imc: Dont create debugfs files for cpu-less
 nodes
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20190702092112.4015-1-maddy@linux.vnet.ibm.com>
 <87d0ihgojp.fsf@concordia.ellerman.id.au>
From: maddy <maddy@linux.vnet.ibm.com>
Date: Mon, 15 Jul 2019 11:52:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87d0ihgojp.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19071506-4275-0000-0000-0000034D07A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071506-4276-0000-0000-0000385D14F2
Message-Id: <cfb89a0b-8f70-8a19-2b14-c93d46b2b900@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907150074
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
Cc: Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/11/19 10:23 AM, Michael Ellerman wrote:
> Hi Maddy,
>
> Madhavan Srinivasan <maddy@linux.vnet.ibm.com> writes:
>> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
>> index 186109bdd41b..e04b20625cb9 100644
>> --- a/arch/powerpc/platforms/powernv/opal-imc.c
>> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
>> @@ -69,20 +69,20 @@ static void export_imc_mode_and_cmd(struct device_node *node,
>>   	if (of_property_read_u32(node, "cb_offset", &cb_offset))
>>   		cb_offset = IMC_CNTL_BLK_OFFSET;
>>   
>> -	for_each_node(nid) {
>> -		loc = (u64)(pmu_ptr->mem_info[chip].vbase) + cb_offset;
>> +	while (ptr->vbase != NULL) {
> This means you'll bail out as soon as you find a node with no vbase, but
> it's possible we could have a CPU-less node intermingled with other
> nodes.
Nice catch. Thanks for the review, will fix it.

Maddy

>
> So I think you want to keep the for loop, but continue if you see a NULL
> vbase?
>
>
>> +		loc = (u64)(ptr->vbase) + cb_offset;
>>   		imc_mode_addr = (u64 *)(loc + IMC_CNTL_BLK_MODE_OFFSET);
>> -		sprintf(mode, "imc_mode_%d", nid);
>> +		sprintf(mode, "imc_mode_%d", (u32)(ptr->id));
>>   		if (!imc_debugfs_create_x64(mode, 0600, imc_debugfs_parent,
>>   					    imc_mode_addr))
>>   			goto err;
>>   
>>   		imc_cmd_addr = (u64 *)(loc + IMC_CNTL_BLK_CMD_OFFSET);
>> -		sprintf(cmd, "imc_cmd_%d", nid);
>> +		sprintf(cmd, "imc_cmd_%d", (u32)(ptr->id));
>>   		if (!imc_debugfs_create_x64(cmd, 0600, imc_debugfs_parent,
>>   					    imc_cmd_addr))
>>   			goto err;
>> -		chip++;
>> +		ptr++;
>>   	}
>>   	return;
> cheers
>

