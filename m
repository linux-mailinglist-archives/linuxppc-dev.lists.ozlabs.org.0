Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6334F602
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97fM58Nlz3cmy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:15:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XX3xtRz3byG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XW0qCZz9sXV; Wed, 31 Mar 2021 12:10:18 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: dingsenjie@163.com, mpe@ellerman.id.au, paulus@samba.org,
 benh@kernel.crashing.org
In-Reply-To: <20210326115356.12444-1-dingsenjie@163.com>
References: <20210326115356.12444-1-dingsenjie@163.com>
Subject: Re: [PATCH] powerpc: powernv: Remove unneeded variable: "rc"
Message-Id: <161715298149.226945.16845685799658420054.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:41 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: dingsenjie <dingsenjie@yulong.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Mar 2021 19:53:56 +0800, dingsenjie@163.com wrote:
> Remove unneeded variable: "rc".

Applied to powerpc/next.

[1/1] powerpc: powernv: Remove unneeded variable: "rc"
      https://git.kernel.org/powerpc/c/69931cc387cca289e0415c79ce5389119670066d

cheers
