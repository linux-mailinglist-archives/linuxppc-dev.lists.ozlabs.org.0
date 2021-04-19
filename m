Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49328363A1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtc56YXNz3fSn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVj28hFz3cN4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:29 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVZ3Wq8z9vGZ; Mon, 19 Apr 2021 14:04:22 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210408074504.248211-1-maddy@linux.ibm.com>
References: <20210408074504.248211-1-maddy@linux.ibm.com>
Subject: Re: [PATCH v4 1/2] powerpc/perf: Infrastructure to support checking
 of attr.config*
Message-Id: <161880480828.1398509.1669123299909339283.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 14:00:08 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 13:15:03 +0530, Madhavan Srinivasan wrote:
> Introduce code to support the checking of attr.config* for
> values which are reserved for a given platform.
> Performance Monitoring Unit (PMU) configuration registers
> have fields that are reserved and some specific values for
> bit fields are reserved. For ex., MMCRA[61:62] is
> Random Sampling Mode (SM) and value of 0b11 for this field
> is reserved.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/perf: Infrastructure to support checking of attr.config*
      https://git.kernel.org/powerpc/c/2e2a441d2c0bb639b6fdbb64b15ee0a43599bcec

cheers
