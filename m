Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E81334F603
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97fk2HvGz3fZD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:15:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XX5Xnzz3c71
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:20 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XX3LLNz9sjD; Wed, 31 Mar 2021 12:10:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20210223095345.2139416-1-geert@linux-m68k.org>
References: <20210223095345.2139416-1-geert@linux-m68k.org>
Subject: Re: [PATCH] powerpc/chrp: Make hydra_init() static
Message-Id: <161715296484.226945.13799552710776744820.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:24 +1100
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

On Tue, 23 Feb 2021 10:53:45 +0100, Geert Uytterhoeven wrote:
> Commit 407d418f2fd4c20a ("powerpc/chrp: Move PHB discovery") moved the
> sole call to hydra_init() to the source file where it is defined, so it
> can be made static.

Applied to powerpc/next.

[1/1] powerpc/chrp: Make hydra_init() static
      https://git.kernel.org/powerpc/c/9634afa67bfd933b231405d05dda37ffa169f32c

cheers
