Return-Path: <linuxppc-dev+bounces-15111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27583CED163
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 16:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhqsx0qb9z2xqr;
	Fri, 02 Jan 2026 02:06:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767280004;
	cv=none; b=AyYT3Yh1fK4eV+4RkNlEbTpuixG63XD0dKMRbNG3KNPanKNyBGZsChuWE4Ltzm3zihaCgM1EVREa8q48O6jqYNuB4XK+7e7DvrVfUFuUOfLcSBBkTRMt6GMrfb2ffzogQSH0CIyLCYhTxrZKq7F0NDop6tKDyOjOxuFuW7g1fQLquR3Lc1XrIM2qF2GYLOeLc39CC8/CB2LwHgWdi0dHOdbWppk1T2vE3e4khn/bQhFMLHJwN/dFbQRa61iSB1eVQ/NXy5JCopmE08FoqIXN8as8+/J1qxlU5+DYoVlXs1FGAzM5V/4o7K6l0eyqJ+0K+y9g54s4VY14fdjaKSbgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767280004; c=relaxed/relaxed;
	bh=d8fcVgmWcefeU0P9LyRd0h37t+Vi86TuMkESe/9Atms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eoj1mMcPA28SELeGggyLuHulu2BirllgX7lcU2d3NlsMT3GQfZIn4u3bqzEz/d4iMq6FJ7UIOZmAgv+ljn/urMVjc4sPXpcPaNN6tM1O4udkXRMsFhOXkasp8PMM9zR91RuDLg+ndkUaqx6j31Ghq3v6GeGJQz4k1a3WEpUUtclAuu44dYBETbY9eL9oqluvNZ1BxENbZlpNQ8zHcBdivOmaJbGc53ydOyNuhx5stKLpRh+4Dnx34Pl4+mZjbmdBSyhinUdxvDIbY1d27CLLVcM1pa3ZVPvNVRacoK5KFXS4JO/LwiAP5SxyuALUIktKRnuSbhjOalmbJXRRwc7pqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g4nQrIOU; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g4nQrIOU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhqst4Gq6z2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 02:06:41 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6012Ebau004564;
	Thu, 1 Jan 2026 15:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=d8fcVg
	mWcefeU0P9LyRd0h37t+Vi86TuMkESe/9Atms=; b=g4nQrIOUWruThZPTKuBOHt
	1TBbPozQQdu8ekoG5n9wxShcp4toV5cCPsSEguNiwITZQUj7Dn5vJmWfIZV+X8vv
	pM4yUFae8eeH5WyTcCTqIe13PAdZNsZfIfv7IiaTp4GyniFOS8y4OJu4/0BsNlPz
	pbqszUkSbNYPpgBosJnCcYorPb6J80P7sJIHQPaZnMqkr0bVY/x8Rac6t0F2v0FB
	q2jtJpIhECWvaWlz9dTMB7Jucug0ZNJJ00cYGB/jW7HWfgp/wLMPj7b+P4xjJZ0P
	cgM+lZb+cX55iFhm6BwxlyIt5zdTeBvQ/rfz4XqHJhkBnezBEBucfrl1x/IiaKVw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w1t40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 15:06:19 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 601F6JK9030222;
	Thu, 1 Jan 2026 15:06:19 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w1t3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 15:06:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 601BA6EK026897;
	Thu, 1 Jan 2026 15:06:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsnk1gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 15:06:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 601F6EFH62063034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jan 2026 15:06:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 374B720043;
	Thu,  1 Jan 2026 15:06:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D86420040;
	Thu,  1 Jan 2026 15:06:11 +0000 (GMT)
