Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E2845D78B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0CjY5ps0z3cWq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:48:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Chs2S0Qz307C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Chr6LYkz4xcM;
 Thu, 25 Nov 2021 20:47:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211105102636.1016378-1-clg@kaod.org>
References: <20211105102636.1016378-1-clg@kaod.org>
Subject: Re: [PATCH 00/11] powerpc/xive: Improve diagnostic and activate
 StoreEOI on P10 PowerNV
Message-Id: <163783297365.1228879.4204140326111839575.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:13 +1100
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

On Fri, 5 Nov 2021 11:26:25 +0100, Cédric Le Goater wrote:
> This series tries to improve diagnostic support in the XIVE driver. It
> adds pr_debug() primitives that can be activated at run-time and changes
> the debugfs xive entry to expose more information :
> 
>   /sys/kernel/debug/powerpc/xive/
>     ├── eqs/
>     │   ├── cpu0
>     │   ├── cpu1
>     │   ├── cpu2
>     .   .
>     │   └── cpu99
>     ├── interrupts
>     ├── ipis
>     ├── save-restore
>     └── store-eoi
> 
> [...]

Patches 1-10 applied to powerpc/next.

[01/11] powerpc/xive: Replace pr_devel() by pr_debug() to ease debug
        https://git.kernel.org/powerpc/c/44b9c8ddcbc351d47ead974f0870d09bfc74b3f7
[02/11] powerpc/xive: Introduce an helper to print out interrupt characteristics
        https://git.kernel.org/powerpc/c/bd5b00c6cf0c37fce1bcd94390044d7e1dd638e7
[03/11] powerpc/xive: Activate StoreEOI on P10
        https://git.kernel.org/powerpc/c/756c52c632f5c2b054bb54b1ea9177329e4b8ce5
[04/11] powerpc/xive: Introduce xive_core_debugfs_create()
        https://git.kernel.org/powerpc/c/412877dfae3dc12733bc711ccbd3d02338803865
[05/11] powerpc/xive: Change the debugfs file 'xive' into a directory
        https://git.kernel.org/powerpc/c/baed14de78b5ee3ca04eae43c5b16e3eeb6e33a8
[06/11] powerpc/xive: Rename the 'cpus' debugfs file to 'ipis'
        https://git.kernel.org/powerpc/c/33e1d4a152ce55272b54a16884461218d12d4f1b
[07/11] powerpc/xive: Add a debugfs file to dump EQs
        https://git.kernel.org/powerpc/c/08f3f610214f395561bbda03344e641579f6e917
[08/11] powerpc/xive: Add a debugfs toggle for StoreEOI
        https://git.kernel.org/powerpc/c/d7bc1e376cb786e9e8483455584d89cad4b5808f
[09/11] powerpc/xive: Add a kernel parameter for StoreEOI
        https://git.kernel.org/powerpc/c/c21ee04f11ae068aa132cce56d09f618d4a66259
[10/11] powerpc/xive: Add a debugfs toggle for save-restore
        https://git.kernel.org/powerpc/c/1e7684dc4fc70271c8bf86d397bd4fbfb3581e65

cheers
