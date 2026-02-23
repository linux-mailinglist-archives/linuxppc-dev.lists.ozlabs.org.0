Return-Path: <linuxppc-dev+bounces-17075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDhxCWqwnGmYJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:54:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96317C8F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:54:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKWl84sttz3bjb;
	Tue, 24 Feb 2026 06:54:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771876452;
	cv=none; b=LWyFaLzBnGWzTYrwUfvFNZSvxuc5xh0nRrBLqmktn3OD67UD1G83D4STIR93+PDhJV3FxCgf/1k69sfJ1bjZEOZs8hDIqGq6B71+qPmTSBAbOH3MpFUsnscTZt5sZkE7qTmVtQQqVdvikK8+kT5gCguBI0yguJ6KeclYHMVP3zHTBASS/UzGmLWCExPCrYZmqHkHAbxdTRS69VCELZrl/hXuoUKpL/3cnGGXysZGdcFQaLvvVlSkCDdQ08eJJYjdhGOYjXcK1X5z0u7Ku9VzUmmcTAxafNb5bWNXqnoNIddxqLCX/b4HLS2dtFl/T3M6SbC5kpje8iCtqiLnOyc70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771876452; c=relaxed/relaxed;
	bh=gikYi5WdMnS1kxzGiRr9SJf47bgLwIbpn3cHxQpbYhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCbruzKZzRmYM+U1cWDiVO6OZpSLOAvbOTaeP4nqBVWv9uZhcUHZWK+dc1xwfBhVZKxjLIt8DKvRyqY3EBXOnJom+SE7+NMsK9J1vISrD+zqCQAhAxO0qI4zPV30Sv8YvK3dc4t/dF+hyFrzwOF1tXSs7v7ZqoR0dahL2NOpImwIofE5fj6yCUa6KZUi0gnv3FUMyfw0CUN3lRVIDK9jndcRHCCkcX3Ga/nB+AA7KXBzKtkVX/iTtMP0Tl8ltcmKXNeG2ThTtAFzSFSghKuK7hsBzsl1ZKkKUCYbG2H4CQXTTUuMKb0TCk2JsZRFlBSlAb+Gl/myhsq8r1KvOdEXwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MmDP5cNh; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MmDP5cNh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKWl73hDlz3bfG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 06:54:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C34743F72;
	Mon, 23 Feb 2026 19:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E64C116C6;
	Mon, 23 Feb 2026 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771876449;
	bh=IYbIDZYsILBSeSQzfO40gPohBY+fqV/kQRQlYXa7IoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmDP5cNhzbQtzpC+srXO430Dbat9Mm+n1IVynUOOwTNAN2EOu6rHF/ksoeUwGnzKq
	 4hYJfbbs1uIC+MyTym2aydZMKvG6Dc57S5u7xZT/YLijukZM1yltiiAPCi5mTLgdAj
	 zwrwtLjigi9QBJTy7sql9R5wLPJL/fmwGXiAaXmQHWB3BoccUmALsCkI8ZQgNWJg5J
	 C3PbUuTJmHOqXdEJfIRElOGaREATOBk0Q10CVVySmcheIBM1I+qoVivhFl0vBiu8U/
	 s2I8Wlb9ZmJ86lzGcX8w7hPcmrgLTcI2oQrhVXrUuKEDlYki0+xy7OBti7Ic8YxjCr
	 HdMNjpyNlqc0A==
Date: Mon, 23 Feb 2026 19:54:04 +0000
From: Simon Horman <horms@kernel.org>
To: Abhilekh Deka <abhindeka@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	nnac123@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net/ibmveth: fix typo in
 ibmveth_remove_buffer_from_pool()
Message-ID: <aZywXPt0X-gnNuRe@horms.kernel.org>
References: <20260222054117.14943-1-abhindeka@gmail.com>
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
In-Reply-To: <20260222054117.14943-1-abhindeka@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17075-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[horms@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:abhindeka@gmail.com,m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:nnac123@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[horms.kernel.org:mid]
X-Rspamd-Queue-Id: 7D96317C8F7
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 11:11:17AM +0530, Abhilekh Deka wrote:
> Correct a typo in ibmveth_remove_buffer_from_pool()
> where gro_receive is misspelled in a comment.
> 
> Signed-off-by: Abhilekh Deka <abhindeka@gmail.com>

Hi,

Codespell notes that Partition is misspelt as Parttion in
the same file. Could you consider sending a v2 that fixes that too?

...

