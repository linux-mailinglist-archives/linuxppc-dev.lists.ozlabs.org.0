Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7D3428CB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSd0C6X0Dz3ccd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HScxk4V0Kz2yfc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:07:54 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HScxk2GBBz4xqQ;
 Mon, 11 Oct 2021 23:07:54 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
In-Reply-To: <20210903063246.70691-1-dja@axtens.net>
References: <20210903063246.70691-1-dja@axtens.net>
Subject: Re: [PATCH] powerpc: Remove unused prototype for of_show_percpuinfo
Message-Id: <163395399750.4094789.11017735746201336050.b4-ty@ellerman.id.au>
Date: Mon, 11 Oct 2021 23:06:37 +1100
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

On Fri, 3 Sep 2021 16:32:46 +1000, Daniel Axtens wrote:
> commit 6d7f58b04d82 ("[PATCH] powerpc: Some minor cleanups to setup_32.c")
> removed of_show_percpuinfo but didn't remove the prototype.
> 
> Remove it.
> 
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Remove unused prototype for of_show_percpuinfo
      https://git.kernel.org/powerpc/c/93fa8e9d88118bd2bdf2c61f9b63e7d4d9b648fe

cheers
