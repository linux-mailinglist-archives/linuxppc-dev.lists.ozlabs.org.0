Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B959797F13
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 01:09:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t16bBPmW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhZh30gL5z3cF2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 09:09:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t16bBPmW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=song@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhZg757ZKz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 09:08:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2F956137B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 23:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FEFC433C9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694128127;
	bh=dwU0cggUZuUj8xz1J+Ttvroipumx77lnmqiIHmYTCJI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t16bBPmWFTaeGkKD6Vuny5I0wpUxFECxfgIyaoxFAuNZPzpo/X6e/ilimWCmJfL+2
	 I4h+YohnsfQ7yfyYlzQyiKH8o9NrfN9+p0XDfkjs70IpNgEjX0G0T9S06xcNpfHW84
	 FwSjyhwf/srK84Dz8A6N8OgBsLF/d4qSD/E4uMvH080newrOLAWQW+3i12G/R95kb9
	 Z4Or6HuEZ6+bjgfSuSasz1whc70SMLIPWiMHNEnlhwSc9hC0EWaUwbp4dpZxGRwJC5
	 28Cy99yc0LHBzdPMTsMnmV7BFWFOHgCUZbKygXi65EiSIZzY1m+zKn2jUqyYAsvlOP
	 UsolUQB93j0JA==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31f7638be6eso643845f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Sep 2023 16:08:47 -0700 (PDT)
X-Gm-Message-State: AOJu0YzWlEhOlICwgJOOTvN9OkxyNSatH3YBDWKahR5xoMslcPyUDJGA
	q6dA3vEqm0zfX1rL3ujCvi0pJ0xkGkMj1CgPbcw=
X-Google-Smtp-Source: AGHT+IE0owwZKnabFPS9/99R5zr4I9QIppyU7eX2Dd5VukMAFWby5ukuNPdc/8yyiuTSzVS853rFdqGdDhwgkZxKGAU=
X-Received: by 2002:a05:6512:280d:b0:500:a60d:c677 with SMTP id
 cf13-20020a056512280d00b00500a60dc677mr547393lfb.59.1694128104311; Thu, 07
 Sep 2023 16:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
From: Song Liu <song@kernel.org>
Date: Thu, 7 Sep 2023 16:08:11 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com>
Message-ID: <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
To: Ricardo Ribalda <ribalda@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Tom Rix <trix@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, llvm@lists.linux.dev, Palmer Dabbelt <palmer@rivosinc.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org, Philipp Rudo <prudo@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Ross Zwisler <zwisler@google.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Eric Biederman <ebiederm@xmission.com>, Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ricardo and folks,

On Fri, May 19, 2023 at 7:48=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> When upreving llvm I realised that kexec stopped working on my test
> platform.
>
> The reason seems to be that due to PGO there are multiple .text sections
> on the purgatory, and kexec does not supports that.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

We are seeing WARNINGs like the following while kexec'ing a PGO and
LTO enabled kernel:

WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
kexec_load_purgatory+0x37f/0x390

AFAICT, the warning was added by this set, and it was triggered when
we have many .text sections
in purgatory.ro. The kexec was actually successful. So I wonder
whether we really need the
WARNING here. If we disable LTO (PGO is still enabled), we don't see
the WARNING any more.

I also tested an older kernel (5.19 based), where we also see many
.text sections with LTO. It
kexec()'ed fine. (It doesn't have the WARN_ON() in
kexec_purgatory_setup_sechdrs).

