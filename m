Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E97EA2DABE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:24:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwG9m0qntzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFPC2bTSzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFPC0VgTz9sVl; Tue, 15 Dec 2020 21:49:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20201207215200.1785968-1-nathanl@linux.ibm.com>
References: <20201207215200.1785968-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 00/28] partition suspend updates
Message-Id: <160802920650.504444.12968803696123035404.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:49:02 +1100 (AEDT)
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, mmc@linux.vnet.ibm.com,
 cforno12@linux.vnet.ibm.com, drt@linux.vnet.ibm.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 15:51:32 -0600, Nathan Lynch wrote:
> This series aims to improve the pseries-specific partition migration
> and hibernation implementation, part of which has been living in
> kernel/rtas.c. Most of that code is eliminated or moved to
> platforms/pseries, and the following major functional changes are
> made:
> 
> - Use stop_machine() instead of on_each_cpu() to avoid deadlock in the
>   join/suspend sequence.
> 
> [...]

Applied to powerpc/next.

[01/28] powerpc/rtas: prevent suspend-related sys_rtas use on LE
        https://git.kernel.org/powerpc/c/de0f7349a0dd072e54b5fc04c305907b22d28a5f
[02/28] powerpc/rtas: complete ibm,suspend-me status codes
        https://git.kernel.org/powerpc/c/970e453ea4ecdd7a16a46c229294547148d1c7b6
[03/28] powerpc/rtas: rtas_ibm_suspend_me -> rtas_ibm_suspend_me_unsafe
        https://git.kernel.org/powerpc/c/7049b288ea8c95f270ec8fe643e3c3187938d5af
[04/28] powerpc/rtas: add rtas_ibm_suspend_me()
        https://git.kernel.org/powerpc/c/701ba68342412ae9be99a7c7f3badebf95271403
[05/28] powerpc/rtas: add rtas_activate_firmware()
        https://git.kernel.org/powerpc/c/5f485a66f4d0693a535e4ab38ffc3538716d2c2b
[06/28] powerpc/hvcall: add token and codes for H_VASI_SIGNAL
        https://git.kernel.org/powerpc/c/9bae89f528c041f3117f0a6c21878dda5a55af60
[07/28] powerpc/pseries/mobility: don't error on absence of ibm, update-nodes
        https://git.kernel.org/powerpc/c/b06a6717873560e9dd1c07357781fc2b27545701
[08/28] powerpc/pseries/mobility: add missing break to default case
        https://git.kernel.org/powerpc/c/aa5e5c9b556a2e5f68a915e4b5dfa5c6bda47c64
[09/28] powerpc/pseries/mobility: error message improvements
        https://git.kernel.org/powerpc/c/2d5be6f16c4ba5c27d06704976daf55f3236a236
[10/28] powerpc/pseries/mobility: use rtas_activate_firmware() on resume
        https://git.kernel.org/powerpc/c/c3ae9781d5a64093f161e6cc5dfefb0773106ca9
[11/28] powerpc/pseries/mobility: extract VASI session polling logic
        https://git.kernel.org/powerpc/c/d9213319b84ee8393475c38361c84151d5c33415
[12/28] powerpc/pseries/mobility: use stop_machine for join/suspend
        https://git.kernel.org/powerpc/c/9327dc0aeef36a3cbb9d94f79b79cc4f91ff8a41
[13/28] powerpc/pseries/mobility: signal suspend cancellation to platform
        https://git.kernel.org/powerpc/c/37cddc7d6cf4568a7fb69aeff6f26e4c8a3bc0f7
[14/28] powerpc/pseries/mobility: retry partition suspend after error
        https://git.kernel.org/powerpc/c/aeca35b9a52b0e0d019a5244fbaab699f753b443
[15/28] powerpc/rtas: dispatch partition migration requests to pseries
        https://git.kernel.org/powerpc/c/4d756894ba75f1afe7945ccafe9afebff50484b6
[16/28] powerpc/rtas: remove rtas_ibm_suspend_me_unsafe()
        https://git.kernel.org/powerpc/c/5f6665e400569de479733677e77862542aebb6cc
[17/28] powerpc/pseries/hibernation: drop pseries_suspend_begin() from suspend ops
        https://git.kernel.org/powerpc/c/52719fce3f4c7a8ac9eaa191e8d75a697f9fbcbc
[18/28] powerpc/pseries/hibernation: pass stream id via function arguments
        https://git.kernel.org/powerpc/c/a10a5a17f4ac4f84fcc26162d43b53e2a4e1009a
[19/28] powerpc/pseries/hibernation: remove pseries_suspend_cpu()
        https://git.kernel.org/powerpc/c/ed22bb8d39fa7f3980afc6e16d2a891847367d33
[20/28] powerpc/machdep: remove suspend_disable_cpu()
        https://git.kernel.org/powerpc/c/796f9247b4fa9bec320d6b47ffde2ecf86cc71c0
[21/28] powerpc/rtas: remove rtas_suspend_cpu()
        https://git.kernel.org/powerpc/c/395b2c090907975c627902ba8fda0bdb04c7cad3
[22/28] powerpc/pseries/hibernation: switch to rtas_ibm_suspend_me()
        https://git.kernel.org/powerpc/c/366fb13bf13b029c4d43bf19382f7aea69bfa4b7
[23/28] powerpc/rtas: remove unused rtas_suspend_last_cpu()
        https://git.kernel.org/powerpc/c/1b2488176ea56e299d2b084772daeb5ecbfc16d1
[24/28] powerpc/pseries/hibernation: remove redundant cacheinfo update
        https://git.kernel.org/powerpc/c/b866459489fe8ef0e92cde3cbd6bbb1af6c4e99b
[25/28] powerpc/pseries/hibernation: perform post-suspend fixups later
        https://git.kernel.org/powerpc/c/fa53bcdb7413e7c40170106781f6b5bb9d74db84
[26/28] powerpc/pseries/hibernation: remove prepare_late() callback
        https://git.kernel.org/powerpc/c/d102f8312e1ea5e8bf84fceebf99186f22d16fc6
[27/28] powerpc/rtas: remove unused rtas_suspend_me_data
        https://git.kernel.org/powerpc/c/87b57ea7e109520d3c6dfb01671a0cb134d3ccff
[28/28] powerpc/pseries/mobility: refactor node lookup during DT update
        https://git.kernel.org/powerpc/c/2efd7f6eb9b7107e469837d8452e750d7d080a5d

cheers
