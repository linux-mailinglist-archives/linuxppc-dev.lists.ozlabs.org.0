Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A41778FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 15:33:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wzyy5mMwzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 01:33:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wzwr2cSMzDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 01:31:55 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 023ELrlC021808
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Mar 2020 09:31:53 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfhqr0gpx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 09:31:52 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 3 Mar 2020 14:31:49 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Mar 2020 14:31:44 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 023EVh0540829204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Mar 2020 14:31:43 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F058AA405B;
 Tue,  3 Mar 2020 14:31:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 799C8A4054;
 Tue,  3 Mar 2020 14:31:32 +0000 (GMT)
Received: from [9.199.50.120] (unknown [9.199.50.120])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Mar 2020 14:31:32 +0000 (GMT)
Subject: Re: [RFC 02/11] perf/core: Data structure to present hazard data
To: Mark Rutland <mark.rutland@arm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302052355.36365-3-ravi.bangoria@linux.ibm.com>
 <20200302145434.GE56497@lakrids.cambridge.arm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Tue, 3 Mar 2020 20:01:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302145434.GE56497@lakrids.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030314-0008-0000-0000-00000358F4D8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030314-0009-0000-0000-00004A7A23F7
Message-Id: <767373d8-c291-9794-61b1-8917c300c730@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-03_05:2020-03-03,
 2020-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030110
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, ak@linux.intel.com,
 maddy@linux.ibm.com, peterz@infradead.org, jolsa@redhat.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 eranian@google.com, adrian.hunter@intel.com,
 alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, acme@kernel.org, robert.richter@amd.com, namhyung@kernel.org,
 kim.phillips@amd.com, linuxppc-dev@lists.ozlabs.org,
 alexey.budankov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/2/20 8:24 PM, Mark Rutland wrote:
>> @@ -870,6 +871,13 @@ enum perf_event_type {
>>   	 *	{ u64			phys_addr;} && PERF_SAMPLE_PHYS_ADDR
>>   	 *	{ u64			size;
>>   	 *	  char			data[size]; } && PERF_SAMPLE_AUX
>> +	 *	{ u8			itype;
>> +	 *	  u8			icache;
>> +	 *	  u8			hazard_stage;
>> +	 *	  u8			hazard_reason;
>> +	 *	  u8			stall_stage;
>> +	 *	  u8			stall_reason;
>> +	 *	  u16			pad;} && PERF_SAMPLE_PIPELINE_HAZ
>>   	 * };
> 
> The existing comment shows the aux data *immediately* after ther
> phys_addr field, where you've placed struct perf_pipeline_haz_data.
> 
> If adding to struct perf_sample_data is fine, this needs to come before
> the aux data in this comment. If adding to struct perf_sample_data is
> not fine. struct perf_pipeline_haz_data cannot live there.
> 
> I suspect the latter is true, but you're getting away with it because
> you're not using both PERF_SAMPLE_AUX and PERF_SAMPLE_PIPELINE_HAZ
> simultaneously.

Right. Thanks for pointing it out. Will change it.

Ravi

