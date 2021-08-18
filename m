Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA03F052C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:47:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTjh3HNsz3dZQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4GqTgp3yGGz3cP2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:58 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgp1DhXz9sXN; Wed, 18 Aug 2021 23:45:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210719130614.195886-1-clg@kaod.org>
References: <20210719130614.195886-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc: use IRQF_NO_DEBUG for IPIs
Message-Id: <162929391589.3619265.4764409917800604606.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:35 +1000
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
Cc: Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 19 Jul 2021 15:06:14 +0200, Cédric Le Goater wrote:
> There is no need to use the lockup detector ("noirqdebug") for IPIs.
> The ipistorm benchmark measures a ~10% improvement on high systems
> when this flag is set.

Applied to powerpc/next.

[1/1] powerpc: use IRQF_NO_DEBUG for IPIs
      https://git.kernel.org/powerpc/c/17df41fec5b80b16ea4774495f1eb730e2225619

cheers
