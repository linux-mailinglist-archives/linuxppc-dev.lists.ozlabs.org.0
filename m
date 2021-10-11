Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90B428CB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSd1D0vXXz3dfJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HScxm3D5mz2ypF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:07:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HScxm2K6rz4xqV;
 Mon, 11 Oct 2021 23:07:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nathan Lynch <nathanl@linux.ibm.com>
In-Reply-To: <20210928124550.132020-1-nathanl@linux.ibm.com>
References: <20210928124550.132020-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc: fix unbalanced node refcount in check_kvm_guest()
Message-Id: <163395400688.4094789.7681311670924385547.b4-ty@ellerman.id.au>
Date: Mon, 11 Oct 2021 23:06:46 +1100
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
Cc: srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Sep 2021 07:45:50 -0500, Nathan Lynch wrote:
> When check_kvm_guest() succeeds in looking up a /hypervisor OF node, it
> returns without performing a matching put for the lookup, leaving the
> node's reference count elevated.
> 
> Add the necessary call to of_node_put(), rearranging the code slightly to
> avoid repetition or goto.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: fix unbalanced node refcount in check_kvm_guest()
      https://git.kernel.org/powerpc/c/56537faf8821e361d739fc5ff58c9c40f54a1d4c

cheers
