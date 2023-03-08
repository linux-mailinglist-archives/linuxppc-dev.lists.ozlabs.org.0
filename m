Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870096B12D7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 21:19:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX3Z52TN6z3cdj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 07:19:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F3AxgntV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F3AxgntV;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX3Y64rmxz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 07:18:34 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9949EB81269;
	Wed,  8 Mar 2023 20:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D47C433D2;
	Wed,  8 Mar 2023 20:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678306709;
	bh=ZtTQKPw9Lhws3bMR0Dxy6tKp0Y2Sewfp9TGaLVkmtN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F3AxgntVW29X9pG+G1qzmxHeFIbfgjuVpWg0O2Ib0HBI/zZbEoDMSTHKJsEOs4mTz
	 KDL+B8wzlZdzT3/LxYrnRdA3HHGp2UNZ2Ou5sDvd70MhPrz5bbuXsbeIkea0FZV0w1
	 da7M9eZbcOoc3K55AREpzpjmixf9b/Y4/tl0ZgmkqOwb+s423chpOEAheE5cKI5cYF
	 8JgKUsLMyhiFYbMZMx3JSMNyLzwXdmZipqevrjLvcAN21MWK2nHL9r+wqdG1bPp8JO
	 WO7zp6GezHRRhRJO+vjPs8fRTHDxz84/SWCwFmPTMEfz79DpEAH/I5jK0x6Lea0S+F
	 YplK3ZMi8GeWA==
Date: Wed, 8 Mar 2023 14:18:27 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Grant Grundler <grundler@chromium.org>
Subject: Re: [PATCH] PCI/AER: correctable error message as KERN_INFO
Message-ID: <20230308201827.GA1039517@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANEJEGvB0+XTgUwJi80BRFpNYWrbtiz17baSoxcR_OpSdnzahg@mail.gmail.com>
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

On Wed, Mar 08, 2023 at 12:00:48PM -0800, Grant Grundler wrote:
> Ping? Did I miss an email or other work that this patch collides with?

Nope, we typically make topic branches based on -rc1, so not much
happens during the merge window.  -rc1 was tagged Sunday, so things
will start appearing in -next soon.

Bjorn

> On Tue, Feb 28, 2023 at 10:05 PM Grant Grundler <grundler@chromium.org> wrote:
> >
> > Since correctable errors have been corrected (and counted), the dmesg output
> > should not be reported as a warning, but rather as "informational".
> >
> > Otherwise, using a certain well known vendor's PCIe parts in a USB4 docking
> > station, the dmesg buffer can be spammed with correctable errors, 717 bytes
> > per instance, potentially many MB per day.
> >
> > Given the "WARN" priority, these messages have already confused the typical
> > user that stumbles across them, support staff (triaging feedback reports),
> > and more than a few linux kernel devs. Changing to INFO will hide these
> > messages from most audiences.
> >
> > Signed-off-by: Grant Grundler <grundler@chromium.org>
> > ---
> > This patch will likely conflict with:
> >   https://lore.kernel.org/all/20230103165548.570377-1-rajat.khandelwal@linux.intel.com/
> >
> > which I'd also like to see upstream. Please let me know to resubmit mine if Rajat's patch lands first. Or feel free to fix up this one.
> >
> >  drivers/pci/pcie/aer.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index f6c24ded134c..e4cf3ec40d66 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -692,7 +692,7 @@ static void __aer_print_error(struct pci_dev *dev,
> >
> >         if (info->severity == AER_CORRECTABLE) {
> >                 strings = aer_correctable_error_string;
> > -               level = KERN_WARNING;
> > +               level = KERN_INFO;
> >         } else {
> >                 strings = aer_uncorrectable_error_string;
> >                 level = KERN_ERR;
> > @@ -724,7 +724,7 @@ void aer_print_error(struct pci_dev *dev, struct aer_err_info *info)
> >         layer = AER_GET_LAYER_ERROR(info->severity, info->status);
> >         agent = AER_GET_AGENT(info->severity, info->status);
> >
> > -       level = (info->severity == AER_CORRECTABLE) ? KERN_WARNING : KERN_ERR;
> > +       level = (info->severity == AER_CORRECTABLE) ? KERN_INFO : KERN_ERR;
> >
> >         pci_printk(level, dev, "PCIe Bus Error: severity=%s, type=%s, (%s)\n",
> >                    aer_error_severity_string[info->severity],
> > --
> > 2.39.2.722.g9855ee24e9-goog
> >
