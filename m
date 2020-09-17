Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCD26DAA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 13:45:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsZsX58mYzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 21:45:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSS4PWxzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSR6pGWz9sV0; Thu, 17 Sep 2020 21:27:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <346f65d677adb11865f7762c25a1ca3c64404ba5.1599216023.git.christophe.leroy@csgroup.eu>
References: <346f65d677adb11865f7762c25a1ca3c64404ba5.1599216023.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/uaccess: Add pre-update addressing to
 __put_user_asm_goto()
Message-Id: <160034201358.3339803.7851441214303980788.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:19 +1000 (AEST)
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

On Fri, 4 Sep 2020 10:46:47 +0000 (UTC), Christophe Leroy wrote:
> Enable pre-update addressing mode in __put_user_asm_goto()

Applied to powerpc/next.

[1/1] powerpc/uaccess: Add pre-update addressing to __put_user_asm_goto()
      https://git.kernel.org/powerpc/c/fcf1f26895a4f14618b0dc04e0801b123c55e4a3

cheers
