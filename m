Return-Path: <linuxppc-dev+bounces-13245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97087C043A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 05:14:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct7L712z4z30RJ;
	Fri, 24 Oct 2025 14:14:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761275679;
	cv=none; b=oSb0FbuVVkQt19gBt2gsuMfV9fnqJHIU1wpazXAqym5AHSMNDPSyKL4ezuheOXULsVJofaXU4nxXm0rEqJWelcn4ckkp3MC1D6A4bNK0u4/eve/fWfnJY6n6sFXWTqtc67r7jKpD2vKVkjDLVfkJK95+C2mpSXXcXQqrhaMKpArxxIf6FLw9homTDr+XSy4Nal+RN9UTj6Bqg7wXXWXOxRqQQnUyGu755mr+Bpu2FYFH0Qb9fO45YZW+y/DdlrVBLQp71IkYh2Rq40S58kNpE1C9+CHC4h4YMJCuZwUgk2X1u6BE4XPTkKjxxYaqGgbNWUbOA4FaKwS3FCweCKSwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761275679; c=relaxed/relaxed;
	bh=f5Sxb67nknCvEPweVVJzksKU02aksezSvPfR3JKjRGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMTF5UJEkoN5H7L43OuPRXmGGXo5VvwossqMtjSPswwiZcvDy9KRq5ZExDJVoRv3K/9StIsFQoK+vDKIvlemIflVaaitMNeZw+h02gCcqbP2TiElPkGGtvZJyE5OseMuoWItPm2IqF5SS3lp+r0NJn+bjrzjVXhmu12BYWzabnOoM9NuaKjP/hH6kh5VgVjXyBuJUvsOrSwUOiE2YPI5B/gOdaPiBekAjnwaMO6rlXHVwkn4EjP8Ia5WHOg8zDq+uKnVg/+s8x1T9w7SwbGpzzh4LMYEZhVlZDIj4fDNQQ4Iz/myg6zlr+NFIs/w1i7lM92Rk5qhNJvlwnHHQ5IbFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ct7L52446z2yl2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 14:14:37 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id D04B92C07AA5;
	Fri, 24 Oct 2025 05:14:25 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id BFD344A12; Fri, 24 Oct 2025 05:14:25 +0200 (CEST)
Date: Fri, 24 Oct 2025 05:14:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for
 native AER control
Message-ID: <aPrvEZ3X4_tiD2Fh@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
 <aPYMO2Eu5UyeEvNu@wunner.de>
 <0fe95dbe-a7ba-4882-bfff-0197828ee6ba@linux.alibaba.com>
 <aPZAAPEGBNk_ec36@wunner.de>
 <645adbb6-096f-4af3-9609-ddc5a6f5239a@linux.alibaba.com>
 <aPoDbKebJD30NjKG@wunner.de>
 <1eaf1f94-e26b-4313-b6b7-51ad966fe28e@linux.alibaba.com>
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
In-Reply-To: <1eaf1f94-e26b-4313-b6b7-51ad966fe28e@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 11:09:25AM +0800, Shuai Xue wrote:
> 2025/10/23 18:29, Lukas Wunner:
> > On Mon, Oct 20, 2025 at 10:45:31PM +0800, Shuai Xue wrote:
> > > From PCIe spec, BIT 0-2 are logged for functions supporting Advanced
> > > Error Handling.
> > > 
> > > I am not sure if we should clear BIT 3, and also BIT 6 (Emergency Power
> > > Reduction Detected) and in case a AER error.
> > 
> > AFAIUI, bits 0 to 3 are what the PCIe r7.0 sec 6.2.1 calls
> > "baseline capability" error reporting.  They're supported
> > even if AER is not supported.
> > 
> > Bit 6 has nothing to do with this AFAICS.
> 
> Per PCIe r7.0 section 7.5.3.5:
> 
>   **For Functions supporting Advanced Error Handling**, errors are logged
>   in this register regardless of the settings of the Uncorrectable Error
>   Mask register. Default value of this bit is 0b.
> 
> From this, it's clear that bits 0 to 2 are not logged unless AER is supported.

No.  It just means that if AER is supported, the Uncorrectable Error Mask
register has no bearing on whether the bits in the Device Status register
are set.  It does not mean that the bits are only set if AER is supported.

Thanks,

Lukas

