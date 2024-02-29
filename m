Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC386BF9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:50:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bRY780YW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlch91cf3z3vXZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bRY780YW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlcgP0z2wz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:50:08 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc1e7c0e29so4487325ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709178605; x=1709783405; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkGL4ihV2OtiC1xVy3oIJJV1camQdA/fDE7d+XmMCGE=;
        b=bRY780YWC+9n0KHWxvsY39zcbM0ZNhw16kCNkqh5HHI5acl11iU4tPkmlW+EbvQizu
         2OdW9X8SdciMuAucdGdH812eIp2xJyVs0ztNBz554IZrsf2O2AK1VqYgb4C4/Gi1u8HP
         ZV9MNAQNs3P58ljt7pncvUFDCrk39PKF9r8588n7Fbrm3zEsbCqRfnIr0YEWUgWyAE7L
         NtkouYvcS95H0jadOIOZJekXdaQ+R5+IZxCjEMY83V3ptrQZ2kRgl6tWr20dsAgjZA1c
         VaMuIxAS/M0LZPu8HO5g5187nH2AmA9hgYIU1xApNMLT7St5zcjUzTBe8MIB0JQTEjQ2
         QMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709178605; x=1709783405;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wkGL4ihV2OtiC1xVy3oIJJV1camQdA/fDE7d+XmMCGE=;
        b=EV0bPqpakL3w6WkrVU6vWzmUXX9TeaZNgINsn29WeMHuvu4F5TG8RT9Emoi4FCSgXm
         ow2tffkT4vuhsM35STvlHpu4sAE4QqGanRE+nBP6qh7ioPPRooWr+UsdYtE1lLBjKRdg
         NfgcYo+wn8wojXTlR1qxtKcEdGYRmrrjNpFjtfGa4cE70eEkDwRHdNlcmuf0r8fbJrfn
         qJ533xWvqk7OcORIknSfeAxrAXL5oIQbBR4kvNk1khI4EWWWndYbO5TGwi4FcXXJr045
         b0aSnhZ5qCmOqPtqzXtF2Nv5eQSvnK0Hl8F3sFBbtVSFZA9JeYSDYKfq/SydJkUkhpXa
         QR/A==
X-Forwarded-Encrypted: i=1; AJvYcCXhRZWezGIxRFrJ3TuMJAW25ZJZqAS+1c5pk4pby2T2sun3BtOFsE3JYTC71UOghpvHygiOoIYClaVO0uBSzmNq3IoAYdcPRDT12U0FoQ==
X-Gm-Message-State: AOJu0Yxc+WKRnW+kNxGdcqr9boBKL0cKqiz/douVNG4RPWgpWoYZ7lch
	6IT/MiNAJUn+8HstGOGZ7rTVfFrw+r49L4DZG52dEYRkWTmeU33x
X-Google-Smtp-Source: AGHT+IEFuQfnfOdxrtG5oSxHaCUMHqvsrtVGazOAp72epa+sxEp407xvB6/65mkpoFr1O5KeWHfjhg==
X-Received: by 2002:a17:902:ed41:b0:1dc:297d:b621 with SMTP id y1-20020a170902ed4100b001dc297db621mr961057plb.16.1709178605410;
        Wed, 28 Feb 2024 19:50:05 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902da9200b001d9773a1993sm229042plx.213.2024.02.28.19.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 19:50:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 13:49:58 +1000
Message-Id: <CZH98WKJY6NT.5D53XGR31X22@wheely>
Subject: Re: [kvm-unit-tests PATCH 04/13] treewide: lib/stack: Make
 base_address arch specific
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>
X-Mailer: aerc 0.15.2
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-19-andrew.jones@linux.dev>
In-Reply-To: <20240228150416.248948-19-andrew.jones@linux.dev>
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, kvmarm@lists.linux.dev, pbonzini@redhat.com, imbrenda@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
> Calculating the offset of an address is image specific, which is
> architecture specific. Until now, all architectures and architecture
> configurations which select CONFIG_RELOC were able to subtract
> _etext, but the EFI configuration of riscv cannot (it must subtract
> ImageBase). Make this function architecture specific, since the
> architecture's image layout already is.

arch_base_address()?

How about a default implementation unlesss HAVE_ARCH_BASE_ADDRESS?

Thanks,
Nick

