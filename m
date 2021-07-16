Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3693CB320
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 09:15:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR2ZJ5syDz3bTg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 17:15:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N8FyTHx2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N8FyTHx2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR2Yj2cbWz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 17:14:48 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16G72u4Z077414; Fri, 16 Jul 2021 03:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Om7ix/OC1tJtlyAxTSYUmQSh8VWJii1JiSFdAKJHU60=;
 b=N8FyTHx2VK4l33+pnIz70WptXRqXaJWlz3uU4r+Ws3RZJOBfHsMYR6MW6crAfg7VS9DY
 +K/5h2rN04kkufd079TUOjM1hXkyKogbWunqBv02PuvkeJQGRQZzEGSBG9CtnHQ2YYDE
 O6P0Kcf/UO5mWUkyN49oBkEyC1cUHp/0oRskDsAFRbChk62JRoszBDnGVyHdBuUZBne2
 y+lC+A/I5g4c8bA4M4rYB5xiFt0PM+ucRg7yMQV53773R77hSz64wa5TfGhWbwW4HYHC
 Trl5hy6JeLQjHkUBHpzDlCM1WIcVhvOGIvTCSM9HA2ksQuyBlNLOz3MRJPqcFCEeq4xE Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39twaa2j9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 03:14:39 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16G75uWf091292;
 Fri, 16 Jul 2021 03:14:38 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39twaa2j9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 03:14:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16G7D1WK029080;
 Fri, 16 Jul 2021 07:14:37 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39txefg4dy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:14:37 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16G7CKRI37945798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 07:12:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 977A44204D;
 Fri, 16 Jul 2021 07:14:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA36B42047;
 Fri, 16 Jul 2021 07:14:32 +0000 (GMT)
Received: from [9.77.199.234] (unknown [9.77.199.234])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 07:14:32 +0000 (GMT)
Subject: Re: [PATCH v3 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
To: Fabiano Rosas <farosas@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
References: <20210712105140.33388-1-psampat@linux.ibm.com>
 <20210712105140.33388-2-psampat@linux.ibm.com> <87lf6bo7v0.fsf@linux.ibm.com>
 <60575876-b15d-6dee-dbb7-c68b9e304557@linux.ibm.com>
 <87lf672wdd.fsf@linux.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <202a2564-e1b2-138e-0ea2-6114eb297e2d@linux.ibm.com>
Date: Fri, 16 Jul 2021 12:44:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87lf672wdd.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: phHLDpISTy7SAEGthgnUo2ka5MozFvsw
X-Proofpoint-GUID: CEIGuh3pe66RLXn4kcxs-CAu8_LljVDS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_02:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160041
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



On 16/07/21 1:16 am, Fabiano Rosas wrote:
> Pratik Sampat <psampat@linux.ibm.com> writes:
>
>> Hello,
>>
>> On 12/07/21 9:13 pm, Fabiano Rosas wrote:
>>> "Pratik R. Sampat" <psampat@linux.ibm.com> writes:
>>>
>>> Hi, have you seen Documentation/core-api/kobject.rst, particularly the
>>> part that says:
>>>
>>> "When you see a sysfs directory full of other directories, generally each
>>>      of those directories corresponds to a kobject in the same kset."
>>>
>>> Taking a look at samples/kobject/kset-example.c, it seems to provide an
>>> overall structure that is closer to what other modules do when creating
>>> sysfs entries. It uses less dynamic allocations and deals a bit better
>>> with cleaning up the state afterwards.
>>>
>> Thank you for pointing me towards this example, the kset approach is
>> interesting and the example indeed does handle cleanups better.
>>
>> Currently, we use "machine_device_initcall()" to register this
>> functionality, do you suggest I convert this into a tristate module
>> instead where I can include a "module_exit" for cleanups?
> Ugh.. I was hoping we could get away with having all cleanups done at
> kobject release time. But now I see that it is not called unless we
> decrement the reference count. Nevermind then.
>
Sure I can keep the current approach as-is, while incorporating the rest of your
comments.

>>>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_ALL, 0,
>>>> +				 virt_to_phys(esi_buf), MAX_BUF_SZ);
>>>> +	esi_hdr = (struct h_energy_scale_info_hdr *) esi_buf;
>>>> +	if (ret != H_SUCCESS || esi_hdr->data_header_version != ESI_VERSION) {
>>> I really dislike this. If you want to bail due to version change, then
>>> at least include in the ABI document that we might not give the
>>> userspace any data at all.
>> My only concern for having a version check is that, the attribute list
>> can change as well as the attributes itself may change.
>> If that is the case, then in a newer version if we do not bail out we
>> may parse data into our structs incorrectly.
> Sure, that is a valid concern. But the documentation for the header
> version field says:
>
>    "Version of the Header. The header will be always backward compatible,
>    and changes will not impact the Array of attributes. Current version =
>    0x01"
>
> I guess this is a bit vague still, but I understood that:
>
> 1- header elements continue to exist at the same position;
> 2- the format of the array of attributes will not change.
>
> Are you saying that my interpretation above is not correct or that you
> don't trust the HV to enforce it?
>
Thanks for the clarification.
I understand now that my interpretation was incorrect. The version change
should not break anything as our code in kernel acts just as a pass through.

>> My argument only hinges on that we should likely give no data at all
>> instead of junk or incorrect data.
> I agree. I just don't think it would be possible to end up with
> incorrect data, unless the HV has a bug.
>
>> Maybe I could make this check after the return check and give out a
>> version mismatch message like the following?
>> pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO VER MISMATCH - EXP: 0x%x, REC: 0x%x",
>>           ESI_VERSION, esi_hdr->data_header_version);
> Yes, this will help with debug if we ever end up in this situation.

