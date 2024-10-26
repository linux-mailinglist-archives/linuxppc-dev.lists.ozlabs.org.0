Return-Path: <linuxppc-dev+bounces-2616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC199B1597
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2024 08:55:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xb9Qy4QGmz2yDT;
	Sat, 26 Oct 2024 17:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729925754;
	cv=none; b=i+5+rQIipSJ/3dJZ33bQq/UBoYBk48aG2KIANYO+qNBCaVd/7DSWiWiQT1pM2/lvxzR+YsBascf6fUJ0sr4oVt3UrkoRg6SzyzBBFuteZFrRaFGQyiJH3X4xuDNo07ug1NiXtO8phbyoWhOHROz5Fludm71erOhTd5H60RJwXZdwTrz9gV9xDd/R28KRtN2y+bJ7h7Ri/1+kFecANZ4O3MOmB4sfFACJM6uS4NGkZtWlwsTjfnkzv+fjP15glo4Fyvby7tEPUkNYgob8vWxWWUGT728hLY5uH+dBb5WBnxL78aRtVbRX/kyQNmvNti1PBX8gCEdJsYsAMKD9TUkLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729925754; c=relaxed/relaxed;
	bh=/Mq3fud90KAWp1yqh9QXH/sTcs1XrXUsNMckN2BVMGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmCzWK1qOCrLjogoi6gNthb+kST8RCPKvnpmTBCJ59dhPLQSryW2svWf1/Q9LkVSx2jwm1eIX7wmFQt/iuEgMcz1A0E7Si3tCsavFMv8n8XTPuEwWlBxu08Lca0GJPqBsvTFE4ISUk7NMT/DWOEnkel6M51enVGxAokY4YgH/3H/0rYerBt4aoJ1x+XLnDP6ncBFDyOj24bNqvouKh9FwnD4P3HaZ588G9r0nVQbhsWV6esYrfn+Do2RqKEuA6udoC/lI5PCfIQ8FukdYgVXqVgGQ2Pn0K2qLHGYeZZ8zU0mdWMdop5xyUd/OtAMghzW2i2BU6ZXhSJ7VmVeVPFr3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=qx3meZGc; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=qx3meZGc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xb9Qw0cbgz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 17:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/Mq3fud90KAWp1yqh9QXH/sTcs1XrXUsNMckN2BVMGw=; b=qx3meZGcBwRoHwOlHVMgHrrgvN
	AJPbYh9meTvbVeR5qDNMcePSFbWG87dwcx9b3y2Ra/H7kiy5xQwmCUzqI5BY2zZanyYSjU76g7jpJ
	6f3LxhSd7o+LthEj2doAk7D5FfkNMP85y5CB8cbk2MVDHSIzTVzLBYlUijopFwo/4oRyTgXQ1PESa
	N2ffY+FLh4FzjgwlvDN02hpGXrwTXFehNZtkNPtN74VGkyzR3VNwZ1a7gcgXIn2t8yo2iMpE9Y6I+
	MEHR09FVSXPs0jPU1SyB6OTJiCCEXUm2TI+akR4abQ78x8Ll2KUwX9glwKXRUIu09e3RDBLBLv1me
	O3EAZxig==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t4ai9-00CFur-1c;
	Sat, 26 Oct 2024 14:55:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 26 Oct 2024 14:55:45 +0800
Date: Sat, 26 Oct 2024 14:55:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
	maddy@linux.ibm.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH 1/2] crypto/nx: Rename devdata_mutex to
 devdata_spinlock
Message-ID: <ZxyScR5z4uvJ0g6r@gondor.apana.org.au>
References: <20241015105551.1817348-2-vishalc@linux.ibm.com>
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
In-Reply-To: <20241015105551.1817348-2-vishalc@linux.ibm.com>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 04:25:51PM +0530, Vishal Chourasia wrote:
> Rename devdata_mutex to devdata_spinlock to accurately reflect its
> implementation as a spinlock.
> 
> [1] v1 https://lore.kernel.org/all/ZwyqD-w5hEhrnqTB@linux.ibm.com
> 
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
>  drivers/crypto/nx/nx-common-pseries.c | 34 +++++++++++++--------------
>  1 file changed, 17 insertions(+), 17 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

