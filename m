Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4475850DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSsx5v54z3fcR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSlw1kbjz3fJ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:19:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSlw0mMVz4xG7;
	Fri, 29 Jul 2022 23:19:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@samba.org, Jason Wang <wangborong@cdjrlc.com>
In-Reply-To: <20220715035250.5978-1-wangborong@cdjrlc.com>
References: <20220715035250.5978-1-wangborong@cdjrlc.com>
Subject: Re: [PATCH] powerpc/sysdev: Fix comment typo
Message-Id: <165909977971.253830.8297331374740310382.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:59 +1000
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
Cc: nick.child@ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Jul 2022 11:52:50 +0800, Jason Wang wrote:
> The double `is' is duplicated in line 110, remove one.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/sysdev: Fix comment typo
      https://git.kernel.org/powerpc/c/738f9dca0df3bb630e6f06a19573ab4e31bd443a

cheers
