Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E55850C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSpw4FNnz3hB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk425ltz3gDP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:48 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSk41MtJz4x1c;
	Fri, 29 Jul 2022 23:17:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Rashmica Gupta <rashmica@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220617042805.426231-1-rashmica@linux.ibm.com>
References: <20220617042805.426231-1-rashmica@linux.ibm.com>
Subject: Re: [PATCH] powerpc: make facility_unavailable_exception 64s
Message-Id: <165909978390.253830.5686683560942392652.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:03:03 +1000
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
Cc: mikey@neuling.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Jun 2022 14:28:05 +1000, Rashmica Gupta wrote:
> The facility unavailable exception is only available on ppc book3s
> machines so use CONFIG_PPC_BOOK3S_64 rather than CONFIG_PPC64.
> tm_unavailable is only called from facility_unavailable_exception so can
> also be under this Kconfig symbol.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: make facility_unavailable_exception 64s
      https://git.kernel.org/powerpc/c/fcdb758ce113c5d1b2b7034a058a9c472e42415e

cheers
