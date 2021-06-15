Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F533A7902
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 10:26:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G41d056x1z3bxQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 18:26:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBiLn1He;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IBiLn1He; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G41cX6FXzz306l
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:26:19 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15F8K6uM115046; Tue, 15 Jun 2021 04:26:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+/aoATniHCn7uLv6XA7uiusCXIGmTWde0Q7ehnZuTOU=;
 b=IBiLn1HeUEbToaGHFHh7borAcniltOcSF4LOqqdOHWUNNsNOpNeCfL4qtA2r5raL4Zuq
 0fnEjY8dfekZx9lkFYojVi40ZQzUG2BcCTI/2EzclloiutylXQjiPtjGVm8x1BxY6QJw
 y4aAakByd3beHvCgwcHvJq8ajmf0/QM2VzcYvZKYW1Q+jYGYIBRSH8TKtiKj5E8ogu6U
 QAuloNquP7LKbUkIfkrV6K87UfJSR4Eq5zHwdkwjpSVhS0TUE7lKpLOuvH0VEtc6vQY8
 oumlgsX/dtSR0zC5thm11AKWPcVzb4tsdaTIdYS5jsEblpPLgUeQ+RTNTbRdss6XLAmN Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396rktg372-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 04:26:12 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15F8KZM8116626;
 Tue, 15 Jun 2021 04:26:12 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396rktg366-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 04:26:11 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15F88DIh004187;
 Tue, 15 Jun 2021 08:26:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 394mj8sbm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 08:26:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F8Q74S29753798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 08:26:07 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56A51A406A;
 Tue, 15 Jun 2021 08:26:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3476CA405F;
 Tue, 15 Jun 2021 08:26:06 +0000 (GMT)
Received: from [9.199.54.82] (unknown [9.199.54.82])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 08:26:05 +0000 (GMT)
Subject: Re: [RFC PATCH 4/8] powerpc/pseries: Consolidate DLPAR NUMA distance
 update
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210614164003.196094-1-aneesh.kumar@linux.ibm.com>
 <20210614164003.196094-5-aneesh.kumar@linux.ibm.com> <YMga6CtDlIB0wLbp@yekko>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <3b88a869-a865-6505-e4a1-9985811e8e4d@linux.ibm.com>
Date: Tue, 15 Jun 2021 13:56:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMga6CtDlIB0wLbp@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7FyyagEiXO4WmSKgPwvotLWCaf5RASNZ
X-Proofpoint-GUID: G_sR6orlHz6jL61PMMZIeJRsYKijgOoT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_04:2021-06-14,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106150049
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/15/21 8:43 AM, David Gibson wrote:
> On Mon, Jun 14, 2021 at 10:09:59PM +0530, Aneesh Kumar K.V wrote:
>> The associativity details of the newly added resourced are collected from
>> the hypervisor via "ibm,configure-connector" rtas call. Update the numa
>> distance details of the newly added numa node after the above call. In
>> later patch we will remove updating NUMA distance when we are looking
>> for node id from associativity array.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/mm/numa.c                        | 41 +++++++++++++++++++
>>   arch/powerpc/platforms/pseries/hotplug-cpu.c  |  2 +
>>   .../platforms/pseries/hotplug-memory.c        |  2 +
>>   arch/powerpc/platforms/pseries/pseries.h      |  1 +
>>   4 files changed, 46 insertions(+)
>>
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 192067991f8a..fec47981c1ef 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -287,6 +287,47 @@ int of_node_to_nid(struct device_node *device)
>>   }
>>   EXPORT_SYMBOL(of_node_to_nid);
>>   
>> +static void __initialize_form1_numa_distance(const __be32 *associativity)
>> +{
>> +	int i, nid;
>> +
>> +	if (of_read_number(associativity, 1) >= primary_domain_index) {
>> +		nid = of_read_number(&associativity[primary_domain_index], 1);
>> +
>> +		for (i = 0; i < max_domain_index; i++) {
>> +			const __be32 *entry;
>> +
>> +			entry = &associativity[be32_to_cpu(distance_ref_points[i])];
>> +			distance_lookup_table[nid][i] = of_read_number(entry, 1);
>> +		}
>> +	}
>> +}
> 
> This logic is almost identicaly to initialize_distance_lookup_table()
> - it would be good if they could be consolidated, so it's clear that
> coldplugged and hotplugged nodes are parsing the NUMA information in
> the same way.

initialize_distance_lookup_table() gets removed in the next patch.

-aneesh
