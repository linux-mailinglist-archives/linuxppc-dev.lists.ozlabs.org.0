Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0EC1296B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:03:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPl320NGzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 18:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKf75WgzDqQ0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKf4xjRz9sBr; Fri,  3 May 2019 16:59:34 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 5d085ec04a000fefb5182d3b03ee46ca96d8389b
X-Patchwork-Hint: ignore
In-Reply-To: <1540905715-4266-1-git-send-email-tsu.yubo@gmail.com>
To: Bo YU <tsu.yubo@gmail.com>, benh@kernel.crashing.org, paulus@samba.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] arch: fix without checked-return value with lseek
Message-Id: <44wNKf4xjRz9sBr@ozlabs.org>
Date: Fri,  3 May 2019 16:59:34 +1000 (AEST)
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
Cc: Bo YU <tsu.yubo@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2018-10-30 at 13:21:55 UTC, Bo YU wrote:
> lseek should have returned value but we miss it maybe.
> This is detected by Coverity scan:
> CID: 1440481
> 
> Signed-off-by: Bo YU <tsu.yubo@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5d085ec04a000fefb5182d3b03ee46ca

cheers
