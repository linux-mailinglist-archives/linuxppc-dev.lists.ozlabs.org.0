Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C771FCF5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 16:18:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n6cC5KZRzDq6k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 00:18:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n6VT0xR3zDqth
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 00:13:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SxAHuubO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49n6VR1MmCz9sRf;
 Thu, 18 Jun 2020 00:13:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592403200;
 bh=iKIq8vuYeYX0Liw4N1hUdZiiIKKAWR4aRgSKwYCo4VU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SxAHuubOLTxXEBrKZxUGgkOv8/nYpMumvh7ICW2/2wVzLDnDbDd6MLaJ8ygYP5CBc
 3RzbyVwNnFrQhvPChoX94B0TVOMOjbHKC3OPSSoZscEyAmtIbsfIfen2waMuGmx01A
 mUt6pGk7kzqo+FzmX89QPR97jG6AnB/MNDDeNCjg0Fvl3fOelQk8w8pI1WJWJvQYNm
 06ipbGO6rHZs/5xywfkrK3cFItbvH9K9MsnPtQipCZa64HA/H5//iunD4Xw0Hyx1sJ
 Fv0imAEyiD/9VTj4mmRZMfJIMglU0jbeXswqj1HjOzwOIorDnwsH49nAH+jK0WNuSX
 RSuTm1LS9eJTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>
Subject: Re: [PATCH 0/3] Fix build failure with v5.8-rc1
In-Reply-To: <cover.1592225557.git.christophe.leroy@csgroup.eu>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
Date: Thu, 18 Jun 2020 00:13:45 +1000
Message-ID: <871rmdeq5i.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Commit 2ab3a0a02905 ("READ_ONCE: Enforce atomicity for
> {READ,WRITE}_ONCE() memory accesses") leads to following build
> failure on powerpc 8xx.

I've put this in my fixes branch.

cheers
