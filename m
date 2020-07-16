Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AF221996
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 03:42:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6cSW4kyRzDqgZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 11:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6cQS6TPlzDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:40:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6cQS4wZVz8ypd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:40:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6cQS4Q1pz9sT6; Thu, 16 Jul 2020 11:40:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6cQS0STlz9sSt
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 11:40:31 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G1VSFp114462; Wed, 15 Jul 2020 21:40:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1k67fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 21:40:24 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G1VgdQ114895;
 Wed, 15 Jul 2020 21:40:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 327u1k67fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 21:40:23 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G1Zxat001424;
 Thu, 16 Jul 2020 01:40:23 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 327529ef74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 01:40:23 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G1eMnm53608770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 01:40:22 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80A69AE05F;
 Thu, 16 Jul 2020 01:40:22 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70051AE05C;
 Thu, 16 Jul 2020 01:40:18 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 01:40:18 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466095278.24747.9161591016931052627.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 08/12] ppc64/kexec_file: setup the stack for purgatory
In-reply-to: <159466095278.24747.9161591016931052627.stgit@hbathini.in.ibm.com>
Date: Wed, 15 Jul 2020 22:40:13 -0300
Message-ID: <87wo348cg2.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160005
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
Cc: Pingfan Liu <piliu@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Sorry, forgot to send one comment for this patch:

Hari Bathini <hbathini@linux.ibm.com> writes:

> @@ -898,10 +900,37 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>  			goto out;
>  	}
>
> +	/* Setup the stack top */
> +	stack_buf = kexec_purgatory_get_symbol_addr(image, "stack_buf");
> +	if (!stack_buf)
> +		goto out;
> +
> +	val = (u64)stack_buf + KEXEC_PURGATORY_STACK_SIZE;
> +	ret = kexec_purgatory_get_set_symbol(image, "stack", &val, sizeof(val),
> +					     false);
> +	if (ret)
> +		goto out;
> +
>  	/* Setup the TOC pointer */
>  	val = get_toc_ptr(&(image->purgatory_info));
>  	ret = kexec_purgatory_get_set_symbol(image, "my_toc", &val, sizeof(val),
>  					     false);
> +	if (ret)
> +		goto out;
> +
> +	/* Setup OPAL base & entry values */
> +	dn = of_find_node_by_path("/ibm,opal");
> +	if (dn) {
> +		of_property_read_u64(dn, "opal-base-address", &val);
> +		ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
> +						     sizeof(val), false);
> +		if (ret)
> +			goto out;
> +
> +		of_property_read_u64(dn, "opal-entry-address", &val);
> +		ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
> +						     sizeof(val), false);

You need to call of_node_put(dn) here and in the if (ret) case above.

> +	}
>  out:
>  	if (ret)
>  		pr_err("Failed to setup purgatory symbols");

--
Thiago Jung Bauermann
IBM Linux Technology Center
