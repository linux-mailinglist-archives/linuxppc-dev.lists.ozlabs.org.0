Return-Path: <linuxppc-dev+bounces-5226-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA4A10691
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 13:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSwg4DFZz30HB;
	Tue, 14 Jan 2025 23:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736857443;
	cv=none; b=V+H0pcJKSFoodaIi9SaxF2RTEgvNE/oK99xV7zSeknqNHnUzk+z37TsHbrLSHOX0vnXvP4gJWlf8DiFxuGYhe72gT2QFK+BWlQPm+CrgHX96cH5LuSKZcrJvumHZUyFt61o7+3kuTK7CG9ATD+ajAk5LlOnVGN07f66lIF5nVz+eOAKO4ktw3AbqSzQMTnsRidaPRh9WrekNYic2gnyhNVBAvg7/BYpL1N9G7g+oc2kx/MmzCpOsO3KphDfCvW5fZsGMAItYkDWyC8w2fEkmHW3U7fNliEN3CQL8iMKeAXEN+zBRtifDK0JvL+dSHj7MZyu1umaKTQrivUvxUkX6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736857443; c=relaxed/relaxed;
	bh=A8dqgwESPx9R9DWrPKarf13obRDixoLP/xCqeJ+xU0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzjJPpHVpgbvTCkfDf6n/0Wog8w40EJp0OYqgVbw65SjrExYeHBZQwGvp2hG/zMDPMoK8oOrUT0zF4LluOHY/k+jAqamajPBWqk7P3xTvUjKGuxhZvO1Y33Ef40Eb5+1jRUd5sXrOCC72DP/ZJJBSXStMXsOredqPlT1IZUHXbnXVLxHuydE/RwxsdfLMOg7laYogND15dnMQnKvxJ4hQfbeHsJFZYos97tzQtD+VgPbabV5K+R4fmFzpsd9OpL8nsC0XgYRAXTwRiMForcFq6GV6s2GBMiFY+MXDEY/3qVDOfZL7cY2jUULvDZHs0LzVdPa1nZLnpF7siqlluBmgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSwf3mcqz30HP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 23:24:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDB2511FB;
	Tue, 14 Jan 2025 04:23:59 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E0623F66E;
	Tue, 14 Jan 2025 04:23:28 -0800 (PST)
Date: Tue, 14 Jan 2025 12:23:26 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, binutils@sourceware.org,
	devel@daynix.com, Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH v4 5/6] s390/crash: Use note name macros
Message-ID: <Z4ZXPp76UiLtBCLA@e133380.arm.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
 <20250111-elf-v4-5-b3841fa0dcd9@daynix.com>
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
In-Reply-To: <20250111-elf-v4-5-b3841fa0dcd9@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Sat, Jan 11, 2025 at 02:48:48PM +0900, Akihiko Odaki wrote:
> Use note name macros to match with the userspace's expectation.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

