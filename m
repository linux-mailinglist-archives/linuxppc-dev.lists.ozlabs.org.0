Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA071E0659
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 07:16:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vlh46TvZzDqGG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 15:16:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VlfK3272zDqMm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 15:15:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jBlRRIPw; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49VlfJ4hjmz9sSd;
 Mon, 25 May 2020 15:15:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590383721;
 bh=GmYuIgDXbqUpvqUl8asodR/2TYm/PICGB2dDioI3BVU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jBlRRIPwPYpu65hwSsT0ks0iJYSGvjLJeFHHFphHmRyvb9gyx8/G0xg0cKgZ3+3st
 mwehdxXxmOXBFmMbCkJr0x5OeA1RdjRRCgiozJpHulHDYzk8FpjlgdRPTHHt1AzPkb
 yVPEIHhko1jt97jUGbLRJxRPjU+HSxANa5MejU4teeVhiTzEzCFS/KboVR35/lZr05
 ZLD5fIiTS/bY2ZtIi1rbmuaSuUqzPN6xMUGoXkSZ024+uW2/xVV1xfwHEqpD2i3wUP
 /mv7ibSdkelyced11GDmS/1SGOQXP3UW7OdzqHuaOH0L6EHhw43cBZJvAXtXRjjcJw
 UoQ9cR3Mscv6Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH v4 07/45] powerpc/ptdump: Limit size of flags text to 1/2
 chars on PPC32
In-Reply-To: <83a7a0cfca6198e63caf7a16839bd18454961f52.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
 <83a7a0cfca6198e63caf7a16839bd18454961f52.1589866984.git.christophe.leroy@csgroup.eu>
Date: Mon, 25 May 2020 15:15:41 +1000
Message-ID: <87h7w4fvcy.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> In order to have all flags fit on a 80 chars wide screen,
> reduce the flags to 1 char (2 where ambiguous).

I don't love this, the output is less readable. Is fitting on an 80 char
screen a real issue for you? I just make my terminal window bigger.

cheers


> No cache is 'i'
> User is 'ur' (Supervisor would be sr)
> Shared (for 8xx) becomes 'sh' (it was 'user' when not shared but
> that was ambiguous because that's not entirely right)
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/ptdump/8xx.c    | 33 ++++++++++++++++---------------
>  arch/powerpc/mm/ptdump/shared.c | 35 +++++++++++++++++----------------
>  2 files changed, 35 insertions(+), 33 deletions(-)
