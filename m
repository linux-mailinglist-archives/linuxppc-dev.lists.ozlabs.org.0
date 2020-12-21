Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB922DFB58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 12:05:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzxTH1dB4zDqHX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 22:05:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzxR41tdQzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 22:03:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CzxR41C6Vz9sVs; Mon, 21 Dec 2020 22:03:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1608022578-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1608022578-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V3] powerpc/perf: Fix Threshold Event Counter Multiplier
 width for P10
Message-Id: <160854857811.1696279.6883849168636548386.b4-ty@ellerman.id.au>
Date: Mon, 21 Dec 2020 22:03:28 +1100 (AEDT)
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Dec 2020 03:56:18 -0500, Athira Rajeev wrote:
> Threshold Event Counter Multiplier (TECM) is part of Monitor Mode
> Control Register A (MMCRA). This field along with Threshold Event
> Counter Exponent (TECE) is used to get threshould counter value.
> In Power10, this is a 8bit field, so patch fixes the
> current code to modify the MMCRA[TECM] extraction macro to
> handle this change. ISA v3.1 says this is a 7 bit field but
> POWER10 it's actually 8 bits which will hopefully be fixed
> in ISA v3.1 update.

Applied to powerpc/next.

[1/1] powerpc/perf: Fix Threshold Event Counter Multiplier width for P10
      https://git.kernel.org/powerpc/c/ef0e3b650f8ddc54bb70868852f50642ee3ae765

cheers
