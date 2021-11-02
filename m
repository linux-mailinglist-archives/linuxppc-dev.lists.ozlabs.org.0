Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE70442D1A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:48:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7St2JQSz3g4G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:48:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fy750sz2ywW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fy46FQz4xdW;
 Tue,  2 Nov 2021 22:38:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Denis Kirjanov <kda@linux-powerpc.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211026133108.7113-1-kda@linux-powerpc.org>
References: <20211026133108.7113-1-kda@linux-powerpc.org>
Subject: Re: [PATCH] powerpc/xmon: fix task state output
Message-Id: <163584792720.1845480.16587603542850268738.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:12:07 +1100
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

On Tue, 26 Oct 2021 16:31:08 +0300, Denis Kirjanov wrote:
> p_state is unsigned since the commit 2f064a59a11f
> 
> The patch also uses TASK_RUNNING instead of null.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xmon: fix task state output
      https://git.kernel.org/powerpc/c/b1f896ce3542eb2eede5949ee2e481526fae1108

cheers
