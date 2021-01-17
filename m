Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5A2F928D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 14:28:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJbMX5Lg9zDqLW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 00:28:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tgEQN74H; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJbHd38mpzDr6S
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 00:24:41 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10HD4MVu086084; Sun, 17 Jan 2021 08:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=woqyHjUD+Wk6Ib5O7OUBZ1HHzA3VJ6QiDNMM6trQ8E0=;
 b=tgEQN74HAtITOc3FbpINU+z+YxVXlSnqUggB0OwiPIKC9wCM6Mwp8cjbeNRwU2YHin0i
 4yOXlNUvogquWbyZn2U6sxLPttaeVp6rIZPvwRlTEZdPX5hSm+e3IEruuLJOZf8a4mwC
 XJeuMZRVm0jBM5QDd7NjtdyO7TFbeZeiAC7a68GDMZ/qYljPz/GZoMAKtZnrH8B54erX
 8Ri5qdkVUJs/Q8XSucKsT1eq6GEOClJSZJCFwk+edGKwc20Zo32ekfBKhIbQ9sQYF0Nu
 Zyq0xPV23CVtscYAvB9zJ1qtrv2Ao4dO4aMOX7TWRIjGeyIXbSjv34hF1+qeCP8nwgp9 UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 364k16b0d9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Jan 2021 08:24:07 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10HDKrL2160007;
 Sun, 17 Jan 2021 08:24:06 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 364k16b0cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Jan 2021 08:24:06 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10HDJ04G021917;
 Sun, 17 Jan 2021 13:24:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 363qs88kdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Jan 2021 13:24:04 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10HDO1hV26804688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 17 Jan 2021 13:24:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0B7B42041;
 Sun, 17 Jan 2021 13:24:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C64FF4203F;
 Sun, 17 Jan 2021 13:23:54 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.41.68]) by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 17 Jan 2021 13:23:54 +0000 (GMT)
Message-ID: <3c920af2da0d2650bc80bf8099bed7c6c549ca5b.camel@linux.ibm.com>
Subject: Re: [PATCH v15 09/10] arm64: Call kmalloc() to allocate DTB buffer
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 bauerman@linux.ibm.com, robh@kernel.org, takahiro.akashi@linaro.org,
 gregkh@linuxfoundation.org, will@kernel.org, catalin.marinas@arm.com,
 mpe@ellerman.id.au, Arnd Bergmann <arnd@arndb.de>
Date: Sun, 17 Jan 2021 08:23:53 -0500
In-Reply-To: <20210115173017.30617-10-nramas@linux.microsoft.com>
References: <20210115173017.30617-1-nramas@linux.microsoft.com>
 <20210115173017.30617-10-nramas@linux.microsoft.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-17_06:2021-01-15,
 2021-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101170082
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
Cc: mark.rutland@arm.com, bhsharma@redhat.com, tao.li@vivo.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 linux-arm-kernel@lists.infradead.org, serge@hallyn.com,
 devicetree@vger.kernel.org, pasha.tatashin@soleen.com,
 prsriva@linux.microsoft.com, hsinyi@chromium.org, allison@lohutok.net,
 christophe.leroy@c-s.fr, mbrugger@suse.com, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org, james.morse@arm.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ard,

On Fri, 2021-01-15 at 09:30 -0800, Lakshmi Ramasubramanian wrote:
> create_dtb() function allocates kernel virtual memory for
> the device tree blob (DTB).  This is not consistent with other
> architectures, such as powerpc, which calls kmalloc() for allocating
> memory for the DTB.
> 
> Call kmalloc() to allocate memory for the DTB, and kfree() to free
> the allocated memory.

The vmalloc() function description says, "vmalloc - allocate virtually
contiguous memory".  I'd appreciate your reviewing this patch, in
particular, which replaces vmalloc() with kmalloc().

thanks,

Mimi

> 
> Co-developed-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Signed-off-by: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> ---
>  arch/arm64/kernel/machine_kexec_file.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index 7de9c47dee7c..51c40143d6fa 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -29,7 +29,7 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
>  
>  int arch_kimage_file_post_load_cleanup(struct kimage *image)
>  {
> -	vfree(image->arch.dtb);
> +	kfree(image->arch.dtb);
>  	image->arch.dtb = NULL;
>  
>  	vfree(image->arch.elf_headers);
> @@ -59,19 +59,21 @@ static int create_dtb(struct kimage *image,
>  			+ cmdline_len + DTB_EXTRA_SPACE;
>  
>  	for (;;) {
> -		buf = vmalloc(buf_size);
> +		buf = kmalloc(buf_size, GFP_KERNEL);
>  		if (!buf)
>  			return -ENOMEM;
>  
>  		/* duplicate a device tree blob */
>  		ret = fdt_open_into(initial_boot_params, buf, buf_size);
> -		if (ret)
> +		if (ret) {
> +			kfree(buf);
>  			return -EINVAL;
> +		}
>  
>  		ret = of_kexec_setup_new_fdt(image, buf, initrd_load_addr,
>  					     initrd_len, cmdline);
>  		if (ret) {
> -			vfree(buf);
> +			kfree(buf);
>  			if (ret == -ENOMEM) {
>  				/* unlikely, but just in case */
>  				buf_size += DTB_EXTRA_SPACE;
> @@ -217,6 +219,6 @@ int load_other_segments(struct kimage *image,
>  	return 0;
>  
>  out_err:
> -	vfree(dtb);
> +	kfree(dtb);
>  	return ret;
>  }


