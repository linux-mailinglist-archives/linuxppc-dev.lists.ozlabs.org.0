Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105754FA7F3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 15:03:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KbFg600mYz3bZs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 23:03:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EM9wV3Rh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KbFfW3V2hz2xnF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 23:03:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EM9wV3Rh; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KbFfV6z7Rz4xYM;
 Sat,  9 Apr 2022 23:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649509395;
 bh=aVrIuPx28RnJkTKsagSyp22bDkE2thyGmzHR8ds8rKw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=EM9wV3Rhji5q144Useb3aQRqke0MpbIceUqGSje5Qvm45JH6oJSU01s/Df4XH8BsY
 DgP5QEAR1986FmoKcWfD+mW3kNs8Dvfx32/4XIxitjoPU3Cs6X2j2fSP3feKdh0CR+
 jdoeMedjN5LNRc4C7/f6fYLYIpyRbd/zDVNIoxPFzskA+SLKFdnVdQ/YHq5dvujTIX
 +FtLZFG3QPuqYlawTWtjy+XgD3bFzCTNzH0hXx3EZRRYfC5cd2E96ngKYrlvIRIfOe
 lu6TdXqmQNFsUKeYONjA5uZCZOpBvDZAG9duoGOy5tmJXZVR0jY4Qbt91hs1V7liW0
 2w/63YtdjL0Kg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Mark arch_get_ima_policy() and
 is_ppc_trustedboot_enabled() as __init
In-Reply-To: <ebfa96c9cdcd48b28c524af0fb4e10bcb5a7acb9.camel@linux.ibm.com>
References: <20220407141520.733735-1-mpe@ellerman.id.au>
 <ebfa96c9cdcd48b28c524af0fb4e10bcb5a7acb9.camel@linux.ibm.com>
Date: Sat, 09 Apr 2022 23:03:13 +1000
Message-ID: <87ee2676jy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nayna@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mimi Zohar <zohar@linux.ibm.com> writes:
> On Fri, 2022-04-08 at 00:15 +1000, Michael Ellerman wrote:
>> We can mark arch_get_ima_policy() as __init because it's only caller
>> ima_init_arch_policy() is __init. We can then mark
>> is_ppc_trustedboot_enabled() __init because its only caller is
>> arch_get_ima_policy().
>> 
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> I assume you want to upstream this via power,
>
>     Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

Yep, thanks.

cheers
