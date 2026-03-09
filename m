Return-Path: <linuxppc-dev+bounces-17898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePTCAmDKrmnEIwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:25:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F996239B49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 14:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTySX2gjdz3c9b;
	Tue, 10 Mar 2026 00:25:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773062748;
	cv=none; b=MwZSrnP3YA6TUtYCE2LtpAVmd5NdeiMB7s07UJIdkzE97R/RvfAHDbEZnSuoYCre065z9sbg02MVCCaTg5SBS+Ns/xq2k+rhAMHEVdPrdZkfy0R+/oO+R9q587t+TCgmnDuEPqA502By1fd/szqvgbD/A4iQBbhC85yXGI1uZayABwh3UbNPXmxxgXie+XI1wuInGXuu7oJXEKUulPU0SE3R53UwQqgE1ruafOfAst7pvZ97bvNs2KGh+L7ygSr9qvpHnKdvZIxueFK9vNJk5BE6+mP4quYIQ/nE+kaNTm9JxZAbBsOeFxliOGLE1z/iYebA34K2IqLclnWE6+dDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773062748; c=relaxed/relaxed;
	bh=4ZwPXT5+rgE2zFgwrEa+cKqSB+W8thhM3mLpvR9VdWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBnYO+GKWgDBd1GgktiHS4Snq+7im0xmE9toS0pMLxLlzWTy6T2m21YhWOlpXR0uxhBKAaCtsuVLQhkReFRtackFzFiViUi+UWQHCE0svsM/0BW8eNKYuN6CcftW9X5S/UsQ9gBp/U20Dqq11rCoU55vj7O/Oh/pz/4y1z/gViQpmqilX8mNgTsZZgdaRlpb/WSup4HDT3NXvnfKiZbAzW51uclQow1RysEhrh5cxNxC7Dp9fW37RcAN8rdYLY4xeUV6CvXpZbCNOHs4IdE/SIAfA8kusxO+Qg2DCWRF7ZRMbBlosIYfQisU7/okB5DXKJik2jn/H/L05zmna6+pDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nXHTCJ7D; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nXHTCJ7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTySW3kglz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 00:25:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628KQSfA1636098;
	Mon, 9 Mar 2026 13:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4ZwPXT
	5+rgE2zFgwrEa+cKqSB+W8thhM3mLpvR9VdWI=; b=nXHTCJ7DhOdqiTw36mGcnB
	aHrNBqsqykBFft5TEiVQ9BImziBIv4Mawp0AOV0qgac1xaT801qgACu+FzO5PT2g
	9B+5pYV1zB5aD0OAke++lVYArHzZJ0dUXrYV/9yyI4sSiwWhVseRKPagsTav3L3K
	P2numt6oGR5wId9NAAVwanKKbKQPUdQWSJQtUq4vS1Yq9S+HLs13lMY74SH65vAz
	nDicfzNmWilKBnc+g6F6Fr+dsdxehdzuwEEaS3jtziLe4vT6LTlPuaShyPge1Fsw
	dbWPLHpbVHtJQ9+Um5rYPQuWYYWkQDA6SFfosi9laeTSqIrXoYDyFvcIpO90ugnQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvm6q2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 13:25:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6298uKPu009085;
	Mon, 9 Mar 2026 13:25:37 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4crxqy562d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Mar 2026 13:25:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 629DPXnr50069928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 13:25:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70C0B20043;
	Mon,  9 Mar 2026 13:25:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B84920040;
	Mon,  9 Mar 2026 13:25:31 +0000 (GMT)
Received: from [9.39.22.34] (unknown [9.39.22.34])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Mar 2026 13:25:30 +0000 (GMT)
Message-ID: <b5594cc0-1747-4f6f-ae19-272f3fde1ed4@linux.ibm.com>
Date: Mon, 9 Mar 2026 18:55:29 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc/crash: fix backup region offset update to
 eflcorehdr
To: Aditya Gupta <adityag@linux.ibm.com>
Cc: hbathini@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, ritesh.list@gmail.com,
        shivangu@linux.ibm.com
References: <20260307052102.944952-2-sourabhjain@linux.ibm.com>
 <aayEIBhSLxjcaDVv@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <aayEIBhSLxjcaDVv@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: akC45lScsr-bBKKskPmFNxk0jp4Az5Ha
