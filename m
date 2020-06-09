Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B21F33F1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 08:06:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h04g0CjzzDqCY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 16:06:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzF80dzRzDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:29:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzF61fvvz9sTY; Tue,  9 Jun 2020 15:28:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: suka@us.ibm.com, Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, nathanl@linux.ibm.com
In-Reply-To: <20200525104308.9814-1-kjain@linux.ibm.com>
References: <20200525104308.9814-1-kjain@linux.ibm.com>
Subject: Re: [PATCH v10 0/5] powerpc/hv-24x7: Expose chip/sockets info to add
 json file metric support for the hv_24x7 socket/chip level events
Message-Id: <159168034047.1381411.14213932955018522142.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:57 +1000 (AEST)
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com,
 peterz@infradead.org, anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 jmario@redhat.com, namhyung@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 25 May 2020 16:13:02 +0530, Kajol Jain wrote:
> Patchset fixes the inconsistent results we are getting when
> we run multiple 24x7 events.
> 
> "hv_24x7" pmu interface events needs system dependent parameter
> like socket/chip/core. For example, hv_24x7 chip level events needs
> specific chip-id to which the data is requested should be added as part
> of pmu events.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/perf/hv-24x7: Fix inconsistent output values incase multiple hv-24x7 events run
      https://git.kernel.org/powerpc/c/b4ac18eead28611ff470d0f47a35c4e0ac080d9c
[2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver to get processor details
      https://git.kernel.org/powerpc/c/8ba21426738207711347335b2cf3e99c690fc777
[3/5] powerpc/hv-24x7: Add sysfs files inside hv-24x7 device to show processor details
      https://git.kernel.org/powerpc/c/60beb65da1efd4cc23d05141181c39b98487950f
[4/5] Documentation/ABI: Add ABI documentation for chips and sockets
      https://git.kernel.org/powerpc/c/15cd1d35ba4a59832df693858ef046457107bd8d
[5/5] powerpc/pseries: Update hv-24x7 information after migration
      https://git.kernel.org/powerpc/c/373b373053384f12951ae9f916043d955501d482

cheers
