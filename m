Return-Path: <linuxppc-dev+bounces-4786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 149BDA045D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 17:18:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSGSR3Yj6z30WT;
	Wed,  8 Jan 2025 03:18:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736266711;
	cv=none; b=hqKcAlo9LhqyeiMfi/y1J/HHN59KmCMHjhiE3lHASdIcbFH+ZUK9ToqpRg1I1fRYK798KsbopUqRDm9S7pYiQLt2XJ7qd2GkZv2Rwvbyrv2HmbeiE63jP007tpV8c+9PQ5L0eIFRH41ifuzxr3AN7kYe6FWEUE2HLL6j6cU/wzqAEfFABOvRRfl5uXlUsQURCknvQGf1KL3kcTdWAMy38rFnbaEFO4a84BmOxIHBeAxYelxG4ulam0f2k8Qe6qNQ+3qapnnTZ8wRuUU6y5v0ai3FZbzUFiOySQzfY5+B1uviyAXtq1sqJmaDFRU3k/7wmg//nNU32HtlSPDL5telJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736266711; c=relaxed/relaxed;
	bh=t8CtES2oYL8C/kvAQfa6mDbgVViASQ+zfjrwizDMYAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCCni3vY7at5RAyVVompvdD5Lu7AbXirMjfqB6pawsW9C+l0zwzBT7aWqtLKbWJyNjDB2kvXOXJJBswW2oaS89gORNrcPmB2BcFbPVzf5lLZ87KXU3GzT+YdKG+sZFOz4ZMoUGMG1k6OAcxEiGq4UHJNx7wXcImqx9qtGFblYVfGetbnFiM1+EVVOxfmzwmEZHq/W3lKfQsgZb7nlx8z8DNNtfk8ASrEXkZ84MQ6T+FfyO3DEKE23wjehPStpQdZOK7pQF0RiNJRZCZcYz9cXEmvYWJmVWrVIyMWwm7RyHrQGch/H+QA2MfVueGym32kA5ssJBMrKYbblhnYT9HdLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSGSP3KbSz30WM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 03:18:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955311424;
	Tue,  7 Jan 2025 08:18:22 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FDFC3F59E;
	Tue,  7 Jan 2025 08:17:52 -0800 (PST)
Date: Tue, 7 Jan 2025 16:17:43 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, binutils@sourceware.org,
	devel@daynix.com
Subject: Re: [PATCH v3 5/6] s390/crash: Use note name macros
Message-ID: <Z31Tp0nMhb/ntUW0@e133380.arm.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
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
In-Reply-To: <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Tue, Jan 07, 2025 at 09:45:56PM +0900, Akihiko Odaki wrote:
> Use note name macros to match with the userspace's expectation.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  arch/s390/kernel/crash_dump.c | 62 ++++++++++++++++---------------------------
>  1 file changed, 23 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/s390/kernel/crash_dump.c b/arch/s390/kernel/crash_dump.c

[...]

> @@ -281,10 +272,8 @@ static void *nt_init_name(void *buf, Elf64_Word type, void *desc, int d_len,
>  	return PTR_ADD(buf, len);
>  }
>  
> -static inline void *nt_init(void *buf, Elf64_Word type, void *desc, int d_len)
> -{
> -	return nt_init_name(buf, type, desc, d_len, nt_name(type));
> -}
> +#define NT_INIT(buf, type, desc) \
> +	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))

Nit: this macro name clashes with the naming scheme in elf.h.

I think that there is a (weak) convention that macros with upper-case
names don't expand to a C function call; thus, a macro with an upper-
case name can be invoked in places where a C function call would not be
allowed.  (This convention is not followed everywhere, though -- it's
up to the maintainer what they prefer here.)

(Note also, the outer parentheses and the parentheses around (buf)
appear redundant -- although harmless?)

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
> +#define NT_SIZE(type, desc) (nt_size_name(sizeof(desc), NN_ ## type))

Nit: name prefix clash (again); possibly redundant parentheses.

[...]

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
> +	size =	NT_SIZE(PRSTATUS, struct elf_prstatus);
> +	size +=  NT_SIZE(PRFPREG, elf_fpregset_t);
> +	size +=  NT_SIZE(S390_TIMER, sa->timer);
> +	size +=  NT_SIZE(S390_TODCMP, sa->todcmp);
> +	size +=  NT_SIZE(S390_TODPREG, sa->todpreg);
> +	size +=  NT_SIZE(S390_CTRS, sa->ctrs);
> +	size +=  NT_SIZE(S390_PREFIX, sa->prefix);

It might be worth fixing the funny spacing on these lines, since all
the affected lines are being replaced.

>  	if (cpu_has_vx()) {
> -		size += nt_size(NT_S390_VXRS_HIGH, sizeof(sa->vxrs_high));
> -		size += nt_size(NT_S390_VXRS_LOW, sizeof(sa->vxrs_low));
> +		size += NT_SIZE(S390_VXRS_HIGH, sa->vxrs_high);
> +		size += NT_SIZE(S390_VXRS_LOW, sa->vxrs_low);
>  	}
>  
>  	return size;
> @@ -373,7 +357,7 @@ static void *nt_prpsinfo(void *ptr)
>  	memset(&prpsinfo, 0, sizeof(prpsinfo));
>  	prpsinfo.pr_sname = 'R';
>  	strcpy(prpsinfo.pr_fname, "vmlinux");
> -	return nt_init(ptr, NT_PRPSINFO, &prpsinfo, sizeof(prpsinfo));
> +	return NT_INIT(ptr, PRPSINFO, prpsinfo);
>  }
>  
>  /*
> @@ -589,7 +573,7 @@ static size_t get_elfcorehdr_size(int phdr_count)
>  	/* PT_NOTES */
>  	size += sizeof(Elf64_Phdr);
>  	/* nt_prpsinfo */
> -	size += nt_size(NT_PRPSINFO, sizeof(struct elf_prpsinfo));
> +	size += NT_SIZE(PRPSINFO, struct elf_prpsinfo);
>  	/* regsets */
>  	size += get_cpu_cnt() * get_cpu_elf_notes_size();
>  	/* nt_vmcoreinfo */

Otherwise, this looks sensible to me.

Cheers
---Dave

