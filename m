Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B576DBAB8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 14:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptv7j2rVKz3fYH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 22:05:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dQ7buXDI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dQ7buXDI;
	dkim-atps=neutral
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtZkz3737z3f4R
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:46:18 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-3e392e10cc4so697611cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 16:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680911174; x=1683503174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qNgArB5CAU6zJ3KE693Zepf2ungWpMwISdipw8XjTg=;
        b=dQ7buXDItC9V9fXOGg6SEX3B4O2LOLN96pwXVrYoB7HVXKeLEOa9yTq8RsTGa40BuD
         xu916iKoVGAXNvhM0JwxWv0it7F8gZ+817vcAqcQkmKNS9T+OJhjhpP4sMS0T9Nf8lxk
         r/phXErde3VSGFIBxlEOoARiydryV43Z7jmyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680911174; x=1683503174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qNgArB5CAU6zJ3KE693Zepf2ungWpMwISdipw8XjTg=;
        b=GRDGrRvTTHI2gRDnZzUwzCx3tnulsofuLiAb7XfoI3KsNHR4N1YsICgtHMx6tcNw+2
         PhzlRfzWWLauL0HCvGuCLgP3GqCcG7r+Y6BYH4nBqhrl+pY98XWLGpZZrukZ+d3PfUdF
         IcosAYGWBOznvp7tzQGrmUiKgYV30DBq7atd10dKWEf2WYQiscfhRSZV2i3ICwHgiCUa
         CibfYuwCXJgRv/D1oTtGozHGtA0/jewPkdFyRncZj4LT31ycPQacC+XMvJkEFXErDUvy
         TcZaZCxvv9dg/7gj/ntqMK731Ofo/WmLKtK6nSAEOa7Ye92/4ezJJuUh9MJGtfcdzHwC
         tsIA==
X-Gm-Message-State: AAQBX9cj6wLmNbSMEKvPYEs0Rga3pwwz0wTntUTfmYoNCAvT1+vxvyHP
	wh/nenrxiu/TyDy2V0o2RPP0KE80d4fxRQywhX9QJw==
X-Google-Smtp-Source: AKy350ZZMFRrMxPVJD4aCBkYrtP/iMkHQJGOgHvA1qYoaD4kkYarIESl12ssgVv3yP+z+In3AlWzCMgeyUO/Yr5ubEs=
X-Received: by 2002:a05:622a:18a1:b0:3b9:f696:c754 with SMTP id
 v33-20020a05622a18a100b003b9f696c754mr55492qtc.5.1680911174515; Fri, 07 Apr
 2023 16:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
 <20230407194645.GA3814486@bhelgaas>
In-Reply-To: <20230407194645.GA3814486@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Fri, 7 Apr 2023 16:46:03 -0700
Message-ID: <CANEJEGsE6KS484iSLkKV8hx2nNThZGfaaz+u+R-A3X5nRev6Gg@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000752a4605f8c7a123"
X-Mailman-Approved-At: Sat, 08 Apr 2023 22:04:37 +1000
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000752a4605f8c7a123
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:

