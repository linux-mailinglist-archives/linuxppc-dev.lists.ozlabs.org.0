Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9DE366C33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLZD1hNVz3bty
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVN38M8z30F3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:16 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVM1nSPz9vFb; Wed, 21 Apr 2021 23:09:15 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <08511c1e92ac239f20ac88c73c59d1f8cf02e6ad.camel@linux.ibm.com>
References: <08511c1e92ac239f20ac88c73c59d1f8cf02e6ad.camel@linux.ibm.com>
Subject: Re: [PATCH] Documentation/powerpc: Add proper links for manual and
 tests
Message-Id: <161901049979.1961279.6555182263673804603.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:19 +1000
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
Cc: abali@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 18 Apr 2021 12:29:42 -0700, Haren Myneni wrote:
> The links that are mentioned in this document are no longer
> valid. So changed the proper links for NXGZIP user manual and
> test cases.

Applied to powerpc/next.

[1/1] Documentation/powerpc: Add proper links for manual and tests
      https://git.kernel.org/powerpc/c/2886e2df10beaf50352dad7a90907251bc692029

cheers
