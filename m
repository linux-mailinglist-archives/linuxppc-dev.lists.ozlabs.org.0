Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD733C9E4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 14:12:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQYC61GV4z302G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 22:12:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQYBn6hWCz2yNb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 22:11:45 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GQYBh4VVTz9sV8; Thu, 15 Jul 2021 22:11:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
In-Reply-To: <20210712013650.376325-1-npiggin@gmail.com>
References: <20210712013650.376325-1-npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV P9: Fix guest TM support
Message-Id: <162635108191.21941.16178288289762997581.b4-ty@ellerman.id.au>
Date: Thu, 15 Jul 2021 22:11:21 +1000
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 12 Jul 2021 11:36:50 +1000, Nicholas Piggin wrote:
> The conversion to C introduced several bugs in TM handling that can
> cause host crashes with TM bad thing interrupts. Mostly just simple
> typos or missed logic in the conversion that got through due to my
> not testing TM in the guest sufficiently.
> 
> - Early TM emulation for the softpatch interrupt should be done if fake
>   suspend mode is _not_ active.
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Book3S HV P9: Fix guest TM support
      https://git.kernel.org/powerpc/c/e44fbdb68049539de9923ce4bad2d277aef54892

cheers