(I'm not in a position to test this, though.)

> ---
>  arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
>  1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c
> index cd0c93a8fb8b..022f4f198edf 100644
> --- a/arch/s390/kernel/crash_dump.c
> +++ b/arch/s390/kernel/crash_dump.c
> @@ -248,15 +248,6 @@ bool is_kdump_kernel(void)
>  }
>  EXPORT_SYMBOL_GPL(is_kdump_kernel);
>  
> -static const char *nt_name(Elf64_Word type)
> -{
> -	const char *name = "LINUX";
> -
> -	if (type == NT_PRPSINFO || type == NT_PRSTATUS || type == NT_PRFPREG)
> -		name = KEXEC_CORE_NOTE_NAME;
> -	return name;
> -}
> -
>  /*
>   * Initialize ELF note
>   */
> @@ -281,10 +272,8 @@ static void *nt_init_name(void *buf, Elf64_Word type, void *desc, int d_len,
>  	return PTR_ADD(buf, len);
>  }
>  
> -static inline void *nt_init(void *buf, Elf64_Word type, void *desc, int d_len)
> -{
> -	return nt_init_name(buf, type, desc, d_len, nt_name(type));
> -}
> +#define nt_init(buf, type, desc) \
> +	nt_init_name(buf, NT_ ## type, &(desc), sizeof(desc), NN_ ## type)
>  
>  /*
>   * Calculate the size of ELF note
> @@ -300,10 +289,7 @@ static size_t nt_size_name(int d_len, const char *name)
>  	return size;
>  }
>  
> -static inline size_t nt_size(Elf64_Word type, int d_len)
> -{
> -	return nt_size_name(d_len, nt_name(type));
> -}
> +#define nt_size(type, desc) nt_size_name(sizeof(desc), NN_ ## type)
>  
>  /*
>   * Fill ELF notes for one CPU with save area registers
> @@ -324,18 +310,16 @@ static void *fill_cpu_elf_notes(void *ptr, int cpu, struct save_area *sa)
>  	memcpy(&nt_fpregset.fpc, &sa->fpc, sizeof(sa->fpc));
>  	memcpy(&nt_fpregset.fprs, &sa->fprs, sizeof(sa->fprs));
>  	/* Create ELF notes for the CPU */
> -	ptr = nt_init(ptr, NT_PRSTATUS, &nt_prstatus, sizeof(nt_prstatus));
> -	ptr = nt_init(ptr, NT_PRFPREG, &nt_fpregset, sizeof(nt_fpregset));
> -	ptr = nt_init(ptr, NT_S390_TIMER, &sa->timer, sizeof(sa->timer));
> -	ptr = nt_init(ptr, NT_S390_TODCMP, &sa->todcmp, sizeof(sa->todcmp));
> -	ptr = nt_init(ptr, NT_S390_TODPREG, &sa->todpreg, sizeof(sa->todpreg));
> -	ptr = nt_init(ptr, NT_S390_CTRS, &sa->ctrs, sizeof(sa->ctrs));
> -	ptr = nt_init(ptr, NT_S390_PREFIX, &sa->prefix, sizeof(sa->prefix));
> +	ptr = nt_init(ptr, PRSTATUS, nt_prstatus);
> +	ptr = nt_init(ptr, PRFPREG, nt_fpregset);
> +	ptr = nt_init(ptr, S390_TIMER, sa->timer);
> +	ptr = nt_init(ptr, S390_TODCMP, sa->todcmp);
> +	ptr = nt_init(ptr, S390_TODPREG, sa->todpreg);
> +	ptr = nt_init(ptr, S390_CTRS, sa->ctrs);
> +	ptr = nt_init(ptr, S390_PREFIX, sa->prefix);
>  	if (cpu_has_vx()) {
> -		ptr = nt_init(ptr, NT_S390_VXRS_HIGH,
> -			      &sa->vxrs_high, sizeof(sa->vxrs_high));
> -		ptr = nt_init(ptr, NT_S390_VXRS_LOW,
> -			      &sa->vxrs_low, sizeof(sa->vxrs_low));
> +		ptr = nt_init(ptr, S390_VXRS_HIGH, sa->vxrs_high);
> +		ptr = nt_init(ptr, S390_VXRS_LOW, sa->vxrs_low);
>  	}
>  	return ptr;
>  }
> @@ -348,16 +332,16 @@ static size_t get_cpu_elf_notes_size(void)
>  	struct save_area *sa = NULL;
>  	size_t size;
>  
> -	size =	nt_size(NT_PRSTATUS, sizeof(struct elf_prstatus));
> -	size +=  nt_size(NT_PRFPREG, sizeof(elf_fpregset_t));
> -	size +=  nt_size(NT_S390_TIMER, sizeof(sa->timer));
> -	size +=  nt_size(NT_S390_TODCMP, sizeof(sa->todcmp));
> -	size +=  nt_size(NT_S390_TODPREG, sizeof(sa->todpreg));
> -	size +=  nt_size(NT_S390_CTRS, sizeof(sa->ctrs));
> -	size +=  nt_size(NT_S390_PREFIX, sizeof(sa->prefix));
> +	size =	nt_size(PRSTATUS, struct elf_prstatus);
> +	size += nt_size(PRFPREG, elf_fpregset_t);
> +	size += nt_size(S390_TIMER, sa->timer);
> +	size += nt_size(S390_TODCMP, sa->todcmp);
> +	size += nt_size(S390_TODPREG, sa->todpreg);
> +	size += nt_size(S390_CTRS, sa->ctrs);
> +	size += nt_size(S390_PREFIX, sa->prefix);
>  	if (cpu_has_vx()) {
> -		size += nt_size(NT_S390_VXRS_HIGH, sizeof(sa->vxrs_high));
> -		size += nt_size(NT_S390_VXRS_LOW, sizeof(sa->vxrs_low));
> +		size += nt_size(S390_VXRS_HIGH, sa->vxrs_high);
> +		size += nt_size(S390_VXRS_LOW, sa->vxrs_low);
>  	}
>  
>  	return size;
> @@ -373,7 +357,7 @@ static void *nt_prpsinfo(void *ptr)
>  	memset(&prpsinfo, 0, sizeof(prpsinfo));
>  	prpsinfo.pr_sname = 'R';
>  	strcpy(prpsinfo.pr_fname, "vmlinux");
> -	return nt_init(ptr, NT_PRPSINFO, &prpsinfo, sizeof(prpsinfo));
> +	return nt_init(ptr, PRPSINFO, prpsinfo);
>  }
>  
>  /*
> @@ -589,7 +573,7 @@ static size_t get_elfcorehdr_size(int phdr_count)
>  	/* PT_NOTES */
>  	size += sizeof(Elf64_Phdr);
>  	/* nt_prpsinfo */
> -	size += nt_size(NT_PRPSINFO, sizeof(struct elf_prpsinfo));
> +	size += nt_size(PRPSINFO, struct elf_prpsinfo);
>  	/* regsets */
>  	size += get_cpu_cnt() * get_cpu_elf_notes_size();
>  	/* nt_vmcoreinfo */
> 
> -- 
> 2.47.1
> 
> 

