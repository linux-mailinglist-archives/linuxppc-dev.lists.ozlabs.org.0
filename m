Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DC4308B8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:34:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKFv2GcVz3cH6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:34:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKCq2sctz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:32:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXKCp5LM9z4xqV;
 Sun, 17 Oct 2021 23:32:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kai Song <songkai01@inspur.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211009041630.4135-1-songkai01@inspur.com>
References: <20211009041630.4135-1-songkai01@inspur.com>
Subject: Re: [PATCH] powerpc/eeh: Fix docstrings in eeh.c
Message-Id: <163447392810.1159469.11303329795231824264.b4-ty@ellerman.id.au>
Date: Sun, 17 Oct 2021 23:32:08 +1100
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
Cc: paulus@samba.org, oohall@gmail.com, linux-kernel@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 9 Oct 2021 12:16:30 +0800, Kai Song wrote:
> We fix the following warnings when building kernel with W=1:
> arch/powerpc/kernel/eeh.c:598: warning: Function parameter or member 'function' not described in 'eeh_pci_enable'
> arch/powerpc/kernel/eeh.c:774: warning: Function parameter or member 'edev' not described in 'eeh_set_dev_freset'
> arch/powerpc/kernel/eeh.c:774: warning: expecting prototype for eeh_set_pe_freset(). Prototype was for eeh_set_dev_freset() instead
> arch/powerpc/kernel/eeh.c:814: warning: Function parameter or member 'include_passed' not described in 'eeh_pe_reset_full'
> arch/powerpc/kernel/eeh.c:944: warning: Function parameter or member 'ops' not described in 'eeh_init'
> arch/powerpc/kernel/eeh.c:1451: warning: Function parameter or member 'include_passed' not described in 'eeh_pe_reset'
> arch/powerpc/kernel/eeh.c:1526: warning: Function parameter or member 'func' not described in 'eeh_pe_inject_err'
> arch/powerpc/kernel/eeh.c:1526: warning: Excess function parameter 'function' described in 'eeh_pe_inject_err'
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/eeh: Fix docstrings in eeh.c
      https://git.kernel.org/powerpc/c/b616230e2325e5560330c40172a4d4e4c5da2c59

cheers
