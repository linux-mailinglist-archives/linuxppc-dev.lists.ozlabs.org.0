Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 384FB43131E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 11:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXrqZ4p7Bz3c5G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 20:17:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SIY6SmxS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SIY6SmxS; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXrpr4QBrz2y6B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 20:16:35 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id gn3so6240233pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 02:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=bk4CmdQz8HPJtWkdQrroAn/KfmHvlYv0QT69F5KgUYY=;
 b=SIY6SmxSooe6c5+WSnMw0wpVs8QY7NiY+XZuBJ+D71+hWvHEdC2Vbwe6t160uJL/aH
 SxAjedhuo7/GPRc5DJ/SEAzpZfnAKWBOZFVYti9AdvfYsJcQ4rL3+DM2dFweZBuHNa2+
 +plqntehvZ9SJWnhWeMNJxgbPzWwOsSXBy+aWPK6JCymQrSbx9dlArY4Er+FBijnqB2+
 KaAdeks2O345KWfd39ueUFOjpMJSBOKHlggozA8hAbjjoen/SEHYJ6ZGB4a5AA4ymoTX
 S+O+sY98XhFR6qaduHBAgc9j1zJ+556dXM7nA9EQbpd+M4xKLyV6Ni7/OoKNvSsZa2tY
 Ga4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bk4CmdQz8HPJtWkdQrroAn/KfmHvlYv0QT69F5KgUYY=;
 b=zm+zOqmH5HjiX+X0WZfvhs4mzIYPrPTkPQHqnDPJPl5tVr+0l9T2AiT8VhIkUg8vs1
 LqaJoTzaoL94Wr22ffFeSmSUlbOXLhl7w66ncn1Vf61jV1O5munEdc/6r8q+5LbpR+/X
 ZyI0nryyMaLcsp5vQE3LzEpY1xI/zQpLuuYCE40Q9yGjuTPEoZ/frAXIUaarNEVcq43Z
 0ur+Jf7fXrKO7T15/Kj/ZRSFmpPfXpMBTeoLYj/p2t9+aCnPxzuO/3RxlqNA3MElAdLU
 sv8UILxmMpFmmPBn3HuTfqVp+kYJwvusj/Vt/eu5AMu+nL8PLd5iYngaW9iZaPI/XtTW
 d5Kw==
X-Gm-Message-State: AOAM532dHfsGl8kbUCr6JlsS43ZziYb5BONzjbGBB4MbfLI9mIwslBbI
 OxkR75MepP0ITtgTtqeuCJQ=
X-Google-Smtp-Source: ABdhPJzhlLMrCQ4LZ3XWVQonDSXYo92dxUzu1RcvXP5BET6OhlsHPRAv2Q264erQZkrgYN002t+nDA==
X-Received: by 2002:a17:90a:2c02:: with SMTP id
 m2mr17579869pjd.109.1634548591342; 
 Mon, 18 Oct 2021 02:16:31 -0700 (PDT)
Received: from localhost ([58.171.214.181])
 by smtp.gmail.com with ESMTPSA id rj2sm13068038pjb.32.2021.10.18.02.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:16:31 -0700 (PDT)
Date: Mon, 18 Oct 2021 19:16:25 +1000
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
 <1634538449.eah9b31bbz.astroid@bobo.none>
 <802b3ff9-8ada-b45b-2b69-b6a23f0c3664@csgroup.eu>
In-Reply-To: <802b3ff9-8ada-b45b-2b69-b6a23f0c3664@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634546857.xamu59z8sr.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 18, 2021 5:07 pm:
>=20
>=20
> Le 18/10/2021 =C3=A0 08:29, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of October 17, 2021 10:38 pm:
>>> We have three architectures using function descriptors, each with its
>>> own type and name.
>>>
>>> Add a common typedef that can be used in generic code.
>>>
>>> Also add a stub typedef for architecture without function descriptors,
>>> to avoid a forest of #ifdefs.
>>>
>>> It replaces the similar 'func_desc_t' previously defined in
>>> arch/powerpc/kernel/module_64.c
>>>
>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>=20
>> [...]
>>=20
>>> diff --git a/include/asm-generic/sections.h b/include/asm-generic/secti=
ons.h
>>> index a918388d9bf6..33b51efe3a24 100644
>>> --- a/include/asm-generic/sections.h
>>> +++ b/include/asm-generic/sections.h
>>> @@ -63,6 +63,9 @@ extern __visible const void __nosave_begin, __nosave_=
end;
>>>   #else
>>>   #define dereference_function_descriptor(p) ((void *)(p))
>>>   #define dereference_kernel_function_descriptor(p) ((void *)(p))
>>> +typedef struct {
>>> +	unsigned long addr;
>>> +} func_desc_t;
>>>   #endif
>>>  =20
>>=20
>> I think that deserves a comment. If it's just to allow ifdef to be
>> avoided, I guess that's okay with a comment. Would be nice if you could
>> cause it to generate a link time error if it was ever used like
>> undefined functions, but I guess you can't. It's not a necessity though.
>>=20
>=20
> I tried to explain it in the commit message, but I can add a comment=20
> here in addition for sure.

Thanks.

>=20
> By the way, it IS used in powerpc's module_64.c:

Ah yes of course. I guess the point is function descriptors don't exist=20
so it should not be used (in general). powerpc module code knows what it
is doing, I guess it's okay for it to use it.

Thanks,
Nick
