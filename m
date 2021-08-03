Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6163DEAC2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 12:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf9rk5B8Tz3d6c
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 20:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf9r60M5Dz302G
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 20:20:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Gf9r200kFz9sWc; Tue,  3 Aug 2021 20:20:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210729180103.15578-1-msuchanek@suse.de>
References: <20210726154243.29025-1-msuchanek@suse.de>
 <20210729180103.15578-1-msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/stacktrace: Include linux/delay.h
Message-Id: <162798602834.163057.5895357781228415786.b4-ty@ellerman.id.au>
Date: Tue, 03 Aug 2021 20:20:28 +1000
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

On Thu, 29 Jul 2021 20:01:03 +0200, Michal Suchanek wrote:
> commit 7c6986ade69e ("powerpc/stacktrace: Fix spurious "stale" traces in raise_backtrace_ipi()")
> introduces udelay() call without including the linux/delay.h header.
> This may happen to work on master but the header that declares the
> functionshould be included nonetheless.

Applied to powerpc/next.

[1/1] powerpc/stacktrace: Include linux/delay.h
      https://git.kernel.org/powerpc/c/135462ae7692a824e5b63299178684fca3a366e6

cheers
