Return-Path: <linuxppc-dev+bounces-16807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEUwMWF3jGktpAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 13:34:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2001212454C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 13:34:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9yYS5HxSz2yFc;
	Wed, 11 Feb 2026 23:34:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.76.133.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770813276;
	cv=none; b=W1wQy9xJ+Uvzyg31/MRzcWnBS+HF9v4pNPZXqVxOEWTv6j+TbOn5P5ObznDzpQMjBYomimlKHeND8WyKmgJYnSrhMmCJ4ADyUJwbMXUfbT915+A206wN5KnkeecP24/S+WjcKRK3vqn6VtAORU4rs+4UG5Y83xTY+rRhhd7JYY7zFWTXmHs3oReOJBrZRw0ERTNZBO/RZCKlazsRDtsDFM/1XKgoUydq0lMH1ZTmHzSmjl9YRWgzMmlmTgJtGS1ZuhhPl0sBx1z9EHb0g1R+TD9k4l92gGGMMDEIGWi+MvU+yEfJtU6RuULYYm7LWn5nUEH1LV4+bNM4WTN5QndAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770813276; c=relaxed/relaxed;
	bh=vMYD5jW1yx4s1ZhXBdhWXzeo+gfEHApEmTbGTfCKaMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmeZN8LQsJsE7OxeAioNVc1eeULGtbVDsqAyIl71fzVWVeoCjClE5OgOty0Ze1XsIkWMz19a0IYr1rzVO79iXmGzuIBkD+iAcjcbGKpku+zOm9hkH4Db+FaAozvSOkq5D6kFHwGf/OOL8U7nMGZ473wbzg6nbfuS8nFCkzW7sqnUAnIZQQZLdq4EaODgtHOoNGTa3O4hEaPdTewN+73a3TjigsLMC4+nLwTqIV0QlflQ+hlwYNyIYtBpGmV1caWMZp//xed6+StwSiVWsvtXcEOl8r6mVXHuwuWlBzq9lAv+cHp35Mozdj9bVFHKzRVy6E0sQkFQpbWTgfiidKiLPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=144.76.133.112; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [144.76.133.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9yYQ61Gxz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 23:34:32 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id AA9252C05FEA;
	Wed, 11 Feb 2026 13:34:27 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 874C732273; Wed, 11 Feb 2026 13:34:27 +0100 (CET)
Date: Wed, 11 Feb 2026 13:34:27 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com,
	zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v2] PCI/AER: Only clear error bits in PCIe Device Status
 register
Message-ID: <aYx3Uy7rE6GM9xq-@wunner.de>
References: <20260211054816.22758-1-xueshuai@linux.alibaba.com>
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
In-Reply-To: <20260211054816.22758-1-xueshuai@linux.alibaba.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xueshuai@linux.alibaba.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:zhuo.song@linux.alibaba.com,m:oliver.yang@linux.alibaba.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-16807-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,huawei.com,amd.com,linux.alibaba.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2001212454C
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 01:48:16PM +0800, Shuai Xue wrote:
> +++ b/drivers/pci/pci.c
> @@ -2243,10 +2243,11 @@ EXPORT_SYMBOL_GPL(pci_set_pcie_reset_state);
>  #ifdef CONFIG_PCIEAER
>  void pcie_clear_device_status(struct pci_dev *dev)
>  {
> -	u16 sta;
> -
> -	pcie_capability_read_word(dev, PCI_EXP_DEVSTA, &sta);
> -	pcie_capability_write_word(dev, PCI_EXP_DEVSTA, sta);
> +	pcie_capability_write_word(dev, PCI_EXP_DEVSTA,
> +				    PCI_EXP_DEVSTA_CED |
> +				    PCI_EXP_DEVSTA_NFED |
> +				    PCI_EXP_DEVSTA_FED |
> +				    PCI_EXP_DEVSTA_URD);

Isn't there one too many blanks before each of the PCI_EXP_DEVSTA_* macros?

The available space would be sufficient to accommodate two macros per line,
so just 2 instead of 4 lines for the macros.

Otherwise this is:
Reviewed-by: Lukas Wunner <lukas@wunner.de>

