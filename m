Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA67A9324
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrqyG3BXSz3fDS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrqvn48Bxz3cRR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:33:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rrqvl1R3Dz4xPd;
	Thu, 21 Sep 2023 19:33:23 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: christophe.leroy@csgroup.eu, Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <cover.1694685860.git.tanyuan@tinylab.org>
References: <cover.1694685860.git.tanyuan@tinylab.org>
Subject: Re: (subset) [PATCH v3 0/3] Kconfig: Add dependencies of POWER_RESET for pmac32
Message-Id: <169528860031.876432.1342566431743164769.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:30:00 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: falcon@tinylab.org, linux@weissschuh.net, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Sep 2023 18:09:55 +0800, Yuan Tan wrote:
> These patches are to add dependencies of POWER_RESET for pmac32.
> 
> As I have to use "savedefconfig" on the latest branch of different
> architectures, I am sending separate patches for each architecture in v3.
> 
> To simplify the enablement of the poweroff support, selecting the
> required options for CONFIG_POWER_RESET=y may make many people happy
> especially when they are using a customized config (maybe tinyconfig
> based) for a target qemu board. Without normal poweroff support from the
> kernel side, qemu will simply hang[1] there after a 'poweroff' command,
> which is a very bad experience for the automatical tests.
> 
> [...]

Patches 2 and 3 applied to powerpc/next.

[2/3] Kconfig: Add dependencies of POWER_RESET for pmac32
      https://git.kernel.org/powerpc/c/a3ef2fef198c25c1d9ac6ff89fd50230e9507207
[3/3] powerpc/config: Simplify pmac32_defconfig
      https://git.kernel.org/powerpc/c/f84b727d132c39c70208503e60149af6dd5a217f

cheers
