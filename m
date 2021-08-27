Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B03F9A17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:29:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0tC5QYgz3fTv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:29:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kh5x9sz3c6q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kf47Ktz9t1Q;
 Fri, 27 Aug 2021 23:22:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210817045407.2445664-1-joel@jms.id.au>
References: <20210817045407.2445664-1-joel@jms.id.au>
Subject: Re: [PATCH v2 0/3] powerpc: mpc855_ads defconfig fixes
Message-Id: <163007013701.52768.10491223554831404392.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:37 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Aug 2021 14:24:04 +0930, Joel Stanley wrote:
> v2: fix typos, split out mtd fix from savedefconfig patch
> 
> The first patch fixes a build warning I noticed when testing something
> unrelated.
> 
> The second fixes a regression where the MTD partition support dropped out
> of the config. I have enabled the dependency so this is still part of
> the config.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/config: Fix IPV6 warning in mpc855_ads
      https://git.kernel.org/powerpc/c/c5ac55b6cbc604ad4144c380feae20f69453df91
[2/3] powerpc/config: Renable MTD_PHYSMAP_OF
      https://git.kernel.org/powerpc/c/d0e28a6145c3455b69991245e7f6147eb914b34a
[3/3] powerpc/configs: Regenerate mpc885_ads_defconfig
      https://git.kernel.org/powerpc/c/87e0d46bf68913f4c87dba94aadc00da658a874b

cheers
