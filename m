Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6DD72364A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 06:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZyGy1C1pz3fC4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 14:31:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NkMg/qr3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NkMg/qr3;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZxDZ0hVCz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 13:44:29 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f7359a3b78so40655e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686023063; x=1688615063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iftkf2df8ANImf6BgTxCsl6iQc2J2N5tuIojpUh0gBM=;
        b=NkMg/qr3GDnS9llAsChIvIz1iftdnBvAbn3ldeRzB/kHRoaJejfxiYEiUvc8826ILE
         b19s9rBHOqbsLChWxUr4LzrwDZoIbOpo6n3yzcSK0W1H9LTxZO1n/DeG1P08Y2uUxrNb
         dAPlpZrXRzGbYqME041FQYVU/BJYOFppT8WAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686023063; x=1688615063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iftkf2df8ANImf6BgTxCsl6iQc2J2N5tuIojpUh0gBM=;
        b=X2DWCYIwHGIAfISo8XPOWJrhD2sMlXjz5hQr1iIxJx8+lLdrFDCQZTK0BvKapEnLtr
         lNA4zgqjh3bRHoPFca9z38xDzS1nxWtTqXzBX9ik/e5L94agdLVYOfKw5hr/z43dY1rM
         l4+QpVDHy15SVtdd10Sx2Dv8e/fI/mSZgMo9H6pawPxKDkrbIUWIX6DgytSANlFyvAVw
         ib8xHaz4liVMu0y6L7gxg14PYhM7bneNX6dwkgJ2OTbTXP3YkrdH8CBdmeaMqnNVk7CB
         ZpI/70vmEc34qLKgRuFlKpCpZwWXsGdiifUiLvhdE81SIwwWZ6wGd9p9JqpyTRA826KF
         71oQ==
X-Gm-Message-State: AC+VfDzhIqeSV6KFN1gduUE6O9s9Uq1PRxvMrUW9OHP5sWH9A5IavJaA
	FNIFqtfyf6t37gfo9u8gOUFVf58y4py2i91KVpwplA==
X-Google-Smtp-Source: ACHHUZ5838FmJNGVv1gKne3dr6SrJ9LLo9rk5oX1YXP96/4xSFDmcr5KRpGvFhwWjLRp2ZflF9/f2BK0qG9I4px8n9E=
X-Received: by 2002:a05:600c:881a:b0:3f1:9a3d:4f7f with SMTP id
 gy26-20020a05600c881a00b003f19a3d4f7fmr49883wmb.1.1686023062853; Mon, 05 Jun
 2023 20:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
 <20230407194645.GA3814486@bhelgaas> <CANEJEGscz3F-6cZcp7dBVekpxHMNXZWgUW2ic3xd6hm3xWH6ZQ@mail.gmail.com>
In-Reply-To: <CANEJEGscz3F-6cZcp7dBVekpxHMNXZWgUW2ic3xd6hm3xWH6ZQ@mail.gmail.com>
From: Grant Grundler <grundler@chromium.org>
Date: Mon, 5 Jun 2023 20:44:10 -0700
Message-ID: <CANEJEGs_ni14PZ0VQcNHF+epBspQwOWLu1Yo8KyF3RhpGscV6w@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Grant Grundler <grundler@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000bf320105fd6dd552"
X-Mailman-Approved-At: Tue, 06 Jun 2023 14:30:55 +1000
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000bf320105fd6dd552
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 11:11=E2=80=AFPM Grant Grundler <grundler@chromium.=
org>
wrote:

> On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org=
> wrote:
> ...
> > But I don't think we need output in a single step; we just need a
> > single instance of ratelimit_state (or one for CPER path and another
> > for native AER path), and that can control all the output for a single
> > error.  E.g., print_hmi_event_info() looks like this:
> >
> >   static void print_hmi_event_info(...)
> >   {
> >     static DEFINE_RATELIMIT_STATE(rs, ...);
> >
> >     if (__ratelimit(&rs)) {
> >       printk("%s%s Hypervisor Maintenance interrupt ...");
> >       printk("%s Error detail: %s\n", ...);
> >       printk("%s      HMER: %016llx\n", ...);
> >     }
> >   }
> >
> > I think it's nice that the struct ratelimit_state is explicit and
> > there's no danger of breaking it when adding another printk later.
>
> Since the output is spread across at least two functions, I think your
> proposal is a better solution.
>
> I'm not happy with the patch series I sent in my previous reply as an
> attachment. It's only marginally better than the original code.
>

Despite not being happy about it, after a week of vacation I now think it
would be better to include them as is since they solve the immediate
problems and then solve the above two issues in additional patches. The two
changes I have prepared so far correctly fix the original issues they
intended to fix and don't affect the new issues we've found.

I'll post a V3 of this series tonight after making sure it at least
compiles and "looks right".

cheers,
grant


> I need another day or two to see if I can implement your proposal
> correctly.
>
> cheers,
> grant
>

--000000000000bf320105fd6dd552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 17, 2023 at 11:11=E2=80=
=AFPM Grant Grundler &lt;<a href=3D"mailto:grundler@chromium.org">grundler@=
chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas &lt;<a hr=
ef=3D"mailto:helgaas@kernel.org" target=3D"_blank">helgaas@kernel.org</a>&g=
t; wrote:<br>
...<br>
&gt; But I don&#39;t think we need output in a single step; we just need a<=
br>
&gt; single instance of ratelimit_state (or one for CPER path and another<b=
r>
&gt; for native AER path), and that can control all the output for a single=
<br>
&gt; error.=C2=A0 E.g., print_hmi_event_info() looks like this:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0static void print_hmi_event_info(...)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0static DEFINE_RATELIMIT_STATE(rs, ...);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if (__ratelimit(&amp;rs)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printk(&quot;%s%s Hypervisor Maintenance int=
errupt ...&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printk(&quot;%s Error detail: %s\n&quot;, ..=
.);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0printk(&quot;%s=C2=A0 =C2=A0 =C2=A0 HMER: %0=
16llx\n&quot;, ...);<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; I think it&#39;s nice that the struct ratelimit_state is explicit and<=
br>
&gt; there&#39;s no danger of breaking it when adding another printk later.=
<br>
<br>
Since the output is spread across at least two functions, I think your<br>
proposal is a better solution.<br>
<br>
I&#39;m not happy with the patch series I sent in my previous reply as an<b=
r>
attachment. It&#39;s only marginally better than the original code.<br></bl=
ockquote><div><br></div><div>Despite not being happy about it, after a week=
 of vacation I now think it would be better to include them as is since the=
y solve the immediate problems and then solve the above two issues in addit=
ional patches. The two changes I have prepared so far correctly fix the ori=
ginal issues they intended to fix and don&#39;t affect the new issues we&#3=
9;ve found.</div><div><br></div><div>I&#39;ll post a V3 of this series toni=
ght after making sure it at least compiles and &quot;looks right&quot;.</di=
v><div><br></div><div>cheers,</div><div>grant</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
I need another day or two to see if I can implement your proposal correctly=
.<br>
<br>
cheers,<br>
grant<br>
</blockquote></div></div>

--000000000000bf320105fd6dd552--
