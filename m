Return-Path: <linuxppc-dev+bounces-11394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF796B38959
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 20:16:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBt5337jfz2ySY;
	Thu, 28 Aug 2025 04:16:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756318567;
	cv=none; b=iXbI4g2uLEy2Rx52Z5+4KYwwHCAfwN9o0O0D6H+qTQxlg+3ArTMQc5rh97xPYvhZzMDqes6iEwZqs6onceQMOnEpFzZHAJOmqi4xD27JI+11N/svq14RP0PjafZiJ2iixwQgxZjxOersZ1erbjOv3kfdJuH3Nl30YfZF5ziyEkpxSi5GhmKZFcUhKm59l0DODzsag1VyaJCPAThqCipGb5NfM1+cJoauF1sSp3spojJENhn8JI+tpP3eRP3lBJAFYuppOaz6TNE3dTz0TVoeOLPBPdyufbk5dOzuX/3GmqJob9XEAYR0qvBdAmhYLrqnPJKdbEPRBtl3Ten4WUy94Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756318567; c=relaxed/relaxed;
	bh=1/1WqEc6uXIlT/jg/aHRl6zmLA43K3i1GN0QMmzdo+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auNouGdQi+0G3jjgucm72p3uMdF2WOa/VLrDykNfKE+B/NgYFJVSRF1ONrB9NhTTp5MSYFcP5oo5Q4uX5xQL78lOUgVKJ0j4DozuOgIolZqePr1cT2JKaizMQAuOwCaILebk/XVtIaaI2uE+NVCt+z5z3xuiQ5pbuM4Rxel/M62VryHVpZnR4xir6rrt2rPzGVQE5Py1j5E6wjDIhp090u2vBMYS4uHuyGqylxqHBW4Ac14wFrIZGKiEADEIMMhVPyNYYdFg9tYO6Mq1jqrtGxGGWj8/e6n9O0d6FVli/O/pSeVTEEofGXOtIbt4B68yEkWHQ9J3Yvs1KWVV1xWj+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UMK0d/Zj; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UMK0d/Zj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBt4y4kw0z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 04:16:02 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RD05Hj006626;
	Wed, 27 Aug 2025 18:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=pp1;
	 bh=1/1WqEc6uXIlT/jg/aHRl6zmLA43K3i1GN0QMmzdo+o=; b=UMK0d/ZjY7g5
	6Puk76YkzdUZVFZsXAk/6obY7zGgYUk/g3uxIv2oW3PFjX214cKtIzg7fQyv91/U
	PKuaa7GrG0/L2lOgM1z/Y0BszUjPcgdW/jWxL/Zk6xWMAMxe7Uqznbz1t68rKZqA
	3nBvH2vZXLYZw7NQP1Sxzoye7BeKC35FaMUmQEOfUYL1XpNXU5KFaR5eBP/McwqM
	+RDcM/BVBZnqzO99EA+8GBX5ahGVEExRkMyTzzytklzRtHpq3mYW89diC8Oj114b
	eeDVvutQO6L+62raSh99hzE+oQs/mvXhIyxg7Yz9VqqvUKw3lADku2Gpq04ajUQr
	Ki5v6SNTCw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avnmjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:15:53 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57RHx7TH004799;
	Wed, 27 Aug 2025 18:15:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5avnmj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:15:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57RHGQCb017981;
	Wed, 27 Aug 2025 18:15:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3gy3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:15:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57RIFmg121889476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Aug 2025 18:15:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3833420043;
	Wed, 27 Aug 2025 18:15:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B96220040;
	Wed, 27 Aug 2025 18:15:46 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.24.199])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Aug 2025 18:15:45 +0000 (GMT)
