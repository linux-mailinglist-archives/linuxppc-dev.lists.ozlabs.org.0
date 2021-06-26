Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D23B4E40
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBrF73ZP1z3g7r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:48:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBrD9376Dz2yWy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:47:21 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBrD82RsQz9ssP; Sat, 26 Jun 2021 20:47:20 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1621416666.git.naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: (subset) [PATCH 0/5] powerpc/kprobes: fixes and cleanups
Message-Id: <162470439741.3596556.13059756494566740246.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:46:37 +1000
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

Patch 2 applied to powerpc/next.

[2/5] powerpc/kprobes: Roll IS_RFI() macro into IS_RFID()
      https://git.kernel.org/powerpc/c/0566fa760d235c119cef92119efc3ab11486a08a

cheers
