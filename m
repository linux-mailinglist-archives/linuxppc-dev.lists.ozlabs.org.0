Return-Path: <linuxppc-dev+bounces-5636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C1A20DAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:54:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8wX1hflz3048;
	Wed, 29 Jan 2025 02:54:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738079644;
	cv=none; b=eT8xndPjZRoG4sS+KXxZRHUW71Fev9JMh0G064yjvX+TDA65+hyKle3LFHdksb8bU2Xr7x98fJDKC9xmBhVDlhj6812TRqEQXjFE1hK90CBAzTXxxkLaLsvGO8OIVGb8loCvaYrfXZF/5TeGYL0wIIcHWZvueMDwF4BsmiliVgenIzDzBq6AhjWPdCzuS7ACC5aOSMe6h+e3kKr7qMEMYL5lHuWqgO5Zq9f/rAw6OPQ0yiigZvXMEfHuj2Ow6AdwW/2Z2QBXXRqWaQKRLOMiwGiNoA05Z5SQUB3f31eLGiOrhplGFSJ8JuCQO3gE+BchQeA7Jf6hW0lA3qgahK46/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738079644; c=relaxed/relaxed;
	bh=yB6zDKaYttU4WZrMX99po3M771UWLAKUHeQTUDVdnE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNiwUPtWKUdYkL1bgpyUmakxq/UemI8OW7UVpzIbTmu6dnEho/bXa0oUKurbjjFIH21Ne4QMUsptcIGdMZfWKh8abRLJvC512tWFEBmTxPCZUP1GWxfkiaUz93jtdre22SXI5SRXpd73QHFuWqY6Fkc2Q3RHVDgOZxd+0TB+Z2A27Ho3nri4cTErkH1F16BldN0yEIhsWzvWQngeloQVkWpXkXECMNQky8atyxMzG7ip4gKaZOOodZ49qrJxfv0+3fFp1n9LxmVIDnwNGcQIte0HAbzCTilEXKazq5FnuuiJo9T9qchQSCqd0478Yr2s+J6p7vmEmdfOrI8dYU8lIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lpZ/KsjZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=evgsyr@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lpZ/KsjZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=evgsyr@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj8wT5zWvz303K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:54:01 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so9985213a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 07:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738079639; x=1738684439; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB6zDKaYttU4WZrMX99po3M771UWLAKUHeQTUDVdnE8=;
        b=lpZ/KsjZAJeWlzBlIeka9dWfN2Ilzl6ODqUwujqaG3F6teja5bjuITu8iojKbid8ye
         4CjR98NmZ9BLrNpUmZr+iMlw1JP7U4BO1pXL6O4vG+7WdxIZAuA5rXvEBD/bHXoLpHoC
         boqhcYGIeioXt20NTcDUTgl0SfTl+Fd60+lpXXkUaQ5aylBsnzagebWKa3c99Z5+obqr
         tlY6p9RV38IjrQlyMuoE2osY2UsQKC3QZg8pTlti1u0shJCiFkA7OGLJaBIfk2IpZVJ4
         g2ivugvWfKsHbs9++53TorX7vCNqGbUDaHvaJa79nQ/SOyGulnVfFnjVTftNJAwzSrh/
         HdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738079639; x=1738684439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB6zDKaYttU4WZrMX99po3M771UWLAKUHeQTUDVdnE8=;
        b=FwUPZDwGWY3ZNZnVXKAQNJh0DN/ZueN2GRGqYR7RCRyaU/XQISx7ut3pkLAIHP2GWs
         7E0Mz+FXCg8I2Otp2fQq7espVbiXjPnyvptdyiLJCPJ6M9YMmGxA++IQKv+flGr4BjN2
         +q4dhrotU1vEq4N3FskDVnOfCiMad3ov9tJCy9ZhDz174TSaZ126YdoJpzQ0FjF55D8R
         9HbN7IHb7koZ6PpqNwb6lzNgS3hUpEKeDg5UeR9EXM6OSpbW4vXvUhj1bAPFl4tPOsmg
         7cwLfjR5Ii6TOvAmpTgFFrrILdzRURwQbgjJx3HNW8bfaBOhYy0miMKoPQattZdOviYR
         /J0g==
