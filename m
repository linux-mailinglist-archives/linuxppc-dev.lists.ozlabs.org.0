Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72096402257
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 04:59:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3VP72f3rz2yZt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 12:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YOnlee9U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c;
 helo=mail-vs1-xe2c.google.com; envelope-from=linasvepstas@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YOnlee9U; dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3TBK3FRBz2yQH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 12:05:29 +1000 (AEST)
Received: by mail-vs1-xe2c.google.com with SMTP id a25so7008839vso.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Sep 2021 19:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=SrlvKqARGDivXRKXI4A7Tvn+WMDYjDuveWi0cEI2VFw=;
 b=YOnlee9U5jHYMdEdc7ovcoxTmZVwWMSQHQTOAWkw0Jan28COHSFrGcrucjqvpyCRKd
 6QQUMz4iZWvM9xhlv4YExn/UB6xuzECUUrVh3aKkZOcjWcYY39XLTXJfKGvTamW5Kyej
 v5SJg4AnS8ceemgX2V93aYw3Lx1dSu46/7RcRE0GYZqFs3wtSlYb+QENtLSCtdxjsVLn
 E6kB7L+/E2Mlk2vr2PtApiqB8gibqGW1UwNkLaie5AbLCN1ituR/8It1TTnsjwT1LaJ/
 HVv+TgeFQRACBJ1/FmlppHc4QpMjF4PrvcxEfAgVunrBLIcqluwAQqLd5GlvlPzVW1sW
 JhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=SrlvKqARGDivXRKXI4A7Tvn+WMDYjDuveWi0cEI2VFw=;
 b=mxgQL2AyD/q6EfQGLHp9vvmMN/hUS7vVtz39eeVVWvMPMHtwUHO3v0epb//zNayogb
 M/nOQSUgG8rKslrvJecBUt/9KPrBjoJjAhi3HfXKUwwgMoMHnpXYJWzwFBtAf9flaSYB
 D4ZC6lf905cYPmwJykOAQSWgO9GpkpqHizxutxsx6+QmRnaauLiD/seTaEeHxwBNhbD6
 jfb189zLxXiE0LkVFw2EQECCoswZgmWl3Rc3m7QSBte+/nSakhUbs4c0TDwv/q9xdp4C
 1xZxAPqeKgf8xK+Ndlf8oSKJVyuTV0Gbneat98SnzbWzO3HIC+/hOnCHGmKdNi/Rb2Yn
 01Qg==
X-Gm-Message-State: AOAM531TSOY4ys4bJTFBfLE73q/oC8On/SrU2YkBEK7WNc3HJxel/y6J
 npx+etiUyoYd+ryKPBq0qYclpPPInYXdARh5tIw=
X-Google-Smtp-Source: ABdhPJyRZy4lP0Yep+BISyfv2BdSr49tUZuqQReOujWXZK0Nbj3We5Aq2/RH4A/a3kIZG/y7A3zCbHKUwb09wfxbhwI=
X-Received: by 2002:a67:c009:: with SMTP id v9mr7526674vsi.47.1630980326280;
 Mon, 06 Sep 2021 19:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
In-Reply-To: <20210906094927.524106-1-schnelle@linux.ibm.com>
From: Linas Vepstas <linasvepstas@gmail.com>
Date: Mon, 6 Sep 2021 21:05:14 -0500
Message-ID: <CAHrUA34TK6U4TB34FHejott9TdFvSgAedOpmro-Uj2ZwnvzecQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] s390/pci: automatic error recovery
To: Niklas Schnelle <schnelle@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000fbd2e805cb5e325a"
X-Mailman-Approved-At: Tue, 07 Sep 2021 12:59:20 +1000
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
Reply-To: linasvepstas@gmail.com
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000fbd2e805cb5e325a
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 4:49 AM Niklas Schnelle <schnelle@linux.ibm.com>
wrote:

>  I believe we might be the first
> implementation of PCI device recovery in a virtualized setting requiring
> us to
> coordinate the device reset with the hypervisor platform by issuing a
> disable
> and re-enable to the platform as well as starting the recovery following
> a platform event.
>

I recall none of the details, but SRIOV is a standardized system for
sharing a PCI device across multiple virtual machines. It has detailed info
on what the hypervisor must do, and what the local OS instance must do to
accomplish this.  It's part of the PCI standard, and its more than a decade
old now, maybe two. Being a part of the PCI standard, it was interoperable
with error recovery, to the best of my recollection. At the time it was
introduced, it got pushed very aggressively.  The x86 hypervisor vendors
were aiming at the heart of zseries, and were militant about it.

-- Linas

-- 
Patrick: Are they laughing at us?
Sponge Bob: No, Patrick, they are laughing next to us.

--000000000000fbd2e805cb5e325a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 6, 2021 at 4:49 AM Niklas=
 Schnelle &lt;<a href=3D"mailto:schnelle@linux.ibm.com">schnelle@linux.ibm.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">=C2=A0I believe we might be the first<br>
implementation of PCI device recovery in a virtualized setting requiring us=
 to<br>
coordinate the device reset with the hypervisor platform by issuing a disab=
le<br>
and re-enable to the platform as well as starting the recovery following<br=
>
a platform event.<br></blockquote><div><br></div><div>I recall none of the =
details, but SRIOV is a standardized system for sharing a PCI device across=
 multiple virtual machines. It has detailed info on what the hypervisor mus=
t do, and what the local OS instance must do to accomplish this.=C2=A0 It&#=
39;s part of the PCI standard, and its more than a decade old now, maybe tw=
o. Being a part of the PCI standard, it was interoperable with error recove=
ry, to the best of my recollection. At the time it was introduced, it got p=
ushed very aggressively.=C2=A0 The x86 hypervisor vendors were aiming at th=
e heart of zseries, and were militant about it. <br></div></div><div class=
=3D"gmail_quote"><br></div><div class=3D"gmail_quote">-- Linas<br clear=3D"=
all"></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><div>Patrick: Are they laughing at us?</div><div>Sponge Bob: No, P=
atrick, they are laughing next to us.</div><div>=C2=A0<br></div><br></div><=
/div></div>

--000000000000fbd2e805cb5e325a--
