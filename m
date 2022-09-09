Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E168B5B36F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFDt4jsfz3cFm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFDX0PLyz2xBl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFDW4d6Vz4xXS;
	Fri,  9 Sep 2022 22:10:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <688084b40b5ac88f2905cb207d5dad947d8d34dc.1662531153.git.christophe.leroy@csgroup.eu>
References: <688084b40b5ac88f2905cb207d5dad947d8d34dc.1662531153.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/math-emu: Inhibit W=1 warnings
Message-Id: <166272525808.2076816.12460969365372770146.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:38 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Sep 2022 08:12:54 +0200, Christophe Leroy wrote:
> When building with W=1 you get:
> 
> 	arch/powerpc/math-emu/fre.c:6:5: error: no previous prototype for 'fre' [-Werror=missing-prototypes]
> 	arch/powerpc/math-emu/fsqrt.c:11:1: error: no previous prototype for 'fsqrt' [-Werror=missing-prototypes]
> 	arch/powerpc/math-emu/fsqrts.c:12:1: error: no previous prototype for 'fsqrts' [-Werror=missing-prototypes]
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/math-emu: Inhibit W=1 warnings
      https://git.kernel.org/powerpc/c/78c73c80fd860d5b3471d8eaa2778a105a56f6ab

cheers
