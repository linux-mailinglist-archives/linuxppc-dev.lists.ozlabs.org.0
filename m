Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3061D7121
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 08:37:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QTpP3Df4zDqX7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 16:37:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QTlS60fwzDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 16:35:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OHlWD3AD; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49QTlS420zz9sRW;
 Mon, 18 May 2020 16:35:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1589783700;
 bh=UlYce5kNCiRVf+FZadQtaQ8qSwzasQzJwjyaAg9XT2s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OHlWD3ADVMxhxvyu3E11PTXX2dAzGBCq34h95KhV2yHvCl9V8K/zH+jOHLWH5WnBx
 jZ9GXqdV0DEWcPauYDtSZsh4wjrIqQcSY/Paab+WDeFr6Xv8trbTdFIkhpVuTpUXDr
 VyuSrxF9l6/1cEOVnVQcpfLbhZ0E9akHGn8TSEZn8qmB5GgdyembV1cvtyMZ0P4c0k
 xEtemNvFcIbZ40Bv5pIhhAnCThU5seFDUko+FWRXhqPWOOzglwEWy815Gbsw6T32iS
 mDLNfHfShj21cMctDYg1qMeR+rFsZCJcMc+EkZY7NmLkc5KMqCnubMtkzCxtLTQEFo
 fl+N13+RU+Yqg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3] powerpc/64: Option to use ELF V2 ABI for big-endian
 kernels
In-Reply-To: <20200429011959.1423180-1-npiggin@gmail.com>
References: <20200429011959.1423180-1-npiggin@gmail.com>
Date: Mon, 18 May 2020 16:35:22 +1000
Message-ID: <87eerhagyd.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Provide an option to build big-endian kernels using the ELF V2 ABI. This works
> on GCC and clang (since about 2014). it is is not officially supported by the
> GNU toolchain, but it can give big-endian kernels  some useful advantages of
> the V2 ABI (e.g., less stack usage).
>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Since v1:
> - Improved the override flavour name suggested by Segher.
> - Improved changelog wording.
>
> Since v2:
> - Improved changelog, help text, to use the name ELF V2 ABI in the spec,
>   and clarify things a bit more, suggested by Segher.
> - For option name, match the ELF_ABI_v1/2 which is already in the kernel.
> - Prefix options with PPC64_ to avoid arch clashes or confusion.
> - "elfv2" is the toolchain name of the ABI, so I kept that in the crypto
>   perl scripts.
>
>  arch/powerpc/Kconfig            | 21 +++++++++++++++++++++
>  arch/powerpc/Makefile           | 15 ++++++++++-----
>  arch/powerpc/boot/Makefile      |  4 ++++
>  drivers/crypto/vmx/Makefile     |  8 ++++++--
>  drivers/crypto/vmx/ppc-xlate.pl | 10 ++++++----
>  5 files changed, 47 insertions(+), 11 deletions(-)

This doesn't build with clang:

  /tmp/aesp8-ppc-dad624.s: Assembler messages:
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_set_encrypt_key does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_set_decrypt_key does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_encrypt does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_decrypt does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_cbc_encrypt does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_ctr32_encrypt_blocks does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_xts_encrypt does not evaluate to a constant
  /tmp/aesp8-ppc-dad624.s: Error: .size expression for aes_p8_xts_decrypt does not evaluate to a constant
  clang: error: assembler command failed with exit code 1 (use -v to see invocation)
  make[4]: *** [/linux/scripts/Makefile.build:349: drivers/crypto/vmx/aesp8-ppc.o] Error 1
  make[4]: *** Waiting for unfinished jobs....
  /tmp/ghashp8-ppc-01aa43.s: Assembler messages:
  /tmp/ghashp8-ppc-01aa43.s: Error: .size expression for gcm_init_p8 does not evaluate to a constant
  /tmp/ghashp8-ppc-01aa43.s: Error: .size expression for gcm_gmult_p8 does not evaluate to a constant
  /tmp/ghashp8-ppc-01aa43.s: Error: .size expression for gcm_ghash_p8 does not evaluate to a constant
  clang: error: assembler command failed with exit code 1 (use -v to see invocation)
  make[4]: *** [/linux/scripts/Makefile.build:349: drivers/crypto/vmx/ghashp8-ppc.o] Error 1
  make[3]: *** [/linux/scripts/Makefile.build:488: drivers/crypto/vmx] Error 2
  make[3]: *** Waiting for unfinished jobs....
  make[2]: *** [/linux/scripts/Makefile.build:488: drivers/crypto] Error 2
  make[2]: *** Waiting for unfinished jobs....
  /linux/drivers/scsi/qla2xxx/qla_nx2.c:3226:1: warning: stack frame size of 2208 bytes in function 'qla8044_collect_md_data' [-Wframe-larger-than=]
  qla8044_collect_md_data(struct scsi_qla_host *vha)
  ^
  1 warning generated.
  make[1]: *** [/linux/Makefile:1722: drivers] Error 2
  make: *** [Makefile:180: sub-make] Error 2


I'm not sure if it can work with clang at all, so I'm happy if the
option depends on !CC_IS_CLANG.

cheers
