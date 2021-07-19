Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60A3CEB40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 21:10:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTBJ61lYtz3bYF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 05:10:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQktzIsO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hQktzIsO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTBHb2FGDz2yP2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 05:10:02 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JJ3bEa085866; Mon, 19 Jul 2021 15:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=yffuskbZjbkCSggQOcBqBaCblBD0NP0nsAkyxMQzvig=;
 b=hQktzIsOhHBCzqFmjJRXb6M536SgGU9nDRbEaolPfyfRgMxNtEdLZ7XkSP7/eFSTjIpv
 73Eoza389D6D/YF7sfxmtNSMUOpcv209lWEubSTiFj+sENAz8gM5LBia2fyeIiLZAmuQ
 Jnbn8RFpkJtGiPMBal4hZKsF1ErgrrYq6cUUB4jHfrQV9uZLAnPM+4wPFLQsrFktC95u
 z+3p9Typ5i/IeJ4bAolAo5JCpZbWmZ9+QkoWPdW7vfbeMm53BxylHn8VjRtGb+W7BtD4
 RIZmRx8aC0Xu3EGQsXdqltHcp5oDp0zfpKvSVbI/HnEa3/Nnrr9n6SxUM547F4tfE4bw fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wf6c07sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:09:50 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JJ5uHH101007;
 Mon, 19 Jul 2021 15:09:49 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39wf6c07s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:09:49 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JJ8TfE005124;
 Mon, 19 Jul 2021 19:09:49 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 39upub7uf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 19:09:48 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JJ9lTb15204744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 19:09:47 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F1D978064;
 Mon, 19 Jul 2021 19:09:47 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC2BE78063;
 Mon, 19 Jul 2021 19:09:46 +0000 (GMT)
Received: from localhost (unknown [9.211.80.96])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Jul 2021 19:09:46 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Pratik R. Sampat" <psampat@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, psampat@linux.ibm.com,
 pratik.r.sampat@gmail.com
Subject: Re: [PATCH v5 1/1] powerpc/pseries: Interface to represent PAPR
 firmware attributes
In-Reply-To: <20210719093250.41405-2-psampat@linux.ibm.com>
References: <20210719093250.41405-1-psampat@linux.ibm.com>
 <20210719093250.41405-2-psampat@linux.ibm.com>
Date: Mon, 19 Jul 2021 16:09:44 -0300
Message-ID: <87fswa2k93.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ngeXdlbW3EHNZBl-0ru8DfbP6dw6U89I
X-Proofpoint-GUID: bmPnIy4xdc9Mc2NPjWUlKfU9gmKnt_7H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_09:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190109
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

"Pratik R. Sampat" <psampat@linux.ibm.com> writes:

> +	pgs = kcalloc(num_attrs, sizeof(*pgs), GFP_KERNEL);
> +	if (!pgs)
> +		goto out;
> +
> +	papr_kobj = kobject_create_and_add("papr", firmware_kobj);
> +	if (!papr_kobj) {
> +		pr_warn("kobject_create_and_add papr failed\n");
> +		goto out_pgs;
> +	}
> +
> +	esi_kobj = kobject_create_and_add("energy_scale_info", papr_kobj);
> +	if (!esi_kobj) {
> +		pr_warn("kobject_create_and_add energy_scale_info failed\n");
> +		goto out_kobj;
> +	}
> +
> +	for (idx = 0; idx < num_attrs; idx++) {
> +		bool show_val_desc = true;
> +
> +		pgs[idx].pg.attrs = kcalloc(MAX_ATTRS + 1,
> +					    sizeof(*pgs[idx].pg.attrs),
> +					    GFP_KERNEL);
> +		if (!pgs[idx].pg.attrs) {
> +			for (i = idx - 1; i >= 0; i--)
> +				kfree(pgs[i].pg.attrs);

What about the pg.name from the previous iterations?

> +			goto out_ekobj;
> +		}
> +
> +		pgs[idx].pg.name = kasprintf(GFP_KERNEL, "%lld",
> +					     be64_to_cpu(esi_attrs[idx].id));
> +		if (pgs[idx].pg.name == NULL) {
> +			for (i = idx; i >= 0; i--)
> +				kfree(pgs[i].pg.attrs);

Here too.

You could just 'goto out_pgattrs' in both cases.

> +			goto out_ekobj;
> +		}
> +		/* Do not add the value description if it does not exist */
> +		if (strnlen(esi_attrs[idx].value_desc,
> +			    sizeof(esi_attrs[idx].value_desc)) == 0)
> +			show_val_desc = false;
> +
> +		if (add_attr_group(be64_to_cpu(esi_attrs[idx].id), &pgs[idx],
> +				   show_val_desc)) {
> +			pr_warn("Failed to create papr attribute group %s\n",
> +				pgs[idx].pg.name);
> +			goto out_pgattrs;
> +		}
> +	}
> +
> +	kfree(esi_buf);
> +	return 0;
> +
> +out_pgattrs:
> +	for (i = 0; i < num_attrs ; i++) {
> +		kfree(pgs[i].pg.attrs);
> +		kfree(pgs[i].pg.name);
> +	}
> +out_ekobj:
> +	kobject_put(esi_kobj);
> +out_kobj:
> +	kobject_put(papr_kobj);
> +out_pgs:
> +	kfree(pgs);
> +out:
> +	kfree(esi_buf);
> +
> +	return -ENOMEM;
> +}
> +
> +machine_device_initcall(pseries, papr_init);
