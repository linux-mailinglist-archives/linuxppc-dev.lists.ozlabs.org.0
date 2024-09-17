Return-Path: <linuxppc-dev+bounces-1422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FC97B00F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 14:23:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7LXp2QFkz2y8t;
	Tue, 17 Sep 2024 22:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726575802;
	cv=none; b=HEDhtxfqCIGn4h3yLWN7Ie4YJsoqusCqsWZ2pQBavUyFbsFGvx7miWARmpJdfOYC9qdyJQPTDowgDZNIRADZwg1OszSyGbp61b2BWi0knPhDXHtxYAvbvTw2tO7/CJRJsD6I5OmB84Fv7WR5id1E72W1CgQMfx+8e7KKxMKvujdszXifXIUYW5/dvXmpNF8StXUeu7bMleaAiV9ObbEHjl/L+9mt9dekfzEkqU0pNVbtrgOM03xu1G6Qm4sh5suWII98Q7Aeu+irQIwDdxHumbrp2cEScdaA5Ef1vUmsxC1ek89CCd/Ie50L4ujyVdcCWDOax77Mox6ung1eOZGwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726575802; c=relaxed/relaxed;
	bh=l5b1A67OP/Y2uiKoarqWCTGMlz/bG3WrxVqC/iAu3zk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Q5wznrl/ieuEyRYcIa3Ab0gGrEW4+vX02sA1T02HbCPZTZqQdH5M2DRNCKXONIiyi2dyykL4LXZvymeTWnuH50JBcvc7KNOiM6tnUVQbYYh1F5gvsf1kLtG3q7zFNsE9iAdI7I+xvRddm+4xSfSStlniTgUbRDqdymGzXxtynDYP2uMreArS5NCLDH+RQ27nRM9yorTFTYqeyJk1T0tgvYGQoq5HulHTvw32Q9QIC+aaBO8KLt4FDE1iXT/EOr/1yhysrkS9JUR/ARnjBTIZF2DqFR9w5E+kuoG62HrCeJmKhaOCzzAik5NUDTmsPD0StHA0djT9DU8Pl7xKB7Ieqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fTXFL85G; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fTXFL85G;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7LXp2FRTz2y71
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 22:23:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726575793;
	bh=l5b1A67OP/Y2uiKoarqWCTGMlz/bG3WrxVqC/iAu3zk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fTXFL85GDr5HeFSDPu9Y+CkmW/P0RtSfgEjjMiSdGzNozY6cY6Awj9UbZQKIM4xVK
	 oHB7mD9cc/nK2Al08TLCS3WY5I9NP+f2zH1Y1/7oGZoYqCmFvfvyxuXYHHdm0dtOCY
	 x1wUxpPgTp4QvAVsRc2ydkSq26k1z/ISa7Z/3g3vE6oumDWN65hlICdxIn/+NZ9XDz
	 WxmCtw8oadH1bZBzztHde+vBtDr80vypqGqWA/4HcdVJgAJqkk2a8GvcnIhku3PQeG
	 vQhBzxDO6Bw1ghmXha0BVZ54teVQW1hhXw8jLgnv+gRQB3B1UD19/4dr8rTdicEM1s
	 hcXtr6zMCWQ0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7LXd3z57z4xVV;
	Tue, 17 Sep 2024 22:23:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: christophe.leroy@csgroup.eu, segher@kernel.crashing.org, sfr@canb.auug.org.au, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, almasrymina@google.com, kuba@kernel.org
In-Reply-To: <20240916120510.2017749-1-mpe@ellerman.id.au>
References: <20240916120510.2017749-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/atomic: Use YZ constraints for DS-form instructions
Message-Id: <172657576225.2195991.10894874767253579579.b4-ty@ellerman.id.au>
Date: Tue, 17 Sep 2024 22:22:42 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Mon, 16 Sep 2024 22:05:10 +1000, Michael Ellerman wrote:
> The 'ld' and 'std' instructions require a 4-byte aligned displacement
> because they are DS-form instructions. But the "m" asm constraint
> doesn't enforce that.
> 
> That can lead to build errors if the compiler chooses a non-aligned
> displacement, as seen with GCC 14:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/atomic: Use YZ constraints for DS-form instructions
      https://git.kernel.org/powerpc/c/39190ac7cff1fd15135fa8e658030d9646fdb5f2

cheers

