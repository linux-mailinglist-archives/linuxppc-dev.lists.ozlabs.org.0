Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F369C4A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpTh0Z9Wz3c41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpPq6Gszz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:51:43 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPq557Qz4x8d;
	Mon, 20 Feb 2023 14:51:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20230210-warn-on-machine-is-before-probe-machine-v2-1-b57f8243c51c@linux.ibm.com>
References: <20230210-warn-on-machine-is-before-probe-machine-v2-1-b57f8243c51c@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/machdep: warn when machine_is() used too early
Message-Id: <167686495715.2406274.8618580728349652223.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:17 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Feb 2023 13:23:51 -0600, Nathan Lynch wrote:
> machine_is() can't provide correct results before probe_machine() has
> run. Warn when it's used too early in boot, placing the WARN_ON() in a
> helper function so the reported file:line indicates exactly what went
> wrong.
> 
> checkpatch complains about __attribute__((weak)) in the patch, so
> change that to __weak, and align the line continuations as well.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/machdep: warn when machine_is() used too early
      https://git.kernel.org/powerpc/c/388defd5e4180a48e068d7ba9b024ce0ca957968

cheers
