Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16C6F8126
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 13:00:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCSQv44Sdz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 21:00:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ui9HE+pl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=glider@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=ui9HE+pl;
	dkim-atps=neutral
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCMQT2lFJz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:15:12 +1000 (AEST)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-44fb639bee3so459602e0c.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683270907; x=1685862907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N202Ijuno3Me5YJcbX3ewbYmNhi4YhDxuel30imfLFU=;
        b=ui9HE+plG5qgwjxWNuLdm9H4SsYL7slc73hg6yxo9gAHavkaxcJb3z67jG8bpI+b5j
         qWPLL14Yp5dVlZkYc9x/Al4w85+ya1TiVO4mErjuFGn6OhFgXGjk69wE3wxNEYp/0p//
         EYNvArp8JT14PtWg1MsfkgaqT97P9xxX7HC3yARHFM4vXA444rurRE7ldw82XLcAbFcW
         kqMnXqQ6bQCwGEAdmArcjoFjCCaiTBLAx4rlqeNN48rVXqfNx1EpJV60uJ+fMvd8UZ6S
         aZ+z8rKB8Qe5Rr019h90HTlwMOCg+2RE17hyTPNQWXkhHDt8KZ7Ozh5fHJBPpLcLcXVv
         kDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683270907; x=1685862907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N202Ijuno3Me5YJcbX3ewbYmNhi4YhDxuel30imfLFU=;
        b=bkb8kkBny+rEkMyR8WhFnsLSceeZK54Qxk6bxatYdDK4lOsY0/WMK4dNM++Z1+RT5N
         5SJrGBb1+gNimR51wndI+dI1j8u4R1tfoosHiZqqpin02ouY8vMBlf4uzKecG8RUS73s
         Uf5X4pj6iUSzylfkdv6Y7nQEoVDBV/krqQ+lBDsPEc8vXBW4S3iSHbvM65QEOxM06KhR
         dBMNTisD6ESypKoDXKeCHBA0wqPj8ZPDHDE+h3D3HKJi/nbCvZKodqbvlYIqUQzakrZ0
         lYEmiuMhp4TPdXpzHCRDAuEG+83mLyZM8PaudopZMmJZAe7vKy9NnUOJOI2NaN8Hvzqr
         IFrg==
X-Gm-Message-State: AC+VfDz3qQryLy8pD9JQLdGKKZndJOo1gilJx2NTtrpHkU9/jDlz2GK9
	ZcRtFq3PEr/o0hvFvlZrSGqNtTx/Jf4/S9Gc5Rxm8A==
X-Google-Smtp-Source: ACHHUZ68ekcoEwkwg7QDBjpoDjZFUlLQ4BVP56EPnRRb/YXb9/U9BEdw5tIh/x3jYpeB03KJ05SbkUWIqztR3rE/znA=
X-Received: by 2002:a1f:bf52:0:b0:44f:fa0d:d346 with SMTP id
 p79-20020a1fbf52000000b0044ffa0dd346mr164456vkf.5.1683270907166; Fri, 05 May
 2023 00:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230505035127.195387-1-mpe@ellerman.id.au>
In-Reply-To: <20230505035127.195387-1-mpe@ellerman.id.au>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 May 2023 09:14:30 +0200
Message-ID: <CAG_fn=WprOA21Ksc0Ty6S3KQ2pqj9vvPmDFOu1uqYW_oHmTBeA@mail.gmail.com>
Subject: Re: [PATCH] mm: kfence: Fix false positives on big endian
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="0000000000007c0d3d05faed0c2c"
X-Mailman-Approved-At: Fri, 05 May 2023 21:00:09 +1000
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
Cc: zhangpeng.00@bytedance.com, elver@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000007c0d3d05faed0c2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 5:51=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:

> Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance of
> __kfence_alloc() and __kfence_free()"), kfence reports failures in
> random places at boot on big endian machines.
>
> The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the
> address of each byte in its value, so it needs to be byte swapped on big
> endian machines.
>
> The compiler is smart enough to do the le64_to_cpu() at compile time, so
> there is no runtime overhead.
>
> Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of
> __kfence_alloc() and __kfence_free()")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
Reviewed-by: Alexander Potapenko <glider@google.com>

--0000000000007c0d3d05faed0c2c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 5, 2023 at 5:51=E2=80=AFA=
M Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.i=
d.au</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Since commit 1ba3cbf3ec3b (&quot;mm: kfence: improve the performance of=
<br>
__kfence_alloc() and __kfence_free()&quot;), kfence reports failures in<br>
random places at boot on big endian machines.<br>
<br>
The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the<br>
address of each byte in its value, so it needs to be byte swapped on big<br=
>
endian machines.<br>
<br>
The compiler is smart enough to do the le64_to_cpu() at compile time, so<br=
>
there is no runtime overhead.<br>
<br>
Fixes: 1ba3cbf3ec3b (&quot;mm: kfence: improve the performance of __kfence_=
alloc() and __kfence_free()&quot;)<br>
Signed-off-by: Michael Ellerman &lt;<a href=3D"mailto:mpe@ellerman.id.au" t=
arget=3D"_blank">mpe@ellerman.id.au</a>&gt;<br></blockquote><div>Reviewed-b=
y: Alexander Potapenko &lt;<a href=3D"mailto:glider@google.com">glider@goog=
le.com</a>&gt;</div></div></div>

--0000000000007c0d3d05faed0c2c--
