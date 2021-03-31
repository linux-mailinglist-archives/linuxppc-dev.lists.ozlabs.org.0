Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0DC34F5E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97ZQ2jNlz3dP9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:11:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XL1xXkz3btZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:10 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XK5m8mz9sX1; Wed, 31 Mar 2021 12:10:09 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Wolfram Sang <wsa@kernel.org>
In-Reply-To: <19e57d16692dcd1ca67ba880d7273a57fab416aa.1616085654.git.christophe.leroy@csgroup.eu>
References: <9c2952bcfaec3b1789909eaa36bbce2afbfab7ab.1616085654.git.christophe.leroy@csgroup.eu>
 <19e57d16692dcd1ca67ba880d7273a57fab416aa.1616085654.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/embedded6xx: Remove CONFIG_MV64X60
Message-Id: <161715298020.226945.1588774720251975064.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:40 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Mar 2021 17:25:07 +0000 (UTC), Christophe Leroy wrote:
> Commit 92c8c16f3457 ("powerpc/embedded6xx: Remove C2K board support")
> moved the last selector of CONFIG_MV64X60.
> 
> As it is not a user selectable config, it can be removed.

Applied to powerpc/next.

[1/1] powerpc/embedded6xx: Remove CONFIG_MV64X60
      https://git.kernel.org/powerpc/c/a329ddd472fa2af0c19a73b8658898ae7fd658ad

cheers
