Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBDC39CEB2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 13:36:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FyZG06m20z3bV0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 21:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FyZFf2R87z2yWt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 21:36:05 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FyZFc2xCVz9sVm; Sun,  6 Jun 2021 21:36:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] powerpc/kprobes: fixes and cleanups
Message-Id: <162297929292.2342154.15153318090805885747.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 21:34:52 +1000
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

On Wed, 19 May 2021 16:17:16 +0530, Naveen N. Rao wrote:
> Various fixes and some code refactoring for kprobes on powerpc. The
> first patch fixes an invalid access if probing the first instruction in
> a kernel module. The rest are small cleanups. More details in the
> individual patches.
> 
> - Naveen
> 
> [...]

Patch 1 applied to powerpc/fixes.

[1/5] powerpc/kprobes: Fix validation of prefixed instructions across page boundary
      https://git.kernel.org/powerpc/c/82123a3d1d5a306fdf50c968a474cc60fe43a80f

cheers
