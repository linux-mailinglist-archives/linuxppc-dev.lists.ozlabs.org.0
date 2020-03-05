Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7896179EEA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 06:09:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XzMG0YfSzDqn2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 16:09:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XzJ8047xzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 16:07:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0254wYc6026550
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 5 Mar 2020 00:06:59 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj4q1y45b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 00:06:58 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Thu, 5 Mar 2020 05:06:56 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 05:06:50 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02556ma238338688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 05:06:48 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A000EA4051;
 Thu,  5 Mar 2020 05:06:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BD0DA4053;
 Thu,  5 Mar 2020 05:06:41 +0000 (GMT)
Received: from [9.199.61.135] (unknown [9.199.61.135])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 05:06:40 +0000 (GMT)
Subject: Re: [RFC 00/11] perf: Enhancing perf to export processor hazard
 information
To: Andi Kleen <ak@linux.intel.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302101332.GS18400@hirez.programming.kicks-ass.net>
 <20200303013329.GB1319864@tassilo.jf.intel.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Thu, 5 Mar 2020 10:36:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303013329.GB1319864@tassilo.jf.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20030505-0008-0000-0000-00000359772C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030505-0009-0000-0000-00004A7AACFD
Message-Id: <aaab8c6a-a02a-f96b-ec43-e9694c8aad02@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=952
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050028
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
Cc: mark.rutland@arm.com, Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 maddy@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, eranian@google.com, adrian.hunter@intel.com,
 alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, acme@kernel.org, robert.richter@amd.com, namhyung@kernel.org,
 kim.phillips@amd.com, linuxppc-dev@lists.ozlabs.org,
 alexey.budankov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andi,

Sorry for being bit late.

On 3/3/20 7:03 AM, Andi Kleen wrote:
> On Mon, Mar 02, 2020 at 11:13:32AM +0100, Peter Zijlstra wrote:
>> On Mon, Mar 02, 2020 at 10:53:44AM +0530, Ravi Bangoria wrote:
>>> Modern processors export such hazard data in Performance
>>> Monitoring Unit (PMU) registers. Ex, 'Sampled Instruction Event
>>> Register' on IBM PowerPC[1][2] and 'Instruction-Based Sampling' on
>>> AMD[3] provides similar information.
>>>
>>> Implementation detail:
>>>
>>> A new sample_type called PERF_SAMPLE_PIPELINE_HAZ is introduced.
>>> If it's set, kernel converts arch specific hazard information
>>> into generic format:
>>>
>>>    struct perf_pipeline_haz_data {
>>>           /* Instruction/Opcode type: Load, Store, Branch .... */
>>>           __u8    itype;
>>>           /* Instruction Cache source */
>>>           __u8    icache;
>>>           /* Instruction suffered hazard in pipeline stage */
>>>           __u8    hazard_stage;
>>>           /* Hazard reason */
>>>           __u8    hazard_reason;
>>>           /* Instruction suffered stall in pipeline stage */
>>>           __u8    stall_stage;
>>>           /* Stall reason */
>>>           __u8    stall_reason;
>>>           __u16   pad;
>>>    };
>>
>> Kim, does this format indeed work for AMD IBS?
> 
> Intel PEBS has a similar concept for annotation of memory accesses,
> which is already exported through perf_mem_data_src. This is essentially
> an extension. It would be better to have something unified here.
> Right now it seems to duplicate at least part of the PEBS facility.

IIUC there is a distinction from perf mem vs exposing the pipeline details.
perf-mem/perf_mem_data_src is more of memory accesses profiling. And proposal
here is to expose pipeline related details like stalls and latencies. Would
prefer/suggest not to extend the current structure further to capture pipeline
details.

Ravi

