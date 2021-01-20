Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB332FCA13
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 05:46:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLCf01zcyzDqvx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 15:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLCc6388nzDqq3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 15:44:38 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4DLCc61pv1z9sVr; Wed, 20 Jan 2021 15:44:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DLCc61RlQz9sW8; Wed, 20 Jan 2021 15:44:38 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210119041800.3093047-1-mpe@ellerman.id.au>
References: <20210119041800.3093047-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Only test lwm/stmw on big endian
Message-Id: <161111785209.3309920.5717355718140367402.b4-ty@ellerman.id.au>
Date: Wed, 20 Jan 2021 15:44:38 +1100 (AEDT)
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
Cc: msuchanek@suse.de, lpechacek@suse.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 Jan 2021 15:18:00 +1100, Michael Ellerman wrote:
> Newer binutils (>= 2.36) refuse to assemble lmw/stmw when building in
> little endian mode. That breaks compilation of our alignment handler
> test:
> 
>   /tmp/cco4l14N.s: Assembler messages:
>   /tmp/cco4l14N.s:1440: Error: `lmw' invalid when little-endian
>   /tmp/cco4l14N.s:1814: Error: `stmw' invalid when little-endian
>   make[2]: *** [../../lib.mk:139: /output/kselftest/powerpc/alignment/alignment_handler] Error 1
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Only test lwm/stmw on big endian
      https://git.kernel.org/powerpc/c/dd3a44c06f7b4f14e90065bf05d62c255b20005f

cheers
