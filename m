Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CBB77DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 12:54:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yty80fzBzF34J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 20:54:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YtKZ6sBdzF4YG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 20:25:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46YtKW5XYJz9s4Y; Thu, 19 Sep 2019 20:25:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46YtKW0Z7hz9sN1; Thu, 19 Sep 2019 20:25:50 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: aa497d4352414aad22e792b35d0aaaa12bbc37c5
In-Reply-To: <c02ce4a573f3bac907e2c70957a2d1275f910013.1567605586.git.segher@kernel.crashing.org>
To: Segher Boessenkool <segher@kernel.crashing.org>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Add attributes for setjmp/longjmp
Message-Id: <46YtKW0Z7hz9sN1@ozlabs.org>
Date: Thu, 19 Sep 2019 20:25:50 +1000 (AEST)
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

On Wed, 2019-09-04 at 14:11:07 UTC, Segher Boessenkool wrote:
> The setjmp function should be declared as "returns_twice", or bad
> things can happen[1].  This does not actually change generated code
> in my testing.
> 
> The longjmp function should be declared as "noreturn", so that the
> compiler can optimise calls to it better.  This makes the generated
> code a little shorter.
> 
> Signed-off-by: Segher Boessenkool <segher@kernel.crashing.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/aa497d4352414aad22e792b35d0aaaa12bbc37c5

cheers
