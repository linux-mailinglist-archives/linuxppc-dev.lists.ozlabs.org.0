Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C958508B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:12:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSc764Fsz3fBj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:12:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSYv72kbz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYv2GSLz4x1h;
	Fri, 29 Jul 2022 23:10:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-watchdog@vger.kernel.org, Scott Cheloha <cheloha@linux.ibm.com>
In-Reply-To: <20220713202335.1217647-1-cheloha@linux.ibm.com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Message-Id: <165909971888.253830.15454249099878371474.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:01:58 +1000
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Jul 2022 15:23:31 -0500, Scott Cheloha wrote:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
> adds support for this hypercall to powerpc/pseries kernels and
> introduces a new watchdog driver, "pseries-wdt", for the virtual
> timers exposed by the hypercall.
> 
> This series is preceded by the following:
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG opcode, H_NOOP return code
      https://git.kernel.org/powerpc/c/c6b2bd262b33aa2451f52aec2190131d1762945a
[2/4] powerpc/pseries: add FW_FEATURE_WATCHDOG flag
      https://git.kernel.org/powerpc/c/1621563ec62ff143c7b817dd5eab0884cdfaf89d
[3/4] powerpc/pseries: register pseries-wdt device with platform bus
      https://git.kernel.org/powerpc/c/578030bfe117060bf86c81aaa7b3faead4589810
[4/4] watchdog/pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
      https://git.kernel.org/powerpc/c/69472ffa6575e3a1c1e3324dd06395af0f63eb71

cheers
