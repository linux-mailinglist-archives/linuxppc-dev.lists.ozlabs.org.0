Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDFE263087
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:29:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmmCC6XChzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjkS68hPzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkR2Zwbz9sVR; Wed,  9 Sep 2020 23:37:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: ajd@linux.ibm.com, christophe_lombard@fr.ibm.com,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200407115601.25453-1-fbarrat@linux.ibm.com>
References: <20200407115601.25453-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH] cxl: Rework error message for incompatible slots
Message-Id: <159965824206.811679.9265334778679096487.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:34 +1000 (AEST)
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
Cc: stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 7 Apr 2020 13:56:01 +0200, Frederic Barrat wrote:
> Improve the error message shown if a capi adapter is plugged on a
> capi-incompatible slot directly under the PHB (no intermediate switch).

Applied to powerpc/next.

[1/1] cxl: Rework error message for incompatible slots
      https://git.kernel.org/powerpc/c/40ac790d99c6dd16b367d5c2339e446a5f1b0593

cheers
