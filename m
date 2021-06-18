Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4A3AC258
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:30:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mDm3yLXz3gCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:30:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4Q3CMKz3c4y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4P2TCBz9sXG; Fri, 18 Jun 2021 14:23:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <cover.1622822173.git.geoff@infradead.org>
References: <cover.1615916650.git.geoff@infradead.org>
 <cover.1622822173.git.geoff@infradead.org>
Subject: Re: [PATCH v2 0/2] PS3 Updates
Message-Id: <162398828628.1363949.17919153044200322721.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:26 +1000
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

On Fri, 04 Jun 2021 15:58:25 +0000, Geoff Levand wrote:
> I've rebased the V1 patches to v5.13-rc4, and moved the firmware version export
> from procfs to sysfs/firmware.
> 
> Please consider.
> 
> -Geoff
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/ps3: Add firmware version to sysfs
      https://git.kernel.org/powerpc/c/07e2d6cf91079ca01db7fb989a02edd8009dcacd

cheers
