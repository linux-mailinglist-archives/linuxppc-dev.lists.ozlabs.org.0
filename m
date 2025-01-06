Return-Path: <linuxppc-dev+bounces-4678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1AA01D4D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 03:22:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRHxz2cVtz2yyR;
	Mon,  6 Jan 2025 13:22:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736130135;
	cv=none; b=jmW1X+lY0w3XFKcU9oVQIzfFoqYkCp8annQj3Zg8Anl0Ap5Zn8gksgM0wIzd+8bvtS35RBUTGiNVs5g+Zvx2xIZoWU4cenjGoed11YnYpDMerMbGzJNbomk4yEGxcQVFHznZw6Wp4cJdo1MTWNs5du7bh3PIzwFgXBV+ahst/afaFSWPQpEpeSYgzGJct3uuwYfTVEuJnx6BWoHdlaLYL8Zu3ADVyzkAMZdMFwWl164R8w2T2Y/4YSIKgiXfVBznB/h6ml0OfrNHWr6LBK+UNG+0dHof+3bWDvImsxAZh6Ht78dmrKu4fjM3d1BYLHQxeqvw2xWYWaL/q4PAITaVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736130135; c=relaxed/relaxed;
	bh=QDNMuGdRbtFXOEF4wgeAn1mDrtVJdeBZdGzWjrJ9xwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwIJSPZ03du2dkuX6LXDiu/jWUs37GXNOAUkJ52+XPI2TSYjEXGSWH1+ht5XQwoFRbGpBreo9iegB7B+z93kGr8794IeGhNLIb5UL96sV8z/OFgh2ZIh5eAXf1vH6b2XMzmTJ1XZ1W9Wgpy1Y52Dj9hNl0QogqYn4ZGblvU9VXdhhdWBSUDtbAMBc8ZU5MkUQLUa9k297+igG+YNlrdN1heSsILHwEAV4l/q/V5LCgZ7vTtCedXZYAMpEBDizCe+x3JcGnTlO9zzLl4DwzEbvYHW6wnWjoolZYNVFlbNP2q5ZsDbdjKN/iC+4XXdHF4cZUsCFX54rLBYEJhjlfkzCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNB9Xhnq; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OFxEHIIC; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QNB9Xhnq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OFxEHIIC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRHxx6ytkz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 13:22:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736130125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QDNMuGdRbtFXOEF4wgeAn1mDrtVJdeBZdGzWjrJ9xwA=;
	b=QNB9XhnqUc/yjh6TtuQerhD5A6MqvdUNuvKpTV0yLghQ/l91KSYUT9FRJIOFIYx9zqFyPP
	KuIig+oQQ2X6cFTCD6uyCPLkq/p9JsULusoSvLy2sJl2rPQQ1mdIb5RxMRaax3kNwHXqf6
	wdKn6+yllEXial7HwHhZaN7YW2GbXSY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736130126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QDNMuGdRbtFXOEF4wgeAn1mDrtVJdeBZdGzWjrJ9xwA=;
	b=OFxEHIICRir4L4XG2K04FulMTnxb7/0EGL8c/+JKda/XLcF+DZo2RKxYXB9Te/2GuxtcfI
	WwgeGw4e9EX9vPFr9CpvfrjLzL+jiwJcu/ODHh6l9qPOlqGsZEPX6A9bu+qR4gSdJEMh8A
	P9lCZQ/kDWA3Cx+l5L/V61Wc0SE+1MI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-WPXHLyM9NlasFo14ZUzn-g-1; Sun,
 05 Jan 2025 21:22:04 -0500
X-MC-Unique: WPXHLyM9NlasFo14ZUzn-g-1
X-Mimecast-MFC-AGG-ID: WPXHLyM9NlasFo14ZUzn-g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DB7D19560A2;
	Mon,  6 Jan 2025 02:22:01 +0000 (UTC)
Received: from localhost (unknown [10.72.112.99])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E7E113000197;
	Mon,  6 Jan 2025 02:21:57 +0000 (UTC)
