Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 546784D171C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:18:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCZ9m1Yb6z3bWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 23:18:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCZ8z2Knhz30G0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 23:17:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KCZ901mQhz4xxt;
 Tue,  8 Mar 2022 23:17:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: paulus@ozlabs.org, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
 Nour-eddine Taleb <kernel.noureddine@gmail.com>, benh@kernel.crashing.org
In-Reply-To: <20220303143416.201851-1-kernel.noureddine@gmail.com>
References: <20220303143416.201851-1-kernel.noureddine@gmail.com>
Subject: Re: [PATCH] arch:powerpc:kvm: remove unnecessary type castings
Message-Id: <164674129469.3322453.11414816113490698694.b4-ty@ellerman.id.au>
Date: Tue, 08 Mar 2022 23:08:14 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 3 Mar 2022 15:34:16 +0100, Nour-eddine Taleb wrote:
> remove unnecessary castings, from "void *" to "struct kvmppc_xics *"
> 
> 

Applied to powerpc/next.

[1/1] arch:powerpc:kvm: remove unnecessary type castings
      https://git.kernel.org/powerpc/c/e40b38a41ce916d6a3a4751d59a01b6c0c03afd0

cheers
