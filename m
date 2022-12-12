Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CFF649976
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 08:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVtMP6rfVz3c8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 18:20:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XnOpfaWb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XnOpfaWb;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVtLQ4tWlz3bZh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 18:19:56 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id x66so7933190pfx.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 23:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hTKPZ2IkODq2IFTDJ5q/3atNgAWsoEz6btRtA3DXcI=;
        b=XnOpfaWbY/mn1r7ZUan7KVW8n6e+W3iWTCUZowgMpRmy4QBWV7VmL10CUkBH7DU4wl
         F9Pgay7G3hkN2vKRL1cEH3hvbRdVRa9HOBbMlt/OGQ6HXjIvePw9RQJVkXVJvD8kpB7a
         /JnmDpcZKe5V/rhhvAElty0sJGrQ0rrSjtnol9IbYrq1Ef0IUe6nnlA/jOmnTVvNflJy
         sIfWphXZiCVUptQtNqO7VtUcySWyc/soFeXtvWeTfuNRknEDXYKhsgLWjlBCx2faaIyu
         vD2x4TsPQpq2z2qkp7ABObRFi2xtr5LGdFs9j/lu9b+egl3tSOmdup6YLxTv+OJ4VYYE
         kuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+hTKPZ2IkODq2IFTDJ5q/3atNgAWsoEz6btRtA3DXcI=;
        b=0Pm+wL2mzyQMLQoE5DhaGSSQDzJwQnCWfYBLIeajJk3WrXBbZVDTgoVmiocY9pvH/w
         4GM/lmFSCyB1WoAhss24uq8NC4MgQa6NYpXb0TrZCzuYPe/CcGKe/UbZUHwsfgwJNu1f
         CnF4lR8MEohNTW7TmnUPInw3q4tZqjyBzRSir1rGLbnAgdOesQnT/3d+IMLJikx0qe9U
         bQ7Sqy/5tLUYiuuhF5dxGau5WuaUDptK58HcVt09c2kyfiRSRRvbtcj50cC36/ba/c0h
         O0hoJAsiBWEpQaHwnJ0pm8reVoGvsP6LVe5IW1Hj5CenCvn83DY2KyZ/YnrbGbV9ka26
         6Y3A==
X-Gm-Message-State: ANoB5pmU1gZcsoYyC4rb+e2f9naPIFEJHHboKVE7Roocrsco2yLPHbr3
	0k5V1IfZkbn4Y19BUU/XIgg=
X-Google-Smtp-Source: AA0mqf6HtTAoq9j6IsVnHBcvSSIQHjaVSnpCbe1bODi8OlzdIGcw0eXaflwdU+h1msUG4Fiu3iTseA==
X-Received: by 2002:aa7:8b4d:0:b0:56c:962:fe7e with SMTP id i13-20020aa78b4d000000b0056c0962fe7emr14947057pfd.32.1670829593534;
        Sun, 11 Dec 2022 23:19:53 -0800 (PST)
Received: from localhost (58-6-248-8.tpgi.com.au. [58.6.248.8])
        by smtp.gmail.com with ESMTPSA id e15-20020a056a0000cf00b00574ab0e053bsm5068095pfj.187.2022.12.11.23.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 23:19:52 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Dec 2022 17:19:48 +1000
Message-Id: <COZNNOOVX33Q.1PAWG5MP5JM55@bobo>
Subject: Re: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
From: "Nicholas Piggin" <npiggin@gmail.com>
To: <bugzilla-daemon@kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <bug-214913-206035@https.bugzilla.kernel.org/>
 <bug-214913-206035-9pRSjAqPTs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035-9pRSjAqPTs@https.bugzilla.kernel.org/>
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
Cc: Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Dec 12, 2022 at 3:57 PM AEST,  wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214913
>
> --- Comment #9 from Michael Ellerman (michael@ellerman.id.au) ---
> I assume it's an io_uring IO worker.
>
> They're created via create_io_worker() -> create_io_thread().
>
> They pass a non-NULL `args->fn` to copy_process() -> copy_thread(), so we=
 end
> up in the "kernel thread" branch of the if, which sets p->thread.regs =3D=
 NULL.

Hmm, you might be right. These things are created with the memory and
thread  / signal context shared with the userspace process.

Still doesn't seem like they should be involved in core dumping though,
pt_regs would have no meaning even if we did set something there. How
best to catch these and filter them out of the core dump? Check for
PF_IO_WORKER in the coredump gathering?

Thanks,
Nick
