Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB11722E6C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:40:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWtT4vYszDqbh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:40:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFWZx5sJjzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWZx0nYSz9sRk; Mon, 27 Jul 2020 17:26:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Li RongQing <lirongqing@baidu.com>,
 christophe.leroy@c-s.fr
In-Reply-To: <1556278590-14727-1-git-send-email-lirongqing@baidu.com>
References: <1556278590-14727-1-git-send-email-lirongqing@baidu.com>
Subject: Re: [PATCH][v3] powerpc/lib: remove memcpy_flushcache redundant return
Message-Id: <159583478859.602200.832460430666465479.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:48 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Apr 2019 19:36:30 +0800, Li RongQing wrote:
> Align it with other architectures and none of the callers has
> been interested its return

Applied to powerpc/next.

[1/1] powerpc/lib: remove memcpy_flushcache redundant return
      https://git.kernel.org/powerpc/c/e2802618970566277cf5cf5c99df66f21ee83766

cheers
