Return-Path: <linuxppc-dev+bounces-16205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAkTC1cXc2mwsAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16205-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:38:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6E7111B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:38:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy7Xz1GF6z2xKh;
	Fri, 23 Jan 2026 17:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=180.181.231.80
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769150291;
	cv=none; b=oFV+zyEvOQKK/VOzpDf8MQ3giEcCyrhSkVSeCAyxJ02M9UF2m8EIvj8+gH8+Uoqm08D7gLwrimHcZFnvbQFnW+DMer/PxUiZ6yteuC7hRQkxZACsVTN/1BQHgQAKBjsZaQeuxP9DjBFatwhrCHyTUnltEvsP1RFz8MG7owNwVlg4xbumvpTEKwD5LgiUHJkiPpQR7vmobYMUQeFYck1+52FC7kdy2nPk3N+Xp9gdpIiVuhUZP4Vhrff/CGNkRgDvQ+IeMn//nXY/Z1s2X5KHSRQSYOpJ1nEpJqxeXhyeykwXL0jRbZeM6rrsfh+6rFRWKjwx7oQ50G9+aEmgXZAHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769150291; c=relaxed/relaxed;
	bh=RtzXpZGCFHahrFkdIvoMtF+cksQkU5NJKlrOBq+TlvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRaECz/nIqrAvbA+XzoBU4W1REll7Y8PJ2s21fi5j616JRNOaiwJDK4+s++UHBZdz13qowuKC79AIKB4QazNXc2nHilqda8MvVncLTeFJDPqsjcUr40fatwSlDssqh4kH3+7DelCzvib5lpDowSqNy88BKC9HrW6mmBV3xUMp/T72p8yYTw6xTkoFF7A2CNdp+E1OfvpomwJ28yClx0EhqWrn9FT3jrcQDq0XaTZdudgWiojXSDVlRO9sb1rnbFRa3EUpdNCQZbKqNQKmz+ELkHA1PHQdPVpfySbKIJpuNLKtOjsIeWumaZbLvckpvmAEKwJ2pWRZLG9k2J0cDrELQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=SM/p64lV; dkim-atps=neutral; spf=pass (client-ip=180.181.231.80; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=SM/p64lV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=180.181.231.80; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 2265 seconds by postgrey-1.37 at boromir; Fri, 23 Jan 2026 17:38:08 AEDT
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy7Xw5lsQz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:38:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=RtzXpZGCFHahrFkdIvoMtF+cksQkU5NJKlrOBq+TlvI=; 
	b=SM/p64lV1r/oqDXv6IiKK+J+XhrASzraHpgIi5pDQ8V+XHbYMdZ9ZU7rZJU6G6mMsv8ox+ZvTNE
	9uf5yTwA5/dzRsaEA1ROptPyNCebVGYQE5uSfNJlPIj58cun+mh5McCf5ZX9HhJ3jGem2ZvaHPnpX
	2TyYqrj3UKeOCnsy61B2kr+CMP8piBPzJNNLqvD6qRHgFdXYwxW8WmMitaqsIhmbrN+NsE2fdk8tm
	xg4GJ0LM2I8+3Qpq2igVkleWawnkfrKw7mKawHOfaXrSJzPUQcpu2UF/6qUqeT1sSI3yeUCY8KDlG
	VmWYHe0YxMSuaPlKK34OdCzL+mAl4Hsi2k3A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vjADG-001VPV-21;
	Fri, 23 Jan 2026 14:00:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 23 Jan 2026 14:00:06 +0800
Date: Fri, 23 Jan 2026 14:00:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: nx - Simplify with scoped for each OF child loop
Message-ID: <aXMOZvjqHcAfWaEz@gondor.apana.org.au>
References: <20260102125011.65046-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260102125011.65046-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,vger.kernel.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16205-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[herbert@gondor.apana.org.au,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:davem@davemloft.net,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:linux-crypto@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	NEURAL_SPAM(0.00)[0.681];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: C9E6E7111B
X-Rspamd-Action: no action

On Fri, Jan 02, 2026 at 01:50:12PM +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/crypto/nx/nx-common-powernv.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

