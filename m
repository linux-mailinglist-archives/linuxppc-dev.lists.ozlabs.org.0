Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD274442D3C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:52:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7YD4w0dz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:52:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7G80BGQz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7G73Wdkz4xdn;
 Tue,  2 Nov 2021 22:38:55 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211021105657.72572-1-u.kleine-koenig@pengutronix.de>
References: <20211021105657.72572-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] powerpc: mpc8349emitx: Make mcu_gpiochip_remove() return
 void
Message-Id: <163584792173.1845480.8901860932693104869.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:12:01 +1100
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 21 Oct 2021 12:56:57 +0200, Uwe Kleine-König wrote:
> Up to now mcu_gpiochip_remove() returns zero unconditionally. Make it
> return void instead which makes it easier to see in the callers that
> there is no error to handle.
> 
> Also the return value of i2c remove callbacks is ignored anyway.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: mpc8349emitx: Make mcu_gpiochip_remove() return void
      https://git.kernel.org/powerpc/c/5d354dc35ebb0b224d627264c60f60dbda3a1bc3

cheers
