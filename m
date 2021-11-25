Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288745D790
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:49:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Ckz1c1Kz3dhN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Cj215NQz3c6n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Cj106q3z4xd8;
 Thu, 25 Nov 2021 20:47:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, masahiroy@kernel.org, adobriyan@gmail.com,
 andriy.shevchenko@linux.intel.com, Peiwei Hu <jlu.hpw@foxmail.com>,
 mpe@ellerman.id.au, aneesh.kumar@linux.ibm.com, rafael.j.wysocki@intel.com,
 benh@kernel.crashing.org, paulus@samba.org, ardb@kernel.org, clg@kaod.org
In-Reply-To: <tencent_BA28CC6897B7C95A92EB8C580B5D18589105@qq.com>
References: <tencent_BA28CC6897B7C95A92EB8C580B5D18589105@qq.com>
Subject: Re: [PATCH] powerpc/prom_init: fix the improper check of prom_getprop
Message-Id: <163783299816.1228879.14308105440652175596.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:38 +1100
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
Cc: trivial@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Nov 2021 17:12:18 +0800, Peiwei Hu wrote:
> prom_getprop() can return PROM_ERROR. Binary operator can not identify it.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/prom_init: fix the improper check of prom_getprop
      https://git.kernel.org/powerpc/c/869fb7e5aecbc163003f93f36dcc26d0554319f6

cheers
