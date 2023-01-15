Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AFB66B06B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 11:45:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NvsJ03wj3z3fJ6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 21:45:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NvsGw44xbz3bZV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Jan 2023 21:44:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NvsGw0SK2z4xN4;
	Sun, 15 Jan 2023 21:44:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230104202437.90039-1-ojaswin@linux.ibm.com>
References: <20230104202437.90039-1-ojaswin@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc: Fix a wrong version calculation issue in ld_version
Message-Id: <167377944231.2279958.10670349663093099686.b4-ty@ellerman.id.au>
Date: Sun, 15 Jan 2023 21:44:02 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Andreas Schwab <schwab@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 5 Jan 2023 01:54:37 +0530, Ojaswin Mujoo wrote:
> ** The Issue **
> 
> The ld_version() function seems to compute the wrong version value for
> certain ld versions like the following:
> 
> $ ld --version GNU ld (GNU Binutils; SUSE Linux Enterprise 15)
> 2.37.20211103-150100.7.37
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix a wrong version calculation issue in ld_version
      https://git.kernel.org/powerpc/c/3287ebd7fd01e853ca4da8be675322429400e2bd

cheers
