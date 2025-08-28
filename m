Return-Path: <linuxppc-dev+bounces-11406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3F1B3936A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 07:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC9Xx2zrLz3bby;
	Thu, 28 Aug 2025 15:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756360369;
	cv=none; b=iRqU0gvne/ZHoi4cuYSSCzOSPsnZVIkBS48HsQZyJl+bN2zcIySW/L110Wr7OhsRyFiKNMpz0vvFPUn0r/OgIb3Ra3D0xQoxCjESN+Lrf3/Yr0x2g0RIppZcvbDOiQCfUsDGIU7I5ZauHlyZhp+D1Hv7QqcIPYcKV3jNEWQiQRgqcnTPkgRsjAqeRaooGesZcmWS5TmFrtH/W0ON0drEvTLmwieJkuYvbqM9wZHOoEkCspKlOB/FnmGNNYq0IeIhyyGgblS+PTGDt0jSqlKVCm/VYWWbxF2pF2x6K93gzaIHA2W2MTbJuLs5mGhg3CLClsGL1jnolB97m470a0en2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756360369; c=relaxed/relaxed;
	bh=Ztf5LwsvP6ruvGlyK7yrG4LEzIhbEayTFjsPdL+ar20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KztPPjFjmCOg7ZBoFPKgKqAplcPMFOTl6dqVeW1r/BSFNCJINZaEVe55Zwh6ikbOmWhX63it6wULq9dLNIZM5i9jm1GbQyRuNDN4sXKf/lSoz0aKcu/LVYUi4i80wIh9K/IgYZTgApP3cnf/fhxIpqmNe91UyhVAb17YZTbpXVieA+VGozsvC0GVC0gMNrdy0BWKW802GL187D5KZH8WZtQBTTp6jDnzBFSeh75+WmXDSa+ixwehxrZTOKRb098Bc0st9yM4g5Wrwd+Vlw4UVAXsXFa+3oIWR5AnGeQyAHuD/sjkBAtGuLsiZNfZHlCxRHC6isNsHBWINxIMTvilKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cC9Xv3bbCz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 15:52:45 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id D1240200B1E0;
	Thu, 28 Aug 2025 07:52:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B4137244BB4; Thu, 28 Aug 2025 07:52:40 +0200 (CEST)
Date: Thu, 28 Aug 2025 07:52:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI/AER: Support errors introduced by PCIe r6.0
Message-ID: <aK_uqHGw3B4vtx66@wunner.de>
References: <21f1875b18d4078c99353378f37dcd6b994f6d4e.1756301211.git.lukas@wunner.de>
 <64a661bd-cb64-4850-90d8-f34de9457173@linux.intel.com>
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
In-Reply-To: <64a661bd-cb64-4850-90d8-f34de9457173@linux.intel.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 27, 2025 at 12:56:41PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 8/27/25 6:41 AM, Lukas Wunner wrote:
> > PCIe r6.0 defined five additional errors in the Uncorrectable Error
> > Status, Mask and Severity Registers (PCIe r7.0 sec 7.8.4.2ff).
> 
> is 2ff a typo ?

"ff" means "and following" (pages, etc), according to:
https://en.wiktionary.org/wiki/ff

Section 7.8.4.2 is the Status Register.  The Mask and Severity Registers
are specified in the following sections 7.8.4.3 and 7.8.4.4.

Thanks,

Lukas

