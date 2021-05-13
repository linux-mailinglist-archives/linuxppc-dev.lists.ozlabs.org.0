Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC7E37FE78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 21:57:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh2WV2Ss6z3bnV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 05:57:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZRIwz8Js;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=ZRIwz8Js; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh2Vx4NDrz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 05:57:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=9ZAZ+z881JDgTJzeQAm+Bs/QG0gxkchxMNdqqahoJwQ=; b=ZRIwz8JsMo8S7kk7JJ2nYXyVn8
 i2CmwCoP+e+egCGimcWStyryMxR1DwYJifPYyMcUlVx721k9SSkIDIMItviFvzwcVkkthACsC1QtG
 maatHXBOERsuuLf62eHRpCIhDw9XI3fXHpqJOCWVbbQWqC1jR74Nnm+LP4sMnhl+4M395djjm2Xj1
 2NtwFYxdxD8zBcHtxyRn5U2iU6pgmZG2zsyQdlVRfFEaRxkp6InoHMMXAtCR1rKqkBZMl2I4WF2uM
 KJH1oX6/hZ2l9jWAl8BXd7ahfQcZ8hSlmNLwMpCTupGwj8ZbBi2vUg6EVYomPDOFMVgl6+BhGGLZ2
 GEqAIkXQ==;
Received: from c-73-157-219-8.hsd1.or.comcast.net ([73.157.219.8]
 helo=[10.0.0.253])
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lhHS9-00BUYB-13; Thu, 13 May 2021 19:57:01 +0000
Subject: Re: [PATCH] x86: Define only {pud/pmd}_{set/clear}_huge when usefull
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Mike Rapoport <rppt@kernel.org>
References: <7fbf1b6bc3e15c07c24fa45278d57064f14c896b.1620930415.git.christophe.leroy@csgroup.eu>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d18bec2b-8a6e-b218-f92b-87016db8a3a7@infradead.org>
Date: Thu, 13 May 2021 12:56:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7fbf1b6bc3e15c07c24fa45278d57064f14c896b.1620930415.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/13/21 11:27 AM, Christophe Leroy wrote:
> When PUD and/or PMD are folded, those functions are useless
> and we have a stub in linux/pgtable.h
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/x86/mm/pgtable.c | 34 +++++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 15 deletions(-)

WorksForMe. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

-- 
~Randy

