Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975047F923
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Dec 2021 22:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMZNr2JQQz3dfY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 08:55:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMZLv2z3Wz2yws
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 08:53:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JMZLv26HQz4xmw;
 Mon, 27 Dec 2021 08:53:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 01/11] powerpc/code-patching: Remove
 pr_debug()/pr_devel() messages and fix check()
Message-Id: <164055556054.3187272.4740665700594331538.b4-ty@ellerman.id.au>
Date: Mon, 27 Dec 2021 08:52:40 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2 Dec 2021 13:00:17 +0100, Christophe Leroy wrote:
> code-patching has been working for years now, time has come to
> remove debugging messages.
> 
> Change useful message to KERN_INFO and remove other ones.
> 
> Also add KERN_ERR to check() macro and change it into a do/while
> to make checkpatch happy.
> 
> [...]

Applied to powerpc/next.

[01/11] powerpc/code-patching: Remove pr_debug()/pr_devel() messages and fix check()
        https://git.kernel.org/powerpc/c/edecd2d6d6f4a122dd62bce654b4f63301e8ad9a
[02/11] powerpc/code-patching: Remove init_mem_is_free
        https://git.kernel.org/powerpc/c/af5304a7506588221d8317ef3f76585eb4483506
[03/11] powerpc/code-patching: Fix error handling in do_patch_instruction()
        https://git.kernel.org/powerpc/c/285672f99327d5b8febdf83cadba61a68abe5d69
[04/11] powerpc/code-patching: Fix unmap_patch_area() error handling
        https://git.kernel.org/powerpc/c/a3483c3dd18c136785a31406fe27210649fc4fba
[05/11] powerpc/code-patching: Reorganise do_patch_instruction() to ease error handling
        https://git.kernel.org/powerpc/c/6b21af74495b556f9d496d97d74e7a3d0ab16d7c
[06/11] powerpc/code-patching: Fix patch_branch() return on out-of-range failure
        https://git.kernel.org/powerpc/c/d5937db114e4b6446c62809484729955f1aeb108
[07/11] powerpc/code-patching: Use test_trampoline for prefixed patch test
        https://git.kernel.org/powerpc/c/ff14a9c09fe91a70bfc6381809877e5a19e38cdb
[08/11] powerpc/code-patching: Move patch_exception() outside code-patching.c
        https://git.kernel.org/powerpc/c/29562a9da29478834e57f81e3804e9ec7a6b350b
[09/11] powerpc/code-patching: Move instr_is_branch_{i/b}form() in code-patching.h
        https://git.kernel.org/powerpc/c/31acc599564120fa41f9df2c567842d003728dab
[10/11] powerpc/code-patching: Move code patching selftests in its own file
        https://git.kernel.org/powerpc/c/f30a578d7653f7dbb253a20daad4bcd9f881d6c9
[11/11] powerpc/code-patching: Replace patch_instruction() by ppc_inst_write() in selftests
        https://git.kernel.org/powerpc/c/309a0a601864831510209531dd72da486225d8ae

cheers
