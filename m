Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F81E5B37B6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFYy3yqMz3hly
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:25:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFF13qXgz3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFF12dm6z4xtd;
	Fri,  9 Sep 2022 22:10:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Julia.Lawall@inria.fr, christophe.leroy@csgroup.eu, Jilin Yuan <yuanjilin@cdjrlc.com>, npiggin@gmail.com, gustavoars@kernel.org, mpe@ellerman.id.au
In-Reply-To: <20220831004914.37055-1-yuanjilin@cdjrlc.com>
References: <20220831004914.37055-1-yuanjilin@cdjrlc.com>
Subject: Re: [PATCH] powerpc/vas: fix repeated words in comments
Message-Id: <166272525491.2076816.12659916420695750455.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:34 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Aug 2022 08:49:14 +0800, Jilin Yuan wrote:
> Delete the redundant word 'the'.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/vas: fix repeated words in comments
      https://git.kernel.org/powerpc/c/0d4bb5e45aa698f2f357b1424b842bebe13b1c8b

cheers
