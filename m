Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02133A405
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:03:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dyw964cdJz3dkL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:03:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dyw786mQrz3cQr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw784DhSz9sWY; Sun, 14 Mar 2021 21:01:24 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20210225031946.1458206-1-jniethe5@gmail.com>
References: <20210225031946.1458206-1-jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/sstep: Fix VSX instruction emulation
Message-Id: <161571587210.138988.1382608155725836061.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:24 +1100 (AEDT)
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
Cc: ravi.bangoria@linux.ibm.com, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Feb 2021 14:19:46 +1100, Jordan Niethe wrote:
> Commit af99da74333b ("powerpc/sstep: Support VSX vector paired storage
> access instructions") added loading and storing 32 word long data into
> adjacent VSRs. However the calculation used to determine if two VSRs
> needed to be loaded/stored inadvertently prevented the load/storing
> taking place for instructions with a data length less than 16 words.
> 
> This causes the emulation to not function correctly, which can be seen
> by the alignment_handler selftest:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/sstep: Fix VSX instruction emulation
      https://git.kernel.org/powerpc/c/5c88a17e15795226b56d83f579cbb9b7a4864f79

cheers
