Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BED5B37B7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 14:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPFZM6Wh2z3hbc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 22:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPFF30qZ0z3cfg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 22:10:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MPFF16hkTz4xtq;
	Fri,  9 Sep 2022 22:10:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jilin Yuan <yuanjilin@cdjrlc.com>, npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au
In-Reply-To: <20220831004706.35280-1-yuanjilin@cdjrlc.com>
References: <20220831004706.35280-1-yuanjilin@cdjrlc.com>
Subject: Re: [PATCH] powerpc/xive: fix repeated words in comments
Message-Id: <166272525594.2076816.2585116952778489787.b4-ty@ellerman.id.au>
Date: Fri, 09 Sep 2022 22:07:35 +1000
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

On Wed, 31 Aug 2022 08:47:06 +0800, Jilin Yuan wrote:
> Delete the redundant word 'set'.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xive: fix repeated words in comments
      https://git.kernel.org/powerpc/c/9b135eef0787813ad073aaeb9ff80ab57bc63e69

cheers
