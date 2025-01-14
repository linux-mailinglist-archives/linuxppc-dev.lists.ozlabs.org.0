Return-Path: <linuxppc-dev+bounces-5224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61892A1068C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 13:23:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSw913zFz30FR;
	Tue, 14 Jan 2025 23:23:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736857417;
	cv=none; b=k64LrqZoJ37DLoY+JLrMgiwFsFZ9qe0DEEdBPs5EF9MgH4tYmJ6//XzNFg5NyF5PI0E6DvIZyILExzB5OnDeY6DFLMaKs7dcU0gXMSVXjhZ/XApglPqX8+UH5EVxnvNVlx11K6TI+MOh9UrGtY/VQpBTSaCVY/gRXa8Su3mm7X4g3Pn8LtyWdKFBORXiFLM8TfU1QbKUDS/odCP5mm64OGq49ZF9mu5XLUazkhVB4h1hzGoRfJcpENd/jaEARFTsSlP2s9XzsWcnEImzCQa/Kcpij6bAn3rJWgIetFiOpbqy3B3siZ9g19jhVxOEW0YVPGkbeoP2ZrO5BNIaYxck6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736857417; c=relaxed/relaxed;
	bh=hqxZT9ozmvZjLWkTsq08CYG4jN1j/R696/vPQZFpMxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CcoCu0TbyAJjy0A3Fl16oF0Zw/YjGs9EyroXGzOf2mo8RTBiGTMIujkTVoSahGmq6ZYFzaiyIc8m5RwQ2smE+hnh6mUHWonEb5pzSw5MpGX3w7vfWf/P+NKObMeowv7VQRvf0+UKnafHcoLLyiclHb5rQa34cp1vQ63wKLFQhz3B8aeg1Hp5xr8Kn3e9J9SnqPXs8VjCibIvDZcISbbysC0s2PgQNsreWsAqW9xhr+nPgB/Q1IdIXBfXLSSM+SZdI7hxWHARK3+FFD404HkVo86qAmf2PoDh5R9E4aTl65ONONiuJR3LvlPnpxfV/I0l53vBFuLgv8Cr1mweIDXsuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSw80r4Kz30CM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 23:23:35 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 607DC1424;
	Tue, 14 Jan 2025 04:23:33 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2EDF3F66E;
	Tue, 14 Jan 2025 04:23:02 -0800 (PST)
Date: Tue, 14 Jan 2025 12:23:00 +0000
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
Subject: Re: [PATCH v4 3/6] powerpc: Use note name macros
Message-ID: <Z4ZXJAn2A5Tawy5/@e133380.arm.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
 <20250111-elf-v4-3-b3841fa0dcd9@daynix.com>
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
In-Reply-To: <20250111-elf-v4-3-b3841fa0dcd9@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Sat, Jan 11, 2025 at 02:48:46PM +0900, Akihiko Odaki wrote:
> Use note name macros to match with the userspace's expectation.

Note, there seems to be some manual encoding of some arch-specific
notes in arch/powerpc/boot/addnote.c, but since this is all hard-coded
and the note types are not taken from elf.h anyway, I think this is
probably out of scope for this series.  I haven't tried to understand
fully what that code is doing.

Anyway:

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

> 
> Acked-by: Baoquan He <bhe@redhat.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  arch/powerpc/kernel/fadump.c               | 2 +-
>  arch/powerpc/platforms/powernv/opal-core.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..d44349fe8e2b 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -751,7 +751,7 @@ u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
>  	 * prstatus.pr_pid = ????
>  	 */
>  	elf_core_copy_regs(&prstatus.pr_reg, regs);
> -	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
> +	buf = append_elf_note(buf, NN_PRSTATUS, NT_PRSTATUS,
>  			      &prstatus, sizeof(prstatus));
>  	return buf;
>  }
> diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
> index c9a9b759cc92..a379ff86c120 100644
> --- a/arch/powerpc/platforms/powernv/opal-core.c
> +++ b/arch/powerpc/platforms/powernv/opal-core.c
> @@ -149,7 +149,7 @@ static Elf64_Word *__init auxv_to_elf64_notes(Elf64_Word *buf,
>  	/* end of vector */
>  	bufp[idx++] = cpu_to_be64(AT_NULL);
>  
> -	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_AUXV,
> +	buf = append_elf64_note(buf, NN_AUXV, NT_AUXV,
>  				oc_conf->auxv_buf, AUXV_DESC_SZ);
>  	return buf;
>  }
> @@ -252,7 +252,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
>  	 * crashing CPU's prstatus.
>  	 */
>  	first_cpu_note = buf;
> -	buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
> +	buf = append_elf64_note(buf, NN_PRSTATUS, NT_PRSTATUS,
>  				&prstatus, sizeof(prstatus));
>  
>  	for (i = 0; i < oc_conf->num_cpus; i++, bufp += size_per_thread) {
> @@ -279,7 +279,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
>  		fill_prstatus(&prstatus, thread_pir, &regs);
>  
>  		if (thread_pir != oc_conf->crashing_cpu) {
> -			buf = append_elf64_note(buf, CRASH_CORE_NOTE_NAME,
> +			buf = append_elf64_note(buf, NN_PRSTATUS,
>  						NT_PRSTATUS, &prstatus,
>  						sizeof(prstatus));
>  		} else {
> @@ -287,7 +287,7 @@ static Elf64_Word * __init opalcore_append_cpu_notes(Elf64_Word *buf)
>  			 * Add crashing CPU as the first NT_PRSTATUS note for
>  			 * GDB to process the core file appropriately.
>  			 */
> -			append_elf64_note(first_cpu_note, CRASH_CORE_NOTE_NAME,
> +			append_elf64_note(first_cpu_note, NN_PRSTATUS,
>  					  NT_PRSTATUS, &prstatus,
>  					  sizeof(prstatus));
>  		}
> 
> -- 
> 2.47.1
> 
> 

