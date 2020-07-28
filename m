Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 457C9230BC3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:49:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGJ1V2wYKzDqLJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 23:49:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGHyK666czDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 23:46:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SneZ7VsG; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BGHyK52bzz9sSd; Tue, 28 Jul 2020 23:46:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BGHyK044Dz9sRK;
 Tue, 28 Jul 2020 23:46:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595943977;
 bh=3y2tXBtxH9v1JkU8HT+t2K5rruo9PDsqNSeSePCEevY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SneZ7VsGkX6I5SYitiDPjdb/NKRSzJte8DNHWSKuV0p5f/vnKMX8dFfvbWVtVBQyY
 MPY4Z/WkYtRQsm8Jdq3ANnNSNrQPrxPneKZ7AcxF3YLUGzVcDPCsPW4uXSBsGX0ZMQ
 nqIUkH3pultd1Fml9MIsYCYTOLu8CYVZdobYH/XOpHKHnYLex2Eptc+MONqlBTEzn0
 LA+aLPgWJ4mdQYOWSeh9UAv2HfXz73P2J68n5Omf796X3FvVKN9QQv95/E1wfR0gAh
 q3sfuqAcmEBp82lI37FWBvu0yVlK9p3r2x5NLZvxSQQ243btSFSu8hSqRWciV8ZMGf
 gJCdITLviKJNg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RESEND PATCH v5 07/11] ppc64/kexec_file: enable early kernel's
 OPAL calls
In-Reply-To: <159579233676.5790.10701756666641782647.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
 <159579233676.5790.10701756666641782647.stgit@hbathini>
Date: Tue, 28 Jul 2020 23:46:15 +1000
Message-ID: <87365b7nx4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Eric Biederman <ebiederm@xmission.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> Kernel built with CONFIG_PPC_EARLY_DEBUG_OPAL enabled expects r8 & r9
> to be filled with OPAL base & entry addresses respectively. Setting
> these registers allows the kernel to perform OPAL calls before the
> device tree is parsed.

I'm not convinced we want to do this.

If we do it becomes part of the kexec ABI and we have to honour it into
the future.

And in practice there are no non-development kernels built with OPAL early
debugging enabled, so it's not clear it actually helps anyone other than
developers.

cheers

> v4 -> v5:
> * New patch. Updated opal_base & opal_entry values in r8 & r9 respectively.
>   This change was part of the below dropped patch in v4:
>     - https://lore.kernel.org/patchwork/patch/1275667/
>
>
>  arch/powerpc/kexec/file_load_64.c      |   16 ++++++++++++++++
>  arch/powerpc/purgatory/trampoline_64.S |   15 +++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 8df085a22fd7..a5c1442590b2 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -713,6 +713,8 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>  			  const void *fdt, unsigned long kernel_load_addr,
>  			  unsigned long fdt_load_addr)
>  {
> +	struct device_node *dn = NULL;
> +	uint64_t val;
>  	int ret;
>  
>  	ret = setup_purgatory(image, slave_code, fdt, kernel_load_addr,
> @@ -735,9 +737,23 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
>  			goto out;
>  	}
>  
> +	/* Setup OPAL base & entry values */
> +	dn = of_find_node_by_path("/ibm,opal");
> +	if (dn) {
> +		of_property_read_u64(dn, "opal-base-address", &val);
> +		ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
> +						     sizeof(val), false);
> +		if (ret)
> +			goto out;
> +
> +		of_property_read_u64(dn, "opal-entry-address", &val);
> +		ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
> +						     sizeof(val), false);
> +	}
>  out:
>  	if (ret)
>  		pr_err("Failed to setup purgatory symbols");
> +	of_node_put(dn);
>  	return ret;
>  }
>  
> diff --git a/arch/powerpc/purgatory/trampoline_64.S b/arch/powerpc/purgatory/trampoline_64.S
> index a5a83c3f53e6..464af8e8a4cb 100644
> --- a/arch/powerpc/purgatory/trampoline_64.S
> +++ b/arch/powerpc/purgatory/trampoline_64.S
> @@ -61,6 +61,10 @@ master:
>  	li	%r4,28
>  	STWX_BE	%r17,%r3,%r4	/* Store my cpu as __be32 at byte 28 */
>  1:
> +	/* Load opal base and entry values in r8 & r9 respectively */
> +	ld	%r8,(opal_base - 0b)(%r18)
> +	ld	%r9,(opal_entry - 0b)(%r18)
> +
>  	/* load the kernel address */
>  	ld	%r4,(kernel - 0b)(%r18)
>  
> @@ -102,6 +106,17 @@ dt_offset:
>  	.8byte  0x0
>  	.size dt_offset, . - dt_offset
>  
> +	.balign 8
> +	.globl opal_base
> +opal_base:
> +	.8byte  0x0
> +	.size opal_base, . - opal_base
> +
> +	.balign 8
> +	.globl opal_entry
> +opal_entry:
> +	.8byte  0x0
> +	.size opal_entry, . - opal_entry
>  
>  	.data
>  	.balign 8
