Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC93F99C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:27:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0r333PTz3f5y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kT6whFz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kS2flKz9t54;
 Fri, 27 Aug 2021 23:22:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210819125656.14498-1-clg@kaod.org>
References: <20210819125656.14498-1-clg@kaod.org>
Subject: Re: [PATCH 0/6] W=1 fixes
Message-Id: <163007014714.52768.12295409571909724728.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:47 +1000
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Aug 2021 14:56:50 +0200, Cédric Le Goater wrote:
> With this small series, I could compile the ppc kernel with W=1. There
> are certainly other configs which will need more fixes but it's a good
> start.
> 
> The last 2 patches look hacky. Christophe, could you help with these
> to find a better place to include the declarations ?
> 
> [...]

Patches 2-4 applied to powerpc/next.

[2/6] powerpc/pseries/vas: Declare pseries_vas_fault_thread_fn() as static
      https://git.kernel.org/powerpc/c/4cb266074aa17e9cafed3a92e9f43b161516569f
[3/6] KVM: PPC: Book3S PR: Declare kvmppc_handle_exit_pr()
      https://git.kernel.org/powerpc/c/cb53a93e33e108bfec00a13cd12696e1c0ccc8b6
[4/6] KVM: PPC: Book3S PR: Remove unused variable
      https://git.kernel.org/powerpc/c/b352ddae7b2ccd2cb29f495ca0a7c9b6848b623f

cheers
