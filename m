Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3B5FF6C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mq2W23Xpgz3dry
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 10:23:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mq2TS4ZGCz3ds0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 10:21:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mq2TJ3sVbz4xGc;
	Sat, 15 Oct 2022 10:21:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20221013073131.1485742-1-npiggin@gmail.com>
References: <20221013073131.1485742-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix CONFIG_DTL=n build
Message-Id: <166578967933.3420000.13635263487491846608.b4-ty@ellerman.id.au>
Date: Sat, 15 Oct 2022 10:21:19 +1100
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
Cc: Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 13 Oct 2022 17:31:31 +1000, Nicholas Piggin wrote:
> The recently moved dtl code must be compiled-in if
> CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y even if CONFIG_DTL=n.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/pseries: Fix CONFIG_DTL=n build
      https://git.kernel.org/powerpc/c/90d5ce82e143b42b2fdfb95401a89f86b71cedb7

cheers
