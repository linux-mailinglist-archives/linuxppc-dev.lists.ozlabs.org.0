Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD07442EADD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 10:02:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVzK12hFcz3cBt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 19:02:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZyQ7hsmu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZyQ7hsmu; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVzJK30D6z305K
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 19:02:08 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id y1so5887486plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LcM+UHlFK6Pfd+gEtHbJF09UeSP+pe47XQ11Z5avvEg=;
 b=ZyQ7hsmusqR3lpIB+4jVL1CZJhbUN3wIXVwfcqZRTh7YjNgeRMolohGOMUDgZa5JFk
 5hu4f8+DyFDYQvHUKeaH4iwxqLbjXa6B5jwA0ZS3Q2cK/rTHNtvPRV7STwIhBJ4q0/dS
 gjTxe5u1++xCa1cryzKvYmDjPaNzP4pUAih2/vPPogCIkQd3KvJlMoEVBZJdkkyxFpK1
 m9nlpZVULb3/vrI/ROKVbpfaBzpfcdMEQZCksz+V4o1oVt/iua2ZAVLU7FbsXVVsCRS4
 wtE8V9dIYvn1mj3SwuRsaw8BSYmZJkXtfz0K4JkS/ZlBu5QRVlMHaHMbH8oAoCBhwJZb
 9fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LcM+UHlFK6Pfd+gEtHbJF09UeSP+pe47XQ11Z5avvEg=;
 b=Ott1h24X68xmI9FIEPTs3WWdc3mqNhitXkjFMjFAr7FacFfbJLphWitcAgCNJbUXZ5
 FILFq0fG3d+k5ynfFBgdIJzsOFXjxKTGCpjc4NEMkTrWfwb86jzFxOIJyrmpPFwp2Nfm
 xWidcE7fjo2g+rne4sVTQmOuFVhpZn7/OklVyPjjpTZbqeIn33hy1kb3skzj46S/n3RS
 UpFgQhliih3gqTyBZ9OfXq40mahnsESRKtIZM4C9EJc/jctxtINDU8RcQdJAp55oQhjh
 G1qDjsA0GlBjjx8g0WT1aqbUAq213g7MBTPltfA6mhwQNUqaeUrzErsDXWQcbgSVmpJ2
 IBuA==
X-Gm-Message-State: AOAM531Z6wXKoEi5KosyYVaNA1XSCf9YssPGaOpwz+1RyFikS8+UgN7z
 EwjU+IKnAQ1UIG09RdYsDsk=
X-Google-Smtp-Source: ABdhPJzj9O7pqlmGSv6dHaxotuTUhJBqQGbDk2OY1xR8CUwFnQB2mcPNJnY0o5eFmCaqPtRJZKn3BQ==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr3158237pjb.164.1634284926242; 
 Fri, 15 Oct 2021 01:02:06 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 m7sm4142769pgn.32.2021.10.15.01.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 01:02:05 -0700 (PDT)
Date: Fri, 15 Oct 2021 18:02:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/13] asm-generic: Use HAVE_FUNCTION_DESCRIPTORS to
 define associated stubs
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Kees Cook <keescook@chromium.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <4fda65cda906e56aa87806b658e0828c64792403.1634190022.git.christophe.leroy@csgroup.eu>
 <1634278340.5yp7xtm7um.astroid@bobo.none>
 <7523a005-ea69-7c4c-64ad-bc2537921975@csgroup.eu>
In-Reply-To: <7523a005-ea69-7c4c-64ad-bc2537921975@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634284464.kd8scm0ckz.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 15, 2021 4:24 pm:
>=20
>=20
> Le 15/10/2021 =C3=A0 08:16, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of October 14, 2021 3:49 pm:
>>> Replace HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR by
>>> HAVE_FUNCTION_DESCRIPTORS and use it instead of
>>> 'dereference_function_descriptor' macro to know
>>> whether an arch has function descriptors.
>>>
>>> To limit churn in one of the following patches, use
>>> an #ifdef/#else construct with empty first part
>>> instead of an #ifndef in asm-generic/sections.h
>>=20
>> Is it worth putting this into Kconfig if you're going to
>> change it? In any case
>=20
> That was what I wanted to do in the begining but how can I do that in=20
> Kconfig ?
>=20
> #ifdef __powerpc64__
> #if defined(_CALL_ELF) && _CALL_ELF =3D=3D 2
> #define PPC64_ELF_ABI_v2
> #else
> #define PPC64_ELF_ABI_v1
> #endif
> #endif /* __powerpc64__ */
>=20
> #ifdef PPC64_ELF_ABI_v1
> #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1

We have ELFv2 ABI / function descriptors iff big-endian so you could=20
just select based on that.

I have a patch that makes the ABI version configurable which cleans
some of this up a bit, but that can be rebased on your series if we
ever merge it. Maybe just add BUILD_BUG_ONs in the above ifdef block
to ensure CONFIG_HAVE_FUNCTION_DESCRIPTORS was set the right way, so
I don't forget.

Thanks,
Nick