> On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> > On Thu, Apr 6, 2023 at 12:50=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg>
> wrote:
> > > On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:
> > > > From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> > > >
> > > > There are many instances where correctable errors tend to inundate
> > > > the message buffer. We observe such instances during thunderbolt PC=
Ie
> > > > tunneling.
> > ...
>
> > > >               if (info->severity =3D=3D AER_CORRECTABLE)
> > > > -                     pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg=
,
> > > > -                             info->first_error =3D=3D i ? " (First=
)" :
> "");
> > > > +                     pci_info_ratelimited(dev, "   [%2d]
> %-22s%s\n", i, errmsg,
> > > > +                                          info->first_error =3D=3D=
 i ?
> " (First)" : "");
> > >
> > > I don't think this is going to reliably work the way we want.  We hav=
e
> > > a bunch of pci_info_ratelimited() calls, and each caller has its own
> > > ratelimit_state data.  Unless we call pci_info_ratelimited() exactly
> > > the same number of times for each error, the ratelimit counters will
> > > get out of sync and we'll end up printing fragments from error A mixe=
d
> > > with fragments from error B.
> >
> > Ok - what I'm reading between the lines here is the output should be
> > emitted in one step, not multiple pci_info_ratelimited() calls. if the
> > code built an output string (using sprintnf()), and then called
> > pci_info_ratelimited() exactly once at the bottom, would that be
> > sufficient?
> >
> > > I think we need to explicitly manage the ratelimiting ourselves,
> > > similar to print_hmi_event_info() or print_extlog_rcd().  Then we can
> > > have a *single* ratelimit_state, and we can check it once to determin=
e
> > > whether to log this correctable error.
> >
> > Is the rate limiting per call location or per device? From above, I
> > understood rate limiting is "per call location".  If the code only
> > has one call location, it should achieve the same goal, right?
>
> Rate-limiting is per call location, so yes, if we only have one call
> location, that would solve it.  It would also have the nice property
> that all the output would be atomic so it wouldn't get mixed with
> other stuff, and it might encourage us to be a little less wordy in
> the output.
>

+1 to all of those reasons. Especially reducing the number of lines output.

I'm going to be out for the next week. If someone else (Rajat Kendalwal
maybe?) wants to rework this to use one call location it should be fairly
straight forward. If not, I'll tackle this when I'm back (in 2 weeks
essentially).


> But I don't think we need output in a single step; we just need a
> single instance of ratelimit_state (or one for CPER path and another
> for native AER path), and that can control all the output for a single
> error.  E.g., print_hmi_event_info() looks like this:
>
>   static void print_hmi_event_info(...)
>   {
>     static DEFINE_RATELIMIT_STATE(rs, ...);
>
>     if (__ratelimit(&rs)) {
>       printk("%s%s Hypervisor Maintenance interrupt ...");
>       printk("%s Error detail: %s\n", ...);
>       printk("%s      HMER: %016llx\n", ...);
>     }
>   }
>
> I think it's nice that the struct ratelimit_state is explicit and
> there's no danger of breaking it when adding another printk later.
>

True. But a single call to a "well documented" API is my preference
(assuming this is my choice).

It *could* be per pci_dev, too, but I suspect it's not worth spending
> 40ish bytes per device for the ratelimit data.
>

Good - I don't think we need to make this per device - I had assumed it was
but also currently don't see a need for this.


Thanks!
grant


>
> Bjorn
>

--000000000000752a4605f8c7a123
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 12:46=E2=80=AF=
PM Bjorn Helgaas &lt;<a href=3D"mailto:helgaas@kernel.org">helgaas@kernel.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:<br>
&gt; On Thu, Apr 6, 2023 at 12:50=E2=80=AFPM Bjorn Helgaas &lt;<a href=3D"m=
ailto:helgaas@kernel.org" target=3D"_blank">helgaas@kernel.org</a>&gt; wrot=
e:<br>
&gt; &gt; On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:<b=
r>
&gt; &gt; &gt; From: Rajat Khandelwal &lt;<a href=3D"mailto:rajat.khandelwa=
l@linux.intel.com" target=3D"_blank">rajat.khandelwal@linux.intel.com</a>&g=
t;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; There are many instances where correctable errors tend to in=
undate<br>
&gt; &gt; &gt; the message buffer. We observe such instances during thunder=
bolt PCIe<br>
&gt; &gt; &gt; tunneling.<br>
&gt; ...<br>
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (in=
fo-&gt;severity =3D=3D AER_CORRECTABLE)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pci_info(dev, &quot;=C2=A0 =C2=A0[%2d] %-22s%s\n&quot;, i,=
 errmsg,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;first_error =3D=3D i =
? &quot; (First)&quot; : &quot;&quot;);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0pci_info_ratelimited(dev, &quot;=C2=A0 =C2=A0[%2d] %-22s%s=
\n&quot;, i, errmsg,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 info-&gt;first_error =3D=3D i ? &quot; (First)&quot; : &quot;=
&quot;);<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t think this is going to reliably work the way we want.=
=C2=A0 We have<br>
&gt; &gt; a bunch of pci_info_ratelimited() calls, and each caller has its =
own<br>
&gt; &gt; ratelimit_state data.=C2=A0 Unless we call pci_info_ratelimited()=
 exactly<br>
