Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB955276E6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 12:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1JJ61d1Dz3fRs
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 May 2022 20:18:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1JG82q7fz3f74
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 May 2022 20:17:04 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L1JG74Qn5z4xZ3;
 Sun, 15 May 2022 20:17:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220502192941.20955-1-rdunlap@infradead.org>
References: <20220502192941.20955-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] powerpc/4xx: cpm: fix return value of __setup handler
Message-Id: <165260954881.1040779.12442892668598459407.b4-ty@ellerman.id.au>
Date: Sun, 15 May 2022 20:12:28 +1000
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
Cc: patches@lists.linux.dev, Paul Mackerras <paulus@samba.org>,
 Igor Zhbanov <izh1979@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2 May 2022 12:29:41 -0700, Randy Dunlap wrote:
> __setup() handlers should return 1 to obsolete_checksetup() in
> init/main.c to indicate that the boot option has been handled.
> A return of 0 causes the boot option/value to be listed as an Unknown
> kernel parameter and added to init's (limited) argument or environment
> strings. Also, error return codes don't mean anything to
> obsolete_checksetup() -- only non-zero (usually 1) or zero.
> So return 1 from cpm_powersave_off().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/4xx: cpm: fix return value of __setup handler
      https://git.kernel.org/powerpc/c/5bb99fd4090fe1acfdb90a97993fcda7f8f5a3d6

cheers
