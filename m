Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C53B82BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 15:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFMKT00NBz3bXl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 23:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFMK51ryQz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 23:15:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GFMK24Y0Xz9sVp; Wed, 30 Jun 2021 23:15:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8ee05934288994a65743a987acb1558f12c0c8c1.1624969450.git.christophe.leroy@csgroup.eu>
References: <8ee05934288994a65743a987acb1558f12c0c8c1.1624969450.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/4xx: Fix setup_kuep() on SMP
Message-Id: <162505885820.174506.3727018626821602076.b4-ty@ellerman.id.au>
Date: Wed, 30 Jun 2021 23:14:18 +1000
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

On Tue, 29 Jun 2021 12:24:21 +0000 (UTC), Christophe Leroy wrote:
> On SMP, setup_kuep() is also called from start_secondary() since
> commit 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").
> 
> start_secondary() is not an __init function.
> 
> Remove the __init marker from setup_kuep() and bail out when
> not caller on the first CPU as the work is already done.

Applied to powerpc/next.

[1/1] powerpc/4xx: Fix setup_kuep() on SMP
      https://git.kernel.org/powerpc/c/fc4999864bca323f1b844fefe1b402632443c076

cheers
