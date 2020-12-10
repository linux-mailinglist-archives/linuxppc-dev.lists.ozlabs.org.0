Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6552D5BD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:33:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsFHk4N0GzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:33:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXw06GWzDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXt6Cckz9sXd; Thu, 10 Dec 2020 22:30:06 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201130152949.26467-1-fbarrat@linux.ibm.com>
References: <20201130152949.26467-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Define PCI bus speed for Gen4 and Gen5
Message-Id: <160756606022.1313423.5761047828767132156.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:06 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Nov 2020 16:29:49 +0100, Frederic Barrat wrote:
> Update bus speed definition for PCI Gen4 and 5.

Applied to powerpc/next.

[1/1] powerpc/pseries: Define PCI bus speed for Gen4 and Gen5
      https://git.kernel.org/powerpc/c/c8754c517e37270a01b0561ad46ee647a721a09b

cheers
