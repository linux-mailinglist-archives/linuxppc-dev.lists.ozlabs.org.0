Return-Path: <linuxppc-dev+bounces-17864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLoKLieErGlUqQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 21:01:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661722D761
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 21:01:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSvL72PzYz2xqm;
	Sun, 08 Mar 2026 07:01:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772913695;
	cv=none; b=m+551nbaH/xU0/ui+FCK6a/vMUJm3YEnzlUZl4s4LrpumMkrYKfPxmdG/vIEkL/QzpDEDNIQJq5G/QEF5v0nFByNktN7V1JP+i3hEqzqqrsSgq3y+CwrnXBoOaXHwsmyxjFILjdE4iKfKXWMyDw6+cpbmpWv5OmOTDr8Mz4yVN0/JgCK4Syrljpgj8zqaN8gF/CjHXBmtKh0W2do+SYnQ0qpXPozu4yWT7ErzOSK7KvKK3b56sgIgfDesDiB8av0janjWbssYcfepMWL24N7Q9kncHmvVgISWLr6nHgAGRQFxDA8OFyngl9WN727VGIgLKg/XguYwN8ugqmNWBwL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772913695; c=relaxed/relaxed;
	bh=9m1RJq7FNDeU576eiwGflXuWFtAnIlo62GlYd1tz7eU=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FIIqpTeSvfEs310Bu6Rnv7QlTb5cQuInr2niqQ1zDJJm/ws0uNPVzNTd6naOoeJN1FcNxarXcFcMrYPewMwli3U1XNsg9CGlPdTz8gVIc0V/AQqN7F3CWqriiqsEKuwBwpjfc0feCMNYk8UyB4kNtpYSBw5aaGncMlnkJc1TaH1qTR1/byGEg1bVJFK0xqn8LgiZoJ7zWb2udCi+h0QKADEeD9gjbjtvIfuh1La7jh9934y9v9cp8bonJaeEuEn+apRMeNNKo9qheK0JUI7/sYErvBP5IHf0+iFaeFShCWDlmc9K6yo7b36f6dBR70XCezDAX5k8tOeJY8MW8sbF1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbAmrY5d; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pbAmrY5d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSvL145zgz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Mar 2026 07:01:28 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627JOVeO2783538;
	Sat, 7 Mar 2026 20:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:message-id:mime-version:to; s=pp1; bh=9m
	1RJq7FNDeU576eiwGflXuWFtAnIlo62GlYd1tz7eU=; b=pbAmrY5dxd+KZs2UyB
	SDGcpTUnkezKo5g41dc8a4MeRph8RAoOvkv4InQjBb7elnox4SeeHe4eX+sfzXXG
	Tw0qhRxW09Vf/XTAVDRuRlDYWhw3SKABc4nnV5V/FiBtw7M1BenWrspc/C5pyE0z
	chZG3wlnuB8j11/qdOXbHZkmxT+oTmLXutqcTFPOixMS54bl+73b13huqTey7Grp
	Af39YJsFDnFDRXdj0LqxQx8Y2kj+m/mLW4Bz9gJFLklDdS8yh0LMg2CAacjaYI7g
	1edtXY2+zPayvFPs52zLDoT6yVNJT8HWmTnmKezSs/OiOttCBGDOjYjJCiEdBvSH
	6NGg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcun1sat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 20:01:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 627HhZ0W003200;
	Sat, 7 Mar 2026 20:01:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmb2yms6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Mar 2026 20:01:16 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 627K1Cdu30212600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Mar 2026 20:01:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DB2120043;
	Sat,  7 Mar 2026 20:01:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A7F520040;
	Sat,  7 Mar 2026 20:01:09 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.124.213.84])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat,  7 Mar 2026 20:01:09 +0000 (GMT)
Date: Sun, 8 Mar 2026 01:31:06 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, ritesh.list@gmail.com,
        shivangu@linux.ibm.com
Message-ID: <aayEAjcSkyNO_jUN@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: OHSqgNIM3RBQ1exYhD7aRWSTBaekLyDg
X-Authority-Analysis: v=2.4 cv=Hp172kTS c=1 sm=1 tr=0 ts=69ac840d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22
 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=LqGHENNDh5GafYNGEFUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE5MCBTYWx0ZWRfX/s0646PtXiRH
 c+9iKERRwmV5fpH6hajRxttn8BJ6WJKyui5sgCD7t86x3WrmnNYcaO+ZYYRxAlvx858rT3tkr6U
 1w4WBbTsZDttnGxfzku1pm3ScXiDT7AHGtIz4iGRsYNiqpfH+GUrqgQhZUC95KhiVZxkkOMMGST
 ihQqgUx6J6LRlEZXa4Wp4u3epXvo4a7OL2L2A5m9wBIMqebIdmkMXkQ1gNscPHp+Gd33W4zM5QK
 cCj/JvwdarYpos8CLlmMl4jTMDiYi/1oxsS5KG4jSvwkgXi+r2ZK6oYwrmjBZxVsAD+AEnkHjyz
 rWPsRrZqBUwElrIXc+ntH+EFnebSgwZW3CI9FjnvCExIDbKddl/2hzQGj6GrW/c6O9wWE9VVr4M
 3Iwo+u+1QUP/m66V/xqIsEzzpZrtBICUD0WqtTIEkaFuT0Dg9fstqCS7XafKjioxCeWQqq0T6gs
 L4hxA686g+ycOMpriyA==
X-Proofpoint-ORIG-GUID: 6kyIB6d6Ac_a8AyYvkps-rYF3hWFpP_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_06,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070190
X-Spam-Status: No, score=1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MISSING_SUBJECT,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7661722D761
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.29 / 15.00];
	MISSING_SUBJECT(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-17864-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com:mid];
	FORGED_SENDER(0.00)[adityag@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adityag@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

maddy@linux.ibm.com, mahesh@linux.ibm.com, mpe@ellerman.id.au,
ritesh.list@gmail.com, shivangu@linux.ibm.com
Bcc: adityag@linux.ibm.com
Subject: Re: [PATCH v2 1/2] powerpc/crash: fix backup region offset update to
 eflcorehdr
Message-ID: <aayC-Ux4TXwv2zwN@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
Reply-To:
In-Reply-To: <20260307052102.944952-2-sourabhjain@linux.ibm.com>

Minor nit in subject: s/eflcorehdr/elfcorehdr

On 26/03/07 10:50AM, Sourabh Jain wrote:
> <...snip...>
>
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


