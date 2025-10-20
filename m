Return-Path: <linuxppc-dev+bounces-13054-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA8BF07CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 12:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqrw11GqLz3020;
	Mon, 20 Oct 2025 21:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760955457;
	cv=none; b=Pk38mxuz20hnPqdbbpxkv8hY1ZPD8iq0A491NiGUdXu8M7MeaqMuNcOyHAetxsM+1yU81tuv75FKS/d25UnDWOu7KVOeMXlFL1rxUhFYqRbloYTSNnrTZybmUgdpID+Ll/MJZXrNpBiYQazXpYhpN9DBkq2QFMHCC3+NoZfAP4cJ8sFWyUX2vBgV8vIqch7GqXhfbmzFKPs33pROeAROFaq0CBe9+GPzlWa9fkI6Ym4WTyPJzGwHW9r6lgANwrPqw+iq+BbDe8aYz1bxoScqDoUeO189Rcx+BpqQQ5SQyyjTurm1I2poR9HZ00SoEaaLz9xcuVmPfJgdCQKxONuovw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760955457; c=relaxed/relaxed;
	bh=HXRNT1nKCnRIMInPjGW0GsvA34xv8hNqTeF79BAFpf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQAyj6OlpqTpfgm2Gi6vxgYKoJ6oOwczjACnRl0OwteYV2dl5RrAQx9/aLuDUbpucDZAlYotE+uQI/R8SDSqzRuTIgP3MZRVqd/2ZIxgZWhFS7R1AnjhGsr9c9Vv8/bKFv2O64ECRzBqDpr8YMpF085+81QcfBm3lG2v1prX3kkP/o3+6sehN/8E4X/mo4bk7brhrU70aqlXIMMg/LBx26Ayva7RiEhwTuyvo0ET92FidTSQ3i1zeB+/OzzurfCC84y59XmFk6u20GR7JMfkovFN7kbAyS5hYqXLDgYpzuXILaOuzlPSuu8UIGs1z8EYGVU0/1I9yKKRqRTV/9W6jA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqrw024cjz3000
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 21:17:36 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id D87A22C02BBC;
	Mon, 20 Oct 2025 12:17:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id BD5754A12; Mon, 20 Oct 2025 12:17:31 +0200 (CEST)
Date: Mon, 20 Oct 2025 12:17:31 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
	kbusch@kernel.org, sathyanarayanan.kuppuswamy@linux.intel.com,
	mahesh@linux.ibm.com, oohall@gmail.com, Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com, tianruidong@linux.alibaba.com
Subject: Re: [PATCH v6 4/5] PCI/ERR: Use pcie_aer_is_native() to check for
 native AER control
Message-ID: <aPYMO2Eu5UyeEvNu@wunner.de>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-5-xueshuai@linux.alibaba.com>
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
In-Reply-To: <20251015024159.56414-5-xueshuai@linux.alibaba.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 10:41:58AM +0800, Shuai Xue wrote:
> Replace the manual checks for native AER control with the
> pcie_aer_is_native() helper, which provides a more robust way
> to determine if we have native control of AER.

Why is it more robust?

Thanks,

Lukas

