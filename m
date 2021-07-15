Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB643CACFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 21:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQlJW1Kk6z300c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 05:47:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ajQRYxjh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ajQRYxjh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQlJ11XVRz2xZk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 05:46:56 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16FJY0HO033239; Thu, 15 Jul 2021 15:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DO+E8NiV2Y5oW7QZ1cVyK9xrKfnb/pFaXLa+lGNYbfI=;
 b=ajQRYxjhOB1LyvJZeWZiSEkLSovy+jqpMmBVab/BTyyBjdyl1MK7geBqClS7RaCuZNaI
 4KU7SwjizXF0upIpMzwMPoGWwbMBVDTFk5lH5gvm1ocV5PJKVNVNum0U3bh1/xJmoVyi
 79oSy1uhemyJDuhCWcffT11m7FqLSvO/s7y1Kph1jMx/PHcNXwNGe5BgEinHk87P6I1q
 etqArucujXwmtfLDLL+86AM3t7KL3+Ar/y6Jpz1NEdcwTf8XkxwiLxb82dAwwRNKS4XB
 T3oyz5cJVjY6eA5XPI6gpbhKZ9wavkAdePlJLnF+aqXMORvo/lNbC9MGg1MKgKPrJp7F 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sug0r03x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 15:46:44 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16FJYpir038850;
 Thu, 15 Jul 2021 15:46:44 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39sug0r033-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 15:46:44 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16FJbgcA015476;
 Thu, 15 Jul 2021 19:46:42 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 39q36dn2w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 19:46:42 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16FJkgUR38863288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Jul 2021 19:46:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EDE2AE067;
 Thu, 15 Jul 2021 19:46:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5306BAE06D;
 Thu, 15 Jul 2021 19:46:41 +0000 (GMT)
Received: from localhost (unknown [9.211.106.233])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 15 Jul 2021 19:46:40 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Pratik Sampat <psampat@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
Subject: Re: [PATCH v3 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
In-Reply-To: <60575876-b15d-6dee-dbb7-c68b9e304557@linux.ibm.com>
References: <20210712105140.33388-1-psampat@linux.ibm.com>
 <20210712105140.33388-2-psampat@linux.ibm.com>
 <87lf6bo7v0.fsf@linux.ibm.com>
 <60575876-b15d-6dee-dbb7-c68b9e304557@linux.ibm.com>
Date: Thu, 15 Jul 2021 16:46:38 -0300
Message-ID: <87lf672wdd.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a0bNXcy2J-n-XNiwByW7QrGsv_iNqiU_
X-Proofpoint-ORIG-GUID: mrYjsOkyQ-E4RBvzf5ieZGQ7m4OaIkVv
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_14:2021-07-14,
 2021-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107150132
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

Pratik Sampat <psampat@linux.ibm.com> writes:

> Hello,
>
> On 12/07/21 9:13 pm, Fabiano Rosas wrote:
>> "Pratik R. Sampat" <psampat@linux.ibm.com> writes:
>>
>> Hi, have you seen Documentation/core-api/kobject.rst, particularly the
>> part that says:
>>
>> "When you see a sysfs directory full of other directories, generally each
>>     of those directories corresponds to a kobject in the same kset."
>>
>> Taking a look at samples/kobject/kset-example.c, it seems to provide an
>> overall structure that is closer to what other modules do when creating
>> sysfs entries. It uses less dynamic allocations and deals a bit better
>> with cleaning up the state afterwards.
>>
> Thank you for pointing me towards this example, the kset approach is
> interesting and the example indeed does handle cleanups better.
>
> Currently, we use "machine_device_initcall()" to register this
> functionality, do you suggest I convert this into a tristate module
> instead where I can include a "module_exit" for cleanups?

Ugh.. I was hoping we could get away with having all cleanups done at
kobject release time. But now I see that it is not called unless we
decrement the reference count. Nevermind then.

>>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_ALL, 0,
>>> +				 virt_to_phys(esi_buf), MAX_BUF_SZ);
>>> +	esi_hdr = (struct h_energy_scale_info_hdr *) esi_buf;
>>> +	if (ret != H_SUCCESS || esi_hdr->data_header_version != ESI_VERSION) {
>> I really dislike this. If you want to bail due to version change, then
>> at least include in the ABI document that we might not give the
>> userspace any data at all.
>
> My only concern for having a version check is that, the attribute list
> can change as well as the attributes itself may change.
> If that is the case, then in a newer version if we do not bail out we
> may parse data into our structs incorrectly.

Sure, that is a valid concern. But the documentation for the header
version field says:

  "Version of the Header. The header will be always backward compatible,
  and changes will not impact the Array of attributes. Current version =
  0x01"

I guess this is a bit vague still, but I understood that:

1- header elements continue to exist at the same position;
2- the format of the array of attributes will not change.

Are you saying that my interpretation above is not correct or that you
don't trust the HV to enforce it?

> My argument only hinges on that we should likely give no data at all
> instead of junk or incorrect data.

I agree. I just don't think it would be possible to end up with
incorrect data, unless the HV has a bug.

> Maybe I could make this check after the return check and give out a
> version mismatch message like the following?
> pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO VER MISMATCH - EXP: 0x%x, REC: 0x%x",
>          ESI_VERSION, esi_hdr->data_header_version);

