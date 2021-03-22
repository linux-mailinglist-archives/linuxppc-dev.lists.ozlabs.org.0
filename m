Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521B345418
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 01:48:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4CQP1KXYz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:47:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JPyw4UZw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=cyborgyn@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JPyw4UZw; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3zMx1vPFz3004
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:45:00 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id y200so11199052pfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTBufNw4i/2n7snfGRiAb8kqCxwWobWjwTB6oKESZ0M=;
 b=JPyw4UZw2XwOct90taF3URGMHz1LhhZ9jbMRPbZnTq2rdbZYvet2VmhekAnLYqS8TZ
 9fgKg8mg2eGcwmnbpxEejFZq2ot0eB3RggThBEXrelNA/RjoLxGHrm7pLCwQW35+O+db
 MoHPHctNpYV3kfKhUBxgPHz3I18LgaC3FqB5Hy8MRZV1vEQ6zpa46Jrimhy0lwiMtN3n
 F8lg7EmEefEEwQ6cPVEpEMcwWqErOAp7cRjlyik3lmyqSHb66RklRvApTpZrk8DxHLvu
 0Q1uQxXH0yyLl2tRp1lzgR62YpcK1CmFSlNgZohKnaO1u1meCjWqaUzNLn+JCdW4yXR6
 4ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTBufNw4i/2n7snfGRiAb8kqCxwWobWjwTB6oKESZ0M=;
 b=nxPixpFWD7hv2P7qoD78SytQV7N2dokOFgmVJqQ5LInQJDEcaPiASj2UfmOhNFs4Ko
 /vbdYTf1/5+nZrMji9Gfkdqx+2cTdiaB3EcldFxCUleUZLXI+dR3pJ9HlXvqGh12ZBvs
 YeDG6VlidxzN51FnRttRyy5tT9+7ygO8GIv7u0aPTzWq9a6dtJUn6jRrMP+NN8SOVQHr
 trGaq4k6B87OLRI0zjwSu1wn6mKvF28r/IaogTrHPmfKe74lapZ+hvjo1L/3y9LSzRSC
 s3QG2BXq86no/seaI0lSo+W2nMRj3fc5NHFXUG/iBJlmeVDjPZPswv4vbkNVkZaF3AkP
 ZiQQ==
X-Gm-Message-State: AOAM533VbPpISnoCowhIMCqng8920darnxc3Cv1sVmJyGc8ZrikCIzEU
 Sqs8lDcM/aHUBJLP8J+43qEqC/gzvbu7ICp9Kd4=
X-Google-Smtp-Source: ABdhPJxALWHZB2PtMzZaEbPK6S6PVlILvoGWfgXJu9E6wwY8bZOwWmhspTqu+N4D6slQMd3+CUy2zkw5C7aP1iHLaLo=
X-Received: by 2002:a63:cc:: with SMTP id 195mr212636pga.282.1616427895067;
 Mon, 22 Mar 2021 08:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-3-hch@lst.de>
 <20210319170753.GV1463@shell.armlinux.org.uk>
 <20210319175311.GW1463@shell.armlinux.org.uk>
 <20210322145403.GA30942@lst.de> <20210322151503.GX1463@shell.armlinux.org.uk>
 <20210322151823.GA2764@lst.de>
In-Reply-To: <20210322151823.GA2764@lst.de>
From: Cye Borg <cyborgyn@gmail.com>
Date: Mon, 22 Mar 2021 16:44:43 +0100
Message-ID: <CAD4NMuaasexgWUmYD0CwhxuFS760Pj4GVuBpJNp+g0YBXpSPnw@mail.gmail.com>
Subject: Re: [PATCH 02/10] ARM: disable CONFIG_IDE in footbridge_defconfig
To: Christoph Hellwig <hch@lst.de>
Content-Type: multipart/alternative; boundary="0000000000007d960b05be21f2a0"
X-Mailman-Approved-At: Tue, 23 Mar 2021 11:47:31 +1100
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-alpha@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000007d960b05be21f2a0
Content-Type: text/plain; charset="UTF-8"

I use pata_cypress on Alpha, and for the above mentioned problems,
it always restricted me to use only one IDE channel out of the two
available. Also, not forcing it to use PIO mode, it always failed to
operate. I would love to test on Alpha, and give you feedback about
a fix/finished implementation of the driver. I have both Alpha Server DS20E
and Alpha Personal Workstation 500 including that freak chipset.

Let me know if/when I can help with my limited capabilities.

Thanks, best regards,
Barnabas Viragh

On Mon, Mar 22, 2021 at 4:19 PM Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin
> wrote:
> > It gets worse than that though - due to a change to remove
> > pcibios_min_io from the generic code, moving it into the ARM
> > architecture code, this has caused a regression that prevents the
> > legacy resources being registered against the bus resource. So even
> > if they are there, they cause probe failures. I haven't found a
> > reasonable way to solve this yet, but until there is, there is no
> > way that the PATA driver can be used as the "legacy mode" support
> > is effectively done via the PCI code assigning virtual IO port
> > resources.
> >
> > I'm quite surprised that the CY82C693 even works on Alpha - I've
> > asked for a lspci for that last week but nothing has yet been
> > forthcoming from whoever responded to your patch for Alpha - so I
> > can't compare what I'm seeing with what's happening with Alpha.
>
> That sounds like something we could fix with a quirk for function 2
> in the PCI resource assignment code.  Can you show what vendor and
> device ID function 2 has so that I could try to come up with one?
>

--0000000000007d960b05be21f2a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I use pata_cypress on Alpha, and for the above mentio=
ned problems, <br></div><div>it always restricted me to use only one IDE ch=
annel out of the two</div><div>available. Also, not forcing it to use PIO m=
ode, it always failed to</div><div>operate. I would love to test on Alpha, =
and give you feedback about</div><div>a fix/finished implementation of the =
driver. I have both Alpha Server DS20E</div><div>and Alpha Personal Worksta=
tion 500 including that freak chipset.</div><div><br></div><div>Let me know=
 if/when I can help with my limited capabilities.</div><div><br></div><div>=
Thanks, best regards,</div><div>Barnabas Viragh<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 22, 20=
21 at 4:19 PM Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de">hch@lst.d=
e</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Mon, Mar 22, 2021 at 03:15:03PM +0000, Russell King - ARM Linux admin w=
rote:<br>
&gt; It gets worse than that though - due to a change to remove<br>
&gt; pcibios_min_io from the generic code, moving it into the ARM<br>
&gt; architecture code, this has caused a regression that prevents the<br>
&gt; legacy resources being registered against the bus resource. So even<br=
>
&gt; if they are there, they cause probe failures. I haven&#39;t found a<br=
>
&gt; reasonable way to solve this yet, but until there is, there is no<br>
&gt; way that the PATA driver can be used as the &quot;legacy mode&quot; su=
pport<br>
&gt; is effectively done via the PCI code assigning virtual IO port<br>
&gt; resources.<br>
&gt; <br>
&gt; I&#39;m quite surprised that the CY82C693 even works on Alpha - I&#39;=
ve<br>
&gt; asked for a lspci for that last week but nothing has yet been<br>
&gt; forthcoming from whoever responded to your patch for Alpha - so I<br>
&gt; can&#39;t compare what I&#39;m seeing with what&#39;s happening with A=
lpha.<br>
<br>
That sounds like something we could fix with a quirk for function 2<br>
in the PCI resource assignment code.=C2=A0 Can you show what vendor and<br>
device ID function 2 has so that I could try to come up with one?<br>
</blockquote></div>

--0000000000007d960b05be21f2a0--
