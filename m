Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E63B82C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 15:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFML711pdz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 23:16:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFMK85jgrz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 23:15:24 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GFMK10pm6z9sVm; Wed, 30 Jun 2021 23:15:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <42f4bd12b476942e4d5dc81c0e839d8871b20b1c.1624863319.git.christophe.leroy@csgroup.eu>
References: <42f4bd12b476942e4d5dc81c0e839d8871b20b1c.1624863319.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix setup_{kuap/kuep}() on SMP
Message-Id: <162505885576.174506.2852417119553122234.b4-ty@ellerman.id.au>
Date: Wed, 30 Jun 2021 23:14:15 +1000
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

On Mon, 28 Jun 2021 06:56:11 +0000 (UTC), Christophe Leroy wrote:
> On SMP, setup_kup() is also called from start_secondary().
> 
> start_secondary() is not an __init function.
> 
> Remove the __init marker from setup_kuep() and and setup_kuap().

Applied to powerpc/next.

[1/1] powerpc/32s: Fix setup_{kuap/kuep}() on SMP
      https://git.kernel.org/powerpc/c/c89e632658e793fbbdcbfbe80a6c13bbf7203e9b

cheers
