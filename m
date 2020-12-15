Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEEC2DABAA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:12:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwFwY6MC3zDqLT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFP91y2MzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFP90V7mz9sVM; Tue, 15 Dec 2020 21:49:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Colin King <colin.king@canonical.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20201207155420.172370-1-colin.king@canonical.com>
References: <20201207155420.172370-1-colin.king@canonical.com>
Subject: Re: [PATCH] powerpc: fix spelling mistake in Kconfig "seleted" ->
 "selected"
Message-Id: <160802920673.504444.13601215684567124032.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:49:00 +1100 (AEDT)
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 15:54:20 +0000, Colin King wrote:
> There is a spelling mistake in the help text of the Kconfig. Fix it.

Applied to powerpc/next.

[1/1] powerpc: fix spelling mistake in Kconfig "seleted" -> "selected"
      https://git.kernel.org/powerpc/c/f8a4b277c3cf39ec8efe50114924a7743cc84800

cheers
