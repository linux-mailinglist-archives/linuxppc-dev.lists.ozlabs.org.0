Return-Path: <linuxppc-dev+bounces-3898-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBB9EA6BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 04:37:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6kvY5YPsz2xGF;
	Tue, 10 Dec 2024 14:37:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733801865;
	cv=none; b=NrlMfKYUjP3AnM5tY+bNJoRM5L/ixDRHqEG8Kwk9ZL+ouIIWL7CAsUMZDg6mNwD0IZlMHfWC2v7vYXYkfsrI9aEhn0Sa1zW5XlrQprk8s5unqlPoMkStQg3eel6pyDaq6We+EeX6arQsxrHtKH9utq/9BlwXuWmpj1/f5x64OG4zPOVs8SoN6zVBb+jZtnnFie5wGr0VrroKIhjXuL9ltgCzr7bEyJ/N76kKlZw0XsdXsq0Swnqw9kE3khE1Ah28ZwdtiyGnHnpFHV4b04eQiqrfvWzKmaW64kyNCxxpjja3bLdl7pM2FsMDv67b37hNALlTTfl8KKsFIsSl8uLmSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733801865; c=relaxed/relaxed;
	bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDs0X6UL67hl/Q1T0HhseOYdH2YviqoRlPpkj0fSzJQiXK+RV25au6LzIlWt5LR6dS9d8EkFnpy9xq4Sh3K8TD9SUVSSzWRDUPujywajIUrQpStdUalSOP9jFXzJPODYz+tORFGcjO/bau9PQzDJLBRVsKBXcC2gnKRlpPn2H67ppJ84u+P9Enu9Hc41MgErMMooQzDql9djbeQUeKcAbar0WIaYxgQIuGQl/FTLdSYezjf3O0M/aCqLSHvySMDms3Q7xdxfTTw5aN2XbWeFS8M8X2TKY56I6jfjz2KVOVkMDGPLevsTjWW67QxYNsOkEHo1gUI2vf8s8VAZLYaY6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CHnPI/qO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CHnPI/qO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=shy828301@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6kvW6mNdz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 14:37:43 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so3169113a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Dec 2024 19:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801859; x=1734406659; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=CHnPI/qO6Jjoi7+IHIg0whhr9BohHDUG9rDM43E/jrpub+gqOny7KX3SFSnQp+2OXG
         1QqbOpTlX33FZzxRcy0WQx+4dVn0mMoirwJH8R5mHHs7ORyCBcRrzQJhu0j/BUt/Dwn2
         RNUE+UItpzp0sYTS3QRvgTucRs1ajQRZQa8p1PW1B2P/cILZ6OzZ7zjUeflyPGYwpLRT
         djkT/VkMjwRoF0JMoo7BtObdWhWRYebC9iwlc2ypHfeXsZY7YCIgNbTfBNvdIPfEh4zv
         VWxXdbgpX11MPTetpbRjqqWqNk/ICjdu0jlPGehgiaQRcQd6tQ7WGNj1FvdbBvSeusZE
         G/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801859; x=1734406659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEGiPdcE8U0HMqCc8hcN09nWg4b+RmE8pUeIXB0J+Us=;
        b=vBBQaJY+rh2VZVMT83oSQePQ4vCmeGLXkvDGpvmQGQwOcR4ZL7dUw0/H87+yqhJua8
         y/BS7vZdy/XnRBIE8cD7OVf4Uy1uQpL7aMPxYxtKMUyaZZ9KpggNv58pybwEUa1jfvwS
         ipOpu6qs0ygL60QYaCHCHfk8yPJ3SVr72xl/E+on4drBt1FoeSwTbE1pHsahWXaFx3go
         w5fiUnRzuzEdjS/wJ0LUPhXq+ym4hjIMV30qwIV5dxIbzOIJTpLbVE5rrAP5ztSuMWHI
         mWoyZeQP7DgPIRBPW9BWtbKq0gFB/ja/9HTIfLjWUpJE2ziKIL1uiSMOSjVLWAQHNe0q
         OB7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhDVjqgIqLN/801DHTkVU7koD5F/iW3hxd7Y9sqiYJkUcHmDyF4WoVXZYbQyh4kw53qrgqW20OtBYeZww=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywc9ribVKmXYgpI970Vw82OTK8DrVB2ZZi6iBcwpA9s2hEljniT
	rMrjdKMYtcHJ50cxSM2kzrxrs/PriXjuuzCV8/YqukiitxHMvi8IZYdrK6CX7ioj1TV4fhSJPqO
	QjxMOo44bjUN/ZdduFLs0aogWZPU=
X-Gm-Gg: ASbGnctbex9vYd4xrCALRoW6o/cnTFlaVtAoQzl9B6KdZ8ssAF3lki/mlKMm28JStmt
	6qZCEf6xN19sGxHqIHQ0Y4MLs0jUdHL1Ze/iEiQ==
X-Google-Smtp-Source: AGHT+IElXjz+7x/lQGuFmHk7BJtRPsIF5Xkbrc+PaOE9soOWoyJSq8aIO8IH6O/j+TzaKqiG91uZtuFho2g8MHXawAQ=
X-Received: by 2002:a05:6402:3229:b0:5d0:f6ed:4cd1 with SMTP id
 4fb4d7f45d1cf-5d41e2b4c34mr1849541a12.10.1733801858975; Mon, 09 Dec 2024
 19:37:38 -0800 (PST)
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
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-18-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-18-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:37:27 -0800
Message-ID: <CAHbLzkq2SNaqzx4d981H2QfQvtObS3X0pPL8=oqFsFbMditWPA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 17/17] mm: Respect mmap hint before THP
 alignment if allocation is possible
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
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

On Mon, Dec 9, 2024 at 6:45=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
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
> address and fallback to THP alignment if that fails.

Thanks for taking time to try to fix this.

>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  mm/huge_memory.c | 15 ++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 137abeda8602..f070c89dafc9 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,14 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +

IIUC, arch_mmap_hint() will be called in arch_get_unmapped_area() and
arch_get_unmapped_area_topdown() again. So we will actually look up
maple tree twice. It sounds like the second hint address search is
pointless. You should be able to set addr to 0 before calling
mm_get_unmapped_area_vmflags() in order to skip the second hint
address search.

>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1125,6 @@ static unsigned long __thp_get_unmapped_area(struc=
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
> index 59bf7d127aa1..6bfeec80152a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -807,7 +807,6 @@ __get_unmapped_area(struct file *file, unsigned long =
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

