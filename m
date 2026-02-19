Return-Path: <linuxppc-dev+bounces-16953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIwxKW1nl2nfxwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 20:41:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1D0162160
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 20:41:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH3fK2ZGhz30GV;
	Fri, 20 Feb 2026 06:41:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771530089;
	cv=none; b=nokGvaLaaVY1NJn3PfdMo+ZxOtyJaouDPIoCm6c81umzTLMeuloJCJoFCHCjEZPbkq++soa8v70bWvX3Rwn/SGs/8zR8uKsxCqdHMSnNjcfNVL0+QzKEYUDIaoEKlPjw3SrUV9Tg0YaznjRU7OdiJZO5x+ZCg657MH0uxYgAcpsPfoNakdeGcw9Qm0iMQO0xP7+B8e4tN+VxgWvlL8hpeCQa5cjkvnkUq1ZrY/KaASCoaI1uPlM1tTMfuuzXJx8ZfqVlHH8Vv3hxEVK4qmFIIWyrGh6CB7ixJFjZbPow+k7/UkOYDvldXEB34tPQMJlWYj/GNIy7ka6SpYaS487BiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771530089; c=relaxed/relaxed;
	bh=L3w7pmw/wKbb3HtA7ljGzrXlBgApnedzk1FmbGFZepk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lvGtuaaOeEPdrZ4CP8yNsJOI8sGn72/UI5GuqyY+WkT+C85MvDpYq1ULanH28s6bWEvJ9esfQsAkPh2Hoq51NkF+YOrKxgcQNQNXzQ2tzHm2EII5aESIwIf2F7BUNFLq9S0IYewNwIvAv+Vcd/Wbg7/IGs15BgIUmZEWF6NPLePv740qwZV5zQIgqaxMx+euntjqXVb9O5EHN2AbRYihEG/N6ylff7strZqfdbDVMMeVxDwJvs0AT/CQJayhZmNJb3JiyVtf8QcACh8C+Is+xE5J8HGeRqXLx/GEPpHVr/c+wdgtD0gl6uS9MHsNsL/jzbJu+L5nZWo0RX2QNSyBAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mkl2KvYU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mkl2KvYU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH3fJ37vjz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 06:41:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27BBB60054;
	Thu, 19 Feb 2026 19:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2130C4CEF7;
	Thu, 19 Feb 2026 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530083;
	bh=X/YpBpZHELPnaJx/3vhuFsswpFYW6glhYMozRGxU4LA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mkl2KvYUp1F20IHclNSctcmg7lauq73IyKRQVwNswPbGoI6InqBDg3hg3+ZZjrC5+
	 5xmyGuTkpEHJV0pwMOSQD/AGbI7y/Gfu2tlqomWKRqJxzs0k7iyB5FgUZmbvEJN1Jr
	 143Utb+tQnNMyiVaUvN5yMocMVNw6pxSL0gpl782Qnl4kmKLvcRuzlSKeI/6HvCO0O
	 cEdBu7hbLoRa5DdaMkj5qAYzVx+cSc6FNnedSBfqttW3KBbws4+0p75nGaviS2XlKy
	 /DcvgKUxO7GDfsM+RyLVLnUcTPCg3V0w1icecFDyLIzQuKI5jIz6oCCYC+oui9lbvo
	 ctR3U1d0NfrUQ==
Date: Thu, 19 Feb 2026 11:41:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: linux-kernel@vger.kernel.org, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Andrew Morton <akpm@linux-foundation.org>, Antoine Tenart
 <atenart@kernel.org>, Christian Brauner <brauner@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Geetha sowjanya <gakula@marvell.com>, Ingo Molnar <mingo@kernel.org>, James
 Clark <james.clark@linaro.org>, Jerin Jacob <jerinj@marvell.com>, Linu
 Cherian <lcherian@marvell.com>, Lukasz Luba <lukasz.luba@arm.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Mike Leach <mike.leach@linaro.org>, Moritz Fischer <mdf@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Simon Horman
 <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Subbaraya Sundeep
 <sbhatta@marvell.com>, Sunil Goutham <sgoutham@marvell.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Tom Rix <trix@redhat.com>, Xu Yilun
 <yilun.xu@intel.com>, Yajun Deng <yajun.deng@linux.dev>, Yury Norov
 <yury.norov@gmail.com>, Zhang Rui <rui.zhang@intel.com>, hariprasad
 <hkelam@marvell.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 00/12] cleanup bitmaps printing in sysfs
Message-ID: <20260219114120.0f4408f7@kernel.org>
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16953-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ynorov@nvidia.com,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev
 @lists.ozlabs.org,m:netdev@vger.kernel.org,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kuba@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 1C1D0162160
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 13:13:52 -0500 Yury Norov wrote:
>  .../marvell/octeontx2/af/rvu_debugfs.c        | 28 +++----------
>  drivers/net/ethernet/meta/fbnic/fbnic_tlv.c   |  6 +--
>  drivers/s390/net/qeth_core_main.c             |  6 +--
>  net/core/net-sysfs.c                          |  2 +-

Please split these changes out and submit them to the correct subsystem
after the merge window. Then push patch 12 during the next merge window.

