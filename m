Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E893AC25A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:31:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5mFc2dvrz3gN6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:31:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4R44R5z3c6S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:23:03 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4Q485rz9sjB; Fri, 18 Jun 2021 14:23:02 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <245897ed65e402686a4b114ba618e935cb5c6506.1622822173.git.geoff@infradead.org>
References: <cover.1622822173.git.geoff@infradead.org>
 <245897ed65e402686a4b114ba618e935cb5c6506.1622822173.git.geoff@infradead.org>
Subject: Re: [PATCH v2 2/2] powerpc/ps3: Re-align DTB in image
Message-Id: <162398828644.1363949.10261928847830527131.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:26 +1000
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

On Fri, 04 Jun 2021 15:58:25 +0000, Geoff Levand wrote:
> Change the PS3 linker script to align the DTB at 8 bytes,
> the same alignment as that of the of the 'generic' powerpc
> linker script.

Applied to powerpc/next.

[2/2] powerpc/ps3: Re-align DTB in image
      https://git.kernel.org/powerpc/c/ff4a825e4a24cdf7f840461ced6283bf865ab7be

cheers
