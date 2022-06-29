Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926D55FF99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 14:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY0nK3XpGz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0n12dyZz3bpJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 22:16:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LY0mv4Wyzz4xD8;
	Wed, 29 Jun 2022 22:16:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-serial@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, netdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org, linux-can@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, chris.packham@alliedtelesis.co.nz, Sergey Shtylyov <s.shtylyov@omp.ru>
In-Reply-To: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
References: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/4] powerpc/52xx: Remove dead code, i.e. mpc52xx_get_xtal_freq()
Message-Id: <165650492719.3004956.10259665965182865650.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 22:15:27 +1000
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
Cc: Anatolij Gustschin <agust@denx.de>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Paolo Abeni <pabeni@redhat.com>, Wolfgang Grandegger <wg@grandegger.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 7 May 2022 13:01:44 +0300, Andy Shevchenko wrote:
> It seems mpc52xx_get_xtal_freq() is not used anywhere. Remove dead code.
> 
> 

Patches 1-3 applied to powerpc/next.

[1/4] powerpc/52xx: Remove dead code, i.e. mpc52xx_get_xtal_freq()
      https://git.kernel.org/powerpc/c/6d056b7254f9954522b7bb9947c8779a013d189f
[2/4] powerpc/mpc5xxx: Switch mpc5xxx_get_bus_frequency() to use fwnode
      https://git.kernel.org/powerpc/c/de06fba62af64144aca6f8a8bedbc848d2e5b440
[3/4] powerpc/52xx: Get rid of of_node assignment
      https://git.kernel.org/powerpc/c/00bcb550dc60f73d593d2dbb718c4f521c7d7be8

cheers
