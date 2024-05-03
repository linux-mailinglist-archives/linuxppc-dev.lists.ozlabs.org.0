Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1EB8BB7D2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 00:53:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oN1qhSjF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWR1Z0BN7z3vYf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 08:53:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oN1qhSjF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWR0m1SN0z3dBh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 08:53:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADA6BCE1A24;
	Fri,  3 May 2024 22:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2293C116B1;
	Fri,  3 May 2024 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714776787;
	bh=mXcYLMX35fPnLEPH9zrI4bMp+JPZC+O689bhhbTpo/o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=oN1qhSjFtfExfcxp83Bnx+pofMcdi/EXKHF/817yLrh6CgflKgvoJCwR2vGGsCl8W
	 BH3uD1m9s+Y+lFfVKyFCLD5HmKBXBd4Cv8OTNmjN8FMXOu7vHV/ktIA32LAwkmJzpb
	 SMEKKGVzYWgrVCP4JBFVtZ+bDAAWNE6BsWablP9gsqxQvdUqpRAqi7TCqG22Kg00Jr
	 TJLehTP1MnHzrOFt3RrIlDmIx/739zyd/khyjVxrI+VT/LjQ9sgoQY14/G3e88rupv
	 vnEmTJ0KBZeGyGQ7H18LOxlzu83Dc4xmNsZA+Pk979Ea1/wfmQn+bqC6qvw5vvzFk+
	 0bFWAPvc5oMAA==
Date: Fri, 3 May 2024 17:53:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v3 1/2] PCI: Add TLP Prefix reading into
 pcie_read_tlp_log()
Message-ID: <20240503225305.GA1609388@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240412133635.3831-2-ilpo.jarvinen@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024 at 04:36:34PM +0300, Ilpo Järvinen wrote:
> pcie_read_tlp_log() handles only 4 TLP Header Log DWORDs but TLP Prefix
> Log (PCIe r6.1 secs 7.8.4.12 & 7.9.14.13) may also be present.
> 
> Generalize pcie_read_tlp_log() and struct pcie_tlp_log to handle also
> TLP Prefix Log. The layout of relevant registers in AER and DPC
> Capability is not identical because the offsets of TLP Header Log and
> TLP Prefix Log vary so the callers must pass the offsets to
> pcie_read_tlp_log().

I think the layouts of the Header Log and the TLP Prefix Log *are*
identical, but they are at different offsets in the AER Capability vs
the DPC Capability.  Lukas and I have both stumbled over this.

Similar and more comments at:
https://lore.kernel.org/r/20240322193011.GA701027@bhelgaas

> Convert eetlp_prefix_path into integer called eetlp_prefix_max and
> make is available also when CONFIG_PCI_PASID is not configured to
> be able to determine the number of E-E Prefixes.

s/make is/make it/

I think this could be a separate patch.

> --- a/include/linux/aer.h
> +++ b/include/linux/aer.h
> @@ -20,6 +20,7 @@ struct pci_dev;
>  
>  struct pcie_tlp_log {
>  	u32 dw[4];
> +	u32 prefix[4];
>  };
>  
>  struct aer_capability_regs {
> @@ -37,7 +38,9 @@ struct aer_capability_regs {
>  	u16 uncor_err_source;
>  };
>  
> -int pcie_read_tlp_log(struct pci_dev *dev, int where, struct pcie_tlp_log *log);
> +int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
> +		      unsigned int tlp_len, struct pcie_tlp_log *log);
> +unsigned int aer_tlp_log_len(struct pci_dev *dev);

I think it was a mistake to expose pcie_read_tlp_log() outside
drivers/pci, and I don't think we should expose aer_tlp_log_len()
either.

We might be stuck with exposing struct pcie_tlp_log since it looks
like ras_event.h uses it.

Bjorn
