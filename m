Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4034B62D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:32:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV9K2My5z3f4g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6914Lcz3cQY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6631Pkz4xcq;
 Tue, 15 Feb 2022 16:30:06 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, paulus@samba.org,
 mpe@ellerman.id.au, groug@kaod.org, benh@kernel.crashing.org,
 tglx@linutronix.de, christophe.leroy@csgroup.eu, clg@kaod.org,
 allison@lohutok.net
In-Reply-To: <564998101804886b151235c8a9f93020923bfd2c.1643718324.git.christophe.jaillet@wanadoo.fr>
References: <564998101804886b151235c8a9f93020923bfd2c.1643718324.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] powerpc/xive: Add some error handling code to
 'xive_spapr_init()'
Message-Id: <164490280126.270256.11152425799703453918.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:41 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Feb 2022 13:31:16 +0100, Christophe JAILLET wrote:
> 'xive_irq_bitmap_add()' can return -ENOMEM.
> In this case, we should free the memory already allocated and return
> 'false' to the caller.
> 
> Also add an error path which undoes the 'tima = ioremap(...)'
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xive: Add some error handling code to 'xive_spapr_init()'
      https://git.kernel.org/powerpc/c/e414e2938ee26e734f19e92a60cd090ebaff37e6

cheers
