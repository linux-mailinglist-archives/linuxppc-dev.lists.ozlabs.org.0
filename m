Return-Path: <linuxppc-dev+bounces-17865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 92NYGLqErGmPqQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 21:04:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B3222D774
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 21:04:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSvP24Nr1z2xqm;
	Sun, 08 Mar 2026 07:04:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772913846;
	cv=none; b=BnB/iwhiYEfasWKz+4lnhtbwRkQcP8HKx6H+CyyDNVkZdfZ9XJM71Y7a7b5IpCBLtIiSpCuJ+yq3YNWj9tyb1W22vh61sV/2/sCaxMDQ7UlVR+OcTfNbWkPS11Y3baAYl46jgZAr+lD6SxgGYocvENnLSJlhxXm5x7J4m0IQynl3K2eig3oE5r6SlJWVN+1QiWQMdod15kD4v5GluN29SaIddmGdbAbyUtCt+rwwdKQuwSIvHcjJ7n9wz3yjPE6A2A2nvZW3ZnSxfLKFHe9OChIAmzkL8nmiLepa7D618EAlst74ZDjHJQxvoNzyRHG6lrN4S7ijmyxvc6HXgzpBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772913846; c=relaxed/relaxed;
	bh=OKPrIA7gSuChVCp6geJECiky17oosnV9fTCtrbI5tJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RokIFi7bgfwMWcrt40FRehy24OqBFF7lzogPpNtz3IycjFuR073rGiuEla8nloxvpXx0lmkvKszVcsoJgabZA0Iro4F7hfnaHzHX1QdqRhog4OOM5YoJbO+GdUMeyyKpysBQU56dNWKY/uPmF6ucGREX3RSk7ZU4nS5a1ZrXR6ZHxhNOiZ98n+hjdTRAImuEZYaNkXrQ2d7JKgHwWvZ+8x20NrtT4W+iavj2IJUxl2jXncIyU3c7F4MOwPAHfFyNF8AQ8fiJcOyx5RSvyNPmvavjck4skBr2LUz6ncnKtLTjBaaJ1wv6JOPNqCTB8xhcL0LrB8BBBGdZt7oBoZdgqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QrdUoi75; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QrdUoi75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSvP15jY6z2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Mar 2026 07:04:05 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627BLaaC1760254;
	Sat, 7 Mar 2026 20:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=OKPrIA7gSuChVCp6geJECiky17oosn
	V9fTCtrbI5tJw=; b=QrdUoi75ndzJkxcSrU78WIy4L4mR5Z4zvddARcWis+emDR
	2ar3KsXHmFdae+zB8QH2pqeQkcmZsjDFw5Gl8vGtuXnxnDLgr4gzKHiCcQZwoJF+
	XaGAhzRo8UDXXcwFu0P5DGt0EmcV2Gth8NrdsphUi2khh1IQwGBaMjxBCC3LZIsP
	zvp4aCT0XgDiOPwDziFwiL8l8KhzWpwBbRKR9fSty26SzJJl0OUw9eZkJh2oVBTW
	m6Vq3YqCClqyAZTrwLE+vXrcPgqfv+T+GeZ8AqHcEN5zbAcuIMi/rzDSsQD33P52
	KsRB+hGACUhuUfZpHdrVb7LEuo/8p303o+1ODzWw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcyw1uj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 20:03:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 627I5cYM011249;
	Sat, 7 Mar 2026 20:03:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cqau317bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 20:03:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 627K3qgH37618168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Mar 2026 20:03:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5DF0520043;
	Sat,  7 Mar 2026 20:03:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EE2020040;
	Sat,  7 Mar 2026 20:03:49 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.124.213.84])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat,  7 Mar 2026 20:03:48 +0000 (GMT)
Date: Sun, 8 Mar 2026 01:33:46 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, ritesh.list@gmail.com,
        shivangu@linux.ibm.com
Subject: Re: [PATCH v2 1/2] powerpc/crash: fix backup region offset update to
 eflcorehdr
Message-ID: <aayEIBhSLxjcaDVv@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
References: <20260307052102.944952-2-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20260307052102.944952-2-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE5MCBTYWx0ZWRfX9+ARLhnVWOny
 2Z6ph9T0IsxjShWaE1T8hCt0HmZ4kz+zbkeMVoE8oK25m8H5b1EbmnhhvWhx7Qv/Ng+pMDAhsWK
 2V8GiRyPjZfr/3s+dLCWTx4+O9HNlXDbJfQ+7FmwY3zjrW8cGQqdyBoWZHg8SOLRRynRQN73HBb
 jj1eV/K4CjNpLWJeKRiPRQTJLOKuxjVjx33rX3hlwUvJoFROnZgfyi9bnMR6A7F3zriDBXjZSG/
 MJOD9ZFfawB9OPVjTww6ng0PLWr8pc0LTM8IclarQTlaJ8/NLuKXIyqmTEh/DrXgO/R5wCdqEA3
 Su0WqKT1vnkWudBJfqlAdPuHFEoowX3RHgZigOOg5qiC8CCFWow01Oz3cwweU9xlVvf5RsL5uVJ
 7W/cmfJKAlZba4EYcpcsodRocy84+yVCN+tSLA3UGbtpbjtIY0VXweewPRnhTLBiNNi7Va9zpvJ
 NNgr49cZtseefbuCRXg==
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=69ac84ad cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=sA1XNX0lgMFCPhbnMi0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: riQMSPxqFozOE1pmSfT14Wit8KwrbfB0
X-Proofpoint-ORIG-GUID: dq_iQi5F4EdScWH8eKNJbEbm8JXiG-9o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070190
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 67B3222D774
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-17865-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[adityag@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adityag@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Sorry for the multiple mails, some mess up with my mail client.

On 26/03/07 10:50AM, Sourabh Jain wrote:
> <...snip...>
>
>  arch/powerpc/kexec/file_load_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Minor nit in subject: s/eflcorehdr/elfcorehdr

> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index e7ef8b2a2554..e631cf2eda2c 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -391,7 +391,7 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
>  	unsigned int i;
>  
>  	phdr = (Elf64_Phdr *)(ehdr + 1);
> -	for (i = 0; i < ehdr->e_phnum; i++) {
> +	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
>  		if (phdr->p_paddr == BACKUP_SRC_START) {
>  			phdr->p_offset = image->arch.backup_start;
>  			kexec_dprintk("Backup region offset updated to 0x%lx\n",

Interesting catch, I see in current images compiler was just optimising
this to not even run more than 1 iteration since phdr never changed :)

With the patch, able to see the offset changing now:

	Previously, without the patch:
	(gdb) p/x *phdr
	$13 = {
	  p_type = 0x1,
	  p_flags = 0x7,
	  p_offset = 0x0,   <--- never changed
	  p_vaddr = 0xc000000000000000,
	  p_paddr = 0x0,
	  p_filesz = 0x10000,
	  p_memsz = 0x10000,
	  p_align = 0x0
	}

	With the patch, the offset gets set correctly:
	  p_type = 0x1,
	  p_flags = 0x7,
	  p_offset = 0x240b0000,
	  p_vaddr = 0xc000000000000000,
	  p_paddr = 0x0,
	  p_filesz = 0x10000,
	  p_memsz = 0x10000,
	  p_align = 0x0

Can also see the kexec print:

	[   29.377990] backup region offset updated to 0x240b0000
	[   29.446360] loaded elf core header at 0x240c0000, bufsz=0x1000 memsz=0x80000

Looks good to me, just minor nit in subject above.

Reviewed-by: Aditya Gupta <adityag@linux.ibm.com>

Thanks,
- Aditya G


