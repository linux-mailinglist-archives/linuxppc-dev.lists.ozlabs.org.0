Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603B228330
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 17:08:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB25n1gqLzDqZG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 01:07:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::442;
 helo=mail-wr1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R9RGlsgq; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB1wv6rBBzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 01:00:15 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id f7so21540705wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 08:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gkcdZTp2vhYAj6bOy4b93mUdztEgbAoKRStl6TIAF08=;
 b=R9RGlsgqzV6dj+XgA5tLGi4k+d6eegdhlMqHNZSTpznh+TqDXoiyuhz+daPZSJfUYa
 /4a5pa1wa2Y0goWjd+Wrwn4odA33wh6Z35ODwUBhsDDq83R1Zlh7EdhMFytzEk7aCdCC
 qGtbZTvfbdaHEagPT16HzRuSvceREEgOzsPRaCHFS0N77rfaNhkBR7giM5gyYmCJ/2eP
 Iy3cRScwAcIL0f13FWZvF3xxr5iu9ypG+dGAufGXtT3uxa/sNmS1Qui0oBd525kp9JuK
 7um+mMi/c6X6A6bYMRI7kejfTJkTWfOgSvdyx1xKm9q6TfHZFOpwC9eI0nqK2km0oWW6
 iEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gkcdZTp2vhYAj6bOy4b93mUdztEgbAoKRStl6TIAF08=;
 b=KZO3z5NzWZaPMsOi+N9bq+JnfcW8RYnXi69hW5Pp2MPF9AN17/TqI4FAbnUVM4Z8kz
 UWK30888sB/rWjcy1cGvMbyqKBKZ7a3c0o8cJjnruJOFKjkvxdDBHcDj44v6CuxVOZBG
 WF3vQRk90tY4qGw8ZZwLFE55ABsSzQpmFr+n7bU542VwVVLiI+Y+pta46uXQ0pRZQjwy
 3nXM8nZQkAyAeIXaMFujMcsKz0LoYJPpwm0EAUHX9Miaz+fbVE0f9x8jF81yqyZYrho/
 TP1x7p/OPXnL6C3yNse0FMs+RUxoo2wdP1cZwLeIMeymhZy48IPKB36ZR36H6TAE4i5V
 os8w==
X-Gm-Message-State: AOAM530eCbivoOMq3wUoNgcOQi+/6/xWLiB3l3nrWiOR5PzZoH3rzECw
 v0YV5DJIVzNu5uLgxVex+981fGfU
X-Google-Smtp-Source: ABdhPJzTxDMzbVi+0xwmEzR8lYOBJgczo5MbDu5Ifcdk7/gzjbnhYsKoNgqiQ9aaWprfNpNJ/dSBoQ==
X-Received: by 2002:adf:bc07:: with SMTP id s7mr13029096wrg.254.1595343611129; 
 Tue, 21 Jul 2020 08:00:11 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id n5sm3722564wmi.34.2020.07.21.08.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 08:00:10 -0700 (PDT)
Date: Wed, 22 Jul 2020 01:00:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ram Pai
 <linuxram@us.ibm.com>
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
In-Reply-To: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Message-Id: <1595342553.d7hx0ljll3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: sukadev@linux.vnet.ibm.com, aik@ozlabs.ru, bharata@linux.ibm.com,
 sathnaga@linux.vnet.ibm.com, ldufour@linux.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ram Pai's message of July 16, 2020 6:32 pm:
> An instruction accessing a mmio address, generates a HDSI fault.  This fa=
ult is
> appropriately handled by the Hypervisor.  However in the case of secureVM=
s, the
> fault is delivered to the ultravisor.

Why not a ucall if you're paraultravizing it anyway?

>=20
> Unfortunately the Ultravisor has no correct-way to fetch the faulting
> instruction. The PEF architecture does not allow Ultravisor to enable MMU
> translation. Walking the two level page table to read the instruction can=
 race
> with other vcpus modifying the SVM's process scoped page table.
>=20
> This problem can be correctly solved with some help from the kernel.
>=20
> Capture the faulting instruction in SPRG0 register, before executing the
> faulting instruction. This enables the ultravisor to easily procure the
> faulting instruction and emulate it.
>=20
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  arch/powerpc/include/asm/io.h | 85 +++++++++++++++++++++++++++++++++++++=
+-----
>  1 file changed, 75 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.=
h
> index 635969b..7ef663d 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -35,6 +35,7 @@
>  #include <asm/mmu.h>
>  #include <asm/ppc_asm.h>
>  #include <asm/pgtable.h>
> +#include <asm/svm.h>
> =20
>  #define SIO_CONFIG_RA	0x398
>  #define SIO_CONFIG_RD	0x399
> @@ -105,34 +106,98 @@
>  static inline u##size name(const volatile u##size __iomem *addr)	\
>  {									\
>  	u##size ret;							\
> -	__asm__ __volatile__("sync;"#insn" %0,%y1;twi 0,%0,0;isync"	\
> -		: "=3Dr" (ret) : "Z" (*addr) : "memory");			\
> +	if (is_secure_guest()) {					\
> +		__asm__ __volatile__("mfsprg0 %3;"			\
> +				"lnia %2;"				\
> +				"ld %2,12(%2);"				\
> +				"mtsprg0 %2;"				\
> +				"sync;"					\
> +				#insn" %0,%y1;"				\
> +				"twi 0,%0,0;"				\
> +				"isync;"				\
> +				"mtsprg0 %3"				\

We prefer to use mtspr in new code, and the nia offset should be=20
calculated with a label I think "(1f - .)(%2)" should work.

SPRG usage is documented in arch/powerpc/include/asm/reg.h if this=20
goes past RFC stage. Looks like SPRG0 probably could be used for this.

Thanks,
Nick
