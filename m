Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD55C16FAC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 10:32:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S9ZY4D8BzDqfM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 20:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ktw9VhFP; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S9VW4l04zDqWS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 20:29:21 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id j17so1031559pjz.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 01:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=seOVm+TleX9u8aC2LPrLZOn91GysKZ6bAu9w+o0gFKQ=;
 b=Ktw9VhFPPmIDY0GYZxI05od8s1G/xMUSYTgp9IQqI5Z38c8iV/yIwrFcGlXe2+PUi9
 sncHRxkSoaER44FmABSyS8rB9mJA7F64hCxI640k/3Mn2FG8syVo/H7aKZ4RgHv2lToR
 R37CDvQURgK9pkNm+1qZxdPagOnSgAo9dxEnKO40/RIdgc8YnBANqjNBU2gVai+aeUhz
 tmlUdK2pbl7E4K/m5HcyE1b2ldPkcgnGsrlRmhiaYU995o8sWoo3Q8DLifmEc49zHPqG
 5gusFs/crJnkncsbVGwUvHQsIQt/nZ4MW0BNIVfDf7OLLbC728YLO06yfVH7RiwI9lv2
 zxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=seOVm+TleX9u8aC2LPrLZOn91GysKZ6bAu9w+o0gFKQ=;
 b=EpvS3wpPexdA3/0Ws+V3XMVHd+GdaJlo/iRkvkQ5vuY3Tw9F0KMBBttTrJIRDs9Wis
 h0nRJCusW/hgcVLceSxK8Qz6BqmQ5YIygEh5Qk++B8ryHVnaZo3skqGTtxon0+jYTQk0
 wKvWULOTPghAAydMIt4+EM4mBBX6817aybMXkBJLa3oZMGaGlCscQ7RjcI/hOngnAm5A
 GyobofEh6Pvx2MOF2SQ+4L/W7CgDv4oTHaEHDIX0aaOd3LQRNV8iaycqmRKy14kiP+lZ
 +BVucNBajJ+d8LhV402hDqrp9oKgc43+80PBrEwNrLly34mCGhkEKZ8KZeRHBGnngA/0
 Aoaw==
X-Gm-Message-State: APjAAAVyqUptpIRHEfwjo/+AsrbWtOpi3TJ8ELhf59llQ/NfPxoqIzE+
 o5/UYe4VIZkXU7ne6Hnljb8=
X-Google-Smtp-Source: APXvYqzuGjO/KOua/O7DUWf4iDd65zyv96kDOODBDueB0kHbPEOzDqvjUyCRcNPY8Onf0mKMpGl2bA==
X-Received: by 2002:a17:902:8549:: with SMTP id
 d9mr3057781plo.153.1582709357769; 
 Wed, 26 Feb 2020 01:29:17 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id h5sm1891212pgi.28.2020.02.26.01.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 01:29:17 -0800 (PST)
Date: Wed, 26 Feb 2020 19:25:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [Bug 206669] Little-endian kernel crashing on POWER8 on heavy
 big-endian PowerKVM load
To: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <bug-206669-206035@https.bugzilla.kernel.org/>
 <bug-206669-206035-j2X3hiFswk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206669-206035-j2X3hiFswk@https.bugzilla.kernel.org/>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582707304.m3tdrof2g5.astroid@bobo.none>
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

