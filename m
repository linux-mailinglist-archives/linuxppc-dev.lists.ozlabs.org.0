Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0BF3F99C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx0rT46Sqz3fB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0kW4YRNz3c52
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:22:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0kV5wMqz9sXk;
 Fri, 27 Aug 2021 23:22:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210823090039.166120-1-clg@kaod.org>
References: <20210823090039.166120-1-clg@kaod.org>
Subject: Re: [PATCH v2 0/2] W=1 fixes
Message-Id: <163007015205.52768.17096257536174291230.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:15:52 +1000
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

On Mon, 23 Aug 2021 11:00:37 +0200, Cédric Le Goater wrote:
> These are the remaining patches needed to compile the ppc kernel with
> W=1. Audit issues are now being addressed by Christophe in patch :
> 
> [v2] powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/dc14509a28a993738b1325211f412be72a4f9b1e.1629701132.git.christophe.leroy@csgroup.eu/
> 
> Thanks,
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/prom: Fix unused variable ‘reserve_map’ when CONFIG_PPC32 is not set
      https://git.kernel.org/powerpc/c/3accc0faef081b6813967b34f7d05a3edb855cbd
[2/2] powerpc/compat_sys: Declare syscalls
      https://git.kernel.org/powerpc/c/cc47ad409ba9cc950e9c492c8ba653dabd392148

cheers
