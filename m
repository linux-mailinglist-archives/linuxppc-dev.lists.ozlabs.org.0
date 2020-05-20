Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FBE1DB0F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:06:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rqgd498LzDqgP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXC0JcmzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 20:59:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXB3T3fz9sTC; Wed, 20 May 2020 20:59:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <9fd0f9a827ebbeae64ad7a6f6c595d242f4dd5fc.1588747860.git.christophe.leroy@csgroup.eu>
References: <9fd0f9a827ebbeae64ad7a6f6c595d242f4dd5fc.1588747860.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Update email address in MAINTAINERS
Message-Id: <158997212671.943180.6637276774386432310.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 20:59:54 +1000 (AEST)
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

On Wed, 6 May 2020 06:51:59 +0000 (UTC), Christophe Leroy wrote:
> Since 01 May 2020, our email adresses have changed to @csgroup.eu
> 
> Update MAINTAINERS accordingly.

Applied to powerpc/next.

[1/1] powerpc/8xx: Update email address in MAINTAINERS
      https://git.kernel.org/powerpc/c/679d74abc4e14cb369e46f080d90f4dc8c143e65

cheers
