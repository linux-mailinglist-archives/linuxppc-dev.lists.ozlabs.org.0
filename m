Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7F85A2CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 13:04:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TtHvw+Kg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdh5r2Chzz3dWD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 23:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TtHvw+Kg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tdh4P3DZvz3cCx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 23:02:45 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e09a890341so2047648b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 04:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708344162; x=1708948962; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXVHiQqTVvLwPVSN4wK295H+HuDvWyHMdFATUrh61Qw=;
        b=TtHvw+KghSs+76C1euBn1EYSBDugM9h33GvkdlKJom5GbSlUh7kVGFH99JgbGiVMhG
         saON8qDWiFe35n7hP/BZ6yHiq8VMWYFM4B/VYrjCoDwQrKyqE2xsLrIw9/NUSOgITmTP
         8ylTDUqL4vko6oomlTLSPMV4Hq+DYM3l540+QoD/kzC6RR+9VfO/wXvYUKW/Y12L24V3
         HVV0xi9otU9qG+oWAZnCFzWnKvQlPjm9WXBGx+iQULPXw9IPtaHKH5LLDpmFaKVG8wL1
         rxmBKhMeRNse1UjoTMrqVZqAXf4e6iB5GNswYT3VwOCjGraPmlBPWucTCNI1eeyuPdEu
         ggrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344162; x=1708948962;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sXVHiQqTVvLwPVSN4wK295H+HuDvWyHMdFATUrh61Qw=;
        b=gft3siUBHvxtlXsdD3qrgqL6gThegOLelQV5jejVTRFj+RF77kVus0gH5F5etSQSv/
         r/PVEGEB/htUXymZWSq5aJf3dAkJ+blKxZJCZ5zL6jiugJfMK2EnwnZpNYerBE/laFjO
         jmMhjLreoYcdZ++bjtenmul3ykpFfbHG35IZo5jwOrKADZyJqBK8vsylDCjX1d6SbhVf
         5llDjg+LgT9qYpRQv4XO2K3pTVECwrpnKEQA8ypb7jYjMuKg113BTFKFhsGh9MRqGJ/B
         beDcKlCNEj7e4BxIJlGT5ujSPuBwRIiSOCSMANIk3jnbXv6PWRdAC6Du2kDNZJtIWMbY
         kWtw==
X-Forwarded-Encrypted: i=1; AJvYcCXLrJhDBOLWb6KRvUE8xHijJ3O5bSgLSjKLeB0Mioz8gsf9g6PgtWCRM9P1xM56/g0gv+AW7bTq9hZ0RL2JNoPG9kTJ+4HQPGj2dFwFng==
X-Gm-Message-State: AOJu0Yza0pj72hYZ07W5juj9yD57I5/WaGsdQ4NOw9GKfYGJC/I1ZrfL
	qdwholtZGbsOD0X4NKiccPM80290IKHfBUgymXn8/vDq/t6Zua3n
X-Google-Smtp-Source: AGHT+IGM/mBl6p+7VQ/UBUY0liSnc0g8tiRAnqqtUyMEBG/QP3L26RLnUqLU9SBZSVRFhEVzjBzHUg==
X-Received: by 2002:a05:6a20:2d13:b0:1a0:aea4:f15c with SMTP id g19-20020a056a202d1300b001a0aea4f15cmr656909pzl.4.1708344161563;
        Mon, 19 Feb 2024 04:02:41 -0800 (PST)
Received: from localhost (123-243-155-241.static.tpgi.com.au. [123.243.155.241])
        by smtp.gmail.com with ESMTPSA id y17-20020aa78551000000b006e0e66369e5sm4638738pfn.66.2024.02.19.04.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:02:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Feb 2024 22:02:32 +1000
Message-Id: <CZ91GLI40959.3EGSUC8X9D0WU@wheely>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v4 8/8] migration: add a migration
 selftest
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
 <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
 <CZ7673PUQ853.DB10GSBEZ65Z@wheely>
 <4d73467d-2091-4342-87a1-822f4aeb8b70@redhat.com>
In-Reply-To: <4d73467d-2091-4342-87a1-822f4aeb8b70@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Feb 19, 2024 at 4:56 PM AEST, Thomas Huth wrote:
> On 17/02/2024 08.19, Nicholas Piggin wrote:
> > On Fri Feb 16, 2024 at 9:15 PM AEST, Thomas Huth wrote:
> >> On 09/02/2024 10.11, Nicholas Piggin wrote:
> >>> Add a selftest for migration support in  guest library and test harne=
ss
> >>> code. It performs migrations in a tight loop to irritate races and bu=
gs
> >>> in the test harness code.
> >>>
> >>> Include the test in arm, s390, powerpc.
> >>>
> >>> Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> >>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >>> ---
> >>>    arm/Makefile.common          |  1 +
> >>>    arm/selftest-migration.c     |  1 +
> >>>    arm/unittests.cfg            |  6 ++++++
> >>
> >>    Hi Nicholas,
> >>
> >> I just gave the patches a try, but the arm test seems to fail for me: =
Only
> >> the first getchar() seems to wait for a character, all the subsequent =
ones
> >> don't wait anymore and just continue immediately ... is this working f=
or
> >> you? Or do I need another patch on top?
> >=20
> > Hey sorry missed this comment....
> >=20
> > It does seem to work for me, I've mostly tested pseries but I did test
> > others too (that's how I saw the arm getchar limit).
> >=20
> > How are you observing it not waiting for migration?
>
> According to you other mail, I think you figured it out already, but just=
=20
> for the records: You can see it when running the guest manually, e.g.=20
> something like:
>
>   qemu-system-aarch64 -nodefaults -machine virt -accel tcg -cpu cortex-a5=
7 \
>     -device virtio-serial-device -device virtconsole,chardev=3Dctd \
>     -chardev testdev,id=3Dctd -device pci-testdev -display none \
>     -serial mon:stdio -kernel arm/selftest-migration.flat -smp 1
>
> Without my "lib/arm/io: Fix calling getchar() multiple times" patch, the=
=20
> guest only waits during the first getchar(), all the others simply return=
=20
> immediately.

Yeah I got it -- I re-ran it on arm and it is obvious since you told
me it's not waiting. At the time I tested I thought it was just arm
migrating really fast :D

Thanks,
Nick
