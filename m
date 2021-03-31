Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF534F627
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:20:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97mm4F7Lz3btt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xr3phQz3cFd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xr2p72z9srY; Wed, 31 Mar 2021 12:10:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20210325200820.16594-1-rdunlap@infradead.org>
References: <20210325200820.16594-1-rdunlap@infradead.org>
Subject: Re: [PATCH] selftests: powerpc: unmark non-kernel-doc comments
Message-Id: <161715298092.226945.12479557880840484464.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:40 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Mar 2021 13:08:20 -0700, Randy Dunlap wrote:
> Drop the 'beginning of kernel-doc' notation markers (/**)
> in places that are not in kernel-doc format.

Applied to powerpc/next.

[1/1] selftests: powerpc: unmark non-kernel-doc comments
      https://git.kernel.org/powerpc/c/dfc4ae3372182a168146745def03d877f31fcf2f

cheers
