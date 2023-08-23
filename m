Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A38397857D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW5134Jk0z3jFw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dw2s2qz3dKV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dr4kFxz4x5m;
	Wed, 23 Aug 2023 22:04:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, christophe.leroy@csgroup.eu, Yuan Tan <tanyuan@tinylab.org>
In-Reply-To: <bb7b5f9958b3e3a20f6573ff7ce7c5dc566e7e32.1690982937.git.tanyuan@tinylab.org>
References: <bb7b5f9958b3e3a20f6573ff7ce7c5dc566e7e32.1690982937.git.tanyuan@tinylab.org>
Subject: Re: [PATCH] powerpc: pmac32: enable serial options by default in defconfig
Message-Id: <169279175545.797584.11700260723575503542.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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

On Wed, 02 Aug 2023 21:41:30 +0800, Yuan Tan wrote:
> Serial is a critical feature for logging and debuging, and the other
> architectures enable serial by default.
> 
> Let's enable CONFIG_SERIAL_PMACZILOG and CONFIG_SERIAL_PMACZILOG_CONSOLE
> by default.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: pmac32: enable serial options by default in defconfig
      https://git.kernel.org/powerpc/c/0b5e06e9cb156e7e97bfb4e1ebf6acd62497eaf5

cheers
