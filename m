Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56E125B3A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 07:07:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dhHg17NKzDqpg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 17:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="R53bfuj7"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dhFq5vnvzDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 17:06:07 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id r14so3694968qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 22:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hh8KccvDtoxQ5iuVrGchqXmublC0voHoq882to+xc8w=;
 b=R53bfuj7F9qGYPrLECK10byImpR4yK7ldvvpoKHT/U0eDHOLw1wcoFq8sEaN7V8dMv
 RTI4OvZHrc3f4vy7R3joPd+QbgejX5prA8699eMCN0SdjkV+ay4zyheL8hzyrR8j0Hz/
 FSbhiR/D9Lrz4TPHD8PeiGOFQ05PJAOuxG6io4ksDgI2GAlOBrgWNi2fNQDz/0dj13ry
 xOkX2z5MAPFOPxMcQ00gmYTQjXZzcFH/t4p8AlNidMVPXMdT+a607AbRmiRnMrMkMMp1
 PtBjaGGkRJkB+xuc08WFU+jIhx9Qq1CE8ukBh1PQfVnawhwdWOVj8zlTfERE9/nPXNUG
 lVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hh8KccvDtoxQ5iuVrGchqXmublC0voHoq882to+xc8w=;
 b=JyKF8EEK1jFK+yP6hrnBPWlcfkO4Qtu8+dZq8S2f/TZGXc0w0NIFCfGTR7w40DDSkf
 rdvdjkoC4UYTatAn8BVqBQsXGyIguHIrHA1Vfz2s9x8NLCvq9Xgxj954PRRfAXlix3Tt
 9HYmwcFPxJACoObTrARZr+oyk0AalU5mRKe6XY5rMfHIxXMWzZGpjTRuDFKQU6NOrKFT
 6HRyVDWgoEO/F4I1n2MLuMl8szka4zRE8bN9o0lY1uK9mlXz/QOBgW41il7qXI94Ogyi
 p9RM3gTLoUBDa6jlg6g/KrUylNs/ItRABq39xSd/0iiqFT7BuPRqRW95jGpb/H6ka1RS
 YtoQ==
X-Gm-Message-State: APjAAAWPPUueyfeyTvKewM37sxuvb31KB7dk4kUH31Sr0491/5LXWfwT
 MBcjDjNbhs7MURaS32Wbmid0RA==
X-Google-Smtp-Source: APXvYqx76XeZmAMheUFNFZOiIvYT9bf+9MmsIr9SMAoK2rMgm3C8UxDFIykW+8QWnhd7emRgbJAyHw==
X-Received: by 2002:a37:7c6:: with SMTP id 189mr6850205qkh.408.1576735563755; 
 Wed, 18 Dec 2019 22:06:03 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 4sm1453127qki.51.2019.12.18.22.06.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 22:06:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: "ftrace: Rework event_create_dir()" triggers boot error messages
From: Qian Cai <cai@lca.pw>
In-Reply-To: <20191218233101.73044ce3@rorschach.local.home>
Date: Thu, 19 Dec 2019 01:06:02 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <7CC42C4D-8DD3-48E5-BB68-752BAB98DB56@lca.pw>
References: <0FA8C6E3-D9F5-416D-A1B0-5E4CD583A101@lca.pw>
 <20191218233101.73044ce3@rorschach.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux@googlegroups.com, Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Dec 18, 2019, at 11:31 PM, Steven Rostedt <rostedt@goodmis.org> =
wrote:
>=20
> On Wed, 18 Dec 2019 22:58:23 -0500
> Qian Cai <cai@lca.pw> wrote:
>=20
>> The linux-next commit "ftrace: Rework event_create_dir()=E2=80=9D [1] =
triggers boot warnings
>> for Clang-build (Clang version 8.0.1) kernels (reproduced on both =
arm64 and powerpc).
>> Reverted it (with trivial conflict fixes) on the top of today=E2=80=99s=
 linux-next fixed the issue.
