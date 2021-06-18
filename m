Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A10493AC6B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 11:03:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5tHS2G84z3c5f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 19:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A0NJRJ2U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A0NJRJ2U; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5tGw0Nn8z3bwm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 19:02:31 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15I8f19g019814; Fri, 18 Jun 2021 05:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=Pg0zM2dtclEhNemHoloIgjkrcrHg3YgthVTEdexPR3Q=;
 b=A0NJRJ2UvBHSYvFx9rxZJNgJVhwYjsGajwzIanPS8xX4jwVsPSH9C2sVmEgxDqbvSLXx
 ETvdxX7aWUWc4GQ9GZQII/UCLhnGI6aV0GxQjq2kAMnrOYx/DSik1bctmTnWCl2QFh6N
 Kt02HIE01mWPstj+H94XwVBs4noVgfUVLqEwRlw/ck+tBws/XRGw4Esel6pVftaInODL
 WTpdJzJoAAje0suLLpUbXlhSnF7LMOg5GuvT7DRY5yDPRA0KXdHDHcw5G0/ThSYO2wBW
 caf/nG4poSpFmCZo/XeLkosEa4hAq76UuWSCsLcQnuH6Kddz9aadD1nHy6YPmmqtreKA QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398p4t3tkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 05:02:22 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15I8fYgQ020677;
 Fri, 18 Jun 2021 05:02:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398p4t3tkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 05:02:21 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15I8wDLW000742;
 Fri, 18 Jun 2021 09:02:19 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 394mjb3t2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 09:02:19 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15I92IIj35127640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 09:02:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D91F7AC069;
 Fri, 18 Jun 2021 09:02:18 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA66AC068;
 Fri, 18 Jun 2021 09:02:17 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.91.58])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 18 Jun 2021 09:02:17 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 6520A2E2D42; Fri, 18 Jun 2021 14:32:08 +0530 (IST)
Date: Fri, 18 Jun 2021 14:32:08 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Pratik R. Sampat" <psampat@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
Message-ID: <20210618090208.GA17177@in.ibm.com>
References: <20210616134240.62195-1-psampat@linux.ibm.com>
 <20210616134240.62195-2-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616134240.62195-2-psampat@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OZwy5X-67dE-h8POmSsMm9x8h7FhaL6K
X-Proofpoint-ORIG-GUID: bp2lgI44CtKvYTYD999DUF78QxHG2Ryi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_17:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1011 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106180048
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

On Wed, Jun 16, 2021 at 07:12:40PM +0530, Pratik R. Sampat wrote:
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
> at a time with firstAttributeId = id


For a single attribute, the “firstAttributeId” must be set by the
caller to the attribute id to retrieve and the “singleAttribute” field
in “flags” must also be set to a 1.

If we don't set the "flags" to 1, while specifying a firstAttributeId,
the hypervisor will populate the buffer with the details pertaining to
all the attributes beginning with firstAttributeId.



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
[..snip..]

> +
> +static ssize_t papr_show_value(struct kobject *kobj,
> +				struct kobj_attribute *attr,
> +				char *buf)
> +{
> +	struct papr_attr *pattr = container_of(attr, struct papr_attr, attr);
> +	struct hv_energy_scale_buffer *t_buf;
> +	struct energy_scale_attributes *t_ea;
> +	int data_offset, ret = 0;
> +
> +	t_buf = kmalloc(sizeof(*t_buf), GFP_KERNEL);
> +	if (t_buf == NULL)
> +		return -ENOMEM;
> +
> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 0,
> +				 pattr->id, virt_to_phys(t_buf),
> +				 sizeof(*t_buf));
> +


In this case, since we are interested in only one attribute, we can
make the call

	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 1,
				 pattr->id, virt_to_phys(t_buf),
				 sizeof(*t_buf));

setting flags=1.

Same in the function papr_show_value_desc() below

--
Thanks and Regards
gautham.


