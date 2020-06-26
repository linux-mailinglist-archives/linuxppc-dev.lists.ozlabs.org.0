Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0820ABB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:10:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tQ1R1XdNzDqyj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:10:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTp3LbrzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTj1HL0z9sTM; Fri, 26 Jun 2020 14:46:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <202006050717.A2F9809E@keescook>
References: <202006050717.A2F9809E@keescook>
Subject: Re: [PATCH] powerpc/mm: Fix typo in IS_ENABLED()
Message-Id: <159314672435.1150869.14310189656762356472.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:46:00 +1000 (AEST)
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
Cc: Joe Perches <joe@perches.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Jun 2020 07:18:06 -0700, Kees Cook wrote:
> IS_ENABLED() matches names exactly, so the missing "CONFIG_" prefix
> means this code would never be built.
> 
> Also fixes a missing newline in pr_warn().

Applied to powerpc/next.

[1/1] powerpc/mm: Fix typo in IS_ENABLED()
      https://git.kernel.org/powerpc/c/55bd9ac468397c4f12a33b7ec714b5d0362c3aa2

cheers
