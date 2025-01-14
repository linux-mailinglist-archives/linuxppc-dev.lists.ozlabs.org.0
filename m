Return-Path: <linuxppc-dev+bounces-5222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5464A10687
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 13:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSvq0wKQz307C;
	Tue, 14 Jan 2025 23:23:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736857399;
	cv=none; b=jooNGmta4oEy3eDwo4YFpjsj3XlDMjXEQmVV3lFq9E2ceDZKY+CAG0jTWjhfFADEuwuFZpwtDTLwHKsSFR7vnqEAMdHx/A1p9BVWTIZmyk0uJqVupPpnDvwFbRTU2g34bULraYazxUATYp9YhOzaNi1+PfXpvyY/+M2cIBVhvySDMZgptVAEUtZF6HsohGkrXcnTiMYI/eR4XD7cwUBV4lW8NipQSrg3QXcrNeJhDcg9jsj9QGODmoK1w/XU16BGSI665Wgr+yvBNVH8IZIpZdQcobIvGBpNsrDy+d3d7NmywvK2Lfb6K9hNUEFZG8wyZvZfl78Ve1ADm4wUO5W0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736857399; c=relaxed/relaxed;
	bh=4M9snT9qbDvQ88PdgmNC6RL0sxoR82CuhIh6v4YfX4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lhwV7ZdREBIclvKTJ7etY/z0K/QoP6M0STo06tWvMc+aIws0n5SmYpxzNzLkCSNjZ9njj11g1qAGuA9ewOWeD7dqjyMsdytZWOpScpY7bbrPftf+iWm9xQht6H056oxeOxqgMT3i+d7IKGZIDXMKTqRQppygcmDUSAEALzVLdLlkuCdHG70r/SbfFSaOgpskjCxPAkZMI/ZLHmajokyG3PYalG9+c0R/g0h7tD0En1/SNlSGc6iTgtwb8ovht94EFuQOFy1mpaPZHYres090SEDvpAlxU/GoTZz+9EupmF28D0HTcSfb4jTmkR3dkyT+KFAunnx8/azrNb1D1BLpXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=dave.martin@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXSvn18Y5z305n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 23:23:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E61311FB;
	Tue, 14 Jan 2025 04:23:09 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E5BF3F66E;
	Tue, 14 Jan 2025 04:22:38 -0800 (PST)
Date: Tue, 14 Jan 2025 12:22:31 +0000
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
Subject: Re: [PATCH v4 1/6] elf: Define note name macros
Message-ID: <Z4ZXB2UJaZWOmshN@e133380.arm.com>
References: <20250111-elf-v4-0-b3841fa0dcd9@daynix.com>
 <20250111-elf-v4-1-b3841fa0dcd9@daynix.com>
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
In-Reply-To: <20250111-elf-v4-1-b3841fa0dcd9@daynix.com>
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Sat, Jan 11, 2025 at 02:48:44PM +0900, Akihiko Odaki wrote:
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

I guess another motivation is to move towards having elf.h as the
single point of definition for the note names, so that obscure and
duplicate logic for determining note names can be removed.

(Could be worth adding a note on this is the patch is respun, but this
would be overkill otherwise...)


> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Acked-by: Baoquan He <bhe@redhat.com>
> ---
>  include/uapi/linux/elf.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 83 insertions(+), 3 deletions(-)
> 
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index b44069d29cec..343f5c40d03a 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -368,99 +368,179 @@ typedef struct elf64_shdr {
>  #define ELF_OSABI ELFOSABI_NONE
>  #endif
>  
> +/* Note definitions: NN_ defines names. NT_ defines types. */
> +
>  /*
>   * Notes used in ET_CORE. Architectures export some of the arch register sets
>   * using the corresponding note types via the PTRACE_GETREGSET and
>   * PTRACE_SETREGSET requests.
> - * The note name for these types is "LINUX", except NT_PRFPREG that is named
> - * "CORE".
>   */
> +#define NN_PRSTATUS	"CORE"
>  #define NT_PRSTATUS	1
> +#define NN_PRFPREG	"CORE"
>  #define NT_PRFPREG	2
> +#define NN_PRPSINFO	"CORE"
>  #define NT_PRPSINFO	3
> +#define NN_TASKSTRUCT	"CORE"
>  #define NT_TASKSTRUCT	4
> +#define NN_AUXV		"CORE"
>  #define NT_AUXV		6
>  /*
>   * Note to userspace developers: size of NT_SIGINFO note may increase
>   * in the future to accomodate more fields, don't assume it is fixed!
>   */
> +#define NN_SIGINFO      "CORE"
>  #define NT_SIGINFO      0x53494749
> +#define NN_FILE         "CORE"
>  #define NT_FILE         0x46494c45
> +#define NN_PRXFPREG     "LINUX"
>  #define NT_PRXFPREG     0x46e62b7f      /* copied from gdb5.1/include/elf/common.h */

[...]

> +#define NN_LOONGARCH_HW_WATCH	"LINUX"
>  #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
>  
> -/* Note types with note name "GNU" */
> +/* Note used in other file types. */

For this, it may make sense to be vaguer, e.g.

	/* Other notes */

(We don't dump NT_GNU_PROPERTY_TYPE_0 in coredumps, but I don't think
it would be nonsensical to do so.)

> +#define NN_GNU_PROPERTY_TYPE_0	"GNU"
>  #define NT_GNU_PROPERTY_TYPE_0	5

[...]

With or without those changes,

Reviewed-by: Dave Martin <Dave.Martin@arm.com>


