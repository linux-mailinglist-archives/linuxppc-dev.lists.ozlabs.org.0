Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 134C33A0FF4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 12:09:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0N9m3yT6z3bt9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 20:09:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DIoPEb8P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DIoPEb8P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0N9D5NhBz2xZs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 20:08:32 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 159A3OuQ019957; Wed, 9 Jun 2021 06:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DqJCfyurpuPL+OBlOqQOT67VvAOg8m1Vl+0FbCzIswI=;
 b=DIoPEb8Pteh/R6CXFLowuXvokwzz3K02xB3+5x85U0XpLLTE3DOZFjAgKbmd9JiXpQHf
 MN1Fi9v/szreRi1fR+lQ/DcPFPv2lmfuYip4AopGWcSFmXxH9u2t/VI9jpp3M9zqdscJ
 LmLT5miSSTdic2zVcliiMZUnjHh0L1fGA8iYJf1xmiLulh0ohU1Mp4PEiTM96MHCagBV
 X5w7B+HG49qUjUhG2/KxShhlPiK3XDmDMX73fUlO1zlAkhIdNqVKLvHZnuYSnduuwwMf
 Z99arZZDX6/EVvPOE8cHrCeVsty1p8w2B7S7CRC67B/hRQnWQwiSqe3ivhcVVfddclin Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 392ug8g7ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jun 2021 06:08:24 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 159A4BMP025235;
 Wed, 9 Jun 2021 06:08:24 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 392ug8g7sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jun 2021 06:08:23 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 159A7ZO6012253;
 Wed, 9 Jun 2021 10:08:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3900hhh57w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Jun 2021 10:08:21 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 159A8Jxo20906314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Jun 2021 10:08:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA1964C040;
 Wed,  9 Jun 2021 10:08:18 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16F7E4C046;
 Wed,  9 Jun 2021 10:08:17 +0000 (GMT)
Received: from [9.102.17.60] (unknown [9.102.17.60])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Jun 2021 10:08:16 +0000 (GMT)
Subject: Re: [RFC] powerpc/pseries: Interface to represent PAPR firmware
 attributes
To: Fabiano Rosas <farosas@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
References: <20210604163501.51511-1-psampat@linux.ibm.com>
 <87wnr4uhs9.fsf@linux.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <5c9cb57b-e9d8-0361-8be7-60dc9618db34@linux.ibm.com>
Date: Wed, 9 Jun 2021 15:38:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87wnr4uhs9.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K_Z-vtNz1WoHlJOwzSkupWjpeLL8b5O1
X-Proofpoint-ORIG-GUID: nTxWXxaDuuduZDLvQMRZudsdIaKClQbu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-09_04:2021-06-04,
 2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106090047
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

Hello,
Thank you for your comments on the design.

On 09/06/21 3:43 am, Fabiano Rosas wrote:
> "Pratik R. Sampat" <psampat@linux.ibm.com> writes:
>
> Hi, I have some general comments and questions, mostly trying to
> understand design of the hcall and use cases of the sysfs data:
>
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
>>    uint64 bufferAddress,   // The logical address of the output buffer
> Instead of logical address, guest address or guest physical address
> would be more precise.

Yes, the name guest physical address makes more sense for this attribute.
The term logical address had me confused too when I first read it in the ACR,
however that isn't the case.

I'll change it to guest physical address here. Thanks for pointing out.

>
>>    uint64 bufferSize       // The size in bytes of the output buffer
>> );
>>
>> This H_CALL can query either all the attributes at once with
>> firstAttributeId = 0, flags = 0 as well as query only one attribute
>> at a time with firstAttributeId = id
>>
>> The output buffer consists of the following
>> 1. number of attributes              - 8 bytes
>> 2. array offset to the data location - 8 bytes
> The offset is from the start of the buffer, isn't it? So not the array
> offset.

Yes,the offset carries information that is to the start of the data buffer.

>> 3. version info                      - 1 byte
>> 4. A data array of size num attributes, which contains the following:
>>    a. attribute ID              - 8 bytes
>>    b. attribute value in number - 8 bytes
>>    c. attribute name in string  - 64 bytes
>>    d. attribute value in string - 64 bytes
> Is this new hypercall already present in the spec? These seem a bit
> underspecified to me.

Yes, it is present in the spec. I probably summarized a little more than needed
here and I could expand upon below.

The input buffer recives the following data:

1. “flags”:
	a. Bit 0: singleAttribute
		If set to 1, only return the single attribute matching firstAttributeId.
	b. Bits 1-63: Reserved
2. “firstAttributeId”: The first attribute to retrieve
3. “bufferAddress”: The logical real address of the start of the output buffer
4. “bufferSize”: The size in bytes of the output buffer
	

 From the document, the format of the output buffer is as follows:

