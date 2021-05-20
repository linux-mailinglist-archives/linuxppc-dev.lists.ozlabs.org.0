Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740EB389C46
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 06:03:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flx1M2KTpz30D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:03:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SWR10IV7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b;
 helo=mail-yb1-xb2b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SWR10IV7; dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flx0s37hPz2yY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 14:03:07 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id i4so21006928ybe.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 21:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X5y5nMZWErHRKQPjFkRsOrj/NAiYS3rp9VjOIioRXgE=;
 b=SWR10IV7AAK2of7orQpXdkLTogAmDMFTiOCAEjc+vijxey3FREv3Md2s1VieLaHa/e
 HrShO3rsGoQnxpcPp3QBnMg7lAMRF3rrHhv4wvCWsFby85sDZWBB9JqMn5UBkZbi5U7S
 zI8cTfV3922+KpGsPshKu7UCFo1v7Rl6RyzIs2MGVmVYNFowAEOq1OvGN6UJQoS5Y4kb
 7P5cW8FEDPTIklJvX9MxQxv9OuUS+uwSbS+oq72q80aBUSAiB2tJqiELYiiLpLEYHrzR
 +uxaeB1kPc90Qj3hvVGbDcn6YIDSXefo9x2nk0idsBJ82WDT8MPSKetH4W7WKHmpPlxz
 7LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X5y5nMZWErHRKQPjFkRsOrj/NAiYS3rp9VjOIioRXgE=;
 b=hOdrlW76JuTd7Su4ZUp57pxQvjY05uVg415LtLH9PozINYemHQwmwrwOiu24OSsll5
 Fu+HUjiFyL3ehMeLxxjRDVweITMyHeXskTDwnS7P7v7ATj1SH2BiJfMb1sU5oBpN8Sri
 fm9hte7RNEOEgs9GUxem0wCBvbNq/Wg83cPc++OEE1u/mlksbtciKnqql8KcFdHX4eqT
 Jyc8iTXLwEywonn7TEhq2iNKV0m/Wq5/DAigTnwukHofSrviuRAcID9Up3cLP6V9JPh/
 fdvra9Apu9HLgJZQ+DW2heh38N3rQb6jnOsyhhvUK2C36Uj5Q/TlrX9KQESOmvQU8AI5
 wPpg==
X-Gm-Message-State: AOAM531PBCMyXyVHSBH0GTra4eCK2gGwJ+CRWUmj7h6Y1HzGOIUf84Fa
 Yh30KKI72EfyeGZD7u0avlJ1LRU//Wyn03XbBn0=
X-Google-Smtp-Source: ABdhPJzwNCXZQTg981xHKwPJ1W0m02Xe0b4RO7AJuR9tHAHZhVw8rMVAyK7njKja95jl5sk2BnxTvDwibEbqDr7JpgE=
X-Received: by 2002:a25:8286:: with SMTP id r6mr4302190ybk.265.1621483385888; 
 Wed, 19 May 2021 21:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210517032810.129949-1-jniethe5@gmail.com>
 <20210517032810.129949-7-jniethe5@gmail.com>
 <8bdb3842-5f1c-173f-df6c-3f4245aabea6@csgroup.eu>
In-Reply-To: <8bdb3842-5f1c-173f-df6c-3f4245aabea6@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 20 May 2021 14:02:54 +1000
Message-ID: <CACzsE9oRfm3ALx5uHwpTzz7=KQjkBcaXOMZQu+krejfOxBZ1Xw@mail.gmail.com>
Subject: Re: [PATCH v14 6/9] powerpc/bpf: Write protect JIT code
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 17, 2021 at 4:40 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 17/05/2021 =C3=A0 05:28, Jordan Niethe a =C3=A9crit :
> > Add the necessary call to bpf_jit_binary_lock_ro() to remove write and
> > add exec permissions to the JIT image after it has finished being
> > written.
> >
> > Without CONFIG_STRICT_MODULE_RWX the image will be writable and
> > executable until the call to bpf_jit_binary_lock_ro().
>
> And _with_ CONFIG_STRICT_MODULE_RWX what will happen ? It will be _writab=
le_ but not _executable_ ?
That's right.
With CONFIG_STRICT_MODULE_RWX the image will initially be PAGE_KERNEL
from bpf_jit_alloc_exec() calling module_alloc(). So not executable.
bpf_jit_binary_lock_ro() will then remove write and add executable.

Without CONFIG_STRICT_MODULE_RWX the image will initially be
PAGE_KERNEL_EXEC from module_alloc().
bpf_jit_binary_lock_ro() will remove write, but until that point it
will have been write + exec.
>
> >
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v10: New to series
> > v11: Remove CONFIG_STRICT_MODULE_RWX conditional
> > ---
> >   arch/powerpc/net/bpf_jit_comp.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit=
_comp.c
> > index 6c8c268e4fe8..53aefee3fe70 100644
> > --- a/arch/powerpc/net/bpf_jit_comp.c
> > +++ b/arch/powerpc/net/bpf_jit_comp.c
> > @@ -237,6 +237,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_pro=
g *fp)
> >       fp->jited_len =3D alloclen;
> >
> >       bpf_flush_icache(bpf_hdr, (u8 *)bpf_hdr + (bpf_hdr->pages * PAGE_=
SIZE));
> > +     bpf_jit_binary_lock_ro(bpf_hdr);
> >       if (!fp->is_func || extra_pass) {
> >               bpf_prog_fill_jited_linfo(fp, addrs);
> >   out_addrs:
> >
