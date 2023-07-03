Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD77454D1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:26:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZDF0YqWz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:26:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8K3shwz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ8K0sqjz4wxs;
	Mon,  3 Jul 2023 15:23:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230429043519.19807-1-rdunlap@infradead.org>
References: <20230429043519.19807-1-rdunlap@infradead.org>
Subject: Re: [PATCH -next?] powerpc/fsl_uli1575: fix kconfig warnings and build errors
Message-Id: <168836167602.46386.8676370805240148519.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Pali Rohár <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Apr 2023 21:35:19 -0700, Randy Dunlap wrote:
> Neither FSL_SOC_BOOKE nor PPC_86xx enables CONFIG_PCI by
> default, so it may be unset in some randconfigs.
> When that happens, FSL_ULI1575 may be set when it should not be
> since it is a PCI driver. When it is set, there are 3 kconfig
> warnings and a slew of build errors
> 
> WARNING: unmet direct dependencies detected for PCI_QUIRKS
>   Depends on [n]: PCI [=n]
>   Selected by [y]:
>   - FSL_PCI [=y]
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/fsl_uli1575: fix kconfig warnings and build errors
      https://git.kernel.org/powerpc/c/536d948a8dee21166d9c5b5a4189af56beba16e3

cheers
