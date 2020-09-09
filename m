Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31B26307A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:26:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmm863RTdzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkT0ChdzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkQ2FV7z9sVM; Wed,  9 Sep 2020 23:37:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: oprofile-list@lists.sf.net, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Colin King <colin.king@canonical.com>, Robert Richter <rric@kernel.org>
In-Reply-To: <20200804174316.402425-1-colin.king@canonical.com>
References: <20200804174316.402425-1-colin.king@canonical.com>
Subject: Re: [PATCH] powerpc/oprofile: fix spelling mistake "contex" ->
 "context"
Message-Id: <159965824316.811679.2643424244803475085.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:34 +1000 (AEST)
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

On Tue, 4 Aug 2020 18:43:16 +0100, Colin King wrote:
> There is a spelling mistake in a pr_debug message. Fix it.

Applied to powerpc/next.

[1/1] powerpc/oprofile: fix spelling mistake "contex" -> "context"
      https://git.kernel.org/powerpc/c/346427e668163e85cbbe14e4d9a2ddd49df1536c

cheers