&gt; &gt; the same number of times for each error, the ratelimit counters w=
ill<br>
&gt; &gt; get out of sync and we&#39;ll end up printing fragments from erro=
r A mixed<br>
&gt; &gt; with fragments from error B.<br>
&gt; <br>
&gt; Ok - what I&#39;m reading between the lines here is the output should =
be<br>
&gt; emitted in one step, not multiple pci_info_ratelimited() calls. if the=
<br>
&gt; code built an output string (using sprintnf()), and then called<br>
&gt; pci_info_ratelimited() exactly once at the bottom, would that be<br>
&gt; sufficient?<br>
&gt;<br>
&gt; &gt; I think we need to explicitly manage the ratelimiting ourselves,<=
br>
&gt; &gt; similar to print_hmi_event_info() or print_extlog_rcd().=C2=A0 Th=
en we can<br>
&gt; &gt; have a *single* ratelimit_state, and we can check it once to dete=
rmine<br>
&gt; &gt; whether to log this correctable error.<br>
&gt; <br>
&gt; Is the rate limiting per call location or per device? From above, I<br=
>
&gt; understood rate limiting is &quot;per call location&quot;.=C2=A0 If th=
e code only<br>
&gt; has one call location, it should achieve the same goal, right?<br>
<br>
Rate-limiting is per call location, so yes, if we only have one call<br>
location, that would solve it.=C2=A0 It would also have the nice property<b=
r>
that all the output would be atomic so it wouldn&#39;t get mixed with<br>
other stuff, and it might encourage us to be a little less wordy in<br>
the output.<br></blockquote><div><br></div><div>+1 to all of those reasons.=
 Especially reducing the=C2=A0number of lines output.</div><div><br></div><=
div>I&#39;m going to be out for the next week. If someone else (Rajat Kenda=
lwal maybe?) wants to rework this to use one call location it should be fai=
rly straight forward. If not, I&#39;ll tackle this when I&#39;m back (in 2 =
weeks essentially).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">But I don&#39;t think we need output in a single step; we =
just need a<br>
single instance of ratelimit_state (or one for CPER path and another<br>
for native AER path), and that can control all the output for a single<br>
error.=C2=A0 E.g., print_hmi_event_info() looks like this:<br>
<br>
=C2=A0 static void print_hmi_event_info(...)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 static DEFINE_RATELIMIT_STATE(rs, ...);<br>
<br>
=C2=A0 =C2=A0 if (__ratelimit(&amp;rs)) {<br>
=C2=A0 =C2=A0 =C2=A0 printk(&quot;%s%s Hypervisor Maintenance interrupt ...=
&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 printk(&quot;%s Error detail: %s\n&quot;, ...);<br>
=C2=A0 =C2=A0 =C2=A0 printk(&quot;%s=C2=A0 =C2=A0 =C2=A0 HMER: %016llx\n&qu=
ot;, ...);<br>
=C2=A0 =C2=A0 }<br>
=C2=A0 }<br>
<br>
I think it&#39;s nice that the struct ratelimit_state is explicit and<br>
there&#39;s no danger of breaking it when adding another printk later.<br><=
/blockquote><div><br></div><div>True. But a single call to a &quot;well doc=
umented&quot; API is my preference (assuming this is my choice).</div><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It *could* be p=
er pci_dev, too, but I suspect it&#39;s not worth spending<br>
40ish bytes per device for the ratelimit data.<br></blockquote><div><br></d=
iv><div>Good - I don&#39;t think we need to make this per device - I had as=
sumed it was but also currently don&#39;t see a need for this.</div><div><b=
r></div><div><br></div><div>Thanks!</div><div>grant</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bjorn<br>
</blockquote></div></div>

--000000000000752a4605f8c7a123--
