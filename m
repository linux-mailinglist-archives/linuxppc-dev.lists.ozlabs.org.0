Return-Path: <linuxppc-dev+bounces-14469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B335BC82BF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 23:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFh2r3Wgsz2yvG;
	Tue, 25 Nov 2025 09:54:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764024852;
	cv=none; b=LFndoZ12sVNb7ngPZXWSyYmUONDcyLsMmHDGRZSq6cWq7Rfl3/Iw08mSsAc+Pcnnoz1i5JhFG9F9VN/wB35rxkNGcGiBj3edD6fC/3bzqoI6o0rqmtjMgLDFjihejpvXSDqhdh0GHVhVR9mJ2taRPZjYAY15lGqW5dkgRcCfP1dEQ3qicSCBwQfFYoo/0l9CMHja6/BIgodxVuXFuGxL8qSqa7NArD4VTRtHZpuKXvqne8OaR8evhVFfQ7Zr5EZmwUkIp5sv39vbtKWJ68f9tHit3gkphE7iu/yhh2IGA3IEdL5oQMAtAXr+gdY+fTj/vq6YwjYKZaYADdPPQCl3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764024852; c=relaxed/relaxed;
	bh=IMQZZc229/p8j9nU1Ps5Zl1WhyTcm9nve++WfAVIKKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oz+CpdHOq+H530C/Y1bQXRadYbBmTlC8kdzPvg20ZITOognAxoH69JlBj2irr0OZLg1N3xQDKZSg/icLoQ9EK/1ny561ViP2lQJK0Vk7elOVtWTLOSqyzCw5/OIz3c+OAklL4laUv4FbqnW4fonpS9Q9DDVNwPyby2MlC6cdKM5LVL7DqykPuzxz4zfIuS/Ne4HBkMd4Rikqs3hRckN9I+xjOKDmJFlMoUcvDIJ7PG6Z5ywxsii+hRc60hckiMM19KtQJwh14x3tMZ9noXfiDQeGbCa/fQfxl875rgr96m09nF2KTY+lqjo+Mg3hPr2XEw5I6hoI0lZbytQv79tKEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PVbK/YME; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PVbK/YME;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFh2q4kc9z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 09:54:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F45444069;
	Mon, 24 Nov 2025 22:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC06C4CEF1;
	Mon, 24 Nov 2025 22:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764024849;
	bh=BC240MSG5119oWxbshF7QWyxMleqYZRlgI7AAnOCTdY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PVbK/YMEeFuUggJRkgUcS3aXBbXzFLLmnI9Brc13WJokHXTPMhfDuDlBRVQOl6rc5
	 ZrxqKA1UwL2Cw6SQp3Au8/i6ZF2l9MsRWpKpA53AB4ugMv72ZtgdThE01kKplr9qh1
	 ZDibUZxdWpGKxUfxJFWaSFnKyk63+JtA/T//NDjKOyJgd3B+ogw1kKlSOL7LlqllBU
	 BB+OPy6QP8OUNjvFuy7WDO31rgQa4T8KuojwFHwvF4w/qrExQ/AsVtmBfvY5zYyjtW
	 x2E+Xl+Uh1W+PYrBnnOz8GBwKjEJBz85qUHgu0805EARDNHoNRxbI4Pb0v0EUiFJ2i
	 pyyLCSNUbFHpQ==
Date: Mon, 24 Nov 2025 16:54:07 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Farhan Ali <alifm@linux.ibm.com>,
	Benjamin Block <bblock@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
	Linas Vepstas <linasvepstas@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: PCI: Amend error recovery doc with
 pci_save_state() rules
Message-ID: <20251124225407.GA2722237@bhelgaas>
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
In-Reply-To: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 21, 2025 at 06:31:17PM +0100, Lukas Wunner wrote:
> After recovering from a PCI error through reset, affected devices are in
> D0_uninitialized state and need to be brought into D0_active state by
> re-initializing their Config Space registers (PCIe r7.0 sec 5.3.1.1).
> 
> To facilitate that, the PCI core provides pci_restore_state() and
> pci_save_state() helpers.  Document rules governing their usage.
> 
> As Bjorn notes, so far no file in "Documentation/ includes anything about
> the idea of a driver using pci_save_state() to capture the state it wants
> to restore after an error", even though it is a common pattern in drivers.
> So that's obviously a gap that should be closed.
> 
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/r/20251113161556.GA2284238@bhelgaas/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Applied with Rafael's ack to pci/err for v6.19, thanks!

> ---
>  Documentation/PCI/pci-error-recovery.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
> index 5df481a..43bc4e3 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -326,6 +326,21 @@ be recovered, there is nothing more that can be done;  the platform
>  will typically report a "permanent failure" in such a case.  The
>  device will be considered "dead" in this case.
>  
> +Drivers typically need to call pci_restore_state() after reset to
> +re-initialize the device's config space registers and thereby
> +bring it from D0\ :sub:`uninitialized` into D0\ :sub:`active` state
> +(PCIe r7.0 sec 5.3.1.1).  The PCI core invokes pci_save_state()
> +on enumeration after initializing config space to ensure that a
> +saved state is available for subsequent error recovery.
> +Drivers which modify config space on probe may need to invoke
> +pci_save_state() afterwards to record those changes for later
> +error recovery.  When going into system suspend, pci_save_state()
> +is called for every PCI device and that state will be restored
> +not only on resume, but also on any subsequent error recovery.
> +In the unlikely event that the saved state recorded on suspend
> +is unsuitable for error recovery, drivers should call
> +pci_save_state() on resume.
> +
>  Drivers for multi-function cards will need to coordinate among
>  themselves as to which driver instance will perform any "one-shot"
>  or global device initialization. For example, the Symbios sym53cxx2
> -- 
> 2.51.0
> 