Understood, In case of a version mismatch and IDs are introduced, it can help
the userspace know that something has changed.

>>>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	num_attrs = be64_to_cpu(esi_hdr->num_attrs);
>>>> +	/*
>>>> +	 * Typecast the energy buffer to the attribute structure at the offset
>>>> +	 * specified in the buffer
>>>> +	 */
>>> I think the code is now simple enough that this comment could be
>>> removed.
>> ack
>>
>>>> +	esi_attrs = (struct energy_scale_attribute *)
>>>> +		    (esi_buf + be64_to_cpu(esi_hdr->array_offset));
>>>> +
>>>> +	pgs = kcalloc(num_attrs, sizeof(*pgs), GFP_KERNEL);
>>> This is never freed.
>>>
>>>> +	if (!pgs)
>>>> +		goto out_pgs;
>>>> +
>>>> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
>>>> +	if (!papr_kobj) {
>>>> +		pr_warn("kobject_create_and_add papr failed\n");
>>>> +		goto out_kobj;
>>>> +	}
>>>> +
>>>> +	esi_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
>>>> +	if (!esi_kobj) {
>>>> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
>>>> +		goto out_ekobj;
>>>> +	}
>>>> +
>>>> +	for (idx = 0; idx < num_attrs; idx++) {
>>>> +		char buf[4];
>>>> +		bool show_val_desc = true;
>>>> +
>>>> +		pgs[idx].pgattrs = kcalloc(MAX_ATTRS,
>>>> +					   sizeof(*pgs[idx].pgattrs),
>>>> +					   GFP_KERNEL);
>>>> +		if (!pgs[idx].pgattrs)
>>>> +			goto out_kobj;
>>>> +
>>>> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
>>>> +					    sizeof(*pgs[idx].pg.attrs),
>>>> +					    GFP_KERNEL);
>>> I think the kobject code expects this to be statically allocated, so
>>> you'd need to override the release function in some way to be able to
>>> free this.
>> Right this and pgs both are never free'd because my understanding was
>> that as this functionality is invoked from machine_init, I'd expect it
>> to stay until shutdown.
> Yep, I thought the kset code would improve this, but I misread it. So
> I'm fine with keeping it like this.
Sure thing. Thanks!
>> However, if you believe that a module approach is cleaner, I can change
>> my implementation to accommodate for that and also include a
>> module_exit for cleanup of the above allocations
>>>> +		if (!pgs[idx].pg.attrs) {
>>>> +			kfree(pgs[idx].pgattrs);
>>>> +			goto out_kobj;
>>>> +		}
>>>> +
>>>> +		sprintf(buf, "%lld", be64_to_cpu(esi_attrs[idx].id));
>>> Do you mean pgs[idx].name instead of buf? Otherwise you're passing this
>>> stack allocated 'buf' to another function.
>>>
>> Yes you're right I should have either passed the pg struct or I should
>> have used strcpy, here the stack allocated buffer is being taken out of
>> scope which is incorrect.
>> Thanks for pointing this out!
>>
>>>> +		pgs[idx].pg.name = buf;
>>>> +
>>>> +		/* Do not add the value description if it does not exist */
>>>> +		if (strlen(esi_attrs[idx].value_desc) == 0)
>>>> +			show_val_desc = false;
>>>> +
>>>> +		if (add_attr_group(be64_to_cpu(esi_attrs[idx].id),
>>>> +				   MAX_ATTRS, &pgs[idx], show_val_desc)) {
>>>> +			pr_warn("Failed to create papr attribute group %s\n",
>>>> +				pgs[idx].pg.name);
>>>> +			goto out_pgattrs;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +
>>>> +out_pgattrs:
>>>> +	for (i = 0; i < MAX_ATTRS; i++) {
>>>> +		kfree(pgs[i].pgattrs);
>>>> +		kfree(pgs[i].pg.attrs);
>>>> +	}
>>>> +out_ekobj:
>>>> +	kobject_put(esi_kobj);
>>>> +out_kobj:
>>>> +	kobject_put(papr_kobj);
>>>> +out_pgs:
>>>> +	kfree(pgs);
>>>> +out:
>>>> +	kfree(esi_buf);
>>>> +
>>>> +	return -ENOMEM;
>>>> +}
>>>> +
>>>> +machine_device_initcall(pseries, papr_init);

