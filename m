Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC3612653
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 00:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FHC4gtkz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 09:59:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PlAf8nRW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PlAf8nRW;
	dkim-atps=neutral
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzQzs1SX3z2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:13:43 +1100 (AEDT)
Received: by mail-vk1-xa2a.google.com with SMTP id f68so2588607vkc.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKCH5rHwhLvmhcc4ioAH94OT26KUWrAa0eYV8ovw8iI=;
        b=PlAf8nRWcV62vxam17acZLUisAZSkcz3NtgdT8N6ODK2aQ66VaCnXQWamCgfngeEr8
         y8I9yAuzs+mMi9jKZ32iz7XP83EhETabvU0rdvCNxNtSOa6bTmlelysbYCuannQ2EOtq
         aGnfPR1MxVDopOfF1F5jKqO4a3dHhaFPZvWtPTIECZtKTUomDZP6UHi6LmhF7yodt3PL
         wOQ/RA1eKxlbzdaVD86aHd5Mp1nfyouIIZtozsYyYB/6ek3a7tLhDrUWNmJ1zwI3usmp
         +3m8SGGHJnhuYC8YGKaBM5xNTdyqzecV4+mgdlPdHZhCHmpnv2ttQZq3IF5VwXWOmmrh
         KlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKCH5rHwhLvmhcc4ioAH94OT26KUWrAa0eYV8ovw8iI=;
        b=Gn3GsvL4U03mj1e9V71yBrhFM7dzdwdOzC8IDtg4KW6FA34YVYvv9ABpXoeLPC3OV8
         MQrcvCs2e9YaPnDkn1ZH2P992zBPB01X7NIubQXlbIE8FFLztm/5hakgOv9aZH7UuWMJ
         DEaxFn0GtF/KGdpKWs9jDqQDwDaqRXhAv4Iq01d4ZfzTtZgYWNbBoZExFg+FUW8Gx6f+
         xZtQPSnP+2gEKmqUR9/UbAq8xYDyahk5DAchPKIZRM0P9ecmkSGnPB2L+Cp4uTnhXfIT
         3zHItY5/DdrC0Bi6xXUtGHrklplA4jdnGSKN07fS02MbTKl1/csPH43+zp4o597YEBKZ
         9UiA==
X-Gm-Message-State: ACrzQf1iCbFnRTFGsV4/Q7ILGEA9NtJEXaLwhhixTQf4nlLlINsMBt6L
	eG8G9dcZ0k3LiwKbchMbaZ5cdmG2EekvXyYKTWM=
X-Google-Smtp-Source: AMsMyM5fMD47AwXdAGZJkp9B9Oi7IArr3hCpb/0IcUoq2JbMjotYiQc5ku/yJ7p1imIS/+yBcPCbJ8RdJkA91IwUrXg=
X-Received: by 2002:a1f:4315:0:b0:3b4:5f59:7408 with SMTP id
 q21-20020a1f4315000000b003b45f597408mr19151364vka.16.1666970019339; Fri, 28
 Oct 2022 08:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221014155845.1986223-1-ajones@ventanamicro.com>
 <20221014155845.1986223-3-ajones@ventanamicro.com> <20221028074828.b66uuqqfbrnjdtab@kamzik>
 <Y1vrMMtRwb0Lekl0@yury-laptop> <Y1vvMlwf/4EA/8WW@zn.tnic>
In-Reply-To: <Y1vvMlwf/4EA/8WW@zn.tnic>
From: Yury Norov <yury.norov@gmail.com>
Date: Fri, 28 Oct 2022 10:13:28 -0500
Message-ID: <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
To: Borislav Petkov <bp@alien8.de>
Content-Type: multipart/alternative; boundary="000000000000daa0b705ec19b325"
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:56:23 +1100
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000daa0b705ec19b325
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022, 10:03 AM Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Oct 28, 2022 at 07:46:08AM -0700, Yury Norov wrote:
> > I'll take it in bitmap-for-next this weekend.
>
> Why?


Because it's related to bitmap API usage and has been revealed after some
work in bitmaps.

And because nobody else cares.

If you're willing to move it yourself please go ahead.

>
>

--000000000000daa0b705ec19b325
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 28, 2022, 10:03 AM Borislav Petkov &lt;<a =
href=3D"mailto:bp@alien8.de">bp@alien8.de</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Fri, Oct 28, 2022 at 07:46:08AM -0700, Yury Norov =
wrote:<br>
&gt; I&#39;ll take it in bitmap-for-next this weekend.<br>
<br>
Why?</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Because it&#39;s related to bitmap API usage and has been revealed after so=
me work in bitmaps.</div><div dir=3D"auto"><br></div><div dir=3D"auto">And =
because nobody else cares.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If you&#39;re willing to move it yourself please go ahead.</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--000000000000daa0b705ec19b325--