>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  lib/arm64/stack.c | 17 +++++++++++++++++
>  lib/riscv/stack.c | 18 ++++++++++++++++++
>  lib/stack.c       | 19 ++-----------------
>  lib/stack.h       |  2 ++
>  lib/x86/stack.c   | 17 +++++++++++++++++
>  5 files changed, 56 insertions(+), 17 deletions(-)
>
> diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
> index f5eb57fd8892..3369031a74f7 100644
> --- a/lib/arm64/stack.c
> +++ b/lib/arm64/stack.c
> @@ -6,6 +6,23 @@
>  #include <stdbool.h>
>  #include <stack.h>
> =20
> +#ifdef CONFIG_RELOC
> +extern char _text, _etext;
> +
> +bool base_address(const void *rebased_addr, unsigned long *addr)
> +{
> +	unsigned long ra =3D (unsigned long)rebased_addr;
> +	unsigned long start =3D (unsigned long)&_text;
> +	unsigned long end =3D (unsigned long)&_etext;
> +
> +	if (ra < start || ra >=3D end)
> +		return false;
> +
> +	*addr =3D ra - start;
> +	return true;
> +}
> +#endif
> +
>  extern char vector_stub_start, vector_stub_end;
> =20
>  int arch_backtrace_frame(const void *frame, const void **return_addrs,
> diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
> index d865594b9671..a143c22a570a 100644
> --- a/lib/riscv/stack.c
> +++ b/lib/riscv/stack.c
> @@ -2,6 +2,24 @@
>  #include <libcflat.h>
>  #include <stack.h>
> =20
> +#ifdef CONFIG_RELOC
> +extern char ImageBase, _text, _etext;
> +
> +bool base_address(const void *rebased_addr, unsigned long *addr)
> +{
> +	unsigned long ra =3D (unsigned long)rebased_addr;
> +	unsigned long base =3D (unsigned long)&ImageBase;
> +	unsigned long start =3D (unsigned long)&_text;
> +	unsigned long end =3D (unsigned long)&_etext;
> +
> +	if (ra < start || ra >=3D end)
> +		return false;
> +
> +	*addr =3D ra - base;
> +	return true;
> +}
> +#endif
> +
>  int arch_backtrace_frame(const void *frame, const void **return_addrs,
>  			 int max_depth, bool current_frame)
>  {
> diff --git a/lib/stack.c b/lib/stack.c
> index dd6bfa8dac6e..e5099e207388 100644
> --- a/lib/stack.c
> +++ b/lib/stack.c
> @@ -11,23 +11,8 @@
> =20
>  #define MAX_DEPTH 20
> =20
> -#ifdef CONFIG_RELOC
> -extern char _text, _etext;
> -
> -static bool base_address(const void *rebased_addr, unsigned long *addr)
> -{
> -	unsigned long ra =3D (unsigned long)rebased_addr;
> -	unsigned long start =3D (unsigned long)&_text;
> -	unsigned long end =3D (unsigned long)&_etext;
> -
> -	if (ra < start || ra >=3D end)
> -		return false;
> -
> -	*addr =3D ra - start;
> -	return true;
> -}
> -#else
> -static bool base_address(const void *rebased_addr, unsigned long *addr)
> +#ifndef CONFIG_RELOC
> +bool base_address(const void *rebased_addr, unsigned long *addr)
>  {
>  	*addr =3D (unsigned long)rebased_addr;
>  	return true;
> diff --git a/lib/stack.h b/lib/stack.h
> index 6edc84344b51..f8def4ad4d49 100644
> --- a/lib/stack.h
> +++ b/lib/stack.h
> @@ -10,6 +10,8 @@
>  #include <libcflat.h>
>  #include <asm/stack.h>
> =20
> +bool base_address(const void *rebased_addr, unsigned long *addr);
> +
>  #ifdef HAVE_ARCH_BACKTRACE_FRAME
>  extern int arch_backtrace_frame(const void *frame, const void **return_a=
ddrs,
>  				int max_depth, bool current_frame);
> diff --git a/lib/x86/stack.c b/lib/x86/stack.c
> index 58ab6c4b293a..7ba73becbd69 100644
> --- a/lib/x86/stack.c
> +++ b/lib/x86/stack.c
> @@ -1,6 +1,23 @@
>  #include <libcflat.h>
>  #include <stack.h>
> =20
> +#ifdef CONFIG_RELOC
> +extern char _text, _etext;
> +
> +bool base_address(const void *rebased_addr, unsigned long *addr)
> +{
> +	unsigned long ra =3D (unsigned long)rebased_addr;
> +	unsigned long start =3D (unsigned long)&_text;
> +	unsigned long end =3D (unsigned long)&_etext;
> +
> +	if (ra < start || ra >=3D end)
> +		return false;
> +
> +	*addr =3D ra - start;
> +	return true;
> +}
> +#endif
> +
>  int arch_backtrace_frame(const void *frame, const void **return_addrs,
>  			 int max_depth, bool current_frame)
>  {

