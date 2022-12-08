Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC7647027
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:55:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYzb608Gz3fBF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrw5zqSz3bhP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:52 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrw4v7nz4xvV;
	Thu,  8 Dec 2022 23:49:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20221114160150.13554-1-ldufour@linux.ibm.com>
References: <20221114160150.13554-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: unregister VPA when hot unplugging a CPU
Message-Id: <167050322056.1457988.13932134686627296499.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:20 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Nov 2022 17:01:50 +0100, Laurent Dufour wrote:
> The VPA should unregister when offlining a CPU. Otherwise there could be a
> short window where 2 CPUs could share the same VPA.
> 
> This happens because the hypervisor is still keeping the VPA attached to
> the vCPU even if it became offline.
> 
> Here is a potential situation:
>  1. remove proc A,
>  2. add proc B. If proc B gets proc A's place in cpu_present_map, then it
>     registers proc A's VPAs.
>  3. If proc B is then re-added to the LP, its threads are sharing VPAs with
>     proc A briefly as they come online.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: unregister VPA when hot unplugging a CPU
      https://git.kernel.org/powerpc/c/f6aa37c51ec0d053ee34c235bfe0e666618a3baf

cheers
