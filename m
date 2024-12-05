Return-Path: <linuxppc-dev+bounces-3816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB57F9E511D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 10:20:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3plq63Zwz2yN8;
	Thu,  5 Dec 2024 20:20:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733390455;
	cv=none; b=E+B/T1UjuDMzCzDVdqXixNLv+rfJWkoF4BvGuBLEd19443p/zDphqPNxsrA+2Dh3XZUZm4H89kbBJaGlP8uDJKH/6l4S5rZKmOsjKLV5cl77uvDwcsFhhPrqCi+BJbOIrVONiPF8WxHkZw0r1dE2OVxhi6qaPqAsK9DDVR5oX/PWucnkUSLWzFbbY72E/0TcCgaN2HFpIKOIHHjP5PGHI7PzuyVKU7yG4gikbKyylBZGZrRpdaLO+VvP/Mb/fOzhLJYtbqNp9hUGDN4Fl0qwQXSy8pGYtq4SV700AwpvvcxwU/UpqomassbY7JBSY/MmPWk5UgwxBylzuTkDS5UzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733390455; c=relaxed/relaxed;
	bh=c/UOd8x6OcqXW5b87dKk0GL/9lzpM9hop8CFOAehcc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S62/BV/Zsz2Qv9fWcgFdgMmNMSUE2gIqTP3p59OWbGifw+abytjnsgpsjLW17e6THE/1w3QcFymHikF/8CAw/NBeB0rgFVzY/DVeyjGK0+tO4ErdA0MnCYx+3YIw7YBjmBbUq23b/l42Fw5h/1TPZHiBNJr1YAU+0ZV4uELdozrVlx+aHs/rjX2gCtG1lFFXOo+epXwIgG+AlFGMA+jkYEJsuGPooMf0zs8f0uTUOVcbB1488E/qfACvBUB/GXSHLlTZm7WhRflm9U3gFW2j4gM0X/dnXRvXv6sEsjDWaTmc0bWATj0la/ljykDg/nQYeVyWMv0WEr/ZFytvQo/Cvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FckA/XhE; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FckA/XhE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=tzungbi@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3plq04YLz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 20:20:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C1DD1A42ACD;
	Thu,  5 Dec 2024 09:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F67C4CED1;
	Thu,  5 Dec 2024 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390451;
	bh=nTGcyP5TWqKkb/7pYPENZ/fK1fUzm0PIWV3HS1RjUT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FckA/XhEBXlPxwegqKxBpM73IRBGuzt3kdUlQ7UoVpM0uuErWu2SLF/Om7q/p3TN6
	 QxPlg5gtraLnA4s9WR7YAm8Xi306+PDHTC8201ZTUbWILRnpUwz2vqO6PUqTyjFV4B
	 WrXxEprcUM/0qUJYoGNXDwiZuVM83peC0iPSPZTiauumz6YExWKVXeeJYDq/gUuAye
	 h0CmJPcpU7MYrbp8daUSViMGem8rdaO5IXqMlt7ML1E6K8kuK4ipneTX8n0XHKB8PS
	 eL/m2waMKSo4x9+GkJylk0Z1GP4/FpgZ1kiZfZQnygKw2s8+NSyeqlihLdhPCAW8Mc
	 jPF+61mADDk7A==
Date: Thu, 5 Dec 2024 09:20:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, chrome-platform@lists.linux.dev,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/5] s390/sclp_config: use BIN_ATTR_ADMIN_WO() for
 bin_attribute definition
Message-ID: <Z1FwbmLjJVBAfK5l@google.com>
References: <20241202-sysfs-const-bin_attr-admin_wo-v1-0-f489116210bf@weissschuh.net>
 <20241202-sysfs-const-bin_attr-admin_wo-v1-2-f489116210bf@weissschuh.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241202-sysfs-const-bin_attr-admin_wo-v1-2-f489116210bf@weissschuh.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 02, 2024 at 08:00:37PM +0100, Thomas Weiﬂschuh wrote:
> Using the macro saves some lines of code and prepares the attribute for
> the general constifications of struct bin_attributes.
> 
> While at it also constify the callback parameter.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

