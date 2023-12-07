Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4565680884C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 13:49:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmDbt5d8yz3cfn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 23:48:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmDVr3Q4Cz3dGx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 23:44:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmDVr1Lw9z4xQP;
	Thu,  7 Dec 2023 23:44:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231120235436.1569255-1-mpe@ellerman.id.au>
References: <20231120235436.1569255-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
Message-Id: <170195271162.2310221.2324455057189218838.b4-ty@ellerman.id.au>
Date: Thu, 07 Dec 2023 23:38:31 +1100
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
Cc: gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Nov 2023 10:54:36 +1100, Michael Ellerman wrote:
> Building with GCC 13 (which has -array-bounds enabled) there are several
> warnings in sstep.c along the lines of:
> 
>   In function ‘do_byte_reverse’,
>       inlined from ‘do_vec_load’ at arch/powerpc/lib/sstep.c:691:3,
>       inlined from ‘emulate_loadstore’ at arch/powerpc/lib/sstep.c:3439:9:
>   arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of ‘u8[16]’ {aka ‘unsigned char[16]’} [-Werror=array-bounds=]
>     289 |                 up[2] = byterev_8(up[1]);
>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~
>   arch/powerpc/lib/sstep.c: In function ‘emulate_loadstore’:
>   arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object ‘u’ of size 16
>     681 |         } u = {};
>         |           ^
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/lib: Avoid array bounds warnings in vec ops
      https://git.kernel.org/powerpc/c/df99da19c6c24ab65052ae1bc0904f99069478d9

cheers
