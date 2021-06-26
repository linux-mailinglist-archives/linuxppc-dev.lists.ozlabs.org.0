Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED33B4E34
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBr7m07kkz3fHc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:43:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2Z5gH6z3c1v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:02 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2Y36lLz9sjD; Sat, 26 Jun 2021 20:39:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20210609090024.1446800-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20210609090024.1446800-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/bpf: Use bctrl for making function calls
Message-Id: <162470384413.3589875.7316169059141962276.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:24 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 9 Jun 2021 14:30:24 +0530, Naveen N. Rao wrote:
> blrl corrupts the link stack. Instead use bctrl when making function
> calls from BPF programs.

Applied to powerpc/next.

[1/1] powerpc/bpf: Use bctrl for making function calls
      https://git.kernel.org/powerpc/c/20ccb004bad659c186f9091015a956da220d615d

cheers
