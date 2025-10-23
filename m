Return-Path: <linuxppc-dev+bounces-13198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81151C0079B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 12:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csj1x3xjqz3bd0;
	Thu, 23 Oct 2025 21:29:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761215349;
	cv=none; b=RTsQ3kTxwekOkgLAAVRSMW2llFFFcuVJdQle3JA4kKz1syguOusRs84HlYIhhUwblECdwfwhP0dAMNpaIReKUZtTdIZqXInPHjKlOb0ZmNQvLWR2ml6kfM1kYiHeOMgnoICQCs5kM9z3kn4WNQZeIE629FzR/ln0shhul4qhOxVBz32ULEODIClgrImQeNyB4gGYmIpptsGYy97hoLkOG2QcblCYssX4mOTCjb6IIJh/54EiZEdYeI+DxDapZIcEuxSdgspmL4olpPygtTe7t+UctZ/TPig/BP7oI1pTQRZwmfp/a2T3JHMz9iIF1ErrOLtK3Zuk9DFcgDJx0EgEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761215349; c=relaxed/relaxed;
	bh=M655niNu1F60oMsz8OIWvZ23nx9ADbBehej1FpVvA8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjaIG3X7vgkCg/MnNIf+UdM4LBsscxHGCLIXtxauopsDVerHWy9JnytK4x5SkOPVYa0EOOj0zxwMI9ox7FHl+SrB1WrM2TOnLT078CxvpiVkGZUKPvNyn0oXKYR5u9TMGzZElQiZIeJPMYvqk0pYNfYVxzJzC6cLoJrUx8wd8pTuPXiVsvlA/xYkNt/cjV/iaEvUH7PoO+5W+C2ynyNLf0PgFHlkMrf7QMnutSA3t9CrNZYbinxZD0wDeEn+orYm9ZhUq1CKucgzp4u6EIyYpIpXyvI1WIwZw1yOO3+ZXLzT+AuGaVXZSX/gJaeo3rXsipnEn8I/fFkIaqBfjwEOTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csj1w21qSz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 21:29:06 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id E9931200C2CB;
	Thu, 23 Oct 2025 12:29:00 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D4EA64A12; Thu, 23 Oct 2025 12:29:00 +0200 (CEST)
Date: Thu, 23 Oct 2025 12:29:00 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for
 native AER control
Message-ID: <aPoDbKebJD30NjKG@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
 <aPYMO2Eu5UyeEvNu@wunner.de>
 <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
 <aPZAAPEGBNk_ec36@wunner.de>
 <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
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
In-Reply-To: <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 20, 2025 at 10:45:31PM +0800, Shuai Xue wrote:
> 	if (host->native_aer || pcie_ports_native) {
> 		pcie_clear_device_status(bridge);
> 		pci_aer_clear_nonfatal_status(bridge);
> 	}
> 
> This code clears both the PCIe Device Status register and AER status
> registers when in native AER mode.
> 
> pcie_clear_device_status() is renamed from
> pci_aer_clear_device_status(). Does it intends to clear only AER error
> status?
> 
> - BIT 0: Correctable Error Detected
> - BIT 1: Non-Fatal Error Detected
> - BIT 2: Fatal Error Detected
> - BIT 3: Unsupported Request Detected
> 
> From PCIe spec, BIT 0-2 are logged for functions supporting Advanced
> Error Handling.
> 
> I am not sure if we should clear BIT 3, and also BIT 6 (Emergency Power
> Reduction Detected) and in case a AER error.

AFAIUI, bits 0 to 3 are what the PCIe r7.0 sec 6.2.1 calls
"baseline capability" error reporting.  They're supported
even if AER is not supported.

Bit 6 has nothing to do with this AFAICS.

Thanks,

Lukas

