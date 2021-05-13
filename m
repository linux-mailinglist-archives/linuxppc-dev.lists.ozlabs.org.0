Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFE37F7E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 14:27:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgrWj0R71z3byv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 22:27:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PerPeYqc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PerPeYqc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgrW92Vqfz2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 22:26:44 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14DCNBxV119669; Thu, 13 May 2021 08:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=U/4Dpg6rGeqjovo2MNoB7wa0IvLzTG7wFV72MKbtHnY=;
 b=PerPeYqc/oSWFWodyRXsCBsU22HDaaCjzzEgxW+LuVbfxsL9bOIzFQ4vHbJCKU4Iuxd9
 z4XLk1I3YO9h2EOExeRkNRCP+CIXX7Ml18nfH0N8KfSxnUGgOun6kpDvIONSbpvEF7Ih
 KiDRQCI5s7+G4roNhFAGnYfEMunpoZFs9PIMGIzEGeqLLjrxYX6dAhd8dnKHN90gYeBH
 dNC1kupnEUPd5YKCNQEiZIFQWC9DNrjpaWG4EPl5A9XTI/Z3SLHvoQzvw+GKXtvVWdYx
 oRTjOS5GRfgusS1tiJQtLczYOhYZWYYXyxgomTmLcTwl3vazMwj6GkMEO6BI5DltkyA5 Aw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38h2m5ah2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 May 2021 08:26:29 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14DCCppv026233;
 Thu, 13 May 2021 12:26:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 38dj9a5xav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 May 2021 12:26:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14DCQQum16777672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 12:26:26 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CFC7BE04F;
 Thu, 13 May 2021 12:26:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0515EBE05A;
 Thu, 13 May 2021 12:26:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.44.200])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 13 May 2021 12:26:16 +0000 (GMT)
Subject: Re: [RFC 1/4] drivers/nvdimm: Add perf interface to expose nvdimm
 performance stats
To: Peter Zijlstra <peterz@infradead.org>
References: <20210512163824.255370-1-kjain@linux.ibm.com>
 <20210512163824.255370-2-kjain@linux.ibm.com>
 <YJwP9ByvAcDPixVN@hirez.programming.kicks-ass.net>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <37015d53-050a-acef-2958-b1ff5d02800b@linux.ibm.com>
Date: Thu, 13 May 2021 17:56:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJwP9ByvAcDPixVN@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EvtomYgSIUC0jAMqMvwF4gaUntt7Qasr
X-Proofpoint-GUID: EvtomYgSIUC0jAMqMvwF4gaUntt7Qasr
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-13_06:2021-05-12,
 2021-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105130093
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, ira.weiny@intel.com,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/12/21 10:57 PM, Peter Zijlstra wrote:
> On Wed, May 12, 2021 at 10:08:21PM +0530, Kajol Jain wrote:
>> +static void nvdimm_pmu_read(struct perf_event *event)
>> +{
>> +	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>> +
>> +	/* jump to arch/platform specific callbacks if any */
>> +	if (nd_pmu && nd_pmu->read)
>> +		nd_pmu->read(event, nd_pmu->dev);
>> +}
>> +
>> +static void nvdimm_pmu_del(struct perf_event *event, int flags)
>> +{
>> +	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>> +
>> +	/* jump to arch/platform specific callbacks if any */
>> +	if (nd_pmu && nd_pmu->del)
>> +		nd_pmu->del(event, flags, nd_pmu->dev);
>> +}
>> +
>> +static int nvdimm_pmu_add(struct perf_event *event, int flags)
>> +{
>> +	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
>> +
>> +	if (flags & PERF_EF_START)
>> +		/* jump to arch/platform specific callbacks if any */
>> +		if (nd_pmu && nd_pmu->add)
>> +			return nd_pmu->add(event, flags, nd_pmu->dev);
>> +	return 0;
>> +}
> 
> What's the value add here? Why can't you directly set driver pointers? I
> also don't really believe ->{add,del,read} can be optional and still
> have a sane driver.
> 

Hi Peter,

  The intend for adding these callbacks  is to give flexibility to the
arch/platform specific driver code to use its own routine for getting 
counter data or specific checks/operations. Arch/platform driver code
would have different method to get the counter data like IBM pseries
nmem* device which uses a hypervisor call(hcall).

But yes the current read/add/del functions are not adding value. We
could  add an arch/platform specific function which could handle the
capturing of the counter data and do the rest of the operation here,
is this approach better?

Thanks,
Kajol Jain



