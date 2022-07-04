Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 053D35653E2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:40:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3lG6Sdtz3fZ1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fG37lFz3c5d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fG1kp7z4xZp;
	Mon,  4 Jul 2022 21:36:06 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <11956ec181a034b51a881ac9c059eea72c679a73.1651828453.git.christophe.leroy@csgroup.eu>
References: <11956ec181a034b51a881ac9c059eea72c679a73.1651828453.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/2] powerpc: Include asm/firmware.h in all users of firmware_has_feature()
Message-Id: <165693438809.9954.10973271301245396597.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:08 +1000
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

On Fri, 6 May 2022 11:14:24 +0200, Christophe Leroy wrote:
> Trying to remove asm/ppc_asm.h from all places that don't need it
> leads to several failures linked to firmware_has_feature().
> 
> To fix it, include asm/firmware.h in all files using
> firmware_has_feature()
> 
> All users found with:
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Include asm/firmware.h in all users of firmware_has_feature()
      https://git.kernel.org/powerpc/c/46d60bdb1283bb0f22d9480e2d6c972623cb4182
[2/2] powerpc: Don't include asm/ppc_asm.h in other headers
      https://git.kernel.org/powerpc/c/e93dee186fc95f2058b0c9d2317d8b876b8512db

cheers
