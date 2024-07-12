Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB992FAC1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 14:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WLBQX45n8z3fv0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2024 22:55:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WLBNx3T44z3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2024 22:53:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WLBNx2MXkz4x12;
	Fri, 12 Jul 2024 22:53:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240509121248.270878-1-mpe@ellerman.id.au>
References: <20240509121248.270878-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc: Drop clang workaround for builtin constant checks
Message-Id: <172078879459.310795.7175195949837566130.b4-ty@ellerman.id.au>
Date: Fri, 12 Jul 2024 22:53:14 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 09 May 2024 22:12:46 +1000, Michael Ellerman wrote:
> The CPU/MMU feature code has build-time checks that the feature value is
> a builtin constant.
> 
> Back when the code was added clang wasn't able to compile the
> checks, so an ifdef was added to avoid the checks for clang builds.
> See b5fa0f7f88ed ("powerpc: Fix build failure with clang due to
> BUILD_BUG_ON()")
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc: Drop clang workaround for builtin constant checks
      https://git.kernel.org/powerpc/c/489116d784bebec7e441f400715fbfe6edbce66c
[2/3] powerpc/xmon: Fix disassembly CPU feature checks
      https://git.kernel.org/powerpc/c/14196e47c5ffe32af7ed5a51c9e421c5ea5bccce
[3/3] powerpc: Check only single values are passed to CPU/MMU feature checks
      https://git.kernel.org/powerpc/c/db25a9625dbc3aa6613c0347f574689c248a3d0b

cheers
