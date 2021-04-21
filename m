Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99F366C22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLXp6sL7z3cNM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:11:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVK6gc0z301J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:13 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVH4lh1z9vFP; Wed, 21 Apr 2021 23:09:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, jniethe5@gmail.com,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <5f6f82572242a59bfee1e19a71194d8f7ef5fca4.1618405715.git.christophe.leroy@csgroup.eu>
References: <5f6f82572242a59bfee1e19a71194d8f7ef5fca4.1618405715.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 1/4] powerpc: Remove probe_user_read_inst()
Message-Id: <161901050534.1961279.5746860283283501781.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:25 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Apr 2021 13:08:40 +0000 (UTC), Christophe Leroy wrote:
> Its name comes from former probe_user_read() function.
> That function is now called copy_from_user_nofault().
> 
> probe_user_read_inst() uses copy_from_user_nofault() to read only
> a few bytes. It is suboptimal.
> 
> It does the same as get_user_inst() but in addition disables
> page faults.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc: Remove probe_user_read_inst()
      https://git.kernel.org/powerpc/c/6ac7897f08e04b47df3955d7691652e9d12d4068
[2/4] powerpc: Make probe_kernel_read_inst() common to PPC32 and PPC64
      https://git.kernel.org/powerpc/c/6449078d50111c839bb7156c3b99b9def80eed42
[3/4] powerpc: Rename probe_kernel_read_inst()
      https://git.kernel.org/powerpc/c/41d6cf68b5f611934bcc6a7d4a1a2d9bfd04b420
[4/4] powerpc: Move copy_from_kernel_nofault_inst()
      https://git.kernel.org/powerpc/c/39352430aaa05fbe4ba710231c70b334513078f2

cheers
