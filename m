Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7E16FCF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 12:10:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SCkf219bzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 22:10:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RRCArEfU; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SChc4Dp9zDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 22:08:15 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id y5so1277779pfb.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 03:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=V+STn4/8h+0difuP3W5zfDidG8Dc47ssZYZdnW6nmnM=;
 b=RRCArEfUpautWlME1gGMXjTP9v5kM6rF5K2r/EnfjRSfHiRThn4YFzQVC2eCGZZWKU
 +ff2f2siPSDO6Xzm0yTXjIuF9XAauNLqoxJlqmmdtWC9hwVWodHfkBiMzMGidIcTtZTL
 HoAye5cygIhhAzOFrf4sT/QxByvtrz07Ei6dE6QzJTXd+dlk30fdzY2dIeVk4jfYBGJ0
 kZMVevnZIAhcdXyzGm+ekzOkj1EUmDVsBo4b0djohsH3kfA9MFEPN0sN3vwWPZIu5FYE
 HqeUZh9P809onwsBng79ioAvjYgn86OOOH+655i91F31WdguSwOLCPCmq3hrU/1D9eBA
 oqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=V+STn4/8h+0difuP3W5zfDidG8Dc47ssZYZdnW6nmnM=;
 b=NdcD7GdAL2fvwFDjVLtCu+dp4kUC1z23zu+N7jAGeyXID5dkxxQI7/+WG5gTqptIxD
 6LEqYkq22HT7vJShi1BAP5Ppi5rNTqLN0QwFW8jcBo5ps2KvdAQ4WgudLSkND1qlVhye
 xQSY/JrOBLKFbAiLpxga0AfA++9V2J/9V20S3oD5Lozk0hvaWfeA3Wk2NKFpKeZRU9+W
 v9jWuczwf5bhcbHPUf45g9QmGycEDpDGaf3h8SYGzMejCxoxvDA60NCxvRX/jglsDMNK
 tl+a93LWytrCEvwvjyhpv6KsHJ0Oaof7GOgwS8kSOuEp8LXxByfQOIo+oW+VNFZrUP4r
 euUw==
X-Gm-Message-State: APjAAAVb+KFzlw2PiAinDChtqX3bh/CeMz1sXvq8r0YLuhgmxe0ZIyZp
 YPaMLYbtKg3U2UGfFyR8q53yHydz
X-Google-Smtp-Source: APXvYqywgheofKrY1NuGGV+y8PUfzEOGP6oiLdulwDTi2reYnpB5s19iQkyN5D5EaOwtRHQoAfQJRQ==
X-Received: by 2002:a63:7f5c:: with SMTP id p28mr3447754pgn.212.1582715292357; 
 Wed, 26 Feb 2020 03:08:12 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id l15sm2422099pgi.31.2020.02.26.03.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 03:08:11 -0800 (PST)
Date: Wed, 26 Feb 2020 21:03:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <bug-206669-206035@https.bugzilla.kernel.org/>
 <bug-206669-206035-ZVCbFl0u4b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206669-206035-ZVCbFl0u4b@https.bugzilla.kernel.org/>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582714660.bopln5sr51.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

bugzilla-daemon@bugzilla.kernel.org's on February 26, 2020 8:28 pm:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206669
>=20
> --- Comment #4 from John Paul Adrian Glaubitz (glaubitz@physik.fu-berlin.=
de) ---
> (In reply to npiggin from comment #3)
>> Do you have tracing / ftrace enabled in the host kernel for any
>> reason? Turning that off might let the oops message get printed.
>=20
> Seems that this is the case in the Debian kernel, yes:
>=20
> root@watson:~# grep -i ftrace /boot/config-5.4.0-0.bpo.3-powerpc64le=20
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_FTRACE=3Dy
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> root@watson:~#
>=20
> Do you have the kernel command option at hand which disables ftrace on th=
e
> command line? Is it just ftrace=3Doff?

Hmm, not sure, Documentation/admin-guide/kernel-parameters.txt seems
to say that wouldn't work.

I thought it might only be going down that path if you have already done
some tracing. Perhaps ensure /sys/kernel/debug/tracing/tracing_on is set
to 0, and then `echo 1 > /sys/kernel/debug/tracing/free_buffer` before
you start the test.

>> > FWIW, the kernel image comes from this Debian package:
>> >=20
>> >>
>> >>
>> >>
>> http://snapshot.debian.org/archive/debian/20200211T210433Z/pool/main/l/l=
inux/linux-image-5.4.0-0.bpo.3-powerpc64le_5.4.13-1%7Ebpo10%2B1_ppc64el.deb
>>=20
>> Okay. Any chance you could test an upstream kernel?=20
>=20
> Sure, absolutely. Any preference on the version number?

Current head if you're feeling lucky, but v5.5 if not. But you can
give the ftrace test a try with the debian kernel first if you've got
it ready to go.

>> Don't bother testing that after the above -- panic_on_oops happens
>> after oops_begin(), so it won't help unfortunately.
>=20
> Okay.
>=20
>> Attmepting to get into xmon might though, if you boot with xmon=3Don.
>> Try that if tracing wasn't enabled, or disabling it doesn't help.
>=20
> Okay. I will try to disable ftrace first, then retrigger the crash.

Cool

Thanks,
Nick
=
