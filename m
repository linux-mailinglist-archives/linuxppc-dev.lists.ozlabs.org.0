Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B19581F3391
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:43:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzZ5695szDqRs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:43:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDk2RPJzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDj5Vtzz9sTG; Tue,  9 Jun 2020 15:28:36 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <57425c33dd72f292b1a23570244b81419072a7aa.1586945153.git.christophe.leroy@c-s.fr>
References: <57425c33dd72f292b1a23570244b81419072a7aa.1586945153.git.christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/8xx: Reduce time spent in allow_user_access() and
 friends
Message-Id: <159168035023.1381411.13094899246116193614.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:36 +1000 (AEST)
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

On Wed, 15 Apr 2020 10:06:09 +0000 (UTC), Christophe Leroy wrote:
> To enable/disable kernel access to user space, the 8xx has to
> modify the properties of access group 1. This is done by writing
> predefined values into SPRN_Mx_AP registers.
> 
> As of today, a __put_user() gives:
> 
> 00000d64 <my_test>:
>  d64:	3d 20 4f ff 	lis     r9,20479
>  d68:	61 29 ff ff 	ori     r9,r9,65535
>  d6c:	7d 3a c3 a6 	mtspr   794,r9
>  d70:	39 20 00 00 	li      r9,0
>  d74:	90 83 00 00 	stw     r4,0(r3)
>  d78:	3d 20 6f ff 	lis     r9,28671
>  d7c:	61 29 ff ff 	ori     r9,r9,65535
>  d80:	7d 3a c3 a6 	mtspr   794,r9
>  d84:	4e 80 00 20 	blr
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Reduce time spent in allow_user_access() and friends
      https://git.kernel.org/powerpc/c/332ce969b763553e9c4d55069e1e15aba4ea560f

cheers