X-Forwarded-Encrypted: i=1; AJvYcCVcfYrlxmIJwhFj2dO+MULaChxkBgnWx4VOhSQFb6enbO8OacNUP/M9/OhJSb/iXyq8FXq5TLuCwAKAE4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1Le1nu3imEbpNYdpOIfNe5jzA3LUTYNP7MWQpZFBdYvF/aCEd
	MHFOXqBIsHCIyjZiFGpEvljMqSVqvSG5viwqh0ru4BhAP46Zq+pEYfKoREtFbAwj3vVp1C3Jh1+
	nUuRLYa+JZzI8tsGgAW4oBLAVYWU=
X-Gm-Gg: ASbGncubHGp6f/eR+fANgQuayR6w4gkAnbqvdKyanGMUP0dFACLNuQo3NK+JizkK+tH
	lBuOWArj6sjaQY8Ji67oCcKfHn8EJIuoYi2WaXo2m350tw7m3Zsk9AgdrVTdJE68P+r44cu/i
X-Google-Smtp-Source: AGHT+IGr9SsZB/12ctFPsu7VikJYTEFKRiPU5nFYkstvuzVx6dj2VqGeIoH4j8GAyQ/J9JH/30jEO1+XCNC22uRQJ4Q=
X-Received: by 2002:a17:90b:2e4b:b0:2ea:9ccb:d1f4 with SMTP id
 98e67ed59e1d1-2f782afebd6mr78293670a91.0.1738079639188; Tue, 28 Jan 2025
 07:53:59 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250127181322.GA1373@strace.io> <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
In-Reply-To: <d0b7849d-2ec3-4652-8b60-98ae63316ded@csgroup.eu>
From: Eugene Syromyatnikov <evgsyr@gmail.com>
Date: Tue, 28 Jan 2025 16:54:17 +0100
X-Gm-Features: AWEUYZmtRC0_g2l3mL21UwYdgidPcwJX7tFWICwuZasHhVkyfmoyu2jp8ZeCrxk
Message-ID: <CACGkJduXFvG=6EAJrpgq1y6ML2TciehWc1uUcNT45Dcu89wX4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc: properly negate error in syscall_set_return_value()
 in sc case
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Michael Ellerman <mpe@ellerman.id.au>, 
	Alexey Gladkov <legion@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	strace-devel@lists.strace.io, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 28, 2025 at 3:59=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
> Le 27/01/2025 =C3=A0 19:13, Dmitry V. Levin a =C3=A9crit :
> > According to the Power Architecture Linux system call ABI documented in
> > [1], when the syscall is made with the sc instruction, both a value and=
 an
> > error condition are returned, where r3 register contains the return val=
ue,
> > and cr0.SO bit specifies the error condition.  When cr0.SO is clear, th=
e
> > syscall succeeded and r3 is the return value.  When cr0.SO is set, the
> > syscall failed and r3 is the error value.  This syscall return semantic=
s
> > was implemented from the very beginning of Power Architecture on Linux,
> > and syscall tracers and debuggers like strace that read or modify sysca=
ll
> > return information also rely on this ABI.
>
> I see a quite similar ABI on microblaze, mips, nios2 and sparc. Do they
> behave all the same ?

In terms of ABI, yes:
https://gitlab.com/strace/strace/-/blob/master/src/linux/sparc/get_error.c
https://gitlab.com/strace/strace/-/blob/master/src/linux/mips/get_error.c
https://gitlab.com/strace/strace/-/blob/master/src/linux/nios2/get_error.c

(cf. https://gitlab.com/strace/strace/-/blob/master/src/linux/powerpc/get_e=
rror.c
)

I can't find microblaze SyscallV ABI, but at least both strace and
glibc expect negated errno in r3:
https://gitlab.com/strace/strace/-/blob/master/src/linux/microblaze/get_err=
or.c
https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sysv/li=
nux/microblaze/syscall.S;h=3D6ebf688d800e19c14a140f0cd5a0ba9344fa95a5;hb=3D=
HEAD