Date: Mon, 6 Jan 2025 10:21:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kexec@lists.infradead.org, devel@daynix.com
Subject: Re: [PATCH v2 1/5] elf: Define note name macros
Message-ID: <Z3s+QeMv8AaGbMGs@MiWiFi-R3L-srv>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/04/25 at 11:38pm, Akihiko Odaki wrote:
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
>   */
>  #define NT_PRSTATUS	1
>  #define NT_PRFPREG	2
> @@ -460,9 +458,91 @@ typedef struct elf64_shdr {
>  #define NT_LOONGARCH_HW_BREAK	0xa05   /* LoongArch hardware breakpoint registers */
>  #define NT_LOONGARCH_HW_WATCH	0xa06   /* LoongArch hardware watchpoint registers */
>  
> -/* Note types with note name "GNU" */
> +/* Note used in ET_EXEC and ET_DYN. */
>  #define NT_GNU_PROPERTY_TYPE_0	5
>  
> +/* Note names */
> +#define NN_PRSTATUS	"CORE"
> +#define NN_PRFPREG	"CORE"
> +#define NN_PRPSINFO	"CORE"
> +#define NN_TASKSTRUCT	"CORE"
> +#define NN_AUXV	"CORE"
> +#define NN_SIGINFO	"CORE"
> +#define NN_FILE	"CORE"
> +#define NN_PRXFPREG	"LINUX"

No objection to make them clearer. Thanks for the effort.

Wondering where below arch specific macros are used. So you just
added all NN_xxx for the corresponding NT_xxx? Not sure if this is
needed if we don't use them at all in the current kernel.

> +#define NN_PPC_VMX	"LINUX"
> +#define NN_PPC_SPE	"LINUX"
> +#define NN_PPC_VSX	"LINUX"
> +#define NN_PPC_TAR	"LINUX"
> +#define NN_PPC_PPR	"LINUX"
> +#define NN_PPC_DSCR	"LINUX"
> +#define NN_PPC_EBB	"LINUX"
> +#define NN_PPC_PMU	"LINUX"
> +#define NN_PPC_TM_CGPR	"LINUX"
> +#define NN_PPC_TM_CFPR	"LINUX"
> +#define NN_PPC_TM_CVMX	"LINUX"
> +#define NN_PPC_TM_CVSX	"LINUX"
> +#define NN_PPC_TM_SPR	"LINUX"
> +#define NN_PPC_TM_CTAR	"LINUX"
> +#define NN_PPC_TM_CPPR	"LINUX"
> +#define NN_PPC_TM_CDSCR	"LINUX"
> +#define NN_PPC_PKEY	"LINUX"
> +#define NN_PPC_DEXCR	"LINUX"
> +#define NN_PPC_HASHKEYR	"LINUX"
> +#define NN_386_TLS	"LINUX"
> +#define NN_386_IOPERM	"LINUX"
> +#define NN_X86_XSTATE	"LINUX"
> +#define NN_X86_SHSTK	"LINUX"
> +#define NN_X86_XSAVE_LAYOUT	"LINUX"
> +#define NN_S390_HIGH_GPRS	"LINUX"
> +#define NN_S390_TIMER	"LINUX"
> +#define NN_S390_TODCMP	"LINUX"
> +#define NN_S390_TODPREG	"LINUX"
> +#define NN_S390_CTRS	"LINUX"
> +#define NN_S390_PREFIX	"LINUX"
> +#define NN_S390_LAST_BREAK	"LINUX"
> +#define NN_S390_SYSTEM_CALL	"LINUX"
> +#define NN_S390_TDB	"LINUX"
> +#define NN_S390_VXRS_LOW	"LINUX"
> +#define NN_S390_VXRS_HIGH	"LINUX"
> +#define NN_S390_GS_CB	"LINUX"
> +#define NN_S390_GS_BC	"LINUX"
> +#define NN_S390_RI_CB	"LINUX"
> +#define NN_S390_PV_CPU_DATA	"LINUX"
> +#define NN_ARM_VFP	"LINUX"
> +#define NN_ARM_TLS	"LINUX"
> +#define NN_ARM_HW_BREAK	"LINUX"
> +#define NN_ARM_HW_WATCH	"LINUX"
> +#define NN_ARM_SYSTEM_CALL	"LINUX"
> +#define NN_ARM_SVE	"LINUX"
> +#define NN_ARM_PAC_MASK	"LINUX"
> +#define NN_ARM_PACA_KEYS	"LINUX"
> +#define NN_ARM_PACG_KEYS	"LINUX"
> +#define NN_ARM_TAGGED_ADDR_CTRL	"LINUX"
> +#define NN_ARM_PAC_ENABLED_KEYS	"LINUX"
> +#define NN_ARM_SSVE	"LINUX"
> +#define NN_ARM_ZA	"LINUX"
> +#define NN_ARM_ZT	"LINUX"
> +#define NN_ARM_FPMR	"LINUX"
> +#define NN_ARM_POE	"LINUX"
> +#define NN_ARM_GCS	"LINUX"
> +#define NN_ARC_V2	"LINUX"
> +#define NN_VMCOREDD	"LINUX"
> +#define NN_MIPS_DSP	"LINUX"
> +#define NN_MIPS_FP_MODE	"LINUX"
> +#define NN_MIPS_MSA	"LINUX"
> +#define NN_RISCV_CSR	"LINUX"
> +#define NN_RISCV_VECTOR	"LINUX"
> +#define NN_RISCV_TAGGED_ADDR_CTRL	"LINUX"
> +#define NN_LOONGARCH_CPUCFG	"LINUX"
> +#define NN_LOONGARCH_CSR	"LINUX"
> +#define NN_LOONGARCH_LSX	"LINUX"
> +#define NN_LOONGARCH_LASX	"LINUX"
> +#define NN_LOONGARCH_LBT	"LINUX"
> +#define NN_LOONGARCH_HW_BREAK	"LINUX"
> +#define NN_LOONGARCH_HW_WATCH	"LINUX"
> +#define NN_GNU_PROPERTY_TYPE_0	"GNU"
> +
>  /* Note header in a PT_NOTE section */
>  typedef struct elf32_note {
>    Elf32_Word	n_namesz;	/* Name size */
> 
> -- 
> 2.47.1
> 


