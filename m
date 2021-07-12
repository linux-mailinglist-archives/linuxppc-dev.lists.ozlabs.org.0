Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78F3C45E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 09:43:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNbP30JrTz3086
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jul 2021 17:43:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjjl8vvm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mjjl8vvm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNbNV3PJjz2yY0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 17:43:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16C7XKTF120244; Mon, 12 Jul 2021 03:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vRruuTVTYuGPRDvelRjhh0we5OahUAhmoZY8I/d+IIc=;
 b=mjjl8vvmtV2ASkSzOlVMabXitYsXtVahr/3DXvFyan8wzdQfuKloliyACWBHooXUuLiy
 6W7S129HT7hrNjfn1+ia0D9My23hWpdvx9m42FbryV7e33nHc23VAz45F/LLoapTf/15
 5anMMIyEcEuggJGpXtwWqQH/7InXnlUi02CQniWqrYF8vknsdU+67PLGZuuPd6aREiNd
 LtjA4oQB0PHMRRZZZITKt0U/77w5xD+S+WgiLWu+oehg5vkbPNmtlVejwncB5fF5HvDR
 fXqvOaXiNeIuMpkU+0lq3/uUnivbS5ytEsVkl3Wi7nx8MooyyvkfuvMlgTQfulg8P9FS DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmbhbje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 03:43:10 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C7aQro132417;
 Mon, 12 Jul 2021 03:43:10 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrmbhbhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 03:43:10 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16C7h7CR010058;
 Mon, 12 Jul 2021 07:43:07 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 39q3688b2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jul 2021 07:43:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16C7h5DB17236258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 07:43:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1CD011C04A;
 Mon, 12 Jul 2021 07:43:04 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9441311C050;
 Mon, 12 Jul 2021 07:43:03 +0000 (GMT)
Received: from [9.102.2.188] (unknown [9.102.2.188])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Jul 2021 07:43:03 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
To: ego@linux.vnet.ibm.com
References: <20210706082400.36996-1-psampat@linux.ibm.com>
 <20210706082400.36996-2-psampat@linux.ibm.com>
 <20210708103543.GA20804@in.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <7c360913-3215-e99b-0d58-adc604bb1d8f@linux.ibm.com>
Date: Mon, 12 Jul 2021 13:13:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708103543.GA20804@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rR_yTr7oF4EYrtgH5GAeb49w1d1EUlzo
X-Proofpoint-GUID: wgK3EzQJU447VIdAwaTq-tYQ6Hrj5vee
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-12_04:2021-07-12,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120059
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
Cc: pratik.r.sampat@gmail.com, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/21 4:05 pm, Gautham R Shenoy wrote:
> Hello Pratik,
>
> On Tue, Jul 06, 2021 at 01:54:00PM +0530, Pratik R. Sampat wrote:
>> Adds a generic interface to represent the energy and frequency related
>> PAPR attributes on the system using the new H_CALL
>> "H_GET_ENERGY_SCALE_INFO".
>>
>> H_GET_EM_PARMS H_CALL was previously responsible for exporting this
>> information in the lparcfg, however the H_GET_EM_PARMS H_CALL
>> will be deprecated P10 onwards.
>>
>> The H_GET_ENERGY_SCALE_INFO H_CALL is of the following call format:
>> hcall(
>>    uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
>>    uint64 flags,           // Per the flag request
>>    uint64 firstAttributeId,// The attribute id
>>    uint64 bufferAddress,   // Guest physical address of the output buffer
>>    uint64 bufferSize       // The size in bytes of the output buffer
>> );
>>
>> This H_CALL can query either all the attributes at once with
>> firstAttributeId = 0, flags = 0 as well as query only one attribute
>> at a time with firstAttributeId = id, flags = 1.
>>
>> The output buffer consists of the following
>> 1. number of attributes              - 8 bytes
>> 2. array offset to the data location - 8 bytes
>> 3. version info                      - 1 byte
>> 4. A data array of size num attributes, which contains the following:
>>    a. attribute ID              - 8 bytes
>>    b. attribute value in number - 8 bytes
>>    c. attribute name in string  - 64 bytes
>>    d. attribute value in string - 64 bytes
>>
>> The new H_CALL exports information in direct string value format, hence
>> a new interface has been introduced in
>> /sys/firmware/papr/energy_scale_info to export this information to
>> userspace in an extensible pass-through format.
>>
>> The H_CALL returns the name, numeric value and string value (if exists)
>>
>> The format of exposing the sysfs information is as follows:
>> /sys/firmware/papr/energy_scale_info/
>>     |-- <id>/
>>       |-- desc
>>       |-- value
>>       |-- value_desc (if exists)
>>     |-- <id>/
>>       |-- desc
>>       |-- value
>>       |-- value_desc (if exists)
>> ...
>
> I like this implementation. Only one comment w.r.t versioning below:
>
> [..snip..]
>
>> @@ -631,6 +632,26 @@ struct hv_gpci_request_buffer {
>>   	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
>>   } __packed;
>>
>> +#define MAX_ESI_ATTRS	10
>> +#define MAX_BUF_SZ	(sizeof(struct h_energy_scale_info_hdr) + \
>> +			(sizeof(struct energy_scale_attribute) * MAX_ESI_ATTRS))
>> +
>> +struct energy_scale_attribute {
>> +	__be64 id;
>> +	__be64 value;
>> +	unsigned char desc[64];
>> +	unsigned char value_desc[64];
>> +} __packed;
>> +
>> +struct h_energy_scale_info_hdr {
>> +	__be64 num_attrs;
>> +	__be64 array_offset;
>> +	__u8 data_header_version;
>> +} __packed;
>> +
>
> [..snip..]
>
>> +static int __init papr_init(void)
>> +{
>> +	uint64_t num_attrs;
>> +	int ret, idx, i;
>> +	char *esi_buf;
>> +
>> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
>> +		return -ENXIO;
>> +
>> +	esi_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
>> +	if (esi_buf == NULL)
>> +		return -ENOMEM;
>> +	/*
>> +	 * hcall(
>> +	 * uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
>> +	 * uint64 flags,            // Per the flag request
>> +	 * uint64 firstAttributeId, // The attribute id
>> +	 * uint64 bufferAddress,    // Guest physical address of the output buffer
>> +	 * uint64 bufferSize);      // The size in bytes of the output buffer
>> +	 */
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_ALL, 0,
>> +				 virt_to_phys(esi_buf), MAX_BUF_SZ);
>
> It is good that you are passing a character buffer here and
> interpreting it later. This helps in the cases where the header has
> more fields than what we are aware of changed. I think even a future
> platform adds newer fields to the header, those fields will be
> appended after the existing fields, so we should still be able to
> interpret the first three fields of the header that we are currently
> aware of.
>
>
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	esi_hdr = (struct h_energy_scale_info_hdr *) esi_buf;
>> +	num_attrs = be64_to_cpu(esi_hdr->num_attrs);
>
> Shouldn't we check for the esi_hdr->data_header_version here?
> Currently we are only aware of the version 1. If we happen to run this
> kernel code on a future platform which supports a different version,
> wouldn't it be safer to bail out here ?
>
> Otherwise this patch looks good to me.
>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Thanks for the review Gautham.
Sure I'll make use of the header version to bail out.
That just seems like the safest approach.

I'll add that and spin a new version here

Thanks
Pratik

> --
> Thanks and Regards
> gautham.

