Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A543262F5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:52:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmk3z61mTzDqMX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:52:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjW15hsbzDqV1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjW04ZHsz9sVk; Wed,  9 Sep 2020 23:27:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <c27bc4e598daf3bbb225de7a1f5c52121cf1e279.1597235091.git.christophe.leroy@csgroup.eu>
References: <c27bc4e598daf3bbb225de7a1f5c52121cf1e279.1597235091.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/2] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
Message-Id: <159965717070.808686.8733357237820602435.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:40 +1000 (AEST)
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

On Wed, 12 Aug 2020 12:25:16 +0000 (UTC), Christophe Leroy wrote:
> At the time being, __put_user()/__get_user() and friends only use
> D-form addressing, with 0 offset. Ex:
> 
> 	lwz	reg1, 0(reg2)
> 
> Give the compiler the opportunity to use other adressing modes
> whenever possible, to get more optimised code.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/uaccess: Use flexible addressing with __put_user()/__get_user()
      https://git.kernel.org/powerpc/c/c20beffeec3cb6f6f52d9aef27f91a3f453a91f4
[2/2] powerpc/uaccess: Add pre-update addressing to __get_user_asm() and __put_user_asm()
      https://git.kernel.org/powerpc/c/2f279eeb68b8eda43a95255db701b4faaeedbe0f

cheers
