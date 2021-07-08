Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6DB3BF881
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 12:36:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLCQ14vpvz3blF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 20:36:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qG9TTP+X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qG9TTP+X; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLCPW2RtHz2yXs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 20:35:58 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168AYAGd046938; Thu, 8 Jul 2021 06:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=EKNhUAjpoR2zsfBpOiCvG61sy+hto3HdXvo++O0la20=;
 b=qG9TTP+XxvFYKK6n4r0c+FqLERZVZ9B4IfsxsAGKFCyyQqK1abPpIY/x41A3v1iXTHgb
 5o+TUuNRyUHh2I7HUbc2JeQd9IHtLUwn6nJNzuVb7QwQHb/aqZvwpmbP6+t+URGnYpi8
 FPLx0I5qZtp7uJbzD9PnZL/dXh5tC7djpsT2cPZEXDieL8WZWyswkUQ2DmQOOx3OF0Ps
 VOhG+C4jEm8Z71TvSGtUQC6AGMC3tY8QAsqrsKXAxPuOtbg3J2FzKfzqStjUgXpOAieE
 +3gSz8P6VfcF2xLNbMQ6EEUOYgQsXDS81NM9/yM03AqbgeHTD8Pdp5xxvuALdLSXPpgk rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nrfh2wd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 06:35:50 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168AZfd7054180;
 Thu, 8 Jul 2021 06:35:50 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nrfh2wcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 06:35:50 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168AU5uo013075;
 Thu, 8 Jul 2021 10:35:49 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 39jfhcm5uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 10:35:49 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168AZmCY4456968
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 10:35:48 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55C1E13604F;
 Thu,  8 Jul 2021 10:35:48 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA0BB136051;
 Thu,  8 Jul 2021 10:35:47 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.17.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  8 Jul 2021 10:35:47 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E82F12E3B06; Thu,  8 Jul 2021 16:05:43 +0530 (IST)
Date: Thu, 8 Jul 2021 16:05:43 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Pratik R. Sampat" <psampat@linux.ibm.com>
Subject: Re: [PATCH v2 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
Message-ID: <20210708103543.GA20804@in.ibm.com>
References: <20210706082400.36996-1-psampat@linux.ibm.com>
 <20210706082400.36996-2-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706082400.36996-2-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LeqWVR8_rrO6euybY3olKXeVbuUI5BYr
X-Proofpoint-ORIG-GUID: dghLorA6Xbf-5xYQ9ghIUOEHPeqI-4ES
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_04:2021-07-06,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080057
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
Reply-To: ego@linux.vnet.ibm.com
Cc: pratik.r.sampat@gmail.com, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Pratik,

On Tue, Jul 06, 2021 at 01:54:00PM +0530, Pratik R. Sampat wrote:
> Adds a generic interface to represent the energy and frequency related
> PAPR attributes on the system using the new H_CALL
> "H_GET_ENERGY_SCALE_INFO".
> 
> H_GET_EM_PARMS H_CALL was previously responsible for exporting this
> information in the lparcfg, however the H_GET_EM_PARMS H_CALL
> will be deprecated P10 onwards.
> 
> The H_GET_ENERGY_SCALE_INFO H_CALL is of the following call format:
> hcall(
>   uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
>   uint64 flags,           // Per the flag request
>   uint64 firstAttributeId,// The attribute id
>   uint64 bufferAddress,   // Guest physical address of the output buffer
>   uint64 bufferSize       // The size in bytes of the output buffer
> );
> 
> This H_CALL can query either all the attributes at once with
> firstAttributeId = 0, flags = 0 as well as query only one attribute
> at a time with firstAttributeId = id, flags = 1.
> 
> The output buffer consists of the following
> 1. number of attributes              - 8 bytes
> 2. array offset to the data location - 8 bytes
> 3. version info                      - 1 byte
> 4. A data array of size num attributes, which contains the following:
>   a. attribute ID              - 8 bytes
>   b. attribute value in number - 8 bytes
>   c. attribute name in string  - 64 bytes
>   d. attribute value in string - 64 bytes
> 
> The new H_CALL exports information in direct string value format, hence
> a new interface has been introduced in
> /sys/firmware/papr/energy_scale_info to export this information to
> userspace in an extensible pass-through format.
> 
> The H_CALL returns the name, numeric value and string value (if exists)
> 
> The format of exposing the sysfs information is as follows:
> /sys/firmware/papr/energy_scale_info/
>    |-- <id>/
>      |-- desc
>      |-- value
>      |-- value_desc (if exists)
>    |-- <id>/
>      |-- desc
>      |-- value
>      |-- value_desc (if exists)
> ...


I like this implementation. Only one comment w.r.t versioning below:

[..snip..]

> @@ -631,6 +632,26 @@ struct hv_gpci_request_buffer {
>  	uint8_t bytes[HGPCI_MAX_DATA_BYTES];
>  } __packed;
> 
> +#define MAX_ESI_ATTRS	10
> +#define MAX_BUF_SZ	(sizeof(struct h_energy_scale_info_hdr) + \
> +			(sizeof(struct energy_scale_attribute) * MAX_ESI_ATTRS))
> +
> +struct energy_scale_attribute {
> +	__be64 id;
> +	__be64 value;
> +	unsigned char desc[64];
> +	unsigned char value_desc[64];
> +} __packed;
> +
> +struct h_energy_scale_info_hdr {
> +	__be64 num_attrs;
> +	__be64 array_offset;
> +	__u8 data_header_version;
> +} __packed;
> +


[..snip..]

> +static int __init papr_init(void)
> +{
> +	uint64_t num_attrs;
> +	int ret, idx, i;
> +	char *esi_buf;
> +
> +	if (!firmware_has_feature(FW_FEATURE_LPAR))
> +		return -ENXIO;
> +
> +	esi_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
> +	if (esi_buf == NULL)
> +		return -ENOMEM;
> +	/*
> +	 * hcall(
> +	 * uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
> +	 * uint64 flags,            // Per the flag request
> +	 * uint64 firstAttributeId, // The attribute id
> +	 * uint64 bufferAddress,    // Guest physical address of the output buffer
> +	 * uint64 bufferSize);      // The size in bytes of the output buffer
> +	 */
> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_ALL, 0,
> +				 virt_to_phys(esi_buf), MAX_BUF_SZ);


It is good that you are passing a character buffer here and
interpreting it later. This helps in the cases where the header has
more fields than what we are aware of changed. I think even a future
platform adds newer fields to the header, those fields will be
appended after the existing fields, so we should still be able to
interpret the first three fields of the header that we are currently
aware of.


> +	if (ret != H_SUCCESS) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}
> +
> +	esi_hdr = (struct h_energy_scale_info_hdr *) esi_buf;
> +	num_attrs = be64_to_cpu(esi_hdr->num_attrs);


Shouldn't we check for the esi_hdr->data_header_version here?
Currently we are only aware of the version 1. If we happen to run this
kernel code on a future platform which supports a different version,
wouldn't it be safer to bail out here ?

Otherwise this patch looks good to me.

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

--
Thanks and Regards
gautham.
