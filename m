Return-Path: <linuxppc-dev+bounces-4716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 863D3A0283E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 15:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRcKB0y5kz2yZN;
	Tue,  7 Jan 2025 01:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736174398;
	cv=none; b=BLBAJQ+7eYwXXL5XNItZKpoG+qkwtgCSZFFHD6uRJbT1Nfy973eSm7Etx15M6GbHKXLhfKfLg3T2joiCahmQfLWdD7UaX5fw9nsSiXgOShJ+TmD4XFmMUTTLPod4tGG2s1hDUHcodQKMJHtQND2RlFR5TAEMVlnTtj2itbawasM6WB29Q39xHpiFMF+o1J2yvmZmptkNu+lZFm0Rc6LwJyutuPH4WhLZEpvPPJbOu0MSjnHWMmRN6xz/6sMG+lUrXv0Ztc9TW31HnsgMxZPEppVKFvi1B6R1rmwnzGxgmBoUox/q6r5U4jcSXGuerSxChBqHHiSk09PPr5nH0Vi7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736174398; c=relaxed/relaxed;
	bh=KScFq6VCrgf/nu/Jb5BN/GzdP0ojcAD8SI4fYCVhxV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7CA6AaoCfwkiMmnhM5wanNNVuyrCZvHCzksGwLwPRU5x5w2UNfkFwyjDfCV4DCowzCXTeUHj78z8jzi2YIXWHXe97WvEuP+sQudIvaHpfC/YYKpo8qHThI+FjCYM0/VFHmDFQkv8r4EM8m7nqWw5iam3sZWpGNYtI5bJCMZ6+e+D/2ZhysvgoGYyq6+lnqlDSADhfw/D7dDW0s1DChg5lWlA2s2d8Jl7fjcaurfsAQTDDv650JoYsRUNops4ieQdW/eQ7d1k5RpdYR7lU7JVvnaH6/3M6v1Fvdhxx/rW1xzCV2KQWtltY0qg4LaKyMMyeHvBNnvGGnayAw//uhHgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRcK84Jsqz2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 01:39:54 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85C64143D;
	Mon,  6 Jan 2025 06:39:49 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 052903F59E;
	Mon,  6 Jan 2025 06:39:18 -0800 (PST)
Date: Mon, 6 Jan 2025 14:39:13 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, devel@daynix.com
Subject: Re: [PATCH v2 1/5] elf: Define note name macros
Message-ID: <Z3vrEYQVlff1+ZBW@e133380.arm.com>
References: <20250104-elf-v2-0-77dc2e06db4e@daynix.com>
 <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
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
In-Reply-To: <20250104-elf-v2-1-77dc2e06db4e@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Jan 04, 2025 at 11:38:34PM +0900, Akihiko Odaki wrote:
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
> them.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  include/uapi/linux/elf.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 83 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b44069d29cec..014b705b97d7 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -372,8 +372,6 @@ typedef struct elf64_shdr {
>   * Notes used in ET_CORE. Architectures export some of the arch register sets
>   * using the corresponding note types via the PTRACE_GETREGSET and
>   * PTRACE_SETREGSET requests.
> - * The note name for these types is "LINUX", except NT_PRFPREG that is named
> - * "CORE".

Maybe most people would find it obvious, but is it worth saying what
the NT_ and NN_ macros are for?  They can easily be explained in terms
of the elfXX_note struct fields.

>   */
>  #define NT_PRSTATUS	1
>  #define NT_PRFPREG	2
> @@ -460,9 +458,91 @@ typedef struct elf64_shdr {
>  #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
>  #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
>  
> -/* Note types with note name "GNU" */
> +/* Note used in ET_EXEC and ET_DYN. */

May just "other notes"?  I think that the comment might bitrot
over time.

>  #define NT_GNU_PROPERTY_TYPE_0	5
>  
> +/* Note names */
> +#define NN_PRSTATUS	"CORE"

Can these be interleaved with the NT_ definitions?  I think this would
make the resulting header (and the diff) easier to read.

> +#define NN_PRFPREG	"CORE"

[...]

> +#define NN_GNU_PROPERTY_TYPE_0	"GNU"

[...]

Cheers
---Dave

