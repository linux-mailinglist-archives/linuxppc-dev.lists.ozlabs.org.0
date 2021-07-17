Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF703CC191
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 08:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRf2Y2BJGz3bhp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jul 2021 16:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Y4qBBMz2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Y4qBBMz2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRf210pkRz2yXL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jul 2021 16:52:56 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16H6jQKg142787; Sat, 17 Jul 2021 02:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TQC5ibxdHAc7PYt0rwjaf4ucWJN0yD9Hu/5fGiXQzH8=;
 b=Y4qBBMz2sK9ysTqD6/FsCWK+grd9zOaKZn9mQg2AabQ5cQDhlVH1v7tq/oMjusJYDwQr
 uQWEwlp+zSpmpjF119JMbiG2OkOD/6M+1jdUvteitdX2xWrl7yFJaonccBwsEOxLFvps
 CEL5DIBxQmi/1wBj+531MHFqh7wGPqUmdPgQRcpvemnBYnLhscLpe2nZDkYyqsUFetoC
 OU8vroGYI50f1AFTPYh25VGAjFhj57iLAsukg2DY2D8gWhjwVo84HAsuckkhxDtpxrZC
 XwRMDbup0w6BPhwKCdrbvXeFD5xhthosmI4xqmyS+l3X7l6fcmqKIlqDsoLWG40cC+Hf jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ut788373-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Jul 2021 02:52:46 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16H6lbtT147285;
 Sat, 17 Jul 2021 02:52:46 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ut78836s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Jul 2021 02:52:46 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16H6qhQI016786;
 Sat, 17 Jul 2021 06:52:43 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 39upu880tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Jul 2021 06:52:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16H6qfim36962698
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Jul 2021 06:52:41 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02658A4062;
 Sat, 17 Jul 2021 06:52:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03B37A405B;
 Sat, 17 Jul 2021 06:52:39 +0000 (GMT)