>>=20
>> configs:
>> https://raw.githubusercontent.com/cailca/linux-mm/master/arm64.config
>> =
https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
>>=20
>> [1] =
https://lore.kernel.org/lkml/20191111132458.342979914@infradead.org/
>>=20
>> [  115.799327][    T1] Registered efivars operations
>> [  115.849770][    T1] clocksource: Switched to clocksource =
arch_sys_counter
>> [  115.901145][    T1] Could not initialize trace point =
events/sys_enter_rt_sigreturn
>> [  115.908854][    T1] Could not create directory for event =
sys_enter_rt_sigreturn
>> [  115.998949][    T1] Could not initialize trace point =
events/sys_enter_restart_syscall
>> [  116.006802][    T1] Could not create directory for event =
sys_enter_restart_syscall
>> [  116.062702][    T1] Could not initialize trace point =
events/sys_enter_getpid
>> [  116.069828][    T1] Could not create directory for event =
sys_enter_getpid
>> [  116.078058][    T1] Could not initialize trace point =
events/sys_enter_gettid
>> [  116.085181][    T1] Could not create directory for event =
sys_enter_gettid
>> [  116.093405][    T1] Could not initialize trace point =
events/sys_enter_getppid
>> [  116.100612][    T1] Could not create directory for event =
sys_enter_getppid
>> [  116.108989][    T1] Could not initialize trace point =
events/sys_enter_getuid
>> [  116.116058][    T1] Could not create directory for event =
sys_enter_getuid
>> [  116.124250][    T1] Could not initialize trace point =
events/sys_enter_geteuid
>> [  116.131457][    T1] Could not create directory for event =
sys_enter_geteuid
>> [  116.139840][    T1] Could not initialize trace point =
events/sys_enter_getgid
>> [  116.146908][    T1] Could not create directory for event =
sys_enter_getgid
>> [  116.155163][    T1] Could not initialize trace point =
events/sys_enter_getegid
>> [  116.162370][    T1] Could not create directory for event =
sys_enter_getegid
>> [  116.178015][    T1] Could not initialize trace point =
events/sys_enter_setsid
>> [  116.185138][    T1] Could not create directory for event =
sys_enter_setsid
>> [  116.269307][    T1] Could not initialize trace point =
events/sys_enter_sched_yield
>> [  116.276811][    T1] Could not create directory for event =
sys_enter_sched_yield
>> [  116.527652][    T1] Could not initialize trace point =
events/sys_enter_munlockall
>> [  116.535126][    T1] Could not create directory for event =
sys_enter_munlockall
>> [  116.622096][    T1] Could not initialize trace point =
events/sys_enter_vhangup
>> [  116.629307][    T1] Could not create directory for event =
sys_enter_vhangup
>> [  116.783867][    T1] Could not initialize trace point =
events/sys_enter_sync
>> [  116.790819][    T1] Could not create directory for event =
sys_enter_sync
>> [  117.723402][    T1] pnp: PnP ACPI init
>=20
> I noticed that all of the above have zero parameters. Does the
> following patch fix it?

Yes, it works.

>=20
> (note, I prefer "ret" and "i" on different lines anyway)
>=20
> -- Steve
>=20
> diff --git a/kernel/trace/trace_syscalls.c =
b/kernel/trace/trace_syscalls.c
> index 53935259f701..abb70c71fe60 100644
> --- a/kernel/trace/trace_syscalls.c
> +++ b/kernel/trace/trace_syscalls.c
> @@ -269,7 +269,8 @@ static int __init =
syscall_enter_define_fields(struct trace_event_call *call)
> 	struct syscall_trace_enter trace;
> 	struct syscall_metadata *meta =3D call->data;
> 	int offset =3D offsetof(typeof(trace), args);
> -	int ret, i;
> +	int ret =3D 0;
> +	int i;
>=20
> 	for (i =3D 0; i < meta->nb_args; i++) {
> 		ret =3D trace_define_field(call, meta->types[i],