Table 1 --> output buffer
================================================================================
| Field Name           | Byte   | Length   |  Description
|                      | Offset | in Bytes |
================================================================================
| NumberOf             |        |          | Number of Attributes in Buffer
| AttributesInBuffer   | 0x000  | 0x08     |
--------------------------------------------------------------------------------
| AttributeArrayOffset | 0x008  | 0x08     | Byte offset to start of Array
|                      |        |          | of Attributes
|                      |        |          |
--------------------------------------------------------------------------------
| OutputBufferData     |        |          | Version of the Header.
| HeaderVersion        | 0x010  | 0x01     | The header will be always
| AttributesInBuffer   |        |          | backward compatible, and changes
|                      |        |          | will not impact the Array of
|                      |        |          | attributes.
|                      |        |          | Current version = 0x01
--------------------------------------------------------------------------------
| ArrayOfAttributes    |        |          | The array will contain
|                      |        |          | "NumberOfAttributesInBuffer"
|                      |        |          | array elements not to exceed
|                      |        |          | the size of the buffer.
|                      |        |          | Layout of the array is
|                      |        |          | detailed in Table 2.
--------------------------------------------------------------------------------


Table 2 --> Array of attributes
================================================================================
| Field Name           | Byte   | Length   |  Description
|                      | Offset | in Bytes |
================================================================================
| 1st AttributeId      | 0x000  | 0x08     | The ID of the Attribute
--------------------------------------------------------------------------------
| 1st AttributeValue   | 0x008  | 0x08     | The numerical value of
|                      |        |          | the attribute
--------------------------------------------------------------------------------
| 1st AttributeString  | 0x010  | 0x40     | The ASCII string
| Description          |        |          | description of the
|                      |        |          | attribute, up to 63
|                      |        |          | characters plus a NULL
|                      |        |          | terminator.
--------------------------------------------------------------------------------
| 1st AttributeValue   | 0x050  | 0x40     | The ASCII string
| StringDescription    |        |          | description of the
|                      |        |          | attribute value, up to 63
|                      |        |          | characters plus a NULL
|                      |        |          | terminator. If this
|                      |        |          | contains only a NULL
|                      |        |          | terminator, then there is
|                      |        |          | no ASCII string
|                      |        |          | associated with AttributeValue.
--------------------------------------------------------------------------------
| ....                 |        |          |


>
>> The new H_CALL exports information in direct string value format, hence
>> a new interface has been introduced in /sys/firmware/papr to export
> Hm.. Maybe this should be something less generic than "papr"?

The interface naming was inspired from /sys/firmware/opal's naming convention.
We believed the name PAPR could serve as more generic name to be used by both
Linux running on PHYP and linux on KVM.

If you have something more concrete in mind, please let me know. I'm open to
suggestions.

>
>> this information to userspace in an extensible pass-through format.
>> The H_CALL returns the name, numeric value and string value. As string
>> values are in human readable format, therefore if the string value
>> exists then that is given precedence over the numeric value.
> So the hypervisor could simply not send the string representation? How
> will the userspace tell the difference since they are reading everything
> from a file?
>
> Overall I'd say we should give the data in a more structured way and let
> the user-facing tool do the formatting and presentation.

That's a valid concern, the design for this was inspired from hwmon's interface
to housing the sensor information.

One alternative to add more structure to this format could be to introduce:
attr_X_name, attr_X_num_val, attr_X_str_val

However, in some cases like min/max frequency the string value is empty. In
that case the file attr_X_str_val will also be empty.
Is that an acceptable format of having empty files that in some cases will
never be populated?
We also went ahead to confirm with the SPEC team that if a string value exists
in their buffer, that must be given precedence.

Another alternative format could to keep attr_X_name, attr_X_val intact but
change what X means. Currently X is just an iteratively increasing number. But
X can also serve as an ID which we get from H_CALL output buffer.

In this case, we should also include some versioning so that the tool now also
has cognizance of contents of each file.

>> The format of exposing the sysfs information is as follows:
>> /sys/firmware/papr/
>>    |-- attr_0_name
>>    |-- attr_0_val
>>    |-- attr_1_name
>>    |-- attr_1_val
>> ...
> How do we keep a stable interface with userspace? Say the hypervisor
> decides to add or remove attributes, change their order, string
> representation, etc? It will inform us via the version field, but that
> is lost when we output this to sysfs.
>
> I get that if the userspace just iterate over the contents of the
> directory then nothing breaks, but there is not much else it could do it
> seems.

Fair point, having the version exposed to the sysfs does seem crucial.

Currently in ppc-utils we iterate over all the information, however as you
rightly pointed out there may be other tools needing just specific information.
The alternative I suggested a few sentences above to include ID based attribute
naming and versioning maybe a more elegant way of solving this problem.

What are your thoughts on a design like this?

>> The energy information that is exported is useful for userspace tools
>> such as powerpc-utils. Currently these tools infer the
>> "power_mode_data" value in the lparcfg, which in turn is obtained from
>> the to be deprecated H_GET_EM_PARMS H_CALL.
>> On future platforms, such userspace utilities will have to look at the
>> data returned from the new H_CALL being populated in this new sysfs
>> interface and report this information directly without the need of
>> interpretation.
>>
>> Signed-off-by: Pratik R. Sampat <psampat@linux.ibm.com>

Thanks
Pratik

