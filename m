Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A07311D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 10:12:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DeLazfIC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhZlL5Rlkz3bVP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 18:12:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=DeLazfIC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhZkR0HhJz301d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 18:11:26 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9745ba45cd1so219329166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 01:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1686816682; x=1689408682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jc3bGs7n8LGJfGG9OcFyn2jHuE4ZH06NRDgfF5l5LjU=;
        b=DeLazfIC3InLlnc+CbN7u3tKeBgHiyvNu9e/jNH3WftMrgPB8g8Nm8trECi2KONeGZ
         uf3lWDYbRqTYPo0TVAcyEuFtq7s9eO4TbZ8HkZ0Zo2uvlysLQyGKYZ4tw2gr7KzCTIpj
         SgMSEMZGFaHUpnALuimbilC8pr1x3qSHGxIzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686816682; x=1689408682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jc3bGs7n8LGJfGG9OcFyn2jHuE4ZH06NRDgfF5l5LjU=;
        b=O+usb2SXajWhLjaPTVBV913IVducuyO9juw1GQuQev8rpANMONkp4ufOZ6ti/NrstZ
         vRFGMNtrehfr88m5o9EMG6rNageZ26gMRmFHQlsoiUKETgzEUemmXaZ5h1W7jbeU1+Qt
         V3D/2aonT0QlRD0wHWhkEQzF/JXyE+34SnsRfosfGryRQi114S6QzNyOQhQknVJDJrY3
         Ipqga88ExBrqj6wxVzPZlvn26DB9jojvP8h+ipO/EE4ENMKQisDze+4v2smKE3Mr44na
         mBMTC5Y05KQnS3q2FS/TAYVxlbV3CBUyTBXLfLN4MYJ6nNhJYnq/S22kPG2JxV6ai021
         oxjA==
X-Gm-Message-State: AC+VfDzRm2WpNBgEMaDrg/Q0GbElGoNgltBHg6tsmgmyvhj2qYzMEgh1
	W9FNVgKme97XLw8h5X6bleqQTmVEQNZf2KZncWA=
X-Google-Smtp-Source: ACHHUZ4bUFGFP77ZcF3kMaZOJhG6wTzBNRglO1RF+tVoIeHKdwBZFicWiHALQYaEk74qIyu3OSniSMlM/E6RZ+LZRhQ=
X-Received: by 2002:a17:906:d553:b0:970:c9f:2db6 with SMTP id
 cr19-20020a170906d55300b009700c9f2db6mr17756450ejc.63.1686816681651; Thu, 15
 Jun 2023 01:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230608075826.86217-1-npiggin@gmail.com> <CACPK8XdpAxjvP+bFNFJzQQzBYvEwsE69QkbNWRumZtUW2wOrrA@mail.gmail.com>
 <CTCW1ILCXTMA.24T7LU9PQBTDA@wheely>
In-Reply-To: <CTCW1ILCXTMA.24T7LU9PQBTDA@wheely>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Jun 2023 08:11:09 +0000
Message-ID: <CACPK8XdOv4j5y6ADrxfvW_iDLLT0UT6Dwb_-J3mTA1Rq9s4xtQ@mail.gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Jun 2023 at 03:02, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> On Wed Jun 14, 2023 at 11:09 AM AEST, Joel Stanley wrote:
> > On Thu, 8 Jun 2023 at 07:58, Nicholas Piggin <npiggin@gmail.com> wrote:
> > >
> > > Posting again, a couple of patches were merged and accounted for review
> > > comments from last time.
> >
> > I saw some failures in the spr tests running on a power9 powernv system:
> >
> > $ TESTNAME=sprs TIMEOUT=90s ACCEL= ./powerpc/run powerpc/sprs.elf -smp
> > 1 |grep FAIL
> > FAIL: WORT      ( 895):    0x00000000c0deba80 <==> 0x0000000000000000
>
> This is just TCG machine? I'm not sure why WORT fails, AFAIKS it's the
> same on POWER8 and doesn't do anything just a simple register. I think
> on real hardware WORT may not have any bits implemented on POWER9
> though.

Yeah, just the TCG machine. Now that you point it out all of the
failures I reported are for ACCEL=<blank>, so they are running in tcg
mode.

run_migration timeout -k 1s --foreground 90s
/usr/bin/qemu-system-ppc64 -nodefaults -machine pseries,accel=tcg
-bios powerpc/boot_rom.bin -display none -serial stdio -kernel
powerpc/sprs.elf -smp 1 -append -w # -initrd /tmp/tmp.61XhbvCGcb


>
> > $ MIGRATION=yes TESTNAME=sprs-migration TIMEOUT=90s ACCEL=
> > ./powerpc/run powerpc/sprs.elf -smp 1 -append '-w' | grep FAIL
> > FAIL: SRR0      (  26):    0xcafefacec0debabc <==> 0x0000000000402244
> > FAIL: SRR1      (  27):    0xc0000006409ebab6 <==> 0x8000000000001001
> > FAIL: CTRL      ( 136):            0x00000000 <==>         0x00008001
> > FAIL: WORT      ( 895):    0x00000000c0deba80 <==> 0x0000000000000000
> > FAIL: PIR       (1023):            0x00000010 <==>         0x00000049
> >
> > Linux 6.2.0-20-generic
> > QEMU emulator version 7.2.0 (Debian 1:7.2+dfsg-5ubuntu2)
> >
> > On a power8 powernv:
> >
> > MIGRATION=yes TESTNAME=sprs-migration TIMEOUT=90s ACCEL= ./powerpc/run
> > powerpc/sprs.elf -smp 1 -append '-w' |grep FAIL
> > FAIL: SRR0      (  26):    0xcafefacec0debabc <==> 0x0000000000402234
> > FAIL: SRR1      (  27):    0xc0000006409ebab6 <==> 0x8000000000001000
> > FAIL: CTRL      ( 136):            0x00000000 <==>         0x00008001
> > FAIL: PIR       (1023):            0x00000060 <==>         0x00000030
>
> Hmm, seems we take some interrupt over migration test that is not
> accounted for (could check the address in SRR0 to see where it is).
> Either need to prevent that interrupt or avoid failing on SRR0/1 on
> this test.
>
> Interesting about CTRL, I wonder if that not migrating correctly.
> PIR looks like a migration issue as well, it can't be changed so
> destination CPU has got a different PIR. I would be inclined to
> leave those as failing to remind us to look into them.
>
> I'll take a look at the others though.
>
> Thanks,
> Nick
