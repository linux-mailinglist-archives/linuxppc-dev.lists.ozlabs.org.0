Return-Path: <linuxppc-dev+bounces-13059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8DDBF1A88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 15:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqxjn0FH8z303y;
	Tue, 21 Oct 2025 00:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760968444;
	cv=none; b=ibqsCUSBp47PLyykBN7+wmgUYw8Ov/UqV9O/X8GSu3EuBu+XYFTjX5DMihXBwjrmYtTRse7r/76mb4hBlFTjsxoLmM66ucIudso3/c2cOgIaIQ00vbdycNUQoNvkhgE7RGXAsgcA47KcAahNVX+wi+dC/gKwj95KAzqbPFlmuUv+YoX/IGDkYJMXU1rvdKPA04Jv0Huu9rQCTk3b8OGblse9TyK+O2FWYh3q3a8ktWtR13YTk+BxM98tbkn5lV9gDhXVmyuA0U+6fXzeLe1aicKeBnnJN5Os3uwgoQwzHW5W3eVmkSnlB3yZn6pJA80ulhgSOwivUPEh+mOdNZR19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760968444; c=relaxed/relaxed;
	bh=j0zX0r+L56/chkerh+MdInmCmHID/JZVRZW8uQVEENU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHpgTWy8BQO2ZM5FdPF/VGaGWL9tXKld91RGaJdhPAFhNtPHCphKv8P4esVSuBirmapsRU0v0zBSZ3M3xPazqeWIewJhNwIeiuUmTNBQva0fHRpY3Qpm6r2c3Y9cVHipvxUX4aIirKBDbQsDTfXCAULtkbLSRVO99OCeZT4npW41P8ca8wxeQr98jmsDZcr9ltVj72xqq0v9ByB6APovoJQB5UQvkh4BvsQ1NuX14FQunjooAklzeTvAAs7NTJ4e6f+X1JGqGJfDB0xbqG57lwiSKc/v0HJ28xAwroHxA9AuGAVnuO7jFmm46mPR+udL5U7JwN+Q8JRe7nsWmxPm2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 13434 seconds by postgrey-1.37 at boromir; Tue, 21 Oct 2025 00:54:04 AEDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqxjm10PSz3020
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 00:54:03 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 210FD20083D3;
	Mon, 20 Oct 2025 15:54:00 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 0A1E44A12; Mon, 20 Oct 2025 15:54:00 +0200 (CEST)
Date: Mon, 20 Oct 2025 15:54:00 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
Message-ID: <aPY--DJnNam9ejpT@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-4-xueshuai@linux.alibaba.com>
 <aPYKe1UKKkR7qrt1@wunner.de>
 <6d7143a3-196f-49f8-8e71-a5abc81ae84b@linux.alibaba.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d7143a3-196f-49f8-8e71-a5abc81ae84b@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 08:58:55PM +0800, Shuai Xue wrote:
> ??? 2025/10/20 18:10, Lukas Wunner ??????:
> > On Wed, Oct 15, 2025 at 10:41:57AM +0800, Shuai Xue wrote:
> > > +++ b/drivers/pci/pcie/err.c
> > > @@ -253,6 +254,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> > >   			pci_warn(bridge, "subordinate device reset failed\n");
> > >   			goto failed;
> > >   		}
> > > +
> > > +		/* Link recovered, report fatal errors of RCiEP or EP */
> > > +		if (state == pci_channel_io_frozen &&
> > > +		    (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END)) {
> > > +			aer_add_error_device(&info, dev);
> > > +			info.severity = AER_FATAL;
> > > +			if (aer_get_device_error_info(&info, 0, true))
> > > +				aer_print_error(&info, 0);
> > > +			pci_dev_put(dev);
> > > +		}
> > 
> > Where is the the pci_dev_get() to balance the pci_dev_put() here?
> 
> The corresponding pci_dev_get() is called in add_error_device(). Please
> refer to commit 60271ab044a5 ("PCI/AER: Take reference on error
> devices") which introduced this reference counting mechanism.

That is non-obvious and needs a code comment.

> > It feels awkward to leak AER-specific details into pcie_do_recovery().
> > That function is supposed to implement the flow described in
> > Documentation/PCI/pci-error-recovery.rst in a platform-agnostic way
> > so that powerpc (EEH) and s390 could conceivably take advantage of it.
> > 
> > Can you find a way to avoid this, e.g. report errors after
> > pcie_do_recovery() has concluded?
> 
> I understand your concern about keeping pcie_do_recovery()
> platform-agnostic.

The code you're adding above, with the exception of the check for
pci_channel_io_frozen, should live in a helper in aer.c.
Then you also don't need to rename add_error_device().

> I explored the possibility of reporting errors after
> recovery concludes, but unfortunately, this approach isn't feasible due
> to the recovery sequence. The issue is that most drivers'
> pci_error_handlers implement .slot_reset() which internally calls
> pci_restore_state() to restore the device's configuration space and
> state. This function also clears the device's AER status registers:
> 
>   .slot_reset()
>     => pci_restore_state()
>       => pci_aer_clear_status()

This was added in 2015 by b07461a8e45b.  The commit claims that
the errors are stale and can be ignored.  It turns out they cannot.

So maybe pci_restore_state() should print information about the
errors before clearing them?

Actually pci_restore_state() is only supposed to restore state,
as the name implies, and not clear errors.  It seems questionable
that the commit amended it to do that.

> > I'm also worried that errors are reported *during* recovery.
> > I imagine this looks confusing to a user.  The logged messages
> > should make it clear that these are errors that occurred *earlier*
> > and are reported belatedly.
> 
> You raise an excellent point about potential user confusion. The current
> aer_print_error() interface doesn't indicate that these are historical
> errors being reported belatedly. Would it be acceptable to add a
> clarifying message before calling aer_print_error()? For example:
> 
>   pci_err(dev, "Reporting error that occurred before recovery:\n");

Yes, something like that.  "Errors reported prior to reset"?  Dunno.

Thanks,

Lukas

