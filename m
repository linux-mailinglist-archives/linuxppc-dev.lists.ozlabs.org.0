Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530D072F15D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:10:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P7p4i++C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgnRY3wGLz30f3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 11:10:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=P7p4i++C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgnQY5Ndlz303d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 11:09:56 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51493ec65d8so10618079a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 18:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1686704992; x=1689296992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CefrVBFgylDvVaVNQyLqjXfzc+7GKkMNBkU5AGBDehw=;
        b=P7p4i++CYaQL68iVpgKv7CXaICXGXHpzr0EaquZeSA8o03NtvkE1FBUeS33jggLyqN
         UdtQs1xx8A/WMx/NcTyEXyi3f3IMCLmi0lTQfYYqmDmEb6td3npppdmrD7RgUv+desx1
         bESozDhReo/9yZA4S+lnrWAL/t+UVxnZRZuKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686704992; x=1689296992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CefrVBFgylDvVaVNQyLqjXfzc+7GKkMNBkU5AGBDehw=;
        b=Obag6AkFxSsnXeCihYMlTc6DerOexSUhhnDTRF7zbY23ry+GzpgMl7HDrNBbSSME5m
         +izsfvLb8nkCqd1puL9PhYAUE9VmuTGMRfbDvcPLR1CuqTi39cw9LXN9XSCLfa2M/8AU
         dFhNtH1AJL5n5QIJtO+27WtGcycbWYn039h76Sm8/P7j3/uByAAdEhzlS7OSAFmClrGF
         g4AhbuElxZ/9SCYE2iuNvrnfE4x5SFQ5mtGP7FW1EFF0F9iE4nqVkZRjalqdjzJhUQQb
         MGKTAwsZ2ijXkTYunAdCYJdIjXdTFonBNvxegxUHVDdrZuthpyyKl51W+9HK/lKYBkI4
         vzhg==
X-Gm-Message-State: AC+VfDzYSnqc1YQ+GabMkeCA1LTnqQ7VNHxxSBxYpe2f2+43Ktdn8HXY
	k1RUzCA1ZaO/Ny57orKVDscPxvFkabenV9vufusiJZqcknw=
X-Google-Smtp-Source: ACHHUZ5Dnfwh3dO42sbHs29HyLn6tpyx6vfROmjBOqEVtFCACOQZ0PfGkFtLZZ2a0UtwXF/X6af1kYcgzpjYeH79U/s=
X-Received: by 2002:a17:907:2ce5:b0:978:af9d:4d4c with SMTP id
 hz5-20020a1709072ce500b00978af9d4d4cmr15656973ejc.75.1686704992255; Tue, 13
 Jun 2023 18:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230608075826.86217-1-npiggin@gmail.com>
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Jun 2023 01:09:39 +0000
Message-ID: <CACPK8XdpAxjvP+bFNFJzQQzBYvEwsE69QkbNWRumZtUW2wOrrA@mail.gmail.com>
Subject: Re: [kvm-unit-tests v4 00/12] powerpc: updates, P10, PNV support
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Jun 2023 at 07:58, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Posting again, a couple of patches were merged and accounted for review
> comments from last time.

I saw some failures in the spr tests running on a power9 powernv system:

$ TESTNAME=sprs TIMEOUT=90s ACCEL= ./powerpc/run powerpc/sprs.elf -smp
1 |grep FAIL
FAIL: WORT      ( 895):    0x00000000c0deba80 <==> 0x0000000000000000

$ MIGRATION=yes TESTNAME=sprs-migration TIMEOUT=90s ACCEL=
./powerpc/run powerpc/sprs.elf -smp 1 -append '-w' | grep FAIL
FAIL: SRR0      (  26):    0xcafefacec0debabc <==> 0x0000000000402244
FAIL: SRR1      (  27):    0xc0000006409ebab6 <==> 0x8000000000001001
FAIL: CTRL      ( 136):            0x00000000 <==>         0x00008001
FAIL: WORT      ( 895):    0x00000000c0deba80 <==> 0x0000000000000000
FAIL: PIR       (1023):            0x00000010 <==>         0x00000049

Linux 6.2.0-20-generic
QEMU emulator version 7.2.0 (Debian 1:7.2+dfsg-5ubuntu2)

On a power8 powernv:

MIGRATION=yes TESTNAME=sprs-migration TIMEOUT=90s ACCEL= ./powerpc/run
powerpc/sprs.elf -smp 1 -append '-w' |grep FAIL
FAIL: SRR0      (  26):    0xcafefacec0debabc <==> 0x0000000000402234
FAIL: SRR1      (  27):    0xc0000006409ebab6 <==> 0x8000000000001000
FAIL: CTRL      ( 136):            0x00000000 <==>         0x00008001
FAIL: PIR       (1023):            0x00000060 <==>         0x00000030

Linux 5.4.0-146-generic
QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.26)

Cheers,

Joel

>
> Thanks,
> Nick
>
> Nicholas Piggin (12):
>   powerpc: Report instruction address and MSR in unhandled exception
>     error
>   powerpc: Add some checking to exception handler install
>   powerpc: Abstract H_CEDE calls into a sleep functions
>   powerpc: Add ISA v3.1 (POWER10) support to SPR test
>   powerpc: Extract some common helpers and defines to headers
>   powerpc/sprs: Specify SPRs with data rather than code
>   powerpc/spapr_vpa: Add basic VPA tests
>   powerpc: Expand exception handler vector granularity
>   powerpc: Add support for more interrupts including HV interrupts
>   powerpc: Discover runtime load address dynamically
>   powerpc: Support powernv machine with QEMU TCG
>   powerpc/sprs: Test hypervisor registers on powernv machine
>
>  lib/powerpc/asm/handlers.h  |   2 +-
>  lib/powerpc/asm/hcall.h     |   1 +
>  lib/powerpc/asm/ppc_asm.h   |   9 +
>  lib/powerpc/asm/processor.h |  55 ++-
>  lib/powerpc/handlers.c      |  10 +-
>  lib/powerpc/hcall.c         |   4 +-
>  lib/powerpc/io.c            |  27 +-
>  lib/powerpc/io.h            |   6 +
>  lib/powerpc/processor.c     |  79 ++++-
>  lib/powerpc/setup.c         |   8 +-
>  lib/ppc64/asm/opal.h        |  15 +
>  lib/ppc64/asm/vpa.h         |  62 ++++
>  lib/ppc64/opal-calls.S      |  46 +++
>  lib/ppc64/opal.c            |  74 +++++
>  powerpc/Makefile.ppc64      |   4 +-
>  powerpc/cstart64.S          | 105 ++++--
>  powerpc/run                 |  35 +-
>  powerpc/spapr_hcall.c       |   9 +-
>  powerpc/spapr_vpa.c         | 172 ++++++++++
>  powerpc/sprs.c              | 645 ++++++++++++++++++++++++++----------
>  powerpc/tm.c                |  20 +-
>  powerpc/unittests.cfg       |   3 +
>  22 files changed, 1133 insertions(+), 258 deletions(-)
>  create mode 100644 lib/ppc64/asm/opal.h
>  create mode 100644 lib/ppc64/asm/vpa.h
>  create mode 100644 lib/ppc64/opal-calls.S
>  create mode 100644 lib/ppc64/opal.c
>  create mode 100644 powerpc/spapr_vpa.c
>
> --
> 2.40.1
>
