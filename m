Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C850D1A9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 14:17:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KmRwr2VFbz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Apr 2022 22:17:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KmRvC6bc0z2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Apr 2022 22:16:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KmRv43H1Mz4xNl;
 Sun, 24 Apr 2022 22:16:00 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220421025756.571995-1-aik@ozlabs.ru>
References: <20220421025756.571995-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/perf: Fix 32bit compile
Message-Id: <165080252348.1540533.14331497903469637806.b4-ty@ellerman.id.au>
Date: Sun, 24 Apr 2022 22:15:23 +1000
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

On Thu, 21 Apr 2022 12:57:56 +1000, Alexey Kardashevskiy wrote:
> The "read_bhrb" global symbol is only called under CONFIG_PPC64 of
> arch/powerpc/perf/core-book3s.c but it is compiled for both 32 and 64 bit
> anyway (and LLVM fails to link this on 32bit).
> 
> This fixes it by moving bhrb.o to obj64 targets.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf: Fix 32bit compile
      https://git.kernel.org/powerpc/c/bb82c574691daf8f7fa9a160264d15c5804cb769

cheers
