Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7878168AF08
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 10:43:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8kx72zMlz3fG3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 20:43:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8kvQ2Gckz3bZj
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 20:42:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4P8kvQ0z1tz4xwq;
	Sun,  5 Feb 2023 20:42:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20230130014401.540543-1-mpe@ellerman.id.au>
References: <20230130014401.540543-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/imc-pmu: Revert nest_init_lock to being a mutex
Message-Id: <167559010649.1647710.5838236888864506052.b4-ty@ellerman.id.au>
Date: Sun, 05 Feb 2023 20:41:46 +1100
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
Cc: kjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 30 Jan 2023 12:44:01 +1100, Michael Ellerman wrote:
> The recent commit 76d588dddc45 ("powerpc/imc-pmu: Fix use of mutex in
> IRQs disabled section") fixed warnings (and possible deadlocks) in the
> IMC PMU driver by converting the locking to use spinlocks.
> 
> It also converted the init-time nest_init_lock to a spinlock, even
> though it's not used at runtime in IRQ disabled sections or while
> holding other spinlocks.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/imc-pmu: Revert nest_init_lock to being a mutex
      https://git.kernel.org/powerpc/c/ad53db4acb415976761d7302f5b02e97f2bd097e

cheers
