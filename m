Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A83F674100
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 19:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyWRH2X1yz3fHR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 05:31:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nih3jJBb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyWQK3bjJz3fDT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 05:30:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nih3jJBb;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyWQF5jY4z4xN5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 05:30:13 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NyWQF5fjjz4xwp; Fri, 20 Jan 2023 05:30:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nih3jJBb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NyWQF3Jgzz4xN5
	for <linuxppc-dev@ozlabs.org>; Fri, 20 Jan 2023 05:30:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30JID4BQ017535;
	Thu, 19 Jan 2023 18:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7QaXGnFJtdhIMUQIJ9Cp7OYA0zV/uBnMr2yUJiZmPKk=;
 b=Nih3jJBbp7PgRKhBkE6NiZAO0KXXy8ad6HoW0k0tH6+u1h+gchyIACY4qqIwKgYCAFYc
 BFUKGZryyRjuMJGShVrlB13ZRUgIPGR9DeLrDeKy9uCOC0KA74eaM1ni66KD+zTLA1ig
 GD3kXiVdSpLjQNaygRRsQvdzgRerWm8LdZzEk0OEkhoIK88IKrnGp8aV55fuqY71yft9
 AddcPzq9p9LeCIFB+cywetZHD3IubLVk+Gd4JGMef9sg41fCAoy7r/H2nvyGihnBsoU2
 KgMGz88d78+QsdrzyoEuF/RkGNUV7cmsgeFJzw7Z8u/vQXJ5tqwt9nax3OIM66XUbTS8 Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n78qscpd7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 18:30:00 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30JIIxH0006881;
	Thu, 19 Jan 2023 18:29:59 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n78qscpce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 18:29:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30J5X3RB023782;
	Thu, 19 Jan 2023 18:29:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16q1p2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 18:29:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30JITr6q40829194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jan 2023 18:29:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCA4620043;
	Thu, 19 Jan 2023 18:29:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3077B20040;
	Thu, 19 Jan 2023 18:29:53 +0000 (GMT)
Received: from [9.179.13.66] (unknown [9.179.13.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Jan 2023 18:29:53 +0000 (GMT)
Message-ID: <51fa22e4-efab-a931-fb8f-48180baaac61@linux.ibm.com>
Date: Thu, 19 Jan 2023 19:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/8] crash: add phdr for possible CPUs in elfcorehdr
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
 <20230115150206.431528-5-sourabhjain@linux.ibm.com>
Content-Language: fr
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20230115150206.431528-5-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PlRiUW0zaDBDhE-lxgxM6FgUJZZk9Qcx
X-Proofpoint-ORIG-GUID: f7WvtRJknNe6nlQ-tVauFUrrS1RjvXOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-19_11,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190149
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/01/2023 16:02:02, Sourabh Jain wrote:
> On architectures like PowerPC the crash notes are available for all
> possible CPUs. So let's populate the elfcorehdr for all possible
> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
> crash update on CPU hotplug events.
> 
> The similar technique is used in kexec-tool for kexec_load case.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  kernel/crash_core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

This patch is not applying on ppc/next (53ab112a9508).

As far as I could see, crash_prepare_elf64_headers() is defined in the file
kernel/kexec_file.c and that's not recent, see babac4a84a88 (kexec_file,
x86: move re-factored code to generic side, 2018-04-13)

Am I missing something?

> 
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 910d377ea317e..19f987b3851e8 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -364,8 +364,8 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>  	ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>  	ehdr->e_phentsize = sizeof(Elf64_Phdr);
>  
> -	/* Prepare one phdr of type PT_NOTE for each present CPU */
> -	for_each_present_cpu(cpu) {
> +	/* Prepare one phdr of type PT_NOTE for possible CPU with crash note. */
> +	for_each_possible_cpu(cpu) {
>  #ifdef CONFIG_CRASH_HOTPLUG
>  		if (IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
>  			/* Skip the soon-to-be offlined cpu */
> @@ -373,8 +373,11 @@ int crash_prepare_elf64_headers(struct kimage *image, struct crash_mem *mem,
>  				continue;
>  		}
>  #endif
> -		phdr->p_type = PT_NOTE;
>  		notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
> +		if (!notes_addr)
> +			continue;
> +
> +		phdr->p_type = PT_NOTE;
>  		phdr->p_offset = phdr->p_paddr = notes_addr;
>  		phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>  		(ehdr->e_phnum)++;

