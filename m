Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE995A7E7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 15:18:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHl945djRz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 23:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHl6G6ZFmz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 23:15:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl6G5pM9z4xGL;
	Wed, 31 Aug 2022 23:15:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220819110430.433984-1-mpe@ellerman.id.au>
References: <20220819110430.433984-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/boot: Convert more files to use SPDX tags
Message-Id: <166195163098.45984.2776043525792290652.b4-ty@ellerman.id.au>
Date: Wed, 31 Aug 2022 23:13:50 +1000
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
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, linux-spdx@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Aug 2022 21:04:30 +1000, Michael Ellerman wrote:
> These files are all plain GPL 2.0, with a second sentence about being
> licensed as-is.
> 
> Similar to the rule in commit 577b61cee5b2 ("treewide: Replace GPLv2
> boilerplate/reference with SPDX - gpl-2.0_398.RULE").
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/boot: Convert more files to use SPDX tags
      https://git.kernel.org/powerpc/c/e01432baf6618296f4d2d557e6b4c3245a5cc3c2

cheers