Date: Wed, 27 Aug 2025 23:45:43 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com
Subject: Re: [PATCH v2 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
Message-ID: <24e2lr6ylufnhz3gimehaqvb6jlr73gxsd67gmn26tuinx7r25@xe3cwjrm7v4y>
Reply-To: mahesh@linux.ibm.com
References: <20250812225715.339225-1-haren@linux.ibm.com>
 <20250812225715.339225-4-haren@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812225715.339225-4-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ypmv6qtdQ5fnjmCuE1p98tOB1a5tBso9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX5DtqR2DODa8C
 HUy0JlehuYsvLvSmc9YhlLrBFJPtvpI+3vbSV0EPbpyw4wasL/5yKW7Bbw3HyDBXhRFB1UoTUcU
 KwVukf0k2Vvua3qByhF/OKQiJjH2ONZcS0krmu/MubxiVeI5QqFUvsPrzpJsHVuHcFUeYNhoaXq
 0oFdZ7k+sJzJWYECbCarDaxtWhM548b3Jim8qemcJp0WqDKRPGwKhMLFa+7V861Gwd6jKH/79JQ
 cHYNH6KnitPXA6gKuYaFcSBfeOGsJFQqS+Saoz3qhzAmCB4OJVKnn3nB75qMwBpHM5e62390j+Q
 loeB9yXoSwHPmXHVZtkGPMGuGisfVWTlwSmkD+0WZWoWRuE5GH3TXHNwwU/550HkocGnYHmMK9b
 gO0DkwtK
X-Proofpoint-ORIG-GUID: JThqqTGeA1w4-aSyEzw1mPZprHzQhRXF
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68af4b59 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=iILM0pd5H-MxPSOPN7QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-12 15:57:07 Tue, Haren Myneni wrote:
> The hypervisor provides ibm,send-hvpipe-msg and
> ibm,receive-hvpipe-msg RTAS calls which can be used by the
> partition to communicate through an inband hypervisor channel with
> different external sources such as Hardware Management Console
> (HMC). The information exchanged, whether it be messages, raw or
> formatted data, etc., is only known to between applications in the
> OS and the source (HMC). This patch adds papr-hvpipe character
> driver and provides the standard interfaces such as open / ioctl/
> read / write to user space for exchanging information with HMC
> using send/recevive HVPIPE RTAS functions.
> 
> PAPR (7.3.32 Hypervisor Pipe Information Exchange) defines the
> HVPIPE usage:
> - The hypervisor has one HVPIPE per partition for all sources.
> - OS can determine this feature’s availability by detecting the
>   “ibm,hypervisor-pipe-capable” property in the /rtas node of the
>   device tree.
> - Each source is represented by the source ID which is used in
>   send / recv HVPIPE RTAS. (Ex: source ID is the target for the
>   payload in send RTAS).
> - Return status of ibm,send-hvpipe-msg can be considered as
>   delivered the payload.
> - Return status of ibm,receive-hvpipe-msg can be considered as
>   ACK to source.
> - The hypervisor generates hvpipe message event interrupt when
>   the partition has the payload to receive.
> 
> Provide the interfaces to the user space with /dev/papr-hvpipe
> character device using the following programming model:
> 
> int devfd = open("/dev/papr-hvpipe")
> int fd = ioctl(devfd, PAPR_HVPIPE_IOC_CREATE_HANDLE, &srcID);
> - Restrict the user space to use the same source ID and do not
>   expect more than one process access with the same source.
> char *buf = malloc(size);
> - SIZE should be 4K and the buffer contains header and the
>   payload.
> length = write(fd, buf, size);
> - OS issues ibm,send-hvpipe-msg RTAS and returns the RTAS status
>   to the user space.
> ret = poll(fd,...)
> - The HVPIPE event message IRQ wakes up for any waiting FDs.
> length = read(fd, buf, size);
> - OS issues ibm,receive-hvpipe-msg to receive payload from the
>   hypervisor.
> release(fd);
> - OS issues ibm,receive-hvpipe-msg if any payload is pending so
>   that pipe is not blocked.
> 
> The actual implementation of these calls are added in the
> next patches.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/Makefile      |   1 +
>  arch/powerpc/platforms/pseries/papr-hvpipe.c | 274 +++++++++++++++++++
>  arch/powerpc/platforms/pseries/papr-hvpipe.h |  14 +
>  3 files changed, 289 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
>  create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h
> 
[...]
> +static int papr_hvpipe_dev_create_handle(u32 srcID)
> +{
> +	struct hvpipe_source_info *src_info;
> +	struct file *file;
> +	long err;
> +	int fd;
> +
> +	spin_lock(&hvpipe_src_list_lock);
> +	/*
> +	 * Do not allow more than one process communicates with
> +	 * each source.
> +	 */
> +	src_info = hvpipe_find_source(srcID);
> +	if (src_info) {
> +		spin_unlock(&hvpipe_src_list_lock);
> +		pr_err("pid(%d) is already using the source(%d)\n",
> +				src_info->tsk->pid, srcID);
> +		return -EALREADY;
> +	}
> +	spin_unlock(&hvpipe_src_list_lock);

What if two process simulteneously try to get handle ? The new src_info
node being allocated below isn't yet on the list. Which means as soon as
we unlock, there is a chance another process can still come here
requesting for same srcID and eventually we will see duplicate or more
entries for same srcID added to the list from different processes.

> +
> +	src_info = kzalloc(sizeof(*src_info), GFP_KERNEL_ACCOUNT);
> +	if (!src_info)
> +		return -ENOMEM;
> +
> +	src_info->srcID = srcID;
> +	src_info->tsk = current;
> +	init_waitqueue_head(&src_info->recv_wqh);
> +
> +	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> +	if (fd < 0) {
> +		err = fd;
> +		goto free_buf;
> +	}
> +
> +	file = anon_inode_getfile("[papr-hvpipe]",
> +			&papr_hvpipe_handle_ops, (void *)src_info,
> +			O_RDWR);
> +	if (IS_ERR(file)) {
> +		err = PTR_ERR(file);
> +		goto put_fd;
> +	}
> +
> +	fd_install(fd, file);
> +
> +	spin_lock(&hvpipe_src_list_lock);

Should we check again here to make sure same srcID hasn't been already
added to the list while we were unlocked and return -EALREADY ?

> +	list_add(&src_info->list, &hvpipe_src_list);
> +	spin_unlock(&hvpipe_src_list_lock);
> +
> +	return fd;
> +
> +put_fd:
> +	put_unused_fd(fd);
> +free_buf:
> +	kfree(src_info);
> +	return err;
> +}
> +

