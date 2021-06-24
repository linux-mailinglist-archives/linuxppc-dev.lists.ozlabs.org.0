Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28D3B30EB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 16:05:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9hjY24B1z3dDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 00:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9hhB5VyFz3bsv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 00:04:10 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G9hh93Xb3z9sXG; Fri, 25 Jun 2021 00:04:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20210611111104.1058991-1-npiggin@gmail.com>
References: <20210611111104.1058991-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/boot: add zImage.lds to targets
Message-Id: <162454339563.2931445.3731468649516702906.b4-ty@ellerman.id.au>
Date: Fri, 25 Jun 2021 00:03:15 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Jun 2021 21:11:04 +1000, Nicholas Piggin wrote:
> This prevents spurious rebuilds of the lds and then wrappers.

Applied to powerpc/next.

[1/1] powerpc/boot: add zImage.lds to targets
      https://git.kernel.org/powerpc/c/710e682286784b50b882fc4befdf83c587059211

cheers
