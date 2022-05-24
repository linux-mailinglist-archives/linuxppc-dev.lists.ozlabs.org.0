Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F85328A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:19:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sD5341Xz3fVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:19:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7d3NPkz3bnn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7Z28Jtz4ySg;
 Tue, 24 May 2022 21:15:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
Subject: Re: (subset) [PATCH 00/30] The panic notifiers refactor
Message-Id: <165339051490.1718562.1423253645001601000.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:08:34 +1000
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

On Wed, 27 Apr 2022 19:48:54 -0300, Guilherme G. Piccoli wrote:
> Hey folks, this is an attempt to improve/refactor the dated panic notifiers
> infrastructure. This is strongly based in a suggestion made by Pter Mladek [0]
> some time ago, and it's finally ready. Below I'll detail the patch ordering,
> testing made, etc.
> First, a bit about the reason behind this.
> 
> The panic notifiers list is an infrastructure that allows callbacks to execute
> during panic time. Happens that anybody can add functions there, no ordering
> is enforced (by default) and the decision to execute or not such notifiers
> before kdump may lead to high risk of failure in crash scenarios - default is
> not to execute any of them. There is a parameter acting as a switch for that.
> But some architectures require some notifiers, so..it's messy.
> 
> [...]

Patch 8 applied to powerpc/next.

[08/30] powerpc/setup: Refactor/untangle panic notifiers
        https://git.kernel.org/powerpc/c/e2aa34ce80a26d24a0333da9402d533885f239c9

cheers
