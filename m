Return-Path: <linuxppc-dev+bounces-17866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHdMCAGHrGnzqQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 21:13:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304DE22D7B2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 21:13:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSvcC6KlJz2xqm;
	Sun, 08 Mar 2026 07:13:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772914427;
	cv=none; b=f3Ar3uKqIWo6RtLbNS7Asbdg8a9Ao8wqNeR30sSbndxRW68uFwqBAy7L9ABYt6WGLhrdcQJt4w/c3yTk0j8sI24QLJh/qcw0IX+lOB/7m5jSpGmK0rkux1709u3kkWRn5BP8wE+97NNAYVnrk+qhksGKIy9DwLHn+kDqCkQHFK/BRJzWwo1QIanOURcpCfOda5GdLr9MuBl17+tYJd0qh4venvba+yYoOdJD8nQwaUdu+5EQwQW+Qphtws+JJg7bWlRXKpny8tHrk5HH9fn+irjT6UjQqSl8JCJhatKSYAuF4Ldf/E2jvgN/wYl/lNa87jxNX9xUCVv7/kDVS+GBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772914427; c=relaxed/relaxed;
	bh=4yvLD11mVPllejxn3NL15m3qrDROut4e9teeeZ3ia3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCIjVtSxVCdaFyU38uTS23/r51K512PRGM0eyFOFpHQ4i0cb2gVF6H7hysvp89srHDWgmGznQRh2XYK1+zgzKLYRoyxoFUmGgLlTAnYN9t07L3/AQHdXZotm6lE8aTgg4Abt1fZAybKemuzmj4VfN7T9K4GHS1apx/+47jmepOxtSELwPOvRP8819R7sUw/U/I/j5wUs6wdIpxVFUZtW0wPBEd7J2QaWnrYoTtIZk9eRctxlA6SrmLTXT3ZB/DARXy1g8I5XRejSsxye07S0bSyuztXtWhlfEz0j2lYuWq+boA9Sbtiyn+/fJeW5umKZgTwW3YFg3L8dqC4gai1e8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+UI2JAF; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+UI2JAF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSvcC0hj6z2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Mar 2026 07:13:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627K9Co32843874;
	Sat, 7 Mar 2026 20:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=4yvLD11mVPllejxn3NL15m3qrDROut
	4e9teeeZ3ia3Q=; b=P+UI2JAFYXyztr0GQviq+R6yHEIV/AAUi+wL/0J6LYnAwf
	yVTRHgKcgwTSzi53FzdssTne0N6F+oWsSki9e3BuDtS5h6GGjr77V6LKM7HMXmn8
	zl1X1GZpCZ8eYHBypGRI0XiCSIwLb+BHbyMncm+a8ibEJ9QAYLQ4wBJIaAgUp/pX
	g56OBIoOfy/NXGYg/PaKgd2EJu+S7S4CKujsiancIUPai4M/ByUOeLQvBbHE4rIn
	d89/WWZOBd+3Kna1A7x9nykzm3NCBlJO8rU8+BtN03RN2np6PsqalcxXfcGNiULi
	yA9l2a53QT6guRX0svx0JhszTuyha4gF1WKHh3Rw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcuy1vf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 20:13:39 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 627JcKqd010299;
	Sat, 7 Mar 2026 20:13:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6kmk7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 20:13:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 627KDYvn17105392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Mar 2026 20:13:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36A7720049;
	Sat,  7 Mar 2026 20:13:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CECC920040;
	Sat,  7 Mar 2026 20:13:30 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.124.213.84])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat,  7 Mar 2026 20:13:30 +0000 (GMT)
Date: Sun, 8 Mar 2026 01:43:28 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, ritesh.list@gmail.com,
        shivangu@linux.ibm.com
Subject: Re: [PATCH v2 2/2] powerpc/crash: Update backup region offset in
 elfcorehdr on memory hotplug
Message-ID: <aayGKtxLIn02Gm08@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
References: <20260307052102.944952-3-sourabhjain@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307052102.944952-3-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EK4LElZC c=1 sm=1 tr=0 ts=69ac86f3 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=FEn-MK4_rbdEeUw7hVsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE5MCBTYWx0ZWRfX9f2HwwkHzoFH
 I59Pm7UMyIbJHkMAGr4hkjxfQG6BVHSrTrBfrSxcVGWBc5SlvnrTxfopAyLxzCh+oSvyEWi2x+I
 pTU0x5GBRvKjifrgepXjpo0Nc5flivivWKP4qPd5ZEppMNsWvKz1UTwOyGi+gIHJ9QgHNVKKcUn
 1zPznhfFOlhT/kfNAGpIrQtkTjAzqPZkc2DEwWKmlg3ZIOyJkbV9nJb/muFloOhSsC3v9nDIQ2i
 VzHIij+Cym1cW5jXSGOl/IQmSZAh6oNZlfMuvlueMg8MPOSr1NqUlbw+HBGC0IqochsdzJXPOqm
 1SfY5HXRayFuOlKk7lM60nzZoWx9p9ad4k1jScTdBxDL0DKozes1YvtX444AzylzhgxMmLKnFLO
 6KFfUlsofZ/xe+rtYUaeM2GW8UFz+pouq2PqdGTLyLlExIA98/bBPrLOShT07JDIAsfnhoN+68A
 14EQo6PD/DE6tHxnK4A==
X-Proofpoint-GUID: qRG8J4chwLGFiRvFXxP8kfaSNjuJsFFW
X-Proofpoint-ORIG-GUID: nJCqpkMrXKHDbrjYpdiUWO2eqqWn-TfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070190
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 304DE22D7B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com:mid];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-17866-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adityag@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adityag@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 26/03/07 10:50AM, Sourabh Jain wrote:
> <...snip...>
>
> +#ifdef CONFIG_CRASH_DUMP
> +/**
> + * sync_backup_region_phdr - synchronize backup region offset between
> + *			    kexec image and ELF core header.
> + * @image: Kexec image.
> + * @ehdr: ELF core header.
> + * @phdr_to_kimage: If true, read the offset from the ELF program header
> + *		    and update the kimage backup region. If false, update
> + *		    the ELF program header offset from the kimage backup
> + *		    region.

nit: if sending a v4, can we add a comment in 'phdr_to_kimage' description that
it is true in case of kexec_load and false in kexec_file_load, or maybe a
different name for the boolean eg 'use_phdr_offset' or simply 'is_kexec_load' ?

fwiw, part of the commit description mentions problem already fixed by patch 1

Looks good. Tested in pseries qemu.

Reviewed-by: Aditya Gupta <adityag@linux.ibm.com>

Thanks,
- Aditya G