Received: from [9.124.212.98] (unknown [9.124.212.98])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jan 2026 15:06:11 +0000 (GMT)
Message-ID: <e32554c8-774e-416d-92e4-306aec42b953@linux.ibm.com>
Date: Thu, 1 Jan 2026 20:36:09 +0530
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
Subject: Re: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
To: Coiby Xu <coxu@redhat.com>, kexec@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Thomas Staudt <tstaudt@de.ibm.com>,
        Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
        Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251226140636.1378505-1-coxu@redhat.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251226140636.1378505-1-coxu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AqNKOzqNRkU4VMUSvfbYuc_8_4dJmaxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDEzMyBTYWx0ZWRfX+6xO0L6FIz73
 +yY54B+bJYx3KwCfKTS62ljwirEOrxDt4tPQsE+EsCrteBGlX2EAaY9N5wkecIGuEBibBgZQdF0
 B37BoYztVxwxDs8snrKfA407hHaNgT08DnrGOi2VYR+NBqw5wLFbriJ9ttPDBPa4syalfVdMdPu
 CbPGWcsciiURYNNoA97b0JrZZBIRfBmsVTBRMAlzQqsIFLWrZgl8F5st4/neGcxyGvjTryHg5ib
 XuNrYOkj0r2qYSWU/R8CcZHiLNhkTNVCAhYHYqFdKtFYTgMHC3xj9xQST9AHoihiMElnluvogbJ
 VblKAxo79gmRPFJfpovd2BelH0UPxSvQjJdnKJUrN+H3rjjgQsEjmYGqK9kAhi3JW0oiS+gP/qJ
 aVen6ssDRE3a3lKtvob3S/HGKeI6uIq9SWQSFrLhsoxkgPjanbAFaSssFH4EywujCFpz7Qdxx1Z
 pAtuVo5CHshKXITyv7w==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=69568d6b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=VnNF1IyMAAAA:8 a=b2T7Ds_qAAAA:8
 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8 a=llR5IeLaMymARZ-qTl0A:9 a=QEXdDO2ut3YA:10
 a=thWvoDmNLqknv6kuXhLH:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-GUID: 2aPxOHtFQDWOjuA52_GD-Nwi5EMnNm78
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601010133
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 26/12/25 19:36, Coiby Xu wrote:
> Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds
> LUKS-encrypted device dump target support to PowerPC by addressing two
> challenges [1],
>   - Kdump kernel may not be able to decrypt the LUKS partition. For some
>     machines, a system administrator may not have a chance to enter the
>     password to decrypt the device in kdump initramfs after the 1st kernel
>     crashes
>
>   - LUKS2 by default use the memory-hard Argon2 key derivation function
>     which is quite memory-consuming compared to the limited memory reserved
>     for kdump.
>
> 1st kernel will build up the kernel command parameter dmcryptkeys as
> similar to elfcorehdr to pass the memory address of the stored info of
> dm-crypt keys to the kdump kernel.
>
> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>
> Cc: Thomas Staudt <tstaudt@de.ibm.com>
> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Kairui Song <ryncsn@gmail.com>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
>   arch/powerpc/include/asm/kexec.h |  3 ++-
>   arch/powerpc/kexec/elf_64.c      | 26 +++++++++++++++++++++++++-
>   arch/powerpc/kexec/file_load.c   | 19 +++++++++++--------
>   3 files changed, 38 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index bd4a6c42a5f3..f3d098d543b4 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -80,7 +80,8 @@ struct kimage_arch {
>   };
>   
>   char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> -			  unsigned long cmdline_len);
> +			  unsigned long cmdline_len,
> +			  char *name, unsigned long addr);
>   int setup_purgatory(struct kimage *image, const void *slave_code,
>   		    const void *fdt, unsigned long kernel_load_addr,
>   		    unsigned long fdt_load_addr);
> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> index 5d6d616404cf..57cb3361d91b 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -81,13 +81,37 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>   
>   		/* Setup cmdline for kdump kernel case */
>   		modified_cmdline = setup_kdump_cmdline(image, cmdline,
> -						       cmdline_len);
> +						       cmdline_len,
> +						       "elfcorehdr",
> +						       image->elf_load_addr);
>   		if (!modified_cmdline) {
>   			pr_err("Setting up cmdline for kdump kernel failed\n");
>   			ret = -EINVAL;
>   			goto out;
>   		}
>   		cmdline = modified_cmdline;
> +		cmdline_len = strlen(cmdline) + 1;
> +
> +		ret = crash_load_dm_crypt_keys(image);
> +		if (ret == -ENOENT) {
> +			kexec_dprintk("No dm crypt key to load\n");
> +		} else if (ret) {
> +			pr_err("Failed to load dm crypt keys\n");
> +			return ERR_PTR(ret);
> +		}
> +
> +		if (image->dm_crypt_keys_addr != 0) {
> +			modified_cmdline = setup_kdump_cmdline(image, cmdline,
> +							       cmdline_len,
> +							       "dmcryptkeys",
> +							       image->dm_crypt_keys_addr);
> +			if (!modified_cmdline) {
> +				pr_err("Setting up cmdline for kdump kernel failed\n");
> +				ret = -EINVAL;
> +				goto out;
> +			}
> +			cmdline = modified_cmdline;
> +		}
>   	}
>   
>   	if (initrd != NULL) {
> diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
> index 4284f76cbef5..e1c08050286d 100644
> --- a/arch/powerpc/kexec/file_load.c
> +++ b/arch/powerpc/kexec/file_load.c
> @@ -23,38 +23,41 @@
>   #define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
>   
>   /**
> - * setup_kdump_cmdline - Prepend "elfcorehdr=<addr> " to command line
> + * setup_kdump_cmdline - Prepend "<name>=<addr> " to command line
>    *                       of kdump kernel for exporting the core.
>    * @image:               Kexec image
>    * @cmdline:             Command line parameters to update.
>    * @cmdline_len:         Length of the cmdline parameters.
> + * @name:                Name e.g elfcorehdr.
> + * @addr:                Memory address.
>    *
>    * kdump segment must be setup before calling this function.
>    *
>    * Returns new cmdline buffer for kdump kernel on success, NULL otherwise.
>    */
>   char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> -			  unsigned long cmdline_len)
> +			  unsigned long cmdline_len,
> +			  char *name, unsigned long addr)
>   {
> -	int elfcorehdr_strlen;
> +	unsigned long parameter_len;
>   	char *cmdline_ptr;
>   
>   	cmdline_ptr = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
>   	if (!cmdline_ptr)
>   		return NULL;
>   
> -	elfcorehdr_strlen = sprintf(cmdline_ptr, "elfcorehdr=0x%lx ",
> -				    image->elf_load_addr);
> +	parameter_len = sprintf(cmdline_ptr, "%s=0x%lx ", name, addr);
>   
> -	if (elfcorehdr_strlen + cmdline_len > COMMAND_LINE_SIZE) {
> -		pr_err("Appending elfcorehdr=<addr> exceeds cmdline size\n");
> +	if (parameter_len + cmdline_len > COMMAND_LINE_SIZE) {
> +		pr_err("Appending %s=<addr> exceeds cmdline size\n", name);
>   		kfree(cmdline_ptr);
>   		return NULL;
>   	}
>   
> -	memcpy(cmdline_ptr + elfcorehdr_strlen, cmdline, cmdline_len);
> +	memcpy(cmdline_ptr + parameter_len, cmdline, cmdline_len);
>   	// Ensure it's nul terminated
>   	cmdline_ptr[COMMAND_LINE_SIZE - 1] = '\0';
> +	kfree(cmdline);

When setup_kdump_cmdline() is called for elfcorehdr, cmdline holds the
same pointer as image->cmdline_buf. Freeing it here may therefore
cause issues, right?

Currently, image->cmdline_buf is not used after calling the
architecture-specific load function (elf64_load on powerpc).
However, kimage_file_post_load_cleanup() later calls kfree() on
the same address.

>   	return cmdline_ptr;
>   }
>   
>
> base-commit: ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1


