Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1584D7EBB98
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:12:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jqTH3fdx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVSs36w8mz3dBv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 14:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jqTH3fdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVSrD048jz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 14:11:54 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc37fb1310so48947435ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Nov 2023 19:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700017912; x=1700622712; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NudZUGQV3llHbCVPyPjhhAsaZpdqUjUNkJuk/0GNfRc=;
        b=jqTH3fdx82QM4oaDVTuegAYoVNlug7WUL79F2DExl4Kz/yOFI02nejgpH1K5uFbpB9
         U1F9NXsZGwemlbKg1G/PhRx1+7+iHpWCrNzAUyBBe7jxYtcdPtjLz5nfoRXaPE3gdvgy
         Of9qv1lHMYlp4sDsNIUleYSkPaSmfX0g4goFCL4Ykh3qoMQ1VJORg21ExSSlqvZMjEAH
         pJ5/YPmPksS3ARcZigvsotMBZd1RMd381pYQLMhrmuZAq0V8zM5SxFlKYlbAOg5VDtCr
         NyN3cwnc2JIAmNsFe6cEVmHB4297HuFLEUD+LK230JKgTdqqcPKaOfLVTzFV2W6QlmrR
         cQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700017912; x=1700622712;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NudZUGQV3llHbCVPyPjhhAsaZpdqUjUNkJuk/0GNfRc=;
        b=VXBB/u5/oGt8rGYj1KR44tuRSw0b8ibkHQhTSy0DQfTp2FbI/JtxT4A8XiG4Apte4x
         ZvT8SSe1Q9ImMrpTv5vYS1yuMOnatKfOd3M0sN6ihQWiZTru16aFTSEHap4uLZiDaRTY
         Za4XOaZEzinHcAc19/kGHdtOAws1Ecgj339E8VyBRT24e4EpfXSeDIqNbj0QvPjxoAPx
         qr3Vc7vsfOBbVFTmq7KLewP9DMx0u6soCNzyGfQnR/L2lpFl9fw6lvWQI3oMYZmbLN+m
         yh9OnhFNFrlPmzVZIbCxlI6WO8gEJuSVvhUDZUHYyY1O1HL8omQgeXGhCubdz1hJjb6O
         5/gw==
X-Gm-Message-State: AOJu0Ywmbsxqrmx4MYwKGRLH6XdwSQb33UEgiYxHqjAAupr8h7unkp7a
	rCb0hoBNVP1ibRNNCC0+0sc=
X-Google-Smtp-Source: AGHT+IH9KopGSGwEL0VshTTN7xL7TlahtfHioNI/uSGAeu3Lki/9LZgZQaqHy8JHGsAKpFfMcPtPJg==
X-Received: by 2002:a17:903:181:b0:1cc:345b:c7f5 with SMTP id z1-20020a170903018100b001cc345bc7f5mr5086458plg.23.1700017911760;
        Tue, 14 Nov 2023 19:11:51 -0800 (PST)
Received: from localhost ([1.145.207.198])
        by smtp.gmail.com with ESMTPSA id z3-20020a170902ee0300b001c9e53b721csm6390927plb.261.2023.11.14.19.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 19:11:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Nov 2023 13:11:35 +1000
Message-Id: <CWZ21RR3QHP3.294BZGFLKYC74@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
X-Mailer: aerc 0.15.2
References: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com> <87pm0c7cr6.fsf@mail.lhotse> <993112821.47345042.1699997526942.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <993112821.47345042.1699997526942.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(Sorry I didn't see that Michael already made the same comment,
ignore my previous.)

On Wed Nov 15, 2023 at 7:32 AM AEST, Timothy Pearson wrote:
>
>
> ----- Original Message -----
> > From: "Michael Ellerman" <mpe@ellerman.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>, "linuxppc-dev" =
<linuxppc-dev@lists.ozlabs.org>
> > Cc: "Jens Axboe" <axboe@kernel.dk>
> > Sent: Tuesday, November 14, 2023 6:14:37 AM
> > Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
>
> > Hi Timothy,
> >=20
> > Thanks for debugging this, but I'm unclear why this is helping because
> > we should already have a full barrier (hwsync) on both the sending and
> > receiving side.
> >=20
> > More below.
>
> So it looks like we might be dealing with a couple of potentially separat=
e issues here, not sure.  This is probably the most infuriating bug I've ru=
n across in my career, so please bear with me -- with the amount of active =
test kernels I have installed at any one time I'm occassionally infecting o=
ne with the tests from another. ;)
>
> First, I'm not 100% convinced the code in try_to_wake_up() is race-free o=
n ppc64, since adding a memory barrier between it and the call to kick_proc=
ess() significantly reduces the frequency of the on-disk corruption.  Can y=
ou take a look and see if anything stands out as to why that would be impor=
tant?

We have had memory ordering bugs in the scheduler before, but normally
they would result in a lost wakeup (hang) or crash in the scheduler.
AFAIK things that sleep are not supposed to assume they won't get an
interrupt before the event they are waiting on.

Where are you adding the barrier?

If it only reduces corruption then it seems like the race or ordering
bug is elsewhere (but maybe nearby).

>
> The second part of this though is that the barrier only reduces the frequ=
ency of the corruption, it does not eliminate the corruption.  After some c=
onsolidation, what completely eliminates the corruption is a combination of=
:
>  * Switching to TWA_SIGNAL_NO_IPI in task_work_add() *=20
>  * Adding udelay(1000) in io_uring/rw.c:io_write(), right before the call=
 to io_rw_init_file()

>
> Adding a memory barrier instead of the udelay() doesn't work, nor does ad=
ding the delay without switching to NO_IPI.

And just NO_IPI alone doesn't eliminate it?

>
> [1] Keeping TWA_SIGNAL and adding the barrier instruction also works, but=
 this is conceptually simpler to understand as to why it would have an effe=
ct at all

Which barrier, the ttwu one? And by work you mean fixes completely?

Still smells like a bug in io uring code, possibly MySQL. Is it only
MySQL it's been seen with do you know? I don't suppose there are any
clues about the corruption pattern or when or where it appears?

Thanks,
Nick
