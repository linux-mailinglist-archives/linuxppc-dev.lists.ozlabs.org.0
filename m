Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF383FC928
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 15:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzTLr5rKGz2yZ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 23:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzTL3319Bz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 23:58:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GzTL30Rc2z9t0J;
 Tue, 31 Aug 2021 23:58:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210826122653.3236867-1-joel@jms.id.au>
References: <20210826122653.3236867-1-joel@jms.id.au>
Subject: Re: [PATCH 0/3] powerpc/microwatt: Device tree and config updates
Message-Id: <163041822670.889087.3318911277057471191.b4-ty@ellerman.id.au>
Date: Tue, 31 Aug 2021 23:57:06 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Aug 2021 21:56:50 +0930, Joel Stanley wrote:
> This enables the liteeth network device for microwatt which will be
> merged in v5.15.
> 
> It also turns on some options so the microwatt defconfig can be used to
> boot a userspace with systemd.
> 
> Joel Stanley (3):
>   powerpc/microwatt: Add Ethernet to device tree
>   powerpc/configs/microwattt: Enable Liteeth
>   powerpc/configs/microwatt: Enable options for systemd
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/microwatt: Add Ethernet to device tree
      https://git.kernel.org/powerpc/c/602d0f96563c2e0b8e1ddb22ac46bf7f58480d64
[2/3] powerpc/configs/microwattt: Enable Liteeth
      https://git.kernel.org/powerpc/c/ef4fcaf99cd27eb48790f2adc4eff456dbe1dec4
[3/3] powerpc/configs/microwatt: Enable options for systemd
      https://git.kernel.org/powerpc/c/3e18e271182206c996a3a7efbbe70c66307ef137

cheers
