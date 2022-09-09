Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A5C5B3780
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFR21k5zz3gZ4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:19:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDr1G4Bz3bvl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:20 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDm70svz4xc1;
	Fri,  9 Sep 2022 22:10:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, christophe.leroy@csgroup.eu, Liang He <windhl@126.com>, npiggin@gmail.com, benh@kernel.crashing.org, mpe@ellerman.id.au
In-Reply-To: <20220619070811.4067215-1-windhl@126.com>
References: <20220619070811.4067215-1-windhl@126.com>
Subject: Re: [PATCH] powerpc: kernel: Fix refcount bug in legacy_serial.c
Message-Id: <166272522961.2076816.13852480670517670306.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:09 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 19 Jun 2022 15:08:11 +0800, Liang He wrote:
> In find_legacy_serial_ports(), of_find_node_by_path() will return
> a node pointer with refcount incremented. We should use of_node_put()
> when it is not used anymore.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: kernel: Fix refcount bug in legacy_serial.c
      https://git.kernel.org/powerpc/c/d1aabbbb2564f23b66ded10d870e7859e92075a3

cheers