Received: from [9.102.2.240] (unknown [9.102.2.240])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 17 Jul 2021 06:52:38 +0000 (GMT)
Subject: Re: [PATCH v4 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
To: Fabiano Rosas <farosas@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratik.r.sampat@gmail.com
References: <20210716152133.72455-1-psampat@linux.ibm.com>
 <20210716152133.72455-2-psampat@linux.ibm.com> <87im1a2i5k.fsf@linux.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <fb840e20-0b8d-b80a-d7cd-60b0b890e126@linux.ibm.com>
Date: Sat, 17 Jul 2021 12:22:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87im1a2i5k.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GPr-FxwkFhG0LBhkHkCVWEWRIpHGhhJJ
X-Proofpoint-GUID: c6tO4_kqStXllE4Cjo-EYiuaFP1Afx6d
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-17_03:2021-07-16,
 2021-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107170038
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



On 17/07/21 12:35 am, Fabiano Rosas wrote:
> "Pratik R. Sampat" <psampat@linux.ibm.com> writes:
>
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/slab.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/hugetlb.h>
>> +#include <asm/lppaca.h>
>> +#include <asm/hvcall.h>
>> +#include <asm/firmware.h>
>> +#include <asm/time.h>
>> +#include <asm/prom.h>
>> +#include <asm/vdso_datapage.h>
>> +#include <asm/vio.h>
>> +#include <asm/mmu.h>
>> +#include <asm/machdep.h>
>> +#include <asm/drmem.h>
> Do you need all of these headers? Sorry to mention just now, I seem to have
> dropped this comment from a previous review.

Ah yes, that was a TODO on my part I had missed as cleanups.
I'll verify if I do need all of them and get back to you.

>> +
>> +#include "pseries.h"
>> +
>> +/*
>> + * Flag attributes to fetch either all or one attribute from the HCALL
>> + * flag = BE(0) => fetch all attributes with firstAttributeId = 0
>> + * flag = BE(1) => fetch a single attribute with firstAttributeId = id
>> + */
>> +#define ESI_FLAGS_ALL		0
>> +#define ESI_FLAGS_SINGLE	PPC_BIT(0)
>> +
>> +#define MAX_ATTRS		3
>> +
>> +struct papr_attr {
>> +	u64 id;
>> +	struct kobj_attribute kobj_attr;
>> +};
>> +struct papr_group {
>> +	struct attribute_group pg;
>> +	struct papr_attr pgattrs[MAX_ATTRS];
>> +} *pgs;
>> +
>> +/* /sys/firmware/papr */
>> +struct kobject *papr_kobj;
>> +/* /sys/firmware/papr/energy_scale_info */
>> +struct kobject *esi_kobj;
>> +
>> +/*
>> + * Extract and export the description of the energy scale attribute
>> + *
> Extra line here.
ack.
>> + */
>> +static ssize_t papr_show_desc(struct kobject *kobj,
>> +			       struct kobj_attribute *kobj_attr,
>> +			       char *buf)
>> +{
>> +	struct papr_attr *pattr = container_of(kobj_attr, struct papr_attr,
>> +					       kobj_attr);
>> +	struct h_energy_scale_info_hdr *t_hdr;
>> +	struct energy_scale_attribute *t_esi;
>> +	char *t_buf;
>> +	int ret = 0;
>> +
>> +	t_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
>> +	if (t_buf == NULL)
>> +		return -ENOMEM;
>> +
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_SINGLE,
>> +				 pattr->id, virt_to_phys(t_buf),
>> +				 MAX_BUF_SZ);
>> +
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	t_hdr = (struct h_energy_scale_info_hdr *) t_buf;
>> +	t_esi = (struct energy_scale_attribute *)
>> +		(t_buf + be64_to_cpu(t_hdr->array_offset));
>> +
>> +	ret = snprintf(buf, sizeof(t_esi->desc), "%s\n", t_esi->desc);
>> +	if (ret < 0)
>> +		ret = -EIO;
>> +out:
>> +	kfree(t_buf);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Extract and export the numeric value of the energy scale attributes
>> + */
>> +static ssize_t papr_show_value(struct kobject *kobj,
>> +				struct kobj_attribute *kobj_attr,
>> +				char *buf)
>> +{
>> +	struct papr_attr *pattr = container_of(kobj_attr, struct papr_attr,
>> +					       kobj_attr);
>> +	struct h_energy_scale_info_hdr *t_hdr;
>> +	struct energy_scale_attribute *t_esi;
>> +	char *t_buf;
>> +	int ret = 0;
>> +
>> +	t_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
>> +	if (t_buf == NULL)
>> +		return -ENOMEM;
>> +
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_SINGLE,
>> +				 pattr->id, virt_to_phys(t_buf),
>> +				 MAX_BUF_SZ);
>> +
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	t_hdr = (struct h_energy_scale_info_hdr *) t_buf;
>> +	t_esi = (struct energy_scale_attribute *)
>> +		(t_buf + be64_to_cpu(t_hdr->array_offset));
>> +
>> +	ret = snprintf(buf, sizeof(t_esi->value), "%llu\n",
>> +		       be64_to_cpu(t_esi->value));
>> +	if (ret < 0)
>> +		ret = -EIO;
>> +out:
>> +	kfree(t_buf);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Extract and export the value description in string format of the energy
>> + * scale attributes
>> + */
>> +static ssize_t papr_show_value_desc(struct kobject *kobj,
>> +				     struct kobj_attribute *kobj_attr,
>> +				     char *buf)
>> +{
>> +	struct papr_attr *pattr = container_of(kobj_attr, struct papr_attr,
>> +					       kobj_attr);
>> +	struct h_energy_scale_info_hdr *t_hdr;
>> +	struct energy_scale_attribute *t_esi;
>> +	char *t_buf;
>> +	int ret = 0;
>> +
>> +	t_buf = kmalloc(MAX_BUF_SZ, GFP_KERNEL);
>> +	if (t_buf == NULL)
>> +		return -ENOMEM;
>> +
>> +	ret = plpar_hcall_norets(H_GET_ENERGY_SCALE_INFO, ESI_FLAGS_SINGLE,
>> +				 pattr->id, virt_to_phys(t_buf),
>> +				 MAX_BUF_SZ);
>> +
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	t_hdr = (struct h_energy_scale_info_hdr *) t_buf;
>> +	t_esi = (struct energy_scale_attribute *)
>> +		(t_buf + be64_to_cpu(t_hdr->array_offset));
>> +
>> +	ret = snprintf(buf, sizeof(t_esi->value_desc), "%s\n",
>> +		       t_esi->value_desc);
>> +	if (ret < 0)
>> +		ret = -EIO;
>> +out:
>> +	kfree(t_buf);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct papr_ops_info {
>> +	const char *attr_name;
>> +	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *kobj_attr,
>> +			char *buf);
>> +} ops_info[MAX_ATTRS] = {
>> +	{ "desc", papr_show_desc },
>> +	{ "value", papr_show_value },
>> +	{ "value_desc", papr_show_value_desc },
>> +};
>> +
>> +static void add_attr(u64 id, int index, struct papr_attr *attr)
>> +{
>> +	attr->id = id;
>> +	sysfs_attr_init(&attr->kobj_attr.attr);
>> +	attr->kobj_attr.attr.name = ops_info[index].attr_name;
>> +	attr->kobj_attr.attr.mode = 0444;
>> +	attr->kobj_attr.show = ops_info[index].show;
>> +}
>> +
>> +static int add_attr_group(u64 id, int len, struct papr_group *pg,
>> +			  bool show_val_desc)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < len; i++) {
> Could use MAX_ATTRS directly.

Sure, while writing this initially I wasn't sure how many attrs we'd have so it
passed as param, now I see that's not needed so I can remove that and use
MAX_ATTRS itself

>> +		if (!strcmp(ops_info[i].attr_name, "value_desc") &&
>> +		    !show_val_desc) {
>> +			continue;
>> +		}
>> +		add_attr(id, i, &pg->pgattrs[i]);
>> +		pg->pg.attrs[i] = &pg->pgattrs[i].kobj_attr.attr;
>> +	}
>> +
>> +	return sysfs_create_group(esi_kobj, &pg->pg);
>> +}
>> +
>> +static int __init papr_init(void)
>> +{
>> +	struct h_energy_scale_info_hdr *esi_hdr;
>> +	struct energy_scale_attribute *esi_attrs;
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
>> +	if (ret != H_SUCCESS) {
>> +		pr_warn("hcall failed: H_GET_ENERGY_SCALE_INFO");
>> +		goto out;
>> +	}
>> +
>> +	esi_hdr = (struct h_energy_scale_info_hdr *) esi_buf;
>> +	if (esi_hdr->data_header_version != ESI_VERSION) {
>> +		pr_warn("H_GET_ENERGY_SCALE_INFO VER MISMATCH - EXP: 0x%x, REC: 0x%x",
>> +			ESI_VERSION, esi_hdr->data_header_version);
>> +	}
>> +
>> +	num_attrs = be64_to_cpu(esi_hdr->num_attrs);
>> +	esi_attrs = (struct energy_scale_attribute *)
>> +		    (esi_buf + be64_to_cpu(esi_hdr->array_offset));
>> +
>> +	pgs = kcalloc(num_attrs, sizeof(*pgs), GFP_KERNEL);
>> +	if (!pgs)
>> +		goto out;
>> +
>> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
>> +	if (!papr_kobj) {
>> +		pr_warn("kobject_create_and_add papr failed\n");
>> +		goto out_pgs;
>> +	}
>> +
>> +	esi_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
>> +	if (!esi_kobj) {
>> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
>> +		goto out_kobj;
>> +	}
>> +
>> +	for (idx = 0; idx < num_attrs; idx++) {
>> +		bool show_val_desc = true;
>> +
>> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
>> +					    sizeof(*pgs[idx].pg.attrs),
>> +					    GFP_KERNEL);
>> +		if (!pgs[idx].pg.attrs)
>> +			goto out_ekobj;
> What about the attrs allocated during the previous iterations?

Yes, you're right that needs cleanups.
I could write the following to clean up old entries like I did when space for
name couldn't be allocated:
for (i = idx - 1; i >= 0; i++)
	kfree(pgs[i].pg.attrs);
Thanks for pointing that out.

>> +
>> +		pgs[idx].pg.name = kasprintf(GFP_KERNEL, "%lld",
>> +					     be64_to_cpu(esi_attrs[idx].id));
>> +		if (pgs[idx].pg.name == NULL) {
>> +			for (i = idx; i >= 0; i--)
>> +				kfree(pgs[i].pg.attrs);
>> +			goto out_ekobj;
>> +		}
>> +		/* Do not add the value description if it does not exist */
>> +		if (strlen(esi_attrs[idx].value_desc) == 0)
> strnlen

ack

>
>> +			show_val_desc = false;
>> +
>> +		if (add_attr_group(be64_to_cpu(esi_attrs[idx].id),
>> +				   MAX_ATTRS, &pgs[idx], show_val_desc)) {
>> +			pr_warn("Failed to create papr attribute group %s\n",
>> +				pgs[idx].pg.name);
>> +			goto out_pgattrs;
>> +		}
>> +	}
>> +
>> +	kfree(esi_buf);
>> +	return 0;
>> +
>> +out_pgattrs:
>> +	for (i = 0; i < MAX_ATTRS ; i++) {
> pgs is num_attrs long

Ah yes, you're right. It should loop over num_attrs

>
>> +		kfree(pgs[i].pg.attrs);
>> +		kfree(pgs[i].pg.name);
>> +	}
>> +out_ekobj:
>> +	kobject_put(esi_kobj);
>> +out_kobj:
>> +	kobject_put(papr_kobj);
>> +out_pgs:
>> +	kfree(pgs);
>> +out:
>> +	kfree(esi_buf);
>> +
>> +	return -ENOMEM;
>> +}
>> +
>> +machine_device_initcall(pseries, papr_init);