X-Proofpoint-ORIG-GUID: FAruRUfw8q8hhJHjuLof_6WZfahfRhCE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOSBTYWx0ZWRfXzmRbAjanjOnM
 2/2wt8pc6sPPV4dmFtACr+h7gCkEwu0UIgxzHSogCZIZs3+yopas+bJml7Wo6DJFRFB/FMK1QIC
 fpRjiq32VAwbVqJGmfRgZST0Qr3TeTjiS3RX7UrsuJtR3aalxWvW3TIq7KNO2XSIZL8M3fMK0LK
 JafqIho7ipo2LUFJhgojWEEVze1OTmxfQr+offVKRZ8XC6IvEcsrYaqCHuqnsnBrEsicV9mNqte
 o6c9KQmdlrTZ682Gw2YbwS6EWsTwmOzT8qsDYVm7odfkoPxPnWR13LLsDjCZJuW12lwcFuVW1Qb
 LnZGejFY1i0DfkKqvuwj8n+uRnbebYeYT+dfNHwHc5JRbNavninH+DoGxL9seO8N61uHwEl029s
 HLyD+dAFSXMbouWm1Ym3dSezt8+8grNINRdxkyE9mw/04KQpe2yJuvt3D+W7HY6vOYzj5VbKy4H
 6nq6qE767D0Lbn/QZmw==
X-Authority-Analysis: v=2.4 cv=B5q0EetM c=1 sm=1 tr=0 ts=69aeca52 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=y5_72lOV29XthaAjUI0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090119
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 0F996239B49
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FREEMAIL_CC(0.00)[linux.ibm.com,lists.ozlabs.org,ellerman.id.au,gmail.com];
	TAGGED_FROM(0.00)[bounces-17898-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:adityag@linux.ibm.com,m:hbathini@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mahesh@linux.ibm.com,m:mpe@ellerman.id.au,m:ritesh.list@gmail.com,m:shivangu@linux.ibm.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 08/03/26 01:33, Aditya Gupta wrote:
> Sorry for the multiple mails, some mess up with my mail client.
>
> On 26/03/07 10:50AM, Sourabh Jain wrote:
>> <...snip...>
>>
>>   arch/powerpc/kexec/file_load_64.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Minor nit in subject: s/eflcorehdr/elfcorehdr

I will update it in next version.

>> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
>> index e7ef8b2a2554..e631cf2eda2c 100644
>> --- a/arch/powerpc/kexec/file_load_64.c
>> +++ b/arch/powerpc/kexec/file_load_64.c
>> @@ -391,7 +391,7 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
>>   	unsigned int i;
>>   
>>   	phdr = (Elf64_Phdr *)(ehdr + 1);
>> -	for (i = 0; i < ehdr->e_phnum; i++) {
>> +	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
>>   		if (phdr->p_paddr == BACKUP_SRC_START) {
>>   			phdr->p_offset = image->arch.backup_start;
>>   			kexec_dprintk("Backup region offset updated to 0x%lx\n",
> Interesting catch, I see in current images compiler was just optimising
> this to not even run more than 1 iteration since phdr never changed :)
>
> With the patch, able to see the offset changing now:
>
> 	Previously, without the patch:
> 	(gdb) p/x *phdr
> 	$13 = {
> 	  p_type = 0x1,
> 	  p_flags = 0x7,
> 	  p_offset = 0x0,   <--- never changed
> 	  p_vaddr = 0xc000000000000000,
> 	  p_paddr = 0x0,
> 	  p_filesz = 0x10000,
> 	  p_memsz = 0x10000,
> 	  p_align = 0x0
> 	}
>
> 	With the patch, the offset gets set correctly:
> 	  p_type = 0x1,
> 	  p_flags = 0x7,
> 	  p_offset = 0x240b0000,
> 	  p_vaddr = 0xc000000000000000,
> 	  p_paddr = 0x0,
> 	  p_filesz = 0x10000,
> 	  p_memsz = 0x10000,
> 	  p_align = 0x0
>
> Can also see the kexec print:
>
> 	[   29.377990] backup region offset updated to 0x240b0000
> 	[   29.446360] loaded elf core header at 0x240c0000, bufsz=0x1000 memsz=0x80000
>
> Looks good to me, just minor nit in subject above.
>
> Reviewed-by: Aditya Gupta <adityag@linux.ibm.com>

Thank you for the review Aditya.

- Sourabh Jain

