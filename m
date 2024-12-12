Return-Path: <linuxppc-dev+bounces-4059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD359EFD0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2024 21:12:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8Nt062WZz30YT;
	Fri, 13 Dec 2024 07:12:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734034328;
	cv=none; b=aDB+E+MlhkQzgkGLxoyt9wpkioKZTOCP+28mjZcbmxn5hy25po71P/LYG8QhYtMP+HT3sFlP17X8fvWn0+G4igFTUthfvLHaWwsACIvn+joU/md/3fcUOrf8ECFNOuTJHEqD+43QJtl1OsvaHB1KBv6NW2/20oYimrsyWJWY6aXtwakBnuyXgjW15lxdtTdLDrSfUaVTTV+sCKhvED0UjdFeZVIydGCi57OztNxavWYSxvNgwOQtUEoBzD+gfC6gaY3aprhH9gVd8naYKnay3V3mXkL1So4vjGdg2+M2diXc7k+BNKNMXCd6903wslPA9vDyy7sOock0yKXUgAV13w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734034328; c=relaxed/relaxed;
	bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D714qZ816Je17GnBpNBnxbirh5nk2hyBsni++06NcLw3vXdz3+1N65vbuAwO7f8al9Zle/HCoSifLRPI+l09kOFoJBIiwcl6FM1WHGCJFpc7rT4ZYnJDZ9hO6lLzU9MLWNUIPZ2aiLL6hFRB/qpJQo1SVgCUH//kGtbDRnPYXib2OHkj2rqDKkgP9EOoabnwfyTimoJYP4A+ZjNPl3aGm+OM2CcMceq1Gwqrg5Aop5kyr3Z8PHRKxYJYjxbeGuI+YBBDL8zfHnN6ALTTK614s/Q+6z+0B5IGEVGtxRxPFGTGXEoHP989GA35nwIqs5ZeiCdx4k4GbTyA/zXVlN3WIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OpT2GM5E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OpT2GM5E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8Nsz3lkhz30ML
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 07:12:07 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso87784166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 12:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034324; x=1734639124; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=OpT2GM5ELQxAGw3kkKQzDF6ky6iSYotJSIZ9caT95S8UyOHikGP909GnP6cxu2m3Jq
         BxJ6GY8be6Hwmn2HHvgAgTxMkplCumUh1FUnkKQes7gkBqXpE4/iK7XgZGDbnFeZ/Rtu
         W9m0OvUcl1x1xrc73KSLaP2sWKnQePc4KAcRPPPCaipOQJYNfqlmDW4sjN3Dr3XtfTPl
         287c9mh+L1qBVpMPhB3jCI9UHtgkXUcyzy2fJIRNlkBXFA+XiZWvqyKvHbdU9kglhVtI
         /AlQO6fD+WUEUHBFFF8coeEEK2nV0NF/bDUUmGVNKXWIvIpyXbi+1KuF2zUOhyUJxqat
         W5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034324; x=1734639124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=vWxIG5fbdhhPlNvQfrYMrFtksGVHGehno0LlUYljpyjPw89TMABeCjwpqEh7TK5Ck+
         +O2NW5TmHSK2fv/Il+TGoBAJYJNX2xI19mHxbxnIV97x1VhtVkDku8Y2JJDJgDjMTDav
         I2viwogzDIDXP4umo/W7Q7wATI6aixl+5FsPfNUkWIvwpy/ty60F60f3bLcCP8BuJ7r3
         mebjvaCJHIg73SKkyzimwTY46s1StMJ8h1seeiLzmmMhpCRdk/7eh4lsjtMfnvv6fYts
         z+OAWpVrUQ6L3iCcDrgUrNbTvhG3Pn63vVsGP0uRblxpkHoMyTGD3rJp1EiZAX2X67YA
         oHng==
X-Forwarded-Encrypted: i=1; AJvYcCVa+CvZdkCde+MiGiX0DoJ69yjIr/Sk1j/FavQtOCMAPR8IU8HWdiCW3fwClHQiyv1gC5jj2CznE0wp4dE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzVXqO8FZEevxe16GBrR8s/7NzQsojTNq1rbkqXCYaV7j5L6ZjD
	YGomzS9E+lFDIN54eqfBHFWmaCB003Tm9+KMMIPvAjTsM6mYb5Exz6yRhK8NK3Dt1TfYjgMpN2D
	vR3574fmPJTc+qfuUr7DXilyR72E=
X-Gm-Gg: ASbGncsei8wyxhc1JXkFd2xI6AAGsCUiT+qrK+YJlr6fJ3o+aBKwjZY5wpZGVZDnaeP
	ZWd+Pb9dd5V+4E4Rx/pAGJ+7iMVgDbmEc/1WZyILx
X-Google-Smtp-Source: AGHT+IF7qx5Z1/fQb+D9Nv/8CkFXoKyEEzLktdUfd+sTUwFi+n5jfhaKRcSctFjQDfGrQzxwJV8DWyyLGWYjEOqOZ4M=
X-Received: by 2002:a17:906:7304:b0:aa6:94c0:f755 with SMTP id
 a640c23a62f3a-aab778c1eaemr4266066b.1.1734034323514; Thu, 12 Dec 2024
 12:12:03 -0800 (PST)
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
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-17-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-17-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:11:51 -0800
Message-ID: <CAHbLzko2Z0-QReXo54H=sd1asXsPKEHf9N4Nmv0=Ry7SM=XX+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com, 
	linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 11, 2024 at 3:31=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP=
")
> fallsback to PAGE_SIZE alignment instead of THP alignment
> for anonymous mapping as long as a hint address is provided by the user
> -- even if we weren't able to allocate the unmapped area at the hint
> address in the end.
>
> This was done to address the immediate regression in anonymous mappings
> where the hint address were being ignored in some cases; due to commit
> efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
>
> It was later pointed out that this issue also existed for file-backed
> mappings from file systems that use thp_get_unmapped_area() for their
> .get_unmapped_area() file operation.
>
> The same fix was not applied for file-backed mappings since it would
> mean any mmap requests that provide a hint address would be only
> PAGE_SIZE-aligned regardless of whether allocation was successful at
> the hint address or not.
>
> Instead, use arch_mmap_hint() to first attempt allocation at the hint
> address and fallback to THP alignment if there isn't sufficient VA space
> to satisfy the allocation at the hint address.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Yang Shi <shy828301@gmail.com>

> ---
>  mm/huge_memory.c | 17 ++++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2da5520bfe24..426761a30aff 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,16 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary;
> +        *
> +        * Or if an the requested extent is invalid return the error imme=
diately.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +
>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1127,6 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         if (IS_ERR_VALUE(ret))
>                 return 0;
>
> -       /*
> -        * Do not try to align to THP boundary if allocation at the addre=
ss
> -        * hint succeeds.
> -        */
> -       if (ret =3D=3D addr)
> -               return addr;
> -
>         off_sub =3D (off - ret) & (size - 1);
>
>         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 76dd6acdf051..3286fdff26f2 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -814,7 +814,6 @@ __get_unmapped_area(struct file *file, unsigned long =
addr, unsigned long len,
>         if (get_area) {
>                 addr =3D get_area(file, addr, len, pgoff, flags);
>         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -                  && !addr /* no hint */
>                    && IS_ALIGNED(len, PMD_SIZE)) {
>                 /* Ensures that larger anonymous mappings are THP aligned=
. */
>                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> --
> 2.47.0.338.g60cca15819-goog
>
>

