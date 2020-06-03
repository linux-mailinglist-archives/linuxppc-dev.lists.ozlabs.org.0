Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 560871ED85E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 00:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cjdb3TwzzDqg4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 08:05:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=broadcom.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=scott.branden@broadcom.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=a+9ORBWW; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49chwS45YzzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 07:33:10 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id a25so3767993ejg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jun 2020 14:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JL8NdDaJJdqJ2k7Gez9CAFvuXWPqlFnywwEZna8Z64w=;
 b=a+9ORBWWW6QEfZ+b4U6NCyeA5ih1bKV8WUni/uNrqDongShL0UvJILFkxYvNSDev8A
 2UHNMdkYFCiXjEZArhjYIJbFO0ZiFf9ng4uo5quKQrIlEk3TTeTY5R5KbzRdwPQkV60f
 8a1jxdtaN9zhSkQRm16sidtSa3lxuRZg1VN5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JL8NdDaJJdqJ2k7Gez9CAFvuXWPqlFnywwEZna8Z64w=;
 b=oKWHnYhFyfWSo/Ye62pc9muD5SVkvBgtvAsXP2d/r2ueb2YNtIw+OrvqabRUD2fgDg
 XR2tJ29RsL/2bdFcB+OL9/WB44OoTI6LXsoAjk3l9doXSTN5C9+lAqf+HNc7hKwyK7/9
 2u4PatzoD67JFyvMj0RicB/VB4umljW1ryjljgqNjwOZYcZ5LxnKr7LMrznOvL0oN/Rc
 gsU7Gr/GfVP9sZzRXHYJNkwK496gBfKxnGqLVk8hXlV751nkY9Ho2CZNDdG1g4u7Db7g
 3Hmw+dvohHuo2lAEcGf9eG+oKFZCF6KzAS3mFjFO6Cdi9pBeT1rN8Scv28irQJN1sEAr
 N+vg==
X-Gm-Message-State: AOAM532hz/Llupi2m5fgzAQmpV4F/biu2iAtcfRZiaoLxM1K3tJY5y5W
 OTYjucBcISGI4YhaOmrZfh2369pDZB0JohntKEpRaA==
X-Google-Smtp-Source: ABdhPJwKzGX3MHIMczGdU8TBcfzGgDiAEiwNknyJ/TSPCZj7GevuAvaX/D3MylS3oIE1S7xzlRCiAIAWhJ88mtuYow4=
X-Received: by 2002:a17:906:63c9:: with SMTP id
 u9mr1171326ejk.439.1591219986422; 
 Wed, 03 Jun 2020 14:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-6-git-send-email-bhsharma@redhat.com>
 <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
 <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com>
 <51606585-77a3-265f-1d4e-19f25a90697d@broadcom.com>
 <CACi5LpPXdcJ7AmFWiSyM8rG_+7C=wTqiP0oCa9QAPe0Y0_wH=Q@mail.gmail.com>
In-Reply-To: <CACi5LpPXdcJ7AmFWiSyM8rG_+7C=wTqiP0oCa9QAPe0Y0_wH=Q@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Date: Wed, 3 Jun 2020 14:32:55 -0700
Message-ID: <CA+JzhdK3ZkG+gtkOsP-csPMEiGc2OC+V=49H=y0=Ks6C8ShPcg@mail.gmail.com>
Subject: Re: Re: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add
 documentation for 'TCR_EL1.T1SZ'
To: Bhupesh Sharma <bhsharma@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000d319105a734c6b2"
X-Mailman-Approved-At: Thu, 04 Jun 2020 08:02:42 +1000
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 James Morse <james.morse@arm.com>, Dave Anderson <anderson@redhat.com>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000d319105a734c6b2
Content-Type: text/plain; charset="UTF-8"

Hi Bhupesh,

On Wed, 3 Jun 2020 at 13:39, Bhupesh Sharma <bhsharma@redhat.com> wrote:

> Hello Scott,
>
> On Thu, Jun 4, 2020 at 12:17 AM Scott Branden
> <scott.branden@broadcom.com> wrote:
> >
> > Hi Bhupesh,
> >
> > Would be great to get this patch series upstreamed?
> >
> > On 2019-12-25 10:49 a.m., Bhupesh Sharma wrote:
> > > Hi James,
> > >
> > > On 12/12/2019 04:02 PM, James Morse wrote:
> > >> Hi Bhupesh,
> > >
> > > I am sorry this review mail skipped my attention due to holidays and
> > > focus on other urgent issues.
> > >
>
<SNIP>

> > >
> > > Ok, got it. Fixed this in v6, which should be on its way shortly.
> > I can't seem to find v6?
>
> Oops. I remember Cc'ing you to the v6 patchset (may be my email client
> messed up), anyways here is the v6 patchset for your reference:
> <http://lists.infradead.org/pipermail/kexec/2020-May/025095.html>
>
> Do share your review/test comments on the same.
>
I found the cover letter but didn't get the patches.  Thanks for sending
link.
v5 worked fine for us. Will get someone to try out v6 and let you know.

>
> Thanks,
> Bhupesh
>
> Regards,
 Scott

--0000000000000d319105a734c6b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Bhupesh,</div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 3 Jun 2020 at 13:=
39, Bhupesh Sharma &lt;<a href=3D"mailto:bhsharma@redhat.com">bhsharma@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hello Scott,<br>
<br>
On Thu, Jun 4, 2020 at 12:17 AM Scott Branden<br>
&lt;<a href=3D"mailto:scott.branden@broadcom.com" target=3D"_blank">scott.b=
randen@broadcom.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bhupesh,<br>
&gt;<br>
&gt; Would be great to get this patch series upstreamed?<br>
&gt;<br>
&gt; On 2019-12-25 10:49 a.m., Bhupesh Sharma wrote:<br>
&gt; &gt; Hi James,<br>
&gt; &gt;<br>
&gt; &gt; On 12/12/2019 04:02 PM, James Morse wrote:<br>
&gt; &gt;&gt; Hi Bhupesh,<br>
&gt; &gt;<br>
&gt; &gt; I am sorry this review mail skipped my attention due to holidays =
and<br>
&gt; &gt; focus on other urgent issues.<br>
&gt; &gt;<br></blockquote><div>&lt;SNIP&gt;=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; &gt;<br>
&gt; &gt; Ok, got it. Fixed this in v6, which should be on its way shortly.=
<br>
&gt; I can&#39;t seem to find v6?<br>
<br>
Oops. I remember Cc&#39;ing you to the v6 patchset (may be my email client<=
br>
messed up), anyways here is the v6 patchset for your reference:<br>
&lt;<a href=3D"http://lists.infradead.org/pipermail/kexec/2020-May/025095.h=
tml" rel=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/piperm=
ail/kexec/2020-May/025095.html</a>&gt;<br>
<br>
Do share your review/test comments on the same.<br></blockquote><div>I foun=
d the cover letter but didn&#39;t get the patches.=C2=A0 Thanks for sending=
 link.</div><div>v5 worked fine for us. Will get someone to try out v6 and =
let you know.=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Thanks,<br>
Bhupesh<br>
<br></blockquote><div>Regards,</div><div>=C2=A0Scott=C2=A0</div></div></div=
>

--0000000000000d319105a734c6b2--
