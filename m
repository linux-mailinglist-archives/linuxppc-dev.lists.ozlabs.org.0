Return-Path: <linuxppc-dev+bounces-7565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D763A83756
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Apr 2025 05:48:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZY5QC64yBz30WR;
	Thu, 10 Apr 2025 13:48:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744256915;
	cv=none; b=lMjayGqQhxagTpVVRKcC25WcRraQXJOXqIKJDTYlKY7eCsp5e/cAgP6IQN3IiV9K16SjrRaLjTzGd69WNENXyobmo7DRjeenxWkkaGbXZqypoYIa93lR4k8EO0lLLAZ2ciAs0fC5GFgR+mxu4pXhcNUyKmqSi37VZn/GrQYnRfjcs2yomqdH7aWbEo9SBmN18qKKdz7X4vD/HHDEKvFpWXINO6sp2ooxBtPJ3LtC2XiVwtnFrUR5awCV/xNW2hIL0acwoM5Y3TE2xzI3+vAmbUyNxy9HgcHQIIJ9bUGTR6D6EiqdUJuRNRZ1we5jUlxdw27eO4w8jLrwI15VQBYaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744256915; c=relaxed/relaxed;
	bh=mP9JHWc0F/ypDEA+qI4URem1tBJxVJMkRZIpFfnYXmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwPkxazGo997uvaQDVcD4cO/h741F88q3HbEFdBhvHow2Ec4cE5B6sj5sGo6n9afhhhdheRlwTkzRT4PiaFpBT5noWMTxVFpXzija9Jd4wxsyX0weRVxrhyED7TYUcrwFMzcn0x31gUvt5SeXP/3P/u1T1P7t0l8SiR7WzXlWxv5qgaOkPSKtnH0pV4k/ktCGyu4HtKHfpFzj25i8zIDLfgzzryphXdhv+qMlvyzJbd8pmAuEeD33Ozo3nl4QFqG041e365tgYGUNXgVB4OAurUpD4KTLAxT1P9yONxx44MYvWf2+hjMq4pPQhP64xcksZqIKd5SojVpdx6L+MdHhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=htZtMLUj; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=htZtMLUj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZY5Q96mlVz2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 13:48:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mP9JHWc0F/ypDEA+qI4URem1tBJxVJMkRZIpFfnYXmA=; b=htZtMLUjtOdEJNyOkU6JIhuxBN
	K+yfQocgzGvePasuAsHVX8Sd4CEn2f9lYh8LkwQ8d7KMzQaShDCXzc/VsvCCxS9td57TsgRjz26yJ
	bYAj4eOatF2ARK5QVhR9WvI/IAD3UKR8t3pC1Q+bLID0VnnVmpbNMbhtkfoyFXseD8HreYHldsAcc
	g3a6vzrr3Lo+1VWJpPDL3lYfH7jmaPN2UdudwloHcp6XfCu+f9LJVOMKK30/wLsXtB7aHZu43NN/Q
	lYlODLlY8YquiVTdVZeBp30xyxnT3kvYY/toBFm2tHUpG1Up7BjNiaTADHliTWK4UZmrXSdlitrKT
	STjTgZSw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u2itr-00EQ8O-0C;
	Thu, 10 Apr 2025 11:48:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 10 Apr 2025 11:48:23 +0800
Date: Thu, 10 Apr 2025 11:48:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-crypto@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] crypto: scomp - Fix null-pointer deref when freeing
 streams
Message-ID: <Z_c_hzEyvlqA2aJP@gondor.apana.org.au>
References: <3c239727-6c46-45c2-80e7-d6853427f72c@linux.ibm.com>
 <Z_SkEnIWk8E0mLJf@gondor.apana.org.au>
 <70ef4489-dc7c-49fe-ac8e-fc0fd58e2bab@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70ef4489-dc7c-49fe-ac8e-fc0fd58e2bab@linux.ibm.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 10, 2025 at 09:15:56AM +0530, Sourabh Jain wrote:
>
> The above fix doesn't apply cleanly on next-20250409.

It should be fixed in the latest cryptodev tree:

https://web.git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=5322584385d938773cbb562db64d8423dd5fd026

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