> +	if (ret != H_SUCCESS) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}
> +
> +	data_offset = be64_to_cpu(t_buf->array_offset) -
> +			(sizeof(t_buf->num_attr) +
> +			sizeof(t_buf->array_offset) +
> +			sizeof(t_buf->data_header_version));
> +
> +	t_ea = (struct energy_scale_attributes *) &t_buf->data[data_offset];
> +
> +	ret = sprintf(buf, "%llu\n", be64_to_cpu(t_ea->attr_value));
> +	if (ret < 0)
> +		ret = -EIO;
> +out:
> +	kfree(t_buf);
> +
> +	return ret;
> +}
> +
> +static ssize_t papr_show_value_desc(struct kobject *kobj,
> +				     struct kobj_attribute *attr,
> +				     char *buf)
> +{
> +	struct papr_attr *pattr = container_of(attr, struct papr_attr, attr);
> +	struct hv_energy_scale_buffer *t_buf;
> +	struct energy_scale_attributes *t_ea;
> +	int data_offset, ret = 0;
> +
> +	t_buf = kmalloc(sizeof(*t_buf), GFP_KERNEL);
> +	if (t_buf == NULL)
> +		return -ENOMEM;
> +
> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 0,
> +				 pattr->id, virt_to_phys(t_buf),
> +				 sizeof(*t_buf));
> +
> +	if (ret != H_SUCCESS) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}
> +
> +	data_offset = be64_to_cpu(t_buf->array_offset) -
> +			(sizeof(t_buf->num_attr) +
> +			sizeof(t_buf->array_offset) +
> +			sizeof(t_buf->data_header_version));
> +
> +	t_ea = (struct energy_scale_attributes *) &t_buf->data[data_offset];
> +
> +	ret = sprintf(buf, "%s\n", t_ea->attr_value_desc);
> +	if (ret < 0)
> +		ret = -EIO;
> +out:
> +	kfree(t_buf);
> +
> +	return ret;
> +}
> +
> +static struct papr_ops_info {
> +	const char *attr_name;
> +	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> +			char *buf);
> +} ops_info[] = {
> +	{ "desc", papr_show_desc },
> +	{ "value", papr_show_value },
> +	{ "value_desc", papr_show_value_desc },
> +};
> +
> +static void add_attr(u64 id, int index, struct papr_attr *attr)
> +{
> +	attr->id = id;
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = ops_info[index].attr_name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = ops_info[index].show;
> +}
> +
> +static int add_attr_group(u64 id, int len, struct papr_group *pg,
> +			  bool show_val_desc)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++) {
> +		if (!strcmp(ops_info[i].attr_name, "value_desc") &&
> +		    !show_val_desc) {
> +			continue;
> +		}
> +		add_attr(id, i, &pg->pgattrs[i]);
> +		pg->pg.attrs[i] = &pg->pgattrs[i].attr.attr;
> +	}
> +
> +	return sysfs_create_group(escale_kobj, &pg->pg);
> +}
> +
> +
> +static int __init papr_init(void)
> +{
> +	uint64_t num_attr;
> +	int ret, idx, i, data_offset;
> +
> +	em_buf = kmalloc(sizeof(*em_buf), GFP_KERNEL);
> +	if (em_buf == NULL)
> +		return -ENOMEM;
> +	/*
> +	 * hcall(
> +	 * uint64 H_GET_ENERGY_SCALE_INFO,  // Get energy scale info
> +	 * uint64 flags,            // Per the flag request
> +	 * uint64 firstAttributeId, // The attribute id
> +	 * uint64 bufferAddress,    // Guest physical address of the output buffer
> +	 * uint64 bufferSize);      // The size in bytes of the output buffer
> +	 */
> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, 0, 0,
> +				 virt_to_phys(em_buf), sizeof(*em_buf));
> +
> +	if (!firmware_has_feature(FW_FEATURE_LPAR) || ret != H_SUCCESS ||
> +	    em_buf->data_header_version != 0x1) {
> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
> +		goto out;
> +	}
> +
> +	num_attr = be64_to_cpu(em_buf->num_attr);
> +
> +	/*
> +	 * Typecast the energy buffer to the attribute structure at the offset
> +	 * specified in the buffer
> +	 */
> +	data_offset = be64_to_cpu(em_buf->array_offset) -
> +			(sizeof(em_buf->num_attr) +
> +			sizeof(em_buf->array_offset) +
> +			sizeof(em_buf->data_header_version));
> +
> +	ea = (struct energy_scale_attributes *) &em_buf->data[data_offset];
> +
> +	pgs = kcalloc(num_attr, sizeof(*pgs), GFP_KERNEL);
> +	if (!pgs)
> +		goto out_pgs;
> +
> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
> +	if (!papr_kobj) {
> +		pr_warn("kobject_create_and_add papr failed\n");
> +		goto out_kobj;
> +	}
> +
> +	escale_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
> +	if (!escale_kobj) {
> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
> +		goto out_ekobj;
> +	}
> +
> +	for (idx = 0; idx < num_attr; idx++) {
> +		char buf[4];
> +		bool show_val_desc = true;
> +
> +		pgs[idx].pgattrs = kcalloc(MAX_ATTRS,
> +					   sizeof(*pgs[idx].pgattrs),
> +					   GFP_KERNEL);
> +		if (!pgs[idx].pgattrs)
> +			goto out_kobj;
> +
> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
> +					    sizeof(*pgs[idx].pg.attrs),
> +					    GFP_KERNEL);
> +		if (!pgs[idx].pg.attrs) {
> +			kfree(pgs[idx].pgattrs);
> +			goto out_kobj;
> +		}
> +
> +		sprintf(buf, "%lld", be64_to_cpu(ea[idx].attr_id));
> +		pgs[idx].pg.name = buf;
> +
> +		/* Do not add the value description if it does not exist */
> +		if (strlen(ea[idx].attr_value_desc) == 0)
> +			show_val_desc = false;
> +
> +		if (add_attr_group(be64_to_cpu(ea[idx].attr_id),
> +				   MAX_ATTRS, &pgs[idx], show_val_desc)) {
> +			pr_warn("Failed to create papr attribute group %s\n",
> +				pgs[idx].pg.name);
> +			goto out_pgattrs;
> +		}
> +	}
> +
> +	return 0;
> +
> +out_pgattrs:
> +	for (i = 0; i < MAX_ATTRS; i++) {
> +		kfree(pgs[i].pgattrs);
> +		kfree(pgs[i].pg.attrs);
> +	}
> +out_ekobj:
> +	kobject_put(escale_kobj);
> +out_kobj:
> +	kobject_put(papr_kobj);
> +out_pgs:
> +	kfree(pgs);
> +out:
> +	kfree(em_buf);
> +
> +	return -ENOMEM;
> +}
> +
> +machine_device_initcall(pseries, papr_init);
> -- 
> 2.30.2
> 
