Return-Path: <linuxppc-dev+bounces-15361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B90CFCB73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:03:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMWd51Svz2yGQ;
	Wed, 07 Jan 2026 20:03:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767776589;
	cv=none; b=ZTS83lGBloIjfnuqVyCiYZfOwTt3Z9WHNJWChbWIwD5KXPjyIRA4HoAZifTwKLeqI10Tsh2XgN23/bwbeedDu8wroKik683MqHvQnv1RPngc+kTIbT7/iiQx/wmH/yx2Q/e6lpCuYgIazxNzqmzlFsbq725gjERPdb+V9Znl92IaAA115dmPwtB/551Rbu9la9BYHOln4V61/P2q9F+4TISheZWx9WPtSiQDKGnnVE8u7i0JJczINgSovW4KksboQn/cFh7R+85UNlHrW22yttvrCmPYSo5qELn9Maur/jinTYxS3FFTi1/OtBlcZ9aFp23kD+49ivvvSNCjim+/Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767776589; c=relaxed/relaxed;
	bh=FC8bgLA624hJ1N6KzUtiq1aITNteYsg02A4wO9C6X/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3IHD2SFruhkSiZzkRvdkdss2X1uUovW4zKr3E97B2pZLmZtgekuTBcMvCdkpU2jUR5WXIZH1yhiCxwB09p5tpsE1SQ7cPPHOAb4oaGvYBELeX5QRXCzKSWhGAm+sVofWqGAfdAGWWRZzrJjWU3ym5d+a921dlDK9xCLcaXPCy3NOmT2uLFZVCyAG3243iIjmqZ85F7s5shM22g+LVkRYSJam0QIxbG74zmBf50cr0iD9XW+LR+saHzb4tmCuRFS7QwN8B6Gdlq+Gx3l28bJGT5u1JeePAS9HbwoWtJU6QA0VghuAKyS+ldMdX/RMjYhmhvClPPmgGbMp1MyixT7sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjAWNl7p; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UjAWNl7p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMWc4KgJz2yFh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:03:08 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606MkGdE032118;
	Wed, 7 Jan 2026 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FC8bgL
	A624hJ1N6KzUtiq1aITNteYsg02A4wO9C6X/g=; b=UjAWNl7pqMQg6QnCVF91KQ
	cTBE5oDDEsbdTtLEsnLH+Ek/tYqp1N6aC6T1QexnxAc+kAn/30oTZFxl9TiOEziW
	L0vcVur0GAHIdrTWu9Fo9Arg9CMzTUlMKRHG3eQs/YFnCH15KcWdTdK+1ePO8w+W
	7NaH7T8v+YZPJHE/mW0qlCYfNMtWWGKzgTm379TLjYQQT5Yh0sZ9bdOuNFY5g9Z1
	s74qMEik5MkFylc75YHSgbiQ1hi7IiBD6futc5rIqHGIzY0UID8UGdAtyIQajIkw
	V4VUZLg7dxasAIc9Ug+4A2FAsUxqByeWez8U0XzuJpeo9bCmLU9XFsothUztrUjw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshey0j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 09:02:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 6078sOHv023930;
	Wed, 7 Jan 2026 09:02:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshey0hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 09:02:51 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60770a21023511;
	Wed, 7 Jan 2026 09:02:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bg3rmcrcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 09:02:50 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60792k2139780724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 09:02:46 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 968C32004B;
	Wed,  7 Jan 2026 09:02:46 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F43A20040;
	Wed,  7 Jan 2026 09:02:43 +0000 (GMT)
Received: from [9.39.29.216] (unknown [9.39.29.216])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 09:02:43 +0000 (GMT)
Message-ID: <9aa592c9-c766-4aac-a60c-25dd5c2f143d@linux.ibm.com>
Date: Wed, 7 Jan 2026 14:32:41 +0530
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
Subject: Re: [PATCH v2] powerpc/kdump: pass dm-crypt keys to kdump kernel
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
        Vivek Goyal <vgoyal@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20251226140636.1378505-1-coxu@redhat.com>
 <20260106074039.564707-1-coxu@redhat.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260106074039.564707-1-coxu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3MCBTYWx0ZWRfX1GnynMeWeBHi
 xPMyHqmViuUR8t9w1X1Aivumy06TaUPg3qde4FhkAePV+R076zwsy3fOaCobhWw67QCqyKZ4NZY
 DJuD723XPj+Q4TTzqi7W+Pwyhywyf2gD/VQ3jEH8i3KozD5dkuoI27eoW+3YMFctIN11Z+QHfRm
 WmpKezBOqqiuZPmaogd/2ikQpyHKgA5p+7+nGZpV7ujSv6Y0BHwtONxyoZhFBb+t9C3UsGTXF3A
 JZPh/KOXfLGrXyt1UZmz/Lgp/ddMfzs4pf1SDiKmBWx/a8piCJFqrIRKw7oBlGdNu9A4zS1mEfr
 jPDJi4rknd7WeaqL82Zk0LplMkRra4AkYJ5MjfokDQa9h37xy5OUUq52wcsOLl7kANSZruX/7Ny
 ywuH8X1E3tiyhH4whlHsMwIWR0mn6cF9cZI6ExPlP6XHfckGBp5J3TYsOT+y8OFKNsTYwIatrrN
 Ec9k5vI79UfeqL+j7qQ==