Please help us fix this properly (as I really don't know much about kexec).

Thanks in advance,
Song


Here is readelf -S output on purgatory.ro.

With LTO:

readelf -W -S purgatory.ro
There are 48 section headers, starting at offset 0x4a10:

Section Headers:
  [Nr] Name              Type            Address          Off    Size
 ES Flg Lk Inf Al
  [ 0]                   NULL            0000000000000000 000000
000000 00      0   0  0
  [ 1] .text             PROGBITS        0000000000000000 000040
0000d0 00  AX  0   0 16
  [ 2] .data             PROGBITS        0000000000000000 001000
001000 00  WA  0   0 4096
  [ 3] .rela.text        RELA            0000000000000000 003788
000228 18   I 45   1  8
  [ 4] .rodata           PROGBITS        0000000000000000 002000
0000e0 00   A  0   0 16
  [ 5] .rela.rodata      RELA            0000000000000000 0039b0
000030 18   I 45   4  8
  [ 6] .bss              NOBITS          0000000000000000 0020e0
001000 00  WA  0   0 4096
  [ 7] .text.purgatory   PROGBITS        0000000000000000 0020e0
0000df 00  AX  0   0 16
  [ 8] .rela.text.purgatory RELA            0000000000000000 0039e0
000060 18   I 45   7  8
  [ 9] .text.warn        PROGBITS        0000000000000000 0021c0
000001 00  AX  0   0 16
  [10] .kexec-purgatory  PROGBITS        0000000000000000 0021d0
000120 00  WA  0   0 16
  [11] .comment          PROGBITS        0000000000000000 003a40
000046 01  MS  0   0  1
  [12] .llvm_addrsig     LOOS+0xfff4c03  0000000000000000 003a86
000005 00   E  0   0  1
  [13] .text.sha256_update PROGBITS        0000000000000000 0022f0
0008eb 00  AX  0   0 16
  [14] .rela.text.sha256_update RELA            0000000000000000
003a90 000060 18   I 45  13  8
  [15] .text.sha224_update PROGBITS        0000000000000000 002be0
00000c 00  AX  0   0 16
  [16] .rela.text.sha224_update RELA            0000000000000000
003af0 000018 18   I 45  15  8
  [17] .text.sha256_final PROGBITS        0000000000000000 002bf0
0000cd 00  AX  0   0 16
  [18] .rela.text.sha256_final RELA            0000000000000000 003b08
000030 18   I 45  17  8
  [19] .text.sha224_final PROGBITS        0000000000000000 002cc0
0000bd 00  AX  0   0 16
  [20] .rela.text.sha224_final RELA            0000000000000000 003b38
000030 18   I 45  19  8
  [21] .text.sha256      PROGBITS        0000000000000000 002d80
00011d 00  AX  0   0 16
  [22] .rela.text.sha256 RELA            0000000000000000 003b68
000030 18   I 45  21  8
  [23] .modinfo          PROGBITS        0000000000000000 002e9d
000039 00   A  0   0  1
  [24] .rodata.SHA256_K  PROGBITS        0000000000000000 002ee0
000100 00   A  0   0 16
  [25] .rodata.__sha256_final.padding PROGBITS        0000000000000000
002fe0 000040 00   A  0   0 16
  [26] .text.memcmp      PROGBITS        0000000000000000 003020
00000b 00  AX  0   0 16
  [27] .text.bcmp        PROGBITS        0000000000000000 003030
00000b 00  AX  0   0 16
  [28] .text.strcmp      PROGBITS        0000000000000000 003040
000041 00  AX  0   0 16
  [29] .text.strncmp     PROGBITS        0000000000000000 003090
00003a 00  AX  0   0 16
  [30] .text.strnlen     PROGBITS        0000000000000000 0030d0
000039 00  AX  0   0 16
  [31] .text.atou        PROGBITS        0000000000000000 003110
000035 00  AX  0   0 16
  [32] .text.simple_strtoull PROGBITS        0000000000000000 003150
0000b6 00  AX  0   0 16
  [33] .text.simple_strtol PROGBITS        0000000000000000 003210
0001b6 00  AX  0   0 16
  [34] .text.strlen      PROGBITS        0000000000000000 0033d0
00001c 00  AX  0   0 16
  [35] .text.strstr      PROGBITS        0000000000000000 0033f0
00005f 00  AX  0   0 16
  [36] .text.strchr      PROGBITS        0000000000000000 003450
000022 00  AX  0   0 16
  [37] .text.kstrtoull   PROGBITS        0000000000000000 003480
000142 00  AX  0   0 16
  [38] .text.boot_kstrtoul PROGBITS        0000000000000000 0035d0
00000c 00  AX  0   0 16
  [39] .rela.text.boot_kstrtoul RELA            0000000000000000
003b98 000018 18   I 45  38  8
  [40] .text.memset      PROGBITS        0000000000000000 0035e0
00001f 00  AX  0   0 16
  [41] .text.memmove     PROGBITS        0000000000000000 003600
0000a6 00  AX  0   0 16
  [42] .text.memcpy      PROGBITS        0000000000000000 0036b0
0000a6 00  AX  0   0 16
  [43] .rodata.str1.1    PROGBITS        0000000000000000 003756
000032 01 AMS  0   0  1
  [44] .note.GNU-stack   PROGBITS        0000000000000000 003bb0
000000 00      0   0  1
  [45] .symtab           SYMTAB          0000000000000000 003bb0
000948 18     47  68  8
  [46] .shstrtab         STRTAB          0000000000000000 0044f8
0002cd 00      0   0  1
  [47] .strtab           STRTAB          0000000000000000 0047c5
000248 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  l (large), p (processor specific)


Without LTO:

readelf -W -S purgatory.ro
There are 16 section headers, starting at offset 0x4130:

Section Headers:
  [Nr] Name              Type            Address          Off    Size
 ES Flg Lk Inf Al
  [ 0]                   NULL            0000000000000000 000000
000000 00      0   0  0
  [ 1] .text             PROGBITS        0000000000000000 000040
00131b 00  AX  0   0 16
  [ 2] .rela.text        RELA            0000000000000000 003290
000480 18   I 13   1  8
  [ 3] .kexec-purgatory  PROGBITS        0000000000000000 001360
000120 00  WA  0   0 16
  [ 4] .comment          PROGBITS        0000000000000000 003710
000046 01  MS  0   0  1
  [ 5] .llvm_addrsig     LOOS+0xfff4c03  0000000000000000 003756
000005 00   E  0   0  1
  [ 6] .data             PROGBITS        0000000000000000 002000
001000 00  WA  0   0 4096
  [ 7] .rodata           PROGBITS        0000000000000000 003000
000220 00   A  0   0 16
  [ 8] .rela.rodata      RELA            0000000000000000 003760
000030 18   I 13   7  8
  [ 9] .bss              NOBITS          0000000000000000 003220
001000 00  WA  0   0 4096
  [10] .modinfo          PROGBITS        0000000000000000 003220
000039 00   A  0   0  1
  [11] .rodata.str1.1    PROGBITS        0000000000000000 003259
000032 01 AMS  0   0  1
  [12] .note.GNU-stack   PROGBITS        0000000000000000 003790
000000 00      0   0  1
  [13] .symtab           SYMTAB          0000000000000000 003790
0006d8 18     15  43  8
  [14] .shstrtab         STRTAB          0000000000000000 003e68
00009c 00      0   0  1
  [15] .strtab           STRTAB          0000000000000000 003f04
00022b 00      0   0  1
Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  l (large), p (processor specific)

[...]

> Ricardo Ribalda (4):
>       kexec: Support purgatories with .text.hot sections
>       x86/purgatory: Remove PGO flags
>       powerpc/purgatory: Remove PGO flags
>       riscv/purgatory: Remove PGO flags
>
>  arch/powerpc/purgatory/Makefile |  5 +++++
>  arch/riscv/purgatory/Makefile   |  5 +++++
>  arch/x86/purgatory/Makefile     |  5 +++++
>  kernel/kexec_file.c             | 14 +++++++++++++-
>  4 files changed, 28 insertions(+), 1 deletion(-)
> ---
> base-commit: 58390c8ce1bddb6c623f62e7ed36383e7fa5c02f
> change-id: 20230321-kexec_clang16-4510c23d129c
>
> Best regards,
> --
> Ricardo Ribalda Delgado <ribalda@chromium.org>
>
