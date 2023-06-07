Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A63BF725793
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 10:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbgSh3QHlz3dxg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 18:27:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gx1AjEIR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gx1AjEIR;
	dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbgRt0G1Kz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 18:26:47 +1000 (AEST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1a1fa977667so7452708fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686126403; x=1688718403;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0OyKL8u76cOWS8rMkXzpr40joVTVvs+ER4J7F7RIUc=;
        b=gx1AjEIRVKwC+e/wYi+5OJVPxwD24AqcSgDNzNjEGmxN9LybTFcLwReCPofBu/oU27
         TPsIqdI18Y4gzDn/PamlyLMVjXB/SlBoYCZ3e012AKFP3ibEDLJ3GBZLHPmiYmZlIqwA
         MOZtje7230z9BYI3KPM1WQP+xH4cQkApMzFMGPc8vL0LzuPup1PRUxK90PD6usWANsz0
         5Eb9fFwRPl01u+1z/6IOKHu2eBgaZBk8XDosHmv/3dxCU05kZLyc/0CwtW61Fx3Xf1F9
         76eRKSm3Vc27Ryz+mfY71QPAYWkwiYyGjg65YH89dYjA23NMGzNhLjCj7TKZ+e7HlO9R
         /KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686126403; x=1688718403;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0OyKL8u76cOWS8rMkXzpr40joVTVvs+ER4J7F7RIUc=;
        b=Skbb9mDrd/yzyhnfrAbiCxo72e+ebfyoPUaGcj1Cfsyyk70Tatdja9kbJh/8WU8oaj
         eLEDK04UtE4/XsvBoIjeo5/ek/h4GaOOMhymOrsq5msRwGuOWRg9WTiWddNNkr1KBxo5
         POezvH0XNr9gxMsEkPon7f3xk6FC+w4ovX98xJwMyVbImZGDT/ZXcgWzMJ1E6PEtbUH1
         vYEGLmJFW0iIbT2/QqX1xknWvAmQlCzPJXu0wkP7uFIVlruYiQrxzl6PNonhbHNlYqng
         1+Q+MO2WLUKjKrWzh1X+UvjftTe4GNsy4PdqFSp67MdB9KH+LUoLmWcDKfJTZ7nzN/US
         qnwA==
X-Gm-Message-State: AC+VfDxu+cWeC5klWgxQNtavsA+5MaAKsbVo7B5zFpO0oMaGfeIAVU8R
	GimB/I0LPoC26gFnYZ+EuoM=
X-Google-Smtp-Source: ACHHUZ52S9FmYHylCGUBDHU6A/rnvTKpdnJxmZbNyuim1YSbqrzR0jOjQly/hHUgV49Csb4p+rh46A==
X-Received: by 2002:a54:418f:0:b0:398:57ac:23fe with SMTP id 15-20020a54418f000000b0039857ac23femr4810602oiy.10.1686126402630;
        Wed, 07 Jun 2023 01:26:42 -0700 (PDT)
Received: from localhost (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001b1a2bf5277sm9843062plg.39.2023.06.07.01.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 01:26:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jun 2023 18:26:35 +1000
Message-Id: <CT69X8Q3NVVO.GXEUNFGVDL08@wheely>
Subject: Re: [RFC PATCH v2 4/6] KVM: PPC: Add helper library for Guest State
 Buffers
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jordan Niethe" <jpn@linux.vnet.ibm.com>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230605064848.12319-1-jpn@linux.vnet.ibm.com>
 <20230605064848.12319-5-jpn@linux.vnet.ibm.com>
In-Reply-To: <20230605064848.12319-5-jpn@linux.vnet.ibm.com>
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
Cc: mikey@neuling.org, kautuk.consul.1980@gmail.com, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, sbhat@linux.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 5, 2023 at 4:48 PM AEST, Jordan Niethe wrote:
> The new PAPR nested guest API introduces the concept of a Guest State
> Buffer for communication about L2 guests between L1 and L0 hosts.
>
> In the new API, the L0 manages the L2 on behalf of the L1. This means
> that if the L1 needs to change L2 state (e.g. GPRs, SPRs, partition
> table...), it must request the L0 perform the modification. If the
> nested host needs to read L2 state likewise this request must
> go through the L0.
>
> The Guest State Buffer is a Type-Length-Value style data format defined
> in the PAPR which assigns all relevant partition state a unique
> identity. Unlike a typical TLV format the length is redundant as the
> length of each identity is fixed but is included for checking
> correctness.
>
> A guest state buffer consists of an element count followed by a stream
> of elements, where elements are composed of an ID number, data length,
> then the data:
>
>   Header:
>
>    <---4 bytes--->
>   +----------------+-----
>   | Element Count  | Elements...
>   +----------------+-----
>
>   Element:
>
>    <----2 bytes---> <-2 bytes-> <-Length bytes->
>   +----------------+-----------+----------------+
>   | Guest State ID |  Length   |      Data      |
>   +----------------+-----------+----------------+
>
> Guest State IDs have other attributes defined in the PAPR such as
> whether they are per thread or per guest, or read-only.
>
> Introduce a library for using guest state buffers. This includes support
> for actions such as creating buffers, adding elements to buffers,
> reading the value of elements and parsing buffers. This will be used
> later by the PAPR nested guest support.

This is a tour de force in one of these things, so I hate to be
the "me smash with club" guy, but what if you allocated buffers
with enough room for all the state (or 99% of cases, in which
case an overflow would make an hcall)?

What's actually a fast-path that we don't get from the interrupt
return buffer? Getting and setting a few regs for MMIO emulation?


> Signed-off-by: Jordan Niethe <jpn@linux.vnet.ibm.com>
> ---
> v2:
>   - Add missing #ifdef CONFIG_VSXs
>   - Move files from lib/ to kvm/
>   - Guard compilation on CONFIG_KVM_BOOK3S_HV_POSSIBLE
>   - Use kunit for guest state buffer tests
>   - Add configuration option for the tests
>   - Use macros for contiguous id ranges like GPRs
>   - Add some missing EXPORTs to functions
>   - HEIR element is a double word not a word
> ---
>  arch/powerpc/Kconfig.debug                    |  12 +
>  arch/powerpc/include/asm/guest-state-buffer.h | 901 ++++++++++++++++++
>  arch/powerpc/include/asm/kvm_book3s.h         |   2 +
>  arch/powerpc/kvm/Makefile                     |   3 +
>  arch/powerpc/kvm/guest-state-buffer.c         | 563 +++++++++++
>  arch/powerpc/kvm/test-guest-state-buffer.c    | 321 +++++++
>  6 files changed, 1802 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
>  create mode 100644 arch/powerpc/kvm/guest-state-buffer.c
>  create mode 100644 arch/powerpc/kvm/test-guest-state-buffer.c
>
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index 6aaf8dc60610..ed830a714720 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -82,6 +82,18 @@ config MSI_BITMAP_SELFTEST
>  	bool "Run self-tests of the MSI bitmap code"
>  	depends on DEBUG_KERNEL
> =20
> +config GUEST_STATE_BUFFER_TEST
> +	def_tristate n
> +	prompt "Enable Guest State Buffer unit tests"
> +	depends on KUNIT
> +	depends on KVM_BOOK3S_HV_POSSIBLE
> +	default KUNIT_ALL_TESTS
> +	help
> +	  The Guest State Buffer is a data format specified in the PAPR.
> +	  It is by hcalls to communicate the state of L2 guests between
> +	  the L1 and L0 hypervisors. Enable unit tests for the library
> +	  used to create and use guest state buffers.
> +
>  config PPC_IRQ_SOFT_MASK_DEBUG
>  	bool "Include extra checks for powerpc irq soft masking"
>  	depends on PPC64
> diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc=
/include/asm/guest-state-buffer.h
> new file mode 100644
> index 000000000000..65a840abf1bb
> --- /dev/null
> +++ b/arch/powerpc/include/asm/guest-state-buffer.h
> @@ -0,0 +1,901 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Interface based on include/net/netlink.h
> + */
> +#ifndef _ASM_POWERPC_GUEST_STATE_BUFFER_H
> +#define _ASM_POWERPC_GUEST_STATE_BUFFER_H
> +
> +#include <linux/gfp.h>
> +#include <linux/bitmap.h>
> +#include <asm/plpar_wrappers.h>
> +
> +/***********************************************************************=
***
> + * Guest State Buffer Constants
> + ***********************************************************************=
***/
> +#define GSID_BLANK			0x0000

The namespaces are a little abbreviated. KVM_PAPR_ might be nice if
you're calling the API that.

> +
> +#define GSID_HOST_STATE_SIZE		0x0001 /* Size of Hypervisor Internal Form=
at VCPU state */
> +#define GSID_RUN_OUTPUT_MIN_SIZE	0x0002 /* Minimum size of the Run VCPU =
output buffer */
> +#define GSID_LOGICAL_PVR		0x0003 /* Logical PVR */
> +#define GSID_TB_OFFSET			0x0004 /* Timebase Offset */
> +#define GSID_PARTITION_TABLE		0x0005 /* Partition Scoped Page Table */
> +#define GSID_PROCESS_TABLE		0x0006 /* Process Table */

> +
> +#define GSID_RUN_INPUT			0x0C00 /* Run VCPU Input Buffer */
> +#define GSID_RUN_OUTPUT			0x0C01 /* Run VCPU Out Buffer */
> +#define GSID_VPA			0x0C02 /* HRA to Guest VCPU VPA */
> +
> +#define GSID_GPR(x)			(0x1000 + (x))
> +#define GSID_HDEC_EXPIRY_TB		0x1020
> +#define GSID_NIA			0x1021
> +#define GSID_MSR			0x1022
> +#define GSID_LR				0x1023
> +#define GSID_XER			0x1024
> +#define GSID_CTR			0x1025
> +#define GSID_CFAR			0x1026
> +#define GSID_SRR0			0x1027
> +#define GSID_SRR1			0x1028
> +#define GSID_DAR			0x1029

It's a shame you have to rip up all your wrapper functions now to
shoehorn these in.

If you included names analogous to the reg field names in the kvm
structures, the wrappers could do macro expansions that get them.

#define __GSID_WRAPPER_dar		GSID_DAR

Or similar.

And since of course you have to explicitly enumerate all these, I
wouldn't mind defining the types and lengths up-front rather than
down in the type function. You'd like to be able to go through the
spec and eyeball type, number, size.

[snip]

> +/**
> + * gsb_paddress() - the physical address of buffer
> + * @gsb: guest state buffer
> + *
> + * Returns the physical address of the buffer.
> + */
> +static inline u64 gsb_paddress(struct gs_buff *gsb)
> +{
> +	return __pa(gsb_header(gsb));
> +}

> +/**
> + * __gse_put_reg() - add a register type guest state element to a buffer
> + * @gsb: guest state buffer to add element to
> + * @iden: guest state ID
> + * @val: host endian value
> + *
> + * Adds a register type guest state element. Uses the guest state ID for
> + * determining the length of the guest element. If the guest state ID ha=
s
> + * bits that can not be set they will be cleared.
> + */
> +static inline int __gse_put_reg(struct gs_buff *gsb, u16 iden, u64 val)
> +{
> +	val &=3D gsid_mask(iden);
> +	if (gsid_size(iden) =3D=3D sizeof(u64))
> +		return gse_put_u64(gsb, iden, val);
> +
> +	if (gsid_size(iden) =3D=3D sizeof(u32)) {
> +		u32 tmp;
> +
> +		tmp =3D (u32)val;
> +		if (tmp !=3D val)
> +			return -EINVAL;
> +
> +		return gse_put_u32(gsb, iden, tmp);
> +	}
> +	return -EINVAL;
> +}

There is a clever accessor that derives the length from the type, but
then you fall back to this.

> +/**
> + * gse_put - add a guest state element to a buffer
> + * @gsb: guest state buffer to add to
> + * @iden: guest state identity
> + * @v: generic value
> + */
> +#define gse_put(gsb, iden, v)					\
> +	(_Generic((v),						\
> +		  u64 : __gse_put_reg,				\
> +		  long unsigned int : __gse_put_reg,		\
> +		  u32 : __gse_put_reg,				\
> +		  struct gs_buff_info : gse_put_buff_info,	\
> +		  struct gs_proc_table : gse_put_proc_table,	\
> +		  struct gs_part_table : gse_put_part_table,	\
> +		  vector128 : gse_put_vector128)(gsb, iden, v))
> +
> +/**
> + * gse_get - return the data of a guest state element
> + * @gsb: guest state element to add to
> + * @v: generic value pointer to return in
> + */
> +#define gse_get(gse, v)						\
> +	(*v =3D (_Generic((v),					\
> +			u64 * : __gse_get_reg,			\
> +			unsigned long * : __gse_get_reg,	\
> +			u32 * : __gse_get_reg,			\
> +			vector128 * : gse_get_vector128)(gse)))

I don't see the benefit of this. Caller always knows the type doesn't
it? It seems like the right function could be called directly. It
makes the calling convention a bit clunky too. I know there's similar
precedent for uaccess functions, but not sure I like it for this.

> +struct gs_buff *gsb_new(size_t size, unsigned long guest_id,
> +			unsigned long vcpu_id, gfp_t flags)
> +{
> +	struct gs_buff *gsb;
> +
> +	gsb =3D kzalloc(sizeof(*gsb), flags);
> +	if (!gsb)
> +		return NULL;
> +
> +	size =3D roundup_pow_of_two(size);
> +	gsb->hdr =3D kzalloc(size, GFP_KERNEL);
> +	if (!gsb->hdr)
> +		goto free;
> +
> +	gsb->capacity =3D size;
> +	gsb->len =3D sizeof(struct gs_header);
> +	gsb->vcpu_id =3D vcpu_id;
> +	gsb->guest_id =3D guest_id;
> +
> +	gsb->hdr->nelems =3D cpu_to_be32(0);
> +
> +	return gsb;
> +
> +free:
> +	kfree(gsb);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(gsb_new);

Should all be GPL exports.

Needs more namespace too, I reckon (not just exports but any kernel-wide
name this short and non-descriptive needs a kvmppc or kvm_papr or
something).

Thanks,
Nick
