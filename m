Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB84B62B8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:31:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV7C2GgNz3dgf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:31:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV636lBNz30Mf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV603PpPz4y3m;
 Tue, 15 Feb 2022 16:30:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Maxim Kiselev <bigunclemax@gmail.com>
In-Reply-To: <20220121091447.3412907-1-bigunclemax@gmail.com>
References: <87czkmudh0.fsf@mpe.ellerman.id.au>
 <20220121091447.3412907-1-bigunclemax@gmail.com>
Subject: Re: [PATCH v3] powerpc: dts: t1040rdb: fix ports names for Seville
 Ethernet switch
Message-Id: <164490279229.270256.13940315690425244509.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:32 +1100
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
Cc: devicetree@vger.kernel.org, andrew@lunn.ch, vladimir.oltean@nxp.com,
 linux-kernel@vger.kernel.org, fido_max@inbox.ru, robh+dt@kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jan 2022 12:14:47 +0300, Maxim Kiselev wrote:
> On board rev A, the network interface labels for the switch ports
> written on the front panel are different than on rev B and later.
> 
> This patch fixes network interface names for the switch ports according
> to labels that are written on the front panel of the board rev B.
> They start from ETH3 and end at ETH10.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: dts: t1040rdb: fix ports names for Seville Ethernet switch
      https://git.kernel.org/powerpc/c/5ebb74749202a25da4b3cc2eb15470225a05527c

cheers
