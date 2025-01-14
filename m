Return-Path: <linuxppc-dev+bounces-5225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB46A1068F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 13:23:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSwQ5ww5z30CM;
	Tue, 14 Jan 2025 23:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736857430;
	cv=none; b=n+7vg2xX2RLZT9MvZ/LQsi3DCZ83cYv9H53BSvNypC9cstHsKzO+UVEBHI6rXC28LSkaUMcWyp73Tik3G5vv2ntYodSq2QujemVHEUaU1Dj443ld37fvPqDVdn5Vbqiinvwi8sb9fjya4QPmeYPQW9L19lgZ6Plgzc5PPHH7ck37tQMrnCjf+hOu6xZCkatKKze7w3Gv+oqAEyeH0hLg/FraQKHR19J05og6Cvi5Sp9IJTicMuNMVnSwwUXorZaLMC1UGUMCV2douiZGHqgp6f8S50RYo7xWJbWlmbvOBDI4krVEl1WSuJoGFgRPXQkrySw0UP/KxMWj3R9FpFD/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736857430; c=relaxed/relaxed;
	bh=N4iRvRLz910hdXyYaCP3vNWFz8TlsaL0KB+8OP0sL8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8Xq1/fPvyWYguQZZWsj5wIbogtStdcVaeBM8DmWPq+TuFELoZyGsrz9yPnnDQgnfsSJmPuKBJ3qYS1NIDSzwaY4lqi7lFQmhvKxr+GPqmCDAAY5R7r5tBg7JC/QaB0q3ENjunm7USOB6L7Y37FASsGmBBmBw23v/9kzkZMvFhxAPAbEaoNAlYJvO7Q0O51+9mKhot2FKEZjhqQhNCXi4R5VrUKIDg7aLfuSGx8reHPGt6DHlLOGy79pGmG7+2DpqbE6HBByA/KD2mKtBb/b4S64uq1fasyeqy3V7p747YDC6FCNgwQBYrrHg/fpM0nwP1PDGMGYrcD0bjY9BrHnHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSwP5bGMz307K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 23:23:49 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04C731CC4;
	Tue, 14 Jan 2025 04:23:47 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1183E3F66E;
	Tue, 14 Jan 2025 04:23:15 -0800 (PST)
Date: Tue, 14 Jan 2025 12:23:13 +0000
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
	devel@daynix.com
Subject: Re: [PATCH v4 4/6] crash: Use note name macros
Message-ID: <Z4ZXMUn34wS8vxbx@e133380.arm.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
 <20250111-elf-v4-4-b3841fa0dcd9@daynix.com>
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
In-Reply-To: <20250111-elf-v4-4-b3841fa0dcd9@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 11, 2025 at 02:48:47PM +0900, Akihiko Odaki wrote:
> Use note name macros to match with the userspace's expectation.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

> ---
>  fs/proc/kcore.c             | 12 ++++++------
>  include/linux/vmcore_info.h |  2 +-
>  kernel/crash_core.c         |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
> index e376f48c4b8b..e5612313b8b4 100644
> --- a/fs/proc/kcore.c
> +++ b/fs/proc/kcore.c
> @@ -34,8 +34,6 @@
>  #include <asm/sections.h>
>  #include "internal.h"
>  
> -#define CORE_STR "CORE"
> -
>  #ifndef ELF_CORE_EFLAGS
>  #define ELF_CORE_EFLAGS	0
>  #endif
> @@ -119,7 +117,9 @@ static size_t get_kcore_size(int *nphdr, size_t *phdrs_len, size_t *notes_len,
>  
>  	*phdrs_len = *nphdr * sizeof(struct elf_phdr);
>  	*notes_len = (4 * sizeof(struct elf_note) +
> -		      3 * ALIGN(sizeof(CORE_STR), 4) +
> +		      ALIGN(sizeof(NN_PRSTATUS), 4) +
> +		      ALIGN(sizeof(NN_PRPSINFO), 4) +
> +		      ALIGN(sizeof(NN_TASKSTRUCT), 4) +
>  		      VMCOREINFO_NOTE_NAME_BYTES +
>  		      ALIGN(sizeof(struct elf_prstatus), 4) +
>  		      ALIGN(sizeof(struct elf_prpsinfo), 4) +
> @@ -444,11 +444,11 @@ static ssize_t read_kcore_iter(struct kiocb *iocb, struct iov_iter *iter)
>  			goto out;
>  		}
>  
> -		append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
> +		append_kcore_note(notes, &i, NN_PRSTATUS, NT_PRSTATUS, &prstatus,
>  				  sizeof(prstatus));
> -		append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
> +		append_kcore_note(notes, &i, NN_PRPSINFO, NT_PRPSINFO, &prpsinfo,
>  				  sizeof(prpsinfo));
> -		append_kcore_note(notes, &i, CORE_STR, NT_TASKSTRUCT, current,
> +		append_kcore_note(notes, &i, NN_TASKSTRUCT, NT_TASKSTRUCT, current,
>  				  arch_task_struct_size);
>  		/*
>  		 * vmcoreinfo_size is mostly constant after init time, but it
> diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
> index e1dec1a6a749..1672801fd98c 100644
> --- a/include/linux/vmcore_info.h
> +++ b/include/linux/vmcore_info.h
> @@ -8,7 +8,7 @@
>  
>  #define CRASH_CORE_NOTE_NAME	   "CORE"
>  #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
> -#define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(CRASH_CORE_NOTE_NAME), 4)
> +#define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
>  #define CRASH_CORE_NOTE_DESC_BYTES ALIGN(sizeof(struct elf_prstatus), 4)
>  
>  /*
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 078fe5bc5a74..335b8425dd4b 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -436,7 +436,7 @@ void crash_save_cpu(struct pt_regs *regs, int cpu)
>  	memset(&prstatus, 0, sizeof(prstatus));
>  	prstatus.common.pr_pid = current->pid;
>  	elf_core_copy_regs(&prstatus.pr_reg, regs);
> -	buf = append_elf_note(buf, KEXEC_CORE_NOTE_NAME, NT_PRSTATUS,
> +	buf = append_elf_note(buf, NN_PRSTATUS, NT_PRSTATUS,
>  			      &prstatus, sizeof(prstatus));
>  	final_note(buf);
>  }
> 
> -- 
> 2.47.1
> 
> 