Yes, this will help with debug if we ever end up in this situation.

>>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>>> +		goto out;
>>> +	}
>>> +
>>> +	num_attrs = be64_to_cpu(esi_hdr->num_attrs);
>>> +	/*
>>> +	 * Typecast the energy buffer to the attribute structure at the offset
>>> +	 * specified in the buffer
>>> +	 */
>> I think the code is now simple enough that this comment could be
>> removed.
>
> ack
>
>>> +	esi_attrs = (struct energy_scale_attribute *)
>>> +		    (esi_buf + be64_to_cpu(esi_hdr->array_offset));
>>> +
>>> +	pgs = kcalloc(num_attrs, sizeof(*pgs), GFP_KERNEL);
>> This is never freed.
>>
>>> +	if (!pgs)
>>> +		goto out_pgs;
>>> +
>>> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
>>> +	if (!papr_kobj) {
>>> +		pr_warn("kobject_create_and_add papr failed\n");
>>> +		goto out_kobj;
>>> +	}
>>> +
>>> +	esi_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
>>> +	if (!esi_kobj) {
>>> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
>>> +		goto out_ekobj;
>>> +	}
>>> +
>>> +	for (idx = 0; idx < num_attrs; idx++) {
>>> +		char buf[4];
>>> +		bool show_val_desc = true;
>>> +
>>> +		pgs[idx].pgattrs = kcalloc(MAX_ATTRS,
>>> +					   sizeof(*pgs[idx].pgattrs),
>>> +					   GFP_KERNEL);
>>> +		if (!pgs[idx].pgattrs)
>>> +			goto out_kobj;
>>> +
>>> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
>>> +					    sizeof(*pgs[idx].pg.attrs),
>>> +					    GFP_KERNEL);
>> I think the kobject code expects this to be statically allocated, so
>> you'd need to override the release function in some way to be able to
>> free this.
>
> Right this and pgs both are never free'd because my understanding was
> that as this functionality is invoked from machine_init, I'd expect it
> to stay until shutdown.

Yep, I thought the kset code would improve this, but I misread it. So
I'm fine with keeping it like this.

> However, if you believe that a module approach is cleaner, I can change
> my implementation to accommodate for that and also include a
> module_exit for cleanup of the above allocations
>>> +		if (!pgs[idx].pg.attrs) {
>>> +			kfree(pgs[idx].pgattrs);
>>> +			goto out_kobj;
>>> +		}
>>> +
>>> +		sprintf(buf, "%lld", be64_to_cpu(esi_attrs[idx].id));
>> Do you mean pgs[idx].name instead of buf? Otherwise you're passing this
>> stack allocated 'buf' to another function.
>>
> Yes you're right I should have either passed the pg struct or I should
> have used strcpy, here the stack allocated buffer is being taken out of
> scope which is incorrect.
> Thanks for pointing this out!
>
>>> +		pgs[idx].pg.name = buf;
>>> +
>>> +		/* Do not add the value description if it does not exist */
>>> +		if (strlen(esi_attrs[idx].value_desc) == 0)
>>> +			show_val_desc = false;
>>> +
>>> +		if (add_attr_group(be64_to_cpu(esi_attrs[idx].id),
>>> +				   MAX_ATTRS, &pgs[idx], show_val_desc)) {
>>> +			pr_warn("Failed to create papr attribute group %s\n",
>>> +				pgs[idx].pg.name);
>>> +			goto out_pgattrs;
>>> +		}
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +out_pgattrs:
>>> +	for (i = 0; i < MAX_ATTRS; i++) {
>>> +		kfree(pgs[i].pgattrs);
>>> +		kfree(pgs[i].pg.attrs);
>>> +	}
>>> +out_ekobj:
>>> +	kobject_put(esi_kobj);
>>> +out_kobj:
>>> +	kobject_put(papr_kobj);
>>> +out_pgs:
>>> +	kfree(pgs);
>>> +out:
>>> +	kfree(esi_buf);
>>> +
>>> +	return -ENOMEM;
>>> +}
>>> +
>>> +machine_device_initcall(pseries, papr_init);
