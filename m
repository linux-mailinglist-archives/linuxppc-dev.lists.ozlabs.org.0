Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C2E835BCB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 08:39:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uwIKI1Be;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJMYk55rsz3byl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 18:39:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=uwIKI1Be;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJMXv3Lkcz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jan 2024 18:38:54 +1100 (AEDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5ffee6e8770so5586807b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jan 2024 23:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705909131; x=1706513931; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btEptr2pD3e12BZE7dkiwHzMFQh/dHJsUOjIgsxvBmo=;
        b=uwIKI1Be/Of6+hACimCjihUKAbEbkwXHposfkmzJZEofpzn+wtuwbkH46/wHvibTt3
         3XYPcBD3ZK/HTrdPpkltMU8dh1N4z+qt/lBHFqWFMITOeZwdJrVfSxaVIdRBQcmOPIjx
         LPu/mBlBiObEGq3dZlKn6xahSXnj2l3ibEdZWeSQv03L7hr8B4UKUqM3p9GSIOwGGiOn
         z0zFQOEFEuI8xq9THah9Nm+bPWwX+vpUNG5FnCe+LNbyUsmxsK6ZEDJFoAMCUv5dNmaf
         iLcwzXM7IFijPUGgMlbgb/Jh00FawOEMgG3hEc0t8XClHL/j6l+ZQQq10yWI1T5r+H0U
         JelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705909131; x=1706513931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btEptr2pD3e12BZE7dkiwHzMFQh/dHJsUOjIgsxvBmo=;
        b=n72em7RCacot7uLEZuiJwaLzLB5QtnIuRJfeNs0judSYftiPUHsZK5ViNZLJ6D3Ken
         c95Kx/0gqumkJUpIuMyowFCsvvotMHF9RM1GJOLBlxvAUksb0oN84V1sUMVYPQ5IlI8q
         ClExdteLSnC3EvZkKek7GmWNU469rcAu5BgTqrFRziBLdtGaVtB9oiFt+qyQmQSZqE4C
         XsOnG+4RYsKXpqVgD7rSaQ3Fyi4/m9iy+CTA8pNJLBMJwJpwUNVQewJ30tlsAUsQ8UES
         UlfQ4e6kKVHgSlSPNLtAaaf3zXwp1Q3hsDmq+GofQSXMds1xyxRQAXYdyZWsQTgBU3Yq
         sK+g==
X-Gm-Message-State: AOJu0Yzfk6rrI54xiPLldgB0u1AL3N40Icd1oUWdKiLagNcFt4dxZnU4
	EBeTEoO4S7WjwDEjM4npzJ+jVWTov/uo7BsfIzPYQ6v7xCtDgxvEodZYGMFqcao1Ro6+LUBK+YY
	umF1cUY5fvoAdCBmml4vqWREpBLJ9+d6DmhL9
X-Google-Smtp-Source: AGHT+IGjEOIHrmfM7ezfh27Xzea24O4bRYWpgPSlKnEmn5Ffc3QES0sPWXdEsTBBAXnmQNHKy//6OSpslLEBp2dKAfc=
X-Received: by 2002:a81:7202:0:b0:5ff:b07b:99f0 with SMTP id
 n2-20020a817202000000b005ffb07b99f0mr1289150ywc.93.1705909130740; Sun, 21 Jan
 2024 23:38:50 -0800 (PST)
MIME-Version: 1.0
References: <20231226214610.109282-1-surenb@google.com> <170578498755.24348.16166096320323933297.git-patchwork-notify@kernel.org>
 <Zaw31DVa9q3JZASo@shell.armlinux.org.uk>
In-Reply-To: <Zaw31DVa9q3JZASo@shell.armlinux.org.uk>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 21 Jan 2024 23:38:38 -0800
Message-ID: <CAJuCfpGV_CwQm+PuiqRz3L1x7QnpgE9LQb4PPChqFv0mzbYeBw@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch/mm/fault: fix major fault accounting when
 retrying under per-VMA lock
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: linux-s390@vger.kernel.org, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, willy@infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, palmer@dabbelt.com, luto@kernel.org, linux-riscv@lists.infradead.org, patchwork-bot+linux-riscv@kernel.org, will@kernel.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jan 20, 2024 at 1:15=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Sat, Jan 20, 2024 at 09:09:47PM +0000, patchwork-bot+linux-riscv@kerne=
l.org wrote:
> > Hello:
> >
> > This patch was applied to riscv/linux.git (fixes)
> > by Andrew Morton <akpm@linux-foundation.org>:
> >
> > On Tue, 26 Dec 2023 13:46:10 -0800 you wrote:
> > > A test [1] in Android test suite started failing after [2] was merged=
.
> > > It turns out that after handling a major fault under per-VMA lock, th=
e
> > > process major fault counter does not register that fault as major.
> > > Before [2] read faults would be done under mmap_lock, in which case
> > > FAULT_FLAG_TRIED flag is set before retrying. That in turn causes
> > > mm_account_fault() to account the fault as major once retry completes=
.
> > > With per-VMA locks we often retry because a fault can't be handled
> > > without locking the whole mm using mmap_lock. Therefore such retries
> > > do not set FAULT_FLAG_TRIED flag. This logic does not work after [2]
> > > because we can now handle read major faults under per-VMA lock and
> > > upon retry the fact there was a major fault gets lost. Fix this by
> > > setting FAULT_FLAG_TRIED after retrying under per-VMA lock if
> > > VM_FAULT_MAJOR was returned. Ideally we would use an additional
> > > VM_FAULT bit to indicate the reason for the retry (could not handle
> > > under per-VMA lock vs other reason) but this simpler solution seems
> > > to work, so keeping it simple.
> > >
> > > [...]
> >
> > Here is the summary with links:
> >   - [1/1] arch/mm/fault: fix major fault accounting when retrying under=
 per-VMA lock
> >     https://git.kernel.org/riscv/c/46e714c729c8
> >
> > You are awesome, thank you!
>
> Now that 32-bit ARM has support for the per-VMA lock, does that also
> need to be patched?

Yes, I think so. I missed the ARM32 change that added support for
per-VMA locks. Will post a similar patch for it tomorrow.
Thanks,
Suren.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
