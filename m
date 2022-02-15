Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B654A4B62E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:35:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVCs1nCMz3fYn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:35:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6G1PSmz3cR2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6G39sKz4y4j;
 Tue, 15 Feb 2022 16:30:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Laurent Dufour <ldufour@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220106161339.74656-1-ldufour@linux.ibm.com>
References: <20220106161339.74656-1-ldufour@linux.ibm.com>
Subject: Re: [PATCH v5] powerpc/pseries: read the lpar name from the firmware
Message-Id: <164490278732.270256.5912946204648546254.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:27 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jan 2022 17:13:39 +0100, Laurent Dufour wrote:
> The LPAR name may be changed after the LPAR has been started in the HMC.
> In that case lparstat command is not reporting the updated value because it
> reads it from the device tree which is read at boot time.
> 
> However this value could be read from RTAS.
> 
> Adding this value in the /proc/powerpc/lparcfg output allows to read the
> updated value.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: read the lpar name from the firmware
      https://git.kernel.org/powerpc/c/eddaa9a402758d379520f6511fb61e89990698aa

cheers
