Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05E39CECA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:12:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb3T2KMbz304j
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb371mMzz2yWy
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb360Mmgz9sVm; Sun,  6 Jun 2021 22:12:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <7f4aaa479569328a1e5b07c96c08fbca0cd7dd88.1620307890.git.christophe.leroy@csgroup.eu>
References: <7f4aaa479569328a1e5b07c96c08fbca0cd7dd88.1620307890.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Remove asm/book3s/32/hash.h
Message-Id: <162298131735.2353459.10982027333245553692.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:37 +1000
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

On Thu, 6 May 2021 13:32:18 +0000 (UTC), Christophe Leroy wrote:
> Move the PAGE bits into pgtable.h to be more similar to book3s/64.

Applied to powerpc/next.

[1/1] powerpc/32s: Remove asm/book3s/32/hash.h
      https://git.kernel.org/powerpc/c/ca8cc36901e9bdd01d371f6236faf9f61d1325d1

cheers
