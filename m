Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662A7A930D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 11:27:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RrqnP0VrPz3cjx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 19:27:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RrqlK6FvGz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Sep 2023 19:26:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RrqlK455Tz4xNq;
	Thu, 21 Sep 2023 19:26:05 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
In-Reply-To: <20230825055601.360083-1-kjain@linux.ibm.com>
References: <20230825055601.360083-1-kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/perf/hv-24x7: Update domain value check
Message-Id: <169528828843.872767.14831793424287961680.b4-ty@ellerman.id.au>
Date: Thu, 21 Sep 2023 19:24:48 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Krishan Gopal Sarawast <krishang@linux.vnet.ibm.com>, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 25 Aug 2023 11:26:01 +0530, Kajol Jain wrote:
> Valid domain value is in range 1 to HV_PERF_DOMAIN_MAX.
> Current code has check for domain value greater than or
> equal to HV_PERF_DOMAIN_MAX. But the check for domain value 0
> is missing.
> Fix this issue by adding check for domain value 0.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/perf/hv-24x7: Update domain value check
      https://git.kernel.org/powerpc/c/4ff3ba4db5943cac1045e3e4a3c0463ea10f6930

cheers
