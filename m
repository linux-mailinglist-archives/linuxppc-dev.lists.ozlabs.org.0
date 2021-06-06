Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1339CECF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:13:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb4q0tg3z3cMq
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:13:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb396P0hz2yX0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb386Pz9z9sWF; Sun,  6 Jun 2021 22:12:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <603725297466959419628ef7964aaf3417fb647d.1620363691.git.christophe.leroy@csgroup.eu>
References: <603725297466959419628ef7964aaf3417fb647d.1620363691.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/603: Avoid a pile of NOPs when not using SW LRU
 in TLB exceptions
Message-Id: <162298131614.2353459.7661512092871640787.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:36 +1000
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

On Fri, 7 May 2021 05:02:02 +0000 (UTC), Christophe Leroy wrote:
> The SW LRU is in an MMU feature section. When not used, that's a
> dozen of NOPs to fetch for nothing.
> 
> Define an ALT section that does the few remaining operations.
> 
> That also avoids a double read on SRR1 in the SW LRU case.

Applied to powerpc/next.

[1/1] powerpc/603: Avoid a pile of NOPs when not using SW LRU in TLB exceptions
      https://git.kernel.org/powerpc/c/70d6ebf82bd0cfddaebb54e861fc15e9945a5fc6

cheers
