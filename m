Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3AA42EFFA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 13:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW4RH4LJ0z3cBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 22:53:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RnbWBgff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RnbWBgff; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW4Qc4Hvcz3bT7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 22:52:54 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso9136757pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 04:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=JxOm4PejsflLixA5I77T/u/EeNwxcWFLBvedgG7X3g0=;
 b=RnbWBgff8R8VzvKZ7Ek8H2JjAGpnn0fYqUT20UYWFA1Evqdl9wbX2+SrmYs0VyUeof
 My+8NauijiAKQ1ELcOViTyu+YwKGpuVjGnDI/Y+s8zKBoD4CkdLl+3utOKqPrAi2ZvJa
 xco3Sdw7p4I0EprZLeBSKrXfq9dwLjRsRYR9egfDkYeulFpk8Eox9oQj1DskkBEoPdde
 DzFRCrsOV/c4XR1D5jF506cVi3Ja28oWzgZ8FGVSYlbrurACLwhG2aYSmIHMafvGUv1w
 KuiavOiwdgS7s9dl0tePyrXU6nuWqLUPQQGiQ0kpUPmXAeNoCjcP3qLfZBdChw5Qws0Q
 81Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=JxOm4PejsflLixA5I77T/u/EeNwxcWFLBvedgG7X3g0=;
 b=BtQqsAUmv1UHn8vonlEBux9mp29EfikgKI4+JHvkJGbtYfvG9cUaCgC0ku9fkrx9+1
 mxyDZvAWItPTlkfXjuNHRvr1ccEDKKHdCeQj7q8ch7p9alvGsvbkn8OlLTIVM7xvH3ae
 LI+C/Y+w+jRgpW5rtViJnUuoouefk7eklpbT4RU7ots/HjASvWlrpgVZjW79JyDTI6qp
 zGMQhmTJ+g7VzJjb4P5sZYy2vdFCttXnENFvN/yFV+xLRhLJ3BcEEgy5z/oLuDRoXHPO
 DZDfsycb/00xoNRSoVu5kxJMnoLqOF+PsXZ7XqmKp0DXLUKSjGjvJEzt038dfw0E/bgx
 nmiA==
X-Gm-Message-State: AOAM531cHnCHOYmX+1XBZRe5MQbHrp8Voz5kAhv2hN8D98WjNOS5m+t0
 sW6jGNx+myXmNoqNDNTbTbw=
X-Google-Smtp-Source: ABdhPJziSb3RPlkgHBIcLy/GsNYHt7p9eqtN/IAdFB/eXr3Vs5LS6nSBulwrip6mVfmFdqJELfYQfQ==
X-Received: by 2002:a17:902:a40a:b0:13e:6de3:76d2 with SMTP id
 p10-20020a170902a40a00b0013e6de376d2mr10599880plq.71.1634298770474; 
 Fri, 15 Oct 2021 04:52:50 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 d138sm4955442pfd.74.2021.10.15.04.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 04:52:50 -0700 (PDT)
Date: Fri, 15 Oct 2021 21:52:44 +1000
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
 <1634284464.kd8scm0ckz.astroid@bobo.none>
In-Reply-To: <1634284464.kd8scm0ckz.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1634298613.bp91trt1cz.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of October 15, 2021 6:02 pm:
> Excerpts from Christophe Leroy's message of October 15, 2021 4:24 pm:
>>=20
>>=20
>> Le 15/10/2021 =C3=A0 08:16, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Excerpts from Christophe Leroy's message of October 14, 2021 3:49 pm:
>>>> Replace HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR by
>>>> HAVE_FUNCTION_DESCRIPTORS and use it instead of
>>>> 'dereference_function_descriptor' macro to know
>>>> whether an arch has function descriptors.
>>>>
>>>> To limit churn in one of the following patches, use
>>>> an #ifdef/#else construct with empty first part
>>>> instead of an #ifndef in asm-generic/sections.h
>>>=20
>>> Is it worth putting this into Kconfig if you're going to
>>> change it? In any case
>>=20
>> That was what I wanted to do in the begining but how can I do that in=20
>> Kconfig ?
>>=20
>> #ifdef __powerpc64__
>> #if defined(_CALL_ELF) && _CALL_ELF =3D=3D 2
>> #define PPC64_ELF_ABI_v2
>> #else
>> #define PPC64_ELF_ABI_v1
>> #endif
>> #endif /* __powerpc64__ */
>>=20
>> #ifdef PPC64_ELF_ABI_v1
>> #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
>=20
> We have ELFv2 ABI / function descriptors iff big-endian so you could=20
> just select based on that.

Of course that should read ELFv1. To be clearer: BE is ELFv1 ABI and
LE is ELFv2 ABI.

Thanks,
Nick
