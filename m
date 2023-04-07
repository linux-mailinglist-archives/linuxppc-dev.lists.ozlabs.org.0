Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B57216DB75D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 01:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtZn84Txdz3fZq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 09:48:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f7kvXaQX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::831; helo=mail-qt1-x831.google.com; envelope-from=grundler@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=f7kvXaQX;
	dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtZmL26Ppz3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 09:47:30 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3e392e10cc4so697751cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 16:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680911247; x=1683503247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXTrg0mDV7Q1ZzUvffjDPVloLufOXWmykfXvP65A/O0=;
        b=f7kvXaQXsTi3P8WLYLsxHg6BjzOkv9BuXp18qU6yp12LEyg/bXd7Cq92+AZdbGbanD
         OhwrOh+oN4kwnppYY+1FU3+ecy/X9DdgdZ5ydpiZVxiu/WoXtSqkeW2FWcg8w/XRTDqp
         ndKPXDdNhqH+JFhO7I1LsIMxCoCcSBLEhtOQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680911247; x=1683503247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXTrg0mDV7Q1ZzUvffjDPVloLufOXWmykfXvP65A/O0=;
        b=iXvI4PRyPYdQkkjAyKGi/BFoBOjOus1XJFDejeI9e1JitvH/LifgcnrgtkfD6VcDSd
         u9gf0+ICx+fESwjS3xpFlRuwiKvNKI8snF7xhme/XrvezFCiGOYN9zEM6rvZzZQfepQa
         nvGjPLP1th8dW9kkjD+Z7U58Nxb/fLfCERExXJBIGtvFQktUwQjTg3dYfbm8n9XLTlVR
         RMrovviSeTh8J3gPMPej1S7A/HXWCIKOrA3SCEMmgoxzl9prnbjzevnrHxUWtDxxa0QC
         Wo8FwDzncIY6CxQPFJLrEvNsqDTCYaxpkGwiT1rQbbZ5wvZuYhGsmvjNKeTxi+gy2T4R
         zhHA==
X-Gm-Message-State: AAQBX9fqP9dwKxLQroYMgU9qVGpS5TeqaWu2NTvCwkBgzXcjkqlTUYqq
	qVoXHeri/xNhUEU+cx3YKwhsX1ZKNYDfSeXClTsXXg==
X-Google-Smtp-Source: AKy350anL/S84pz5fQsDUIE/4hZz/d4BnMbaLsMWzeAb0ywkzGXmZGt34QieZAyEeqWjWiFbipyCD6eXWX0ziw214bg=
X-Received: by 2002:a05:622a:15c7:b0:3de:8cbe:47af with SMTP id
 d7-20020a05622a15c700b003de8cbe47afmr57131qty.9.1680911246702; Fri, 07 Apr
 2023 16:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
 <20230407194645.GA3814486@bhelgaas>
In-Reply-To: <20230407194645.GA3814486@bhelgaas>
From: Grant Grundler <grundler@chromium.org>
Date: Fri, 7 Apr 2023 16:47:15 -0700
Message-ID: <CANEJEGtZo-TSjYfoVbw5wdNbOdjwth=E51w8_MoFYyuo5+QrTw@mail.gmail.com>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[reposting in plain text mode]


On Fri, Apr 7, 2023 at 12:46=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> > On Thu, Apr 6, 2023 at 12:50=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
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
)" : "");
> > > > +                     pci_info_ratelimited(dev, "   [%2d] %-22s%s\n=
", i, errmsg,
> > > > +                                          info->first_error =3D=3D=
 i ? " (First)" : "");
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
> It *could* be per pci_dev, too, but I suspect it's not worth spending
> 40ish bytes per device for the ratelimit data.
>
> Bjorn
