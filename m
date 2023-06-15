Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A3730D68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 05:03:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GOg+ZPxR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhRv92MLSz3bnv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 13:03:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GOg+ZPxR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhRtD5f78z300q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:02:43 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b3a6469623so31704165ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 20:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686798160; x=1689390160;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G4IXwGpoUdWL3Jj26QlGSDuiNxEjCjHlS4hHitS9FY=;
        b=GOg+ZPxRGBheX5NiFnwchnIk6F9ucBIBZkHECyciq1u+1Lbw73d3KXyMNOJ5K7EGsa
         DLKZNF6jBpC3ZnlkfQwAvDq7EjlkHz9J82xuBaIavB3mlD2Pi0bfyASTRcL7Joz1+9Pi
         Nch/MQnKGvYv5fT+9VUMYDZUwHGL3gg+YCzN4NoY0K0QrTX5ppT4+x9waNF+QDmVliJV
         YmCmrICVINR5cNM2tmXppwHAmwYspROGTazQG4swifGWdQE5UU1Lw9tMf2n3DMm70PDH
         MO+lReBH35ycVa9ao6mhLkOcWmJebpodOPTgpxYjZ21Mxdx0iak2X4OFZyLtHtIpa9oB
         CjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686798160; x=1689390160;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6G4IXwGpoUdWL3Jj26QlGSDuiNxEjCjHlS4hHitS9FY=;
        b=KZbRvloyZ1lE+ukdRAqyT5X63hE+jJWn5VFNSSQLBydu7AWf4V/hLT4e8GxsJT8EFX
         pVU25phcJKEXQ6gppzVq+YfpTg3VaLH/5yINBfGiEbAkkMnrUis/VUldFeGmKEetwYm2
         O85ixfD6OOTIGaQ0cOB0cquk+xprapUYH11BTB17F1PtCirWHO5V7sddgKZ43lYqu/uN
         QLMNFpybpl3uPR1082I43xxqBpGDD7IMzr1sa614J5KmwFi+/GuThx4r4lYXA4SWhXiW
         l5dleSNyCLoUi2GCFpuqDkHpWgoUxpx+moaK1L18Ot7nBBBghQbvvhnYldKuTzsLxXAQ
         uNBQ==
X-Gm-Message-State: AC+VfDyJfVFQD/PqKmG6Kw0qsfm1dWiJKRVkmVVcPAWYsOljt2YM3iBk
	JLNQpayrcEtfESBSesce/+E=
X-Google-Smtp-Source: ACHHUZ6lgjIPBI0Tymldtf6QR27S0ioLRgoC0GF43wVBjXefXq1as6jZvCfbw6Hn4lMDb5hFgodfSA==
X-Received: by 2002:a17:902:e314:b0:1af:fe12:4e18 with SMTP id q20-20020a170902e31400b001affe124e18mr11243125plc.20.1686798160453;
        Wed, 14 Jun 2023 20:02:40 -0700 (PDT)
Received: from localhost (14-203-144-223.static.tpgi.com.au. [14.203.144.223])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d70500b001ac94b33ab1sm4164815ply.304.2023.06.14.20.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 20:02:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jun 2023 13:02:34 +1000
Message-Id: <CTCW1ILCXTMA.24T7LU9PQBTDA@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [kvm-unit-tests v4 00/12] powerpc: updates, P10, PNV support
X-Mailer: aerc 0.14.0
References: <20230608075826.86217-1-npiggin@gmail.com>
 <CACPK8XdpAxjvP+bFNFJzQQzBYvEwsE69QkbNWRumZtUW2wOrrA@mail.gmail.com>
In-Reply-To: <CACPK8XdpAxjvP+bFNFJzQQzBYvEwsE69QkbNWRumZtUW2wOrrA@mail.gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas
 Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 14, 2023 at 11:09 AM AEST, Joel Stanley wrote:
> On Thu, 8 Jun 2023 at 07:58, Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Posting again, a couple of patches were merged and accounted for review
> > comments from last time.
>
> I saw some failures in the spr tests running on a power9 powernv system:
>
> $ TESTNAME=3Dsprs TIMEOUT=3D90s ACCEL=3D ./powerpc/run powerpc/sprs.elf -=
smp
> 1 |grep FAIL
> FAIL: WORT      ( 895):    0x00000000c0deba80 <=3D=3D> 0x0000000000000000

This is just TCG machine? I'm not sure why WORT fails, AFAIKS it's the
same on POWER8 and doesn't do anything just a simple register. I think
on real hardware WORT may not have any bits implemented on POWER9
though.

> $ MIGRATION=3Dyes TESTNAME=3Dsprs-migration TIMEOUT=3D90s ACCEL=3D
> ./powerpc/run powerpc/sprs.elf -smp 1 -append '-w' | grep FAIL
> FAIL: SRR0      (  26):    0xcafefacec0debabc <=3D=3D> 0x0000000000402244
> FAIL: SRR1      (  27):    0xc0000006409ebab6 <=3D=3D> 0x8000000000001001
> FAIL: CTRL      ( 136):            0x00000000 <=3D=3D>         0x00008001
> FAIL: WORT      ( 895):    0x00000000c0deba80 <=3D=3D> 0x0000000000000000
> FAIL: PIR       (1023):            0x00000010 <=3D=3D>         0x00000049
>
> Linux 6.2.0-20-generic
> QEMU emulator version 7.2.0 (Debian 1:7.2+dfsg-5ubuntu2)
>
> On a power8 powernv:
>
> MIGRATION=3Dyes TESTNAME=3Dsprs-migration TIMEOUT=3D90s ACCEL=3D ./powerp=
c/run
> powerpc/sprs.elf -smp 1 -append '-w' |grep FAIL
> FAIL: SRR0      (  26):    0xcafefacec0debabc <=3D=3D> 0x0000000000402234
> FAIL: SRR1      (  27):    0xc0000006409ebab6 <=3D=3D> 0x8000000000001000
> FAIL: CTRL      ( 136):            0x00000000 <=3D=3D>         0x00008001
> FAIL: PIR       (1023):            0x00000060 <=3D=3D>         0x00000030

Hmm, seems we take some interrupt over migration test that is not
accounted for (could check the address in SRR0 to see where it is).
Either need to prevent that interrupt or avoid failing on SRR0/1 on
this test.

Interesting about CTRL, I wonder if that not migrating correctly.
PIR looks like a migration issue as well, it can't be changed so
destination CPU has got a different PIR. I would be inclined to
leave those as failing to remind us to look into them.

I'll take a look at the others though.

Thanks,
Nick
