Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B903F9A14
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0sL5QFWz3cYL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:28:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kZ63fGz3bW5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kZ19q8z9t5m;
 Fri, 27 Aug 2021 23:22:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Finn Thain <fthain@linux-m68k.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <44ab381741916a51e783c4a50d0b186abdd8f280.1629334014.git.fthain@linux-m68k.org>
References: <44ab381741916a51e783c4a50d0b186abdd8f280.1629334014.git.fthain@linux-m68k.org>
Subject: Re: [PATCH] powerpc/tau: Add 'static' storage qualifier to 'tau_work'
 definition
Message-Id: <163007014335.52768.13507331045109682641.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:43 +1000
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

On Thu, 19 Aug 2021 10:46:54 +1000, Finn Thain wrote:
> This patch prevents the following sparse warning.
> 
> arch/powerpc/kernel/tau_6xx.c:199:1: sparse: sparse: symbol 'tau_work'
> was not declared. Should it be static?
> 
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/tau: Add 'static' storage qualifier to 'tau_work' definition
      https://git.kernel.org/powerpc/c/6cd717fe9b3a787f8e8f9d0bc9b7634a9c104b3e

cheers
