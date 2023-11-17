Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D087EED0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 09:02:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wc5NzNlh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWqB76n0Gz3d8Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 19:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wc5NzNlh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWq9H4d45z3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:01:23 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5bde80aad05so1392843a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 00:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700208078; x=1700812878; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELg5pH1D6J4yXcv2OUudvpRj743AVooVeUNeq7EyeMM=;
        b=Wc5NzNlhTLDPoEUl+br5YcShQ+1/ZEnXHHFQqKBN/RysDdI6EWDyKEGqNgw6iUBUBp
         Uuq+1FOXnQPxmCx2sdX57sDom8m4dFGNE7hos7CeXP5AuZNx1jII2IELiovdNs0YdgAN
         LzOFu7epD16Pnmx2rnL08UuQTaWjcf7ZWuO2Hh/GR3fzViNKOUIehCWcIObfl4XFyD/Z
         DQOaIIlOOYZZCRYjX05+R5lySmm+Vtpyyf76W8zrLp34Sb0XYdElOwST98+bD80VByWn
         Rz8ERfWEKIQ0doIvM4L5LfFqws2sd+Tj6Q4+8wixe4z7uaJyZrHa807Ldh9HBa/nBadI
         30yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700208078; x=1700812878;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELg5pH1D6J4yXcv2OUudvpRj743AVooVeUNeq7EyeMM=;
        b=frULvGIUuUgxr49vvUm9B7dRrbj3XOehKQax2tCcwxvkhcQV3bPtLXPcf4nxGNqJmp
         c5KJMymmprAC1zW/b4ouk3x7OUsJqxBQaSCnUDxm5cf8U6Dr1oR0D56+OT4Ne3JqFrU4
         Pcz5S4oZKsMadprBrL1o6CRXALKtVo3H3+wJi46wj9NPxxIZ3xNZhNc9sVzCCpWc1U53
         Ik4w4wDT8vtYeIdHTOSfCAmeSgEWbTkX9ksEe+TLsockPO+Iw4muETCuEydCtoTw3aZV
         sUS+YoaflCbBSEsksjhk6W4qJ9+zrLhNjJhkIdBjYEJmy4zMWBtO2jmV0FXr7FeipBB1
         GyEA==
X-Gm-Message-State: AOJu0YzG3maiog/tq7jrT26apKEcq7tPlzOA8rteu6+qM1Lt+xZNvkAQ
	iu36Koj+vlN023GxiZDToUstlC6r07A=
X-Google-Smtp-Source: AGHT+IE110ViTUp076IgiNUTPkFy2lzJzq5Jd9+tZFixGLJYwQthfZilAASPJt3HNbfE2lQzT1E7eA==
X-Received: by 2002:a05:6a20:7487:b0:148:f952:552b with SMTP id p7-20020a056a20748700b00148f952552bmr20984031pzd.51.1700208078058;
        Fri, 17 Nov 2023 00:01:18 -0800 (PST)
Received: from localhost ([1.146.110.245])
        by smtp.gmail.com with ESMTPSA id fd13-20020a056a002e8d00b006baa1cf561dsm908547pfb.0.2023.11.17.00.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 00:01:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Nov 2023 18:01:12 +1000
Message-Id: <CX0XGLS2M4KG.1WIPX82OSTTRT@wheely>
Subject: Re: [PATCH] powerpc: Fix data corruption on IPI
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.15.2
References: <1654757454.47202735.1699948827325.JavaMail.zimbra@raptorengineeringinc.com> <87pm0c7cr6.fsf@mail.lhotse> <480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Nov 17, 2023 at 5:39 PM AEST, Timothy Pearson wrote:
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
> I've spent another few days poking at this, and think I might finally hav=
e something more solid in terms of what exactly is happening, but would lik=
e some feedback on the concept / how best to fix the potential problem.
>
> As background, there are several worker threads both in userspace and in =
kernel mode.  Crucially, the main MariaDB data processing thread (the one t=
hat handles tasks like flushing dirty pages to disk) always runs on the sam=
e core as the io_uring kernel thread that picks up I/O worker creation requ=
ests and handles them via create_worker_cb().
>
> Changes in the ~5.12 era switched away from a delayed worker setup.  io_u=
ring currently sets up the new process with create_io_thread(), and immedia=
tely uses an IPI to forcibly schedule the new process.  Because of the way =
the two threads interact, the new process ends up grabbing the CPU from the=
 running MariaDB user thread; I've never seen it schedule on a different co=
re.  If the timing is right in this process, things get trampled on in user=
space and the database server either crashes or throws a corruption fault.
>
> Through extensive debugging, I've narrowed this down to invalid state in =
the VSX registers on return to the MariaDB user thread from the new kernel =
thread.  For some reason, it seems we don't restore FP state on return from=
 the PF_IO_WORKER thread, and something in the kernel was busy writing new =
data to them.
>
> A direct example I was able to observe is as follows:
>
> xxspltd vs0,vs0,0      <-- vs0 now zeroed out
> xori    r9,r9,1        <-- Presumably we switch to the new kernel thread =
here due to the IPI
> slwi    r9,r9,7        <-- On userspace thread resume, vs0 now contains t=
he value 0x820040000000000082004000
> xxswapd vs8,vs0        <-- vs8 now has the wrong value
> stxvd2x vs8,r3,r12     <-- userspace is now getting stepped on
> stw     r9,116(r3)
> stxvd2x vs8,r3,r0
> ...
> CRASH

Nice find, that looks pretty conclusive.

> This is a very difficult race to hit, but MariaDB naturally does repetiti=
ve operations with VSX registers so it does eventually fail.  I ended up wi=
th a tight loop around glibc operations that use VSX to trigger the failure=
 reliably enough to even understand what was going on.
>
> As I am not as familiar with this part of the Linux kernel as with most o=
ther areas, what is the expected save/restore path for the FP/VSX registers=
 around an IPI and associated forced thread switch?  If restore_math() is i=
n the return path, note that MSR_FP is set in regs->msr.

Context switching these FP/vec registers should be pretty robust in
general because it's not just io-uring that uses them. io-uring could
be using some uncommon kernel code that uses the registers incorrectly
though I guess.

>
> Second question: should we even be using the VSX registers at all in kern=
el space?  Is this a side effect of io_uring interacting so closely with us=
erspace threads, or something else entirely?
>
> If I can get pointed somewhat in the right direction I'm ready to develop=
 the rest of the fix for this issue...just trying to avoid another several =
days of slogging through the source to see what it's supposed to be doing i=
n the first place. :)

Kernel can use FP/VEC/VSX registers but it has to enable and disable
explicitly. Such kernel code also should not be preemptible.

enable|disable_kernel_fp|altivec|vsx().

Maybe try run the test with ppc_strict_facility_enable boot option to
start with.

If no luck with that, maybe put WARN_ON(preemptible()); checks also in
the disable_kernel_* functions.

You could also add an enable/disable counter for each, and make sure it
is balanced on context switch or kernel->userspace exit.

Thanks,
Nick
