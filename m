Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E73746BC8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:29:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h3W0WQCz3cZ3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:29:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2L5bVtz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2L3sWtz4xgr;
 Wed,  8 Dec 2021 00:28:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <3eb14570612eef17e01bb67f14a4450136001794.1637840601.git.christophe.leroy@csgroup.eu>
References: <3eb14570612eef17e01bb67f14a4450136001794.1637840601.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Don't bother about .data..Lubsan sections
Message-Id: <163888361204.3690807.4937169274874065902.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:26:52 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Nov 2021 12:43:33 +0100, Christophe Leroy wrote:
> Since commit 9a427556fb8e ("vmlinux.lds.h: catch compound literals
> into data and BSS") .data..Lubsan sections are taken into account
> in DATA_MAIN which is included in DATA_DATA macro.
> 
> No need to take care of them anymore in powerpc vmlinux.lds.S
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Don't bother about .data..Lubsan sections
      https://git.kernel.org/powerpc/c/57dd3a7bdf311e4a499fe0decabcdf2484e2538a

cheers
