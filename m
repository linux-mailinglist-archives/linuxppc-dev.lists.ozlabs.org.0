Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 092B86DB461
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 21:47:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtTRT5j0Xz3fVk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 05:47:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TO469duA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TO469duA;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtTQg166qz3chn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 05:46:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCB6E6512E;
	Fri,  7 Apr 2023 19:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AE7C433EF;
	Fri,  7 Apr 2023 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680896807;
	bh=jJZrgaS9x+x1S2R2yg1K1+c5nWNoK5ss3XwLkYAtE8Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TO469duAJkhpj1So22MlFHRFn5xX24ea33Qa5N8RAp5UJIIKGZZOBX6Hs2rMJ52Ig
	 RpwfFH4aHa7VjgDuSDJpTTjnqOfjYnsa/tGBV93QjZABBO8NYJgZnZ+X8EpcEN0nIk
	 E2oP1kjOx7Zu2S0/t9nYBdInDLCE+uBvUVdVndcyp72HOaATPyxov0cl2HDrAvHx7d
	 t+kv49Qt/c6skSolQc+cw42feY7R8ExgnIaeO5/eeEMS8QDG0EbTOJhO2aCPC00vWu
	 F9IZPC/a1LZehjXz2KicoaZxZlOVth24NTYZ6QPxJFFjousdIZDGbwBFHwtqkLMJKP
	 s3lHDSpINxvew==
Date: Fri, 7 Apr 2023 14:46:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Grant Grundler <grundler@chromium.org>
Subject: Re: [PATCHv2 pci-next 2/2] PCI/AER: Rate limit the reporting of the
 correctable errors
Message-ID: <20230407194645.GA3814486@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANEJEGvKRVGLYPmD3kujg6veq5KR7J+rAu6ni92wUz72KGtyBA@mail.gmail.com>
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
Cc: Rajat Jain <rajatja@chromium.org>, Rajat Khandelwal <rajat.khandelwal@linux.intel.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O 'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 07, 2023 at 11:53:27AM -0700, Grant Grundler wrote:
> On Thu, Apr 6, 2023 at 12:50 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Mar 17, 2023 at 10:51:09AM -0700, Grant Grundler wrote:
> > > From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> > >
> > > There are many instances where correctable errors tend to inundate
> > > the message buffer. We observe such instances during thunderbolt PCIe
> > > tunneling.
> ...

> > >               if (info->severity == AER_CORRECTABLE)
> > > -                     pci_info(dev, "   [%2d] %-22s%s\n", i, errmsg,
> > > -                             info->first_error == i ? " (First)" : "");
> > > +                     pci_info_ratelimited(dev, "   [%2d] %-22s%s\n", i, errmsg,
> > > +                                          info->first_error == i ? " (First)" : "");
> >
> > I don't think this is going to reliably work the way we want.  We have
> > a bunch of pci_info_ratelimited() calls, and each caller has its own
> > ratelimit_state data.  Unless we call pci_info_ratelimited() exactly
> > the same number of times for each error, the ratelimit counters will
> > get out of sync and we'll end up printing fragments from error A mixed
> > with fragments from error B.
> 
> Ok - what I'm reading between the lines here is the output should be
> emitted in one step, not multiple pci_info_ratelimited() calls. if the
> code built an output string (using sprintnf()), and then called
> pci_info_ratelimited() exactly once at the bottom, would that be
> sufficient?
>
> > I think we need to explicitly manage the ratelimiting ourselves,
> > similar to print_hmi_event_info() or print_extlog_rcd().  Then we can
> > have a *single* ratelimit_state, and we can check it once to determine
> > whether to log this correctable error.
> 
> Is the rate limiting per call location or per device? From above, I
> understood rate limiting is "per call location".  If the code only
> has one call location, it should achieve the same goal, right?

Rate-limiting is per call location, so yes, if we only have one call
location, that would solve it.  It would also have the nice property
that all the output would be atomic so it wouldn't get mixed with
other stuff, and it might encourage us to be a little less wordy in
the output.

But I don't think we need output in a single step; we just need a
single instance of ratelimit_state (or one for CPER path and another
for native AER path), and that can control all the output for a single
error.  E.g., print_hmi_event_info() looks like this:

  static void print_hmi_event_info(...)
  {
    static DEFINE_RATELIMIT_STATE(rs, ...);

    if (__ratelimit(&rs)) {
      printk("%s%s Hypervisor Maintenance interrupt ...");
      printk("%s Error detail: %s\n", ...);
      printk("%s      HMER: %016llx\n", ...);
    }
  }

I think it's nice that the struct ratelimit_state is explicit and
there's no danger of breaking it when adding another printk later.

It *could* be per pci_dev, too, but I suspect it's not worth spending
40ish bytes per device for the ratelimit data.

Bjorn
