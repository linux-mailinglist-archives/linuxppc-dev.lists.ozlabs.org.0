Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B413431094
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 08:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXn7P2xhnz308h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 17:30:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EaHY4+nx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EaHY4+nx; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXn6l53Dtz2xX5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 17:30:07 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id c4so8006117pgv.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=SrZhhuie2LYb+DH8DnKTrW/zbTOuYNfpSWs+Jg+B7ZI=;
 b=EaHY4+nxzBbXnw4re2cGF5gs8wOdjWhvwRQb3eDdLNljCkNp8D3Cdglit6b/DEdvI2
 ey56INCUK8p9wnePBtmhufxokbGfkq/bNQtz2eGE9C1+N1+IZcLiivrjaHi+fbFyw9Sm
 CIG7/CN1JQ+NPRu8XrkCHXO75w/J8IzbZLZsXNgIgGrssc22eKmoEH650zN1aNt6fb/E
 RQyug5mhR8JxjCa8hxG/oKYeTCXUcl0CnsOg/Ox97LP7sL0xsADVjLigIWesCf7KolDZ
 X9a2zF1I9AHYK6mcfZmGIOyZknnbra8wW42jtGvX7ZmhL6HnsRn8jCA4kg5Bq6CKLMz9
 Bq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=SrZhhuie2LYb+DH8DnKTrW/zbTOuYNfpSWs+Jg+B7ZI=;
 b=Z7Bsloalz97vkGTMdsygiZB0C8yLg/1NVgtYPFSbd5ymPIWnSPBxONeLQcD687JM5p
 shEugBKzDH3nx0EYShulrAov4wLu6QgyFnsu1NaxR8t/vpHtSOSHOa+iX92D7sNJhOSh
 u9RzvAtLWb5Iac1lnGdbnWpKyOvw0RTyffTvSGdMyat4DmPV30V7XzG7LCS4AwA7ip22
 BbRiTI8I63M4JZHmZhfW7Fj0Njt+rbR8J+P4Pikq73O3YQymwXPh/0vlJxipmnByFyop
 j5xmD2spWlG2ONnmT66b94FTh7AxyNlw4zwXjpWX27DkwKsjmQSxu6rbKM4w/wlynfF+
 teLQ==
X-Gm-Message-State: AOAM5307y4SS/1oc3OslYW+gpOy83wp/KoX/bG0VGA8zSLrUHAFSEpCf
 16D5289PVBmmS/Q9dVqObS39MwPjP4XncA==
X-Google-Smtp-Source: ABdhPJzH86hY+t32jbrJWE1dxVltQNRhTT8NQFAijIbO8sR0zCmyZjDW9Fs93D5vJD/a+7+qImFigg==
X-Received: by 2002:aa7:86d9:0:b0:44d:a354:b803 with SMTP id
 h25-20020aa786d9000000b0044da354b803mr15773350pfo.21.1634538604529; 
 Sun, 17 Oct 2021 23:30:04 -0700 (PDT)
Received: from localhost ([1.128.244.1])
 by smtp.gmail.com with ESMTPSA id a12sm18027761pjq.16.2021.10.17.23.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 23:30:04 -0700 (PDT)
Date: Mon, 18 Oct 2021 16:29:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 07/12] asm-generic: Define 'func_desc_t' to commonly
 describe function descriptors
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <a33107c5b82580862510cc20af0d61e33a2b841d.1634457599.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a33107c5b82580862510cc20af0d61e33a2b841d.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634538449.eah9b31bbz.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 17, 2021 10:38 pm:
> We have three architectures using function descriptors, each with its
> own type and name.
>=20
> Add a common typedef that can be used in generic code.
>=20
> Also add a stub typedef for architecture without function descriptors,
> to avoid a forest of #ifdefs.
>=20
> It replaces the similar 'func_desc_t' previously defined in
> arch/powerpc/kernel/module_64.c
>=20
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

[...]

> diff --git a/include/asm-generic/sections.h b/include/asm-generic/section=
s.h
> index a918388d9bf6..33b51efe3a24 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -63,6 +63,9 @@ extern __visible const void __nosave_begin, __nosave_en=
d;
>  #else
>  #define dereference_function_descriptor(p) ((void *)(p))
>  #define dereference_kernel_function_descriptor(p) ((void *)(p))
> +typedef struct {
> +	unsigned long addr;
> +} func_desc_t;
>  #endif
> =20

I think that deserves a comment. If it's just to allow ifdef to be=20
avoided, I guess that's okay with a comment. Would be nice if you could=20
cause it to generate a link time error if it was ever used like
undefined functions, but I guess you can't. It's not a necessity though.

Thanks,
Nick
