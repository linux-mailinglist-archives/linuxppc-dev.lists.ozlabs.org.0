Return-Path: <linuxppc-dev+bounces-13247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C9C044D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 06:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct8Q26gzNz30RJ;
	Fri, 24 Oct 2025 15:03:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761278586;
	cv=none; b=lQphZ7k6H20TmyXw3G7uLTexMD03Y+Qb6B8REOReulBOv3pclArrKWq1KmwwyoEAEnZV/ZAoZSiGMCHWbVsFwBKoqw3dahlVZA0wxZlcoghFc01UOVYtXGJmLKb0Xaij1hswcS/4ZnP7OfIHo+bb3+EhHbL4F5F/5gweiRllnKI5KTEq5xgAJ4Qxz0ZwIteUZrdwOTkJNx/W72tWkc+zg5zBYIbPWVnCcOgjxHNINTXRMaKI1ovwvzlE2CM/FiCy/1Y1+c00lnbVZxmsESQS77tPeAAV3d8Sj1Vb5tN19elJ3ZRJGsEdIXPDcK+aviE8QqTJcnFnI2WY2hrgx+ky8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761278586; c=relaxed/relaxed;
	bh=0MW2XTK4f8khGCv3juldHWHRGRK+gpyUFuThKY1MM9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzdSbPc2di5AbTPIc6MXTOa7cZdKPhn0A2p6/hhPuFddQvezPjbspRAMGK1lt9nAZVdmsAQxd6yfGW9QfBsBxqMrHR+LQKuyrIzLt/wc0c5EfOwisWdGjW27NZDMRZEoLbBO05qw5OCI33pRBd4pNOGMTkFG2EMqpbFXFQvcc2z4Ajvh/exA3a7E8HToTD/nOQ+eMThiNrhbWOjKK3t74jtZhIqYEl9UDE6YDI9LCAXEta+50Lzvfj05/g8UyBZAloMgZshjkf2wQ0AE7T3FC6zEs3x+1J9xaDKLvUVCTrQpe7fCGbi2y/1zOCxkDEHjgjf/BMUBch8+AU2U+jPkEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct8Q20ZMLz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 15:03:05 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 258FA2C0163C;
	Fri, 24 Oct 2025 06:03:01 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 008A54A12; Fri, 24 Oct 2025 06:03:00 +0200 (CEST)
Date: Fri, 24 Oct 2025 06:03:00 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for
 native AER control
Message-ID: <aPr6dBDUUohRUzYg@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
 <aPYMO2Eu5UyeEvNu@wunner.de>
 <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
 <aPZAAPEGBNk_ec36@wunner.de>
 <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
 <aPoDbKebJD30NjKG@wunner.de>
 <1eaf1f94-e26b-4313-b6b7-51ad966fe28e@linux.alibaba.com>
 <aPrvEZ3X4_tiD2Fh@wunner.de>
 <91cf33b4-7f67-4f3a-b095-e8f04d8c18e9@linux.alibaba.com>
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
In-Reply-To: <91cf33b4-7f67-4f3a-b095-e8f04d8c18e9@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 11:38:10AM +0800, Shuai Xue wrote:
> The remaining question is whether it would make more sense to rename
> pcie_clear_device_status() to pci_clear_device_error_status() and refine
> its behavior by adding a mask specifically for bits 0 to 3. Here's an
> example of the proposed change:

I don't see much value in renaming the function.

However clearing only bits 0-3 makes sense.  PCIe r5.0 defined bit 6
as Emergency Power Reduction Detected with type RW1C in 2019.  The
last time we touched pcie_clear_device_status() was in 2018 with
ec752f5d54d7 and we've been clearing all bits since forever,
not foreseeing that new ones with type RW1C might be added later.

I suggest defining a new macro in include/uapi/linux/pci_regs.h
instead of using 0xf, say PCI_EXP_DEVSTA_ERR.  Then you don't
need the code comment because the code is self-explanatory.

Thanks,

Lukas