X-Proofpoint-GUID: Hx5YSfKPElydaJpG7kLQMaPX-AqQS2UU
X-Proofpoint-ORIG-GUID: cjY_gzEq_sZc-2kwP2nZq4-tZVp0xk3s
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=695e213c cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=VnNF1IyMAAAA:8
 a=b2T7Ds_qAAAA:8 a=pGLkceISAAAA:8 a=Z4Rwk6OoAAAA:8 a=yghmjiirNig4hOQTtyAA:9
 a=QEXdDO2ut3YA:10 a=thWvoDmNLqknv6kuXhLH:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601070070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 06/01/26 13:10, Coiby Xu wrote:
> CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
> device dump target by addressing two challenges [1],
>   - Kdump kernel may not be able to decrypt the LUKS partition. For some
>     machines, a system administrator may not have a chance to enter the
>     password to decrypt the device in kdump initramfs after the 1st kernel
>     crashes
>
>   - LUKS2 by default use the memory-hard Argon2 key derivation function
>     which is quite memory-consuming compared to the limited memory reserved
>     for kdump.
>
> To also enable this feature for PowerPC, we only need to let 1st kernel
> build up the kernel command parameter dmcryptkeys as similar to
> elfcorehdr to pass the memory address of the stored info of dm-crypt
> keys to the kdump kernel.
>
> Note to avoid a building failure [2] caused by undeclared function
> crash_load_dm_crypt_keys when CONFIG_CRASH_DUMP is not enabled,
> realign the function declaration with CONFIG_CRASH_DM_CRYPT.
>
> [1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
> [2] https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/
>
> Cc: Thomas Staudt <tstaudt@de.ibm.com>
> Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Kairui Song <ryncsn@gmail.com>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coxu@redhat.com>
> ---
> v2:
> - fix double kfree issue [Sourabh]
> - corretly kfree old modified_cmdline
> - use imperative mood for commit message
> - fix a compiling error caught by kernel test robot
>
>   arch/powerpc/include/asm/kexec.h |  3 ++-
>   arch/powerpc/kexec/elf_64.c      | 27 ++++++++++++++++++++++++++-
>   arch/powerpc/kexec/file_load.c   | 18 ++++++++++--------
>   include/linux/crash_core.h       | 14 +++++++-------
>   4 files changed, 45 insertions(+), 17 deletions(-)
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
> index 5d6d616404cf..995d7e8e98e1 100644
> --- a/arch/powerpc/kexec/elf_64.c
> +++ b/arch/powerpc/kexec/elf_64.c
> @@ -81,13 +81,38 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
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

I have a limited understanding of the new dm-crypt keys, but the way they
are loaded and the additional command-line options added for the kdump
kernel look good to me.

Feel free to add:
Acked-by: Sourabh Jain <sourabhjain@linux.ibm.com>


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
> +			kfree(cmdline);
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
> index 4284f76cbef5..9964c57785f5 100644
> --- a/arch/powerpc/kexec/file_load.c
> +++ b/arch/powerpc/kexec/file_load.c
> @@ -23,36 +23,38 @@
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
>   	return cmdline_ptr;
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index d35726d6a415..e128270c703f 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -34,13 +34,6 @@ static inline void arch_kexec_protect_crashkres(void) { }
>   static inline void arch_kexec_unprotect_crashkres(void) { }
>   #endif
>   
> -#ifdef CONFIG_CRASH_DM_CRYPT
> -int crash_load_dm_crypt_keys(struct kimage *image);
> -ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
> -#else
> -static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
> -#endif
> -
>   #ifndef arch_crash_handle_hotplug_event
>   static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
>   #endif
> @@ -96,4 +89,11 @@ static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
>   static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
>   #endif /* CONFIG_CRASH_DUMP*/
>   
> +#ifdef CONFIG_CRASH_DM_CRYPT
> +int crash_load_dm_crypt_keys(struct kimage *image);
> +ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
> +#else
> +static inline int crash_load_dm_crypt_keys(struct kimage *image) { return 0; }
> +#endif
> +
>   #endif /* LINUX_CRASH_CORE_H */
>
> base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67


