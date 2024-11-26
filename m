Return-Path: <linuxppc-dev+bounces-3577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBEB9D9DE0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 20:12:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyXJk0NG7z2yjg;
	Wed, 27 Nov 2024 06:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732648357;
	cv=none; b=HR019nngVy5VKHN9rckgv+lD4PuRC7RqJ53vPZfjIbNgt0e+Q1EpjOTRaDgejxPXnW2FlMVNl7t4jHNLOXq8K/MfVM5nEsrLyEDkQsd8DxTLnQNoEPkj9wZkMn4ZaoyxqJFFpS5Nw2ygBwvrDJYP6NGiic1KTtX5XzV8lfURq7iGxJGaA/eA2BbJULtFZA8M3oYJ6aKXVmytQknJu3qnq9mrvGfUSyMd+eD2UMb0pl+atJHNpyZk0GNv1Qpu6FGoKzhOqR0eUWZqvMZpoYE5LklFiLNSyzEBw98hknj5IwcC8HrSNk7B8G6bZv+DEFfmguf+zz9Hr1WDnvRefdMRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732648357; c=relaxed/relaxed;
	bh=juxmy+LN1da5h1GKzYEEUBLwpi80Q0PP/+0zUlrMJUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKYon4WDh8Latx0vqlaZGjsYXFy4yYLCI7aIRhxgm27Ew0pYsbTCXB1SGdi2UMGiQsJJUAVfLwPTKTNvRHMSOPkFeyHBAl601q94PI3PGOIabFLwjzASb7pJQuuCOJ2eIElY71bAqzNvdp8u+MDQS30klyfAj3bLZLXNIi/k0CvQ1zqD8xSmBhj71amw4vWoOzMxHepYunmfRGadxmULtONpHuseTojEkuA875b9M6/v46IiUurog+D7GXykPKHdkhWRx8uUYtPRz5ELVpkPYRu4xn9N2IgqDYKsRCXvLgY4tdYK0d6o7tJrM9Lifmb1r1TbhNpuol6SN5iJzQUkBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SMSGuC24; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SMSGuC24;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyXJh4khrz2yHj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2024 06:12:35 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ9bpP9027857;
	Tue, 26 Nov 2024 19:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=juxmy+LN1da5h1GKzYEEU
	BLwpi80Q0PP/+0zUlrMJUQ=; b=SMSGuC240zvZuCbQlgSxRpZZRR72KFrshFPof
	aAj5SfUrnBSgvGVsnGWXTWvz3MQZbB/YJkghhfovmEC7wSaGrXNLZw0dJ+z9Xqk7
	OVnQ3PZX3CPt8G/Y2LNh/WT+0nq47j97hIMi4vY1to2lIQyHV4ckySNFwK3eHG3A
	j7g5lLlULckJnzTbYgiHBmysw+We62sodfBt6RIwS+6a680OBpVXcQBUc9z9sB7V
	kRAbF62Uxtqx3DVFD0+cW9fJHL/K3JnqSBw7UKcji1J7Wn4IgEoA72AZll0h8dPo
	wD7RIgvP5AfQg2ZnXgWYiQC12zNWDbgoFkBoTTwNmAL239Rcg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4350rhnbdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 19:12:24 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AQJASmx029238;
	Tue, 26 Nov 2024 19:12:24 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4350rhnbdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 19:12:24 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQCwVqG008785;
	Tue, 26 Nov 2024 19:12:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 433scrw2gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 19:12:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AQJCKTG55378348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 19:12:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 286A82004B;
	Tue, 26 Nov 2024 19:12:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0B8820043;
	Tue, 26 Nov 2024 19:12:18 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.222.158])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 26 Nov 2024 19:12:18 +0000 (GMT)
Date: Wed, 27 Nov 2024 00:42:10 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        maddy@linux.ibm.com, msuchanek@suse.de, tyreld@linux.ibm.com,
        hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character driver
 for dump retrieval
Message-ID: <jmjczbrkepk447u64usrr3mbx3nwei2ot7fbheu3yguyrtuo2o@dwmszh6ksbog>
Reply-To: mahesh@linux.ibm.com
References: <20241124052040.239813-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124052040.239813-1-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2vogy2P9NoWQ1WL1piFURj9joBmG_uTQ
X-Proofpoint-ORIG-GUID: 4_cq17Sb7tz4tVOI0U50uyNhFtYfqp61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=818 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260151
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-11-23 21:20:39 Sat, Haren Myneni wrote:
[...]
> +static ssize_t papr_platform_dump_handle_read(struct file *file,
> +		char __user *buf, size_t size, loff_t *off)
> +{
> +	struct ibm_platform_dump_params *params = file->private_data;
> +	u64 total_bytes;
> +	s32 fwrc;
> +
> +	/*
> +	 * Dump already completed with the previous read calls.
> +	 * In case if the user space issues further reads, returns
> +	 * -EINVAL.
> +	 */
> +	if (!params->buf_length) {
> +		pr_warn_once("Platform dump completed for dump ID %llu\n",
> +			(u64) (((u64)params->dump_tag_hi << 32) |
> +				params->dump_tag_lo));
> +		return -EINVAL;
> +	}
> +
> +	if (size < SZ_1K) {
> +		pr_err_once("Buffer length should be minimum 1024 bytes\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * The hypervisor returns status 0 if no more data available to
> +	 * download. Then expects the last RTAS call with NULL buffer
> +	 * to invalidate the dump which means dump will be freed in the
> +	 * hypervisor.
> +	 */
> +	if (params->status == RTAS_IBM_PLATFORM_DUMP_COMPLETE) {
> +		params->buf_length = 0;
> +		fwrc = rtas_ibm_platform_dump(params, 0, 0);
> +		/*
> +		 * Returns 0 (success) to the user space so that user
> +		 * space read stops.

Does this implicitly invalidates the dump irrespective of whether
userspace has requested or not ?

Copy-pasting bellow code snippet from librtas side patch posted by you to
librtas-devel mailing list:
+ /*
+ * rtas_platform_dump() is called with buf = NULL and length = 0
+ * for "dump complete" RTAS call to invalidate dump.
+ * For kernel interface, read() will be continued until the
+ * return value = 0. Means kernel API will return this value only
+ * after issued "dump complete" call. So nothing to do further
+ * for the last RTAS call.
+ */
+ if (buffer == NULL)
+ return 0;

If I understand this correctly, it looks like calling
rtas_platform_dump() with buf = NULL and length = 0, now does nothing.
Dump is already invalidated even before userspace makes this call.
Wouldn't this break ABI ? Correct me if I am wrong.

Consider a scenario where userspace tool using librtas interface
rtas_platform_dump() reads the last set of data but unable to write it
to the disk due to insufficient disk space. In that case, tool may error
out without invalidating the dump and expect user to cleanup the disk
space, re-run the tool to save platform dump to disk. If last read
implicitly invalidates the dump, then in this scenario user will loose
the platform dump. Shouldn't we wait for explicit request from user to
invalidate the dump to avoid this ?

Thanks,
-Mahesh.