bugzilla-daemon@bugzilla.kernel.org's on February 26, 2020 5:26 pm:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206669
>=20
> --- Comment #2 from John Paul Adrian Glaubitz (glaubitz@physik.fu-berlin.=
de) ---
> (In reply to npiggin from comment #1)
>> Thanks for the report, we need to get more data about the first BUG if=20
>> we can. What function in your vmlinux contains address=20
>> 0xc00000000017a778? (use nm or objdump etc)
>=20
> Seems to be t select_task_rq_fair:
>=20
> root@watson:/boot# nm vmlinux-5.4.0-0.bpo.3-powerpc64le |grep -C5 c000000=
00017a
> c000000000448550 T select_estimate_accuracy
> c000000000170d20 t select_fallback_rq
> c000000000e4c940 D select_idle_mask
> c000000000179f10 t select_idle_sibling
> c00000000018fd80 t select_task_rq_dl
> c00000000017a640 t select_task_rq_fair
> c000000000177f50 t select_task_rq_idle
> c00000000018c9e0 t select_task_rq_rt
> c00000000019c800 t select_task_rq_stop
> c000000000927710 t selem_alloc.isra.6
> c000000000926e50 t selem_link_map
> root@watson:/boot#
>=20
>> Is that the first message you
>> get,
>> No warnings or anything else earlier in the dmesg?
>=20
> Correct. You can see the login prompt of the host VM watson directly afte=
r
> booting up.
>=20
>> Also 0xc0000000002659a0 would be interesting.
>=20
> Looks like that's ring_buffer_record_off:
>=20
> root@watson:/boot# nm vmlinux-5.4.0-0.bpo.3-powerpc64le |grep -C5
> c0000000002659
> c0000000002667e0 T ring_buffer_read_finish
> c00000000026b4b0 T ring_buffer_read_page
> c000000000265e10 T ring_buffer_read_prepare
> c000000000265ef0 T ring_buffer_read_prepare_sync
> c000000000269ae0 T ring_buffer_read_start
> c000000000265950 T ring_buffer_record_disable
> c000000000266070 T ring_buffer_record_disable_cpu
> c000000000265970 T ring_buffer_record_enable
> c0000000002660c0 T ring_buffer_record_enable_cpu
> c00000000026d470 T ring_buffer_record_is_on
> c00000000026d480 T ring_buffer_record_is_set_on
> c000000000265990 T ring_buffer_record_off
> c000000000265a10 T ring_buffer_record_on
> c000000000266da0 T ring_buffer_reset
> c000000000266a90 T ring_buffer_reset_cpu
> c000000000267cd0 T ring_buffer_resize
> c00000000026d400 T ring_buffer_set_clock
> root@watson:/boot#

Thanks.

Okay it looks like what's happening here is something crashes in
select_task_rq_fair (kernel data access fault). It's then able to
print out those first two lines but then it calls die(), which
ends up calling oops_enter() which calls tracing_off(), which calls
tracer_tracing_off and crashes there, which goes around the same
cycle only printing out the first two lines.

Nothing obvious as to why those accesses in particular are crashing.
The first data address is 0xc000000002bfd038, the second is
0xc0000007f9070c08. Not vmalloc space, not above the 1TB segment.

Do you have tracing / ftrace enabled in the host kernel for any
reason? Turning that off might let the oops message get printed.

>=20
> FWIW, the kernel image comes from this Debian package:
>=20
>>
>> http://snapshot.debian.org/archive/debian/20200211T210433Z/pool/main/l/l=
inux/linux-image-5.4.0-0.bpo.3-powerpc64le_5.4.13-1%7Ebpo10%2B1_ppc64el.deb

Okay. Any chance you could test an upstream kernel?=20
>=20
>> When reproducing, do you ever get a clean trace of the first bug?
>=20
> I have logged everything that showed in the console during and after the =
crash.
> After that, the machine no longer responds and has to be hard-resetted.
>=20
>> Could you try setting /proc/sys/kernel/panic_on_oops and reproducing?
>=20
> I will try that.

Don't bother testing that after the above -- panic_on_oops happens
after oops_begin(), so it won't help unfortunately.

Attmepting to get into xmon might though, if you boot with xmon=3Don.
Try that if tracing wasn't enabled, or disabling it doesn't help.

>=20
> Anything to be considered for the kernel running inside the big-endian VM=
?
>=20

Not that I'm aware of really. Certainly it shouldn't be able to crash
the host even if the guest was doing something stupid.

Thanks,
Nick
=