> > r3 and cr0.SO are exposed directly via struct pt_regs where gpr[3] and
> > (ccr & 0x10000000) correspond to r3 and cr0.SO, respectively.
> > For example, here is an excerpt from check_syscall_restart() that assig=
ns
> > these members of struct pt_regs:
> >          regs->result =3D -EINTR;
> >          regs->gpr[3] =3D EINTR;
> >          regs->ccr |=3D 0x10000000;
> > In this example, the semantics of negative ERRORCODE that's being used
> > virtually everywhere in generic kernel code is translated to powerpc sc
> > syscall return ABI which uses positive ERRORCODE and cr0.SO bit.
>
> At what point are they exposed really ? At what point do they need to
> comply with the ABI ?

On ptrace stops via pt_regs, for example?

> I'm also a bit lost between regs->orig_r3, regs->gpr[3] and regs->result.
>
> The comment added by commit 1b1a3702a65c ("powerpc: Don't negate error
> in syscall_set_return_value()") says that CCR needs to be set because of
> signal code. But signal code is invoked by syscall_exit_prepare()
> through call to interrupt_exit_user_prepare_main() after setting CR[SO]
> and negating syscall result.
>
> >
> > Also, r3 and cr0.SO are exposed indirectly via helpers.
> > For example, here is an excerpt from syscall_get_error():
> >          /*
> >           * If the system call failed,
> >           * regs->gpr[3] contains a positive ERRORCODE.
> >           */
> >          return (regs->ccr & 0x10000000UL) ? -regs->gpr[3] : 0;
> > and here is another example, from regs_return_value():
> >          if (is_syscall_success(regs))
> >                  return regs->gpr[3];
> >          else
> >                  return -regs->gpr[3];
> > In these examples, the powerpc sc syscall return ABI which uses positiv=
e
> > ERRORCODE and cr0.SO bit is translated to the semantics of negative
> > ERRORCODE that's being used virtually everywhere in generic kernel code=
.
> >
> > Up to a certain point in time the kernel managed to implement the power=
pc
> > sc syscall return ABI in all cases where struct pt_regs was exposed to =
user
> > space.
> >
> > The situation changed when SECCOMP_RET_TRACE support was introduced.
> > At this point the -ERRORCODE semantics that was used under the hood to
> > implement seccomp on powerpc became exposed to user space.  The tracer
> > handling PTRACE_EVENT_SECCOMP is not just able to observe -ENOSYS in gp=
r[3]
> > - this is relatively harmless as at this stage there is no syscall retu=
rn
> > yet so the powerpc sc syscall return ABI does not apply.  What's import=
ant
> > is that the tracer can change the syscall number to -1 thus making the
> > syscall fail, and at this point the tracer is also able to specify the
> > error value.  This has to be done in accordance with the syscall return
> > ABI, however, the current implementation of do_seccomp() supports both =
the
> > generic kernel -ERRORCODE return value ABI and the powerpc sc syscall
> > return ABI, thanks to syscall_exit_prepare() that converts the former t=
o
> > the latter.  Consequently, seccomp_bpf selftest passes both with and
> > without this change.
> >
> > Now comes the moment when PTRACE_SET_SYSCALL_INFO is going to be
> > introduced.  PTRACE_SET_SYSCALL_INFO is a generic ptrace API that
> > complements PTRACE_GET_SYSCALL_INFO by letting the ptracer modify
> > the details of the system calls the tracee is blocked in.
> >
> > One of the helpers that have to be used to implement
> > PTRACE_SET_SYSCALL_INFO is syscall_set_return_value().
> > This helper complements other two helpers, syscall_get_error() and
> > syscall_get_return_value(), that are currently used to implement
> > PTRACE_GET_SYSCALL_INFO on syscall return.  When syscall_set_return_val=
ue()
> > is used to set an error code, the caller specifies it as a negative val=
ue
> > in -ERRORCODE format.
> >
> > Unfortunately, this does not work well on powerpc since commit 1b1a3702=
a65c
> > ("powerpc: Don't negate error in syscall_set_return_value()") because
> > syscall_set_return_value() does not follow the powerpc sc syscall retur=
n
> > ABI:
> >       /*
> >        * In the general case it's not obvious that we must deal with
> >        * CCR here, as the syscall exit path will also do that for us.
> >        * However there are some places, eg. the signal code, which
> >        * check ccr to decide if the value in r3 is actually an error.
> >        */
> >       if (error) {
> >               regs->ccr |=3D 0x10000000L;
> >               regs->gpr[3] =3D error;
> >       } else {
> >               regs->ccr &=3D ~0x10000000L;
> >               regs->gpr[3] =3D val;
> >       }
> >
> > The reason why this syscall_set_return_value() implementation was able =
to
> > get away with violating the powerpc sc syscall return ABI is the follow=
ing:
> > Up to now, syscall_set_return_value() on powerpc could be called only f=
rom
> > do_syscall_trace_enter() via do_seccomp(), there was no way it could be
> > called from do_syscall_trace_leave() which is the point where tracers o=
n
> > syscall return are activated and the powerpc sc syscall return ABI has
> > to be respected.
> >
> > Introduction of PTRACE_SET_SYSCALL_INFO necessitates a change of
> > syscall_set_return_value() to comply with the powerpc sc syscall return
> > ABI.  Without the change, the upcoming ptrace/set_syscall_info selftest
> > fails with the following diagnostics:
> >
> >    # set_syscall_info.c:119:set_syscall_info:Expected exp_exit->rval (-=
38) =3D=3D info->exit.rval (38)
> >    # set_syscall_info.c:120:set_syscall_info:wait #4: PTRACE_GET_SYSCAL=
L_INFO #2: exit stop mismatch
> >
> > Note that since backwards compatibility with the current implementation=
 has
