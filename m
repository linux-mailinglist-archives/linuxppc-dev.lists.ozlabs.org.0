Return-Path: <linuxppc-dev+bounces-5301-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3CEA12982
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 18:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYCGp5F2mz2yyJ;
	Thu, 16 Jan 2025 04:12:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736961138;
	cv=none; b=II5ljh2r6ZFLFzUaS0xAulZR8SKhtzfShr4/4QThxmlqOf00lh35IFmFHxS9hSVCg8r1QKGnU9HXQ7GCARPmNOSvDTUNmZ/ciis/+JDHfMfcc58iNpe9bum/xJvc2amhbImuyGFONLViNpk0ClShy75mHb5pACsbyyvXZF0wXyA+qseqRze9uZqQ9eGhDe0YxxGhPbbnHAzQJ/b2bBCNxQaAf8a/lqZVZLvIjQ1/MSZtuNDgMa+q3IY7jcfkQD1R2WHcgPkbftVcKeIcLDMzxp0UMqj3j3uHLR6kQ1LX2r4CR3ZfpkEIvECFhYuIgC5Jw1s7S4HulqtpvkbQhAGOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736961138; c=relaxed/relaxed;
	bh=AQnotGj8O8dtIqdw3qds2F4aUxndTgIwthGYOjx9Xqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHARFtwFvenqjMV2jPTJXL9e+B6jmlKGwyyD8CqbRs6Y79EAY5Kwzy65vF6sKQVDggS11u4ppIvlBPwfZorkdUUWkQor6QvJDsF4x7Bhr1fgDTXYONkWsQYkFcgo9WddDnQguxej00qQVp0K7DqhMrhhVrZuodGmZgQmPMVhu5Ik1pmYV47hMueqnBH4zC1R7cFYTDsque9eNoooUx9ln0wU2wOHg23Q8Urdo7mNY0wfyQ0pV1JVXLQyuBY30iGiLpjFmouNVULl6JWlfDz/r0LLqG05gjecyztzgJWrxK2pXmvMW47AouOKStYZlqEOnw+w5fu09VB+bgnVLC5GKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYCGn6XQHz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 04:12:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4E6611FB;
	Wed, 15 Jan 2025 09:12:12 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0F63F673;
	Wed, 15 Jan 2025 09:11:42 -0800 (PST)
Date: Wed, 15 Jan 2025 17:11:34 +0000
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
Subject: Re: [PATCH v5 1/6] elf: Define note name macros
Message-ID: <Z4fsRq4D4X5Qb+Dq@e133380.arm.com>
References: <20250115-elf-v5-0-0f9e55bbb2fc@daynix.com>
 <20250115-elf-v5-1-0f9e55bbb2fc@daynix.com>
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
In-Reply-To: <20250115-elf-v5-1-0f9e55bbb2fc@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Wed, Jan 15, 2025 at 02:47:58PM +0900, Akihiko Odaki wrote:
> elf.h had a comment saying:
> > Notes used in ET_CORE. Architectures export some of the arch register
> > sets using the corresponding note types via the PTRACE_GETREGSET and
> > PTRACE_SETREGSET requests.
> > The note name for these types is "LINUX", except NT_PRFPREG that is
> > named "CORE".
> 
> However, NT_PRSTATUS is also named "CORE". It is also unclear what
> "these types" refers to.
> 
> To fix these problems, define a name for each note type. The added
> definitions are macros so the kernel and userspace can directly refer to
> them to remove their duplicate definitions of note names.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> ---
>  include/uapi/linux/elf.h | 89 +++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 5 deletions(-)
> 
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b44069d29cec..592507aa9b3a 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -368,101 +368,180 @@ typedef struct elf64_shdr {
>  #define ELF_OSABI ELFOSABI_NONE
>  #endif
>  
> +/* Note definitions: NN_ defines names. NT_ defines types. */
> +
> +#define NN_GNU_PROPERTY_TYPE_0	"GNU"
> +#define NT_GNU_PROPERTY_TYPE_0	5
> +

I guess this also works as a neutral way of saying that
NT_GNU_PROPERTY_TYPE_0 isn't _specifically_ for coredumps.

I would worry that moving this block is going to generate unwanted
context noise with other patches that may be in flight and add new
NT_ definitions.

But (a) changing the comments will cause that anyway, and
(b) if there are any new NT_ definitions in flight, we want people to
notice the conflict and add the accompanying NN_ definition.

So, perhaps context noise is not such a bad thing in this instance.

[...]

> +#define NN_LOONGARCH_HW_WATCH	"LINUX"
>  #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
>  
> -/* Note types with note name "GNU" */
> -#define NT_GNU_PROPERTY_TYPE_0	5
> -
>  /* Note header in a PT_NOTE section */
>  typedef struct elf32_note {
>    Elf32_Word	n_namesz;	/* Name size */

Reviewed-by: Dave Martin <Dave.Martin@arm.com>

Cheers
---Dave

