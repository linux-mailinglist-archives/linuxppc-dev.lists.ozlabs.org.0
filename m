Return-Path: <linuxppc-dev+bounces-12293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE5B59C9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 17:55:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR6183lYdz30FR;
	Wed, 17 Sep 2025 01:55:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758038108;
	cv=none; b=Exdz+wXvBmpMphPFJ05sXpKLDwqCxFL5gDZbSi+CVKXulwSFptFBssFtzQ9l5V6oSAcji9ImTzPB5wEUDDKFFeMwZl79I5fn0J/DrS3K3uIzCXbB0WRetj4yPd5Npiwo6W37g+KYi/dNEqaJrxMjBAWHZKCRbGKhN/aSXuVvGwyASE6YPb+sQqDe7xHPoUAw9S+1D7JoY7Z5FBPleMIXznVwJwt4Auf26xhODR6102W8FjiJGVhSz9xcsz8aeDFvX36kOVrbF+7nDgvYjlyj4CoArVxBKV6Fmos+OMJrNStYqmRxpRL5Z6RGOk9ajQHPC0Y1kDcm4Bm1P/4lpF873Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758038108; c=relaxed/relaxed;
	bh=8XOuvxMxdPbq3T5sJPAUR8fhtBwVltv8IANSaMsgJY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cD4rV5XHlkD06XxZMNko7TnLkft1m5oG9NqN7252tf41g8/bjNuE2sFDi+gS0Cf5PZ1zzGPssp2G9RPaa77iX+PStSBufnLm2D6c6IcXSDl/AQLjaZf8pbKtHV1j1IifXTe75iHQz6D7C9q/huuvvh2ghs++SsepLxmznhZJWNm6dbKWiSEEpIZXQ+gmcT4/BcBNyYFPElAn3Us4doKccu2aSRZab/VMLlo0Hb1zBTOnYtJ8KLTYblDx3riLuYGS43+dcCUZbXURKVNv1CsKJHDAUsvW2/CCx3CMXWQ3oUcH0mIDH733BcTZtPNXUXNoFM0plQlofZRAhVCLOBYcXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RG7kRAD2; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RG7kRAD2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cR6162T7yz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 01:55:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE04E416B2;
	Tue, 16 Sep 2025 15:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE2DC4CEEB;
	Tue, 16 Sep 2025 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758038103;
	bh=CXYoSgaS63Y+/tc9C0ims5v3zXKHr5QTlAy7T/0nUAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=RG7kRAD2GJpzmsl/wG1YZ7hRD2r3vD8Br+jFsGVErbdEbb8BAozNa2ksZfx+apq6+
	 BW6ORKblBpSyrTNrw8LeV0oIlabHKfaq/4JEFd7goi9vPSq6MYTd56tN1gMldIpn0N
	 4vkLAwAK0nafaOQjWqSMKqWiwYjf4WHQMv8Sxxs6XPqymU4FjazCM+Uhbdl9LLtgCY
	 jAWTMGi+VRCykLD3OP/wVd+hwIx09ub9b6eMxxZyU33HYijgmytgKLd8MzmgXq2tuc
	 fCd0/olnaY7Ac/+ujskMpBW8KqvF8XABsRPFliHispKm/bqd6Oh/5I5wfEeP9w1SYp
	 c3eABWjikpTng==
Date: Tue, 16 Sep 2025 10:55:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Terry Bowman <terry.bowman@amd.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2 0/4] Documentation: PCI: Update error recovery docs
Message-ID: <20250916155502.GA1801539@bhelgaas>
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
In-Reply-To: <cover.1757942121.git.lukas@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 15, 2025 at 03:50:00PM +0200, Lukas Wunner wrote:
> Fix deviations between the code and the documentation on
> PCIe Advanced Error Reporting.  Add minor clarifications
> and make a few small cleanups.
> 
> Changes v1 -> v2:
> * In all patches, change subject prefix to "Documentation: PCI: ".
> * In patch [3/4], mention s390 alongside powerpc (Niklas).
> 
> Link to v1:
> https://lore.kernel.org/all/cover.1756451884.git.lukas@wunner.de/
> 
> Lukas Wunner (4):
>   Documentation: PCI: Sync AER doc with code
>   Documentation: PCI: Sync error recovery doc with code
>   Documentation: PCI: Amend error recovery doc with DPC/AER specifics
>   Documentation: PCI: Tidy error recovery doc's PCIe nomenclature
> 
>  Documentation/PCI/pci-error-recovery.rst | 43 ++++++++++---
>  Documentation/PCI/pcieaer-howto.rst      | 81 +++++++++++-------------
>  2 files changed, 72 insertions(+), 52 deletions(-)

Applied to pci/aer for v6.18, thanks, everybody!