> > to be provided, the kernel has to continue supporting simultaneously bo=
th
> > the generic kernel -ERRORCODE return value ABI and the powerpc sc sysca=
ll
> > return ABI at least for PTRACE_EVENT_SECCOMP tracers.  Consequently, si=
nce
> > the point of __secure_computing() invocation and up to the point of
> > conversion in syscall_exit_prepare(), gpr[3] may be set according to ei=
ther
> > of these two ABIs.  An attempt to address code inconsistencies in sysca=
ll
> > error return handling that were introduced as a side effect of the dual
> > ABI support follows in a separate patch.
>
> What do you mean by "backwards compatibility" here ? backwards
> compatibility applies only to userspace API doesn't it ? So if there was
> no way to trigger the problem previously, what does it mean ?

ptrace and seccomp users are pretty much userspace, aren't they?

> >
> > Link: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Farch%2Fpowerpc%2Fsyscall64-abi.ht=
ml%23return-value&data=3D05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cc2cf5902=
81c24fe1478408dd3efe4a3e%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C63873=
5984085033893%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuM=
DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=
=3DEEP9s6k%2Fs5VfqWgrs6VXi879HEfJ8BYOOJ8InmmVTQA%3D&reserved=3D0 [1]
> > Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> > Reviewed-by: Alexey Gladkov <legion@kernel.org>
> > ---
> >   arch/powerpc/include/asm/syscall.h | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/=
asm/syscall.h
> > index 3dd36c5e334a..422d7735ace6 100644
> > --- a/arch/powerpc/include/asm/syscall.h
> > +++ b/arch/powerpc/include/asm/syscall.h
> > @@ -82,7 +82,11 @@ static inline void syscall_set_return_value(struct t=
ask_struct *task,
> >                */
> >               if (error) {
> >                       regs->ccr |=3D 0x10000000L;
> > -                     regs->gpr[3] =3D error;
> > +                     /*
> > +                      * In case of an error regs->gpr[3] contains
> > +                      * a positive ERRORCODE.
> > +                      */
> > +                     regs->gpr[3] =3D -error;
> >               } else {
> >                       regs->ccr &=3D ~0x10000000L;
> >                       regs->gpr[3] =3D val;
>


--=20
Eugene Syromyatnikov
mailto:evgsyr@gmail.com
xmpp:esyr@jabber.{ru|org}

