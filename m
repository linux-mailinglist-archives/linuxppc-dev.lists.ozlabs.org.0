Return-Path: <linuxppc-dev+bounces-12696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD9BC28F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 21:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ch6KZ60Mdz3bjb;
	Wed,  8 Oct 2025 06:54:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::443"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759866866;
	cv=none; b=ZaHIkv8yrFFRn6CtsulNyhbfbV39U3iKydbOG59HRKBESlSRqmOGl/TdEfo18XTXKaUWqibfdYUwOS+fid9aiTsIZbocrjcEJJMYTSLt5RYvbZjh3rJl5eIxyMnYwyZUedqr+xBnOIMWdajQ6fQbloTF2tMGXnevUma4OUPXwiSL1S5Um40egDcxEkBj0cqffMnx6FMQ8Wch72qpEyfinu+oORdTxIyOb6zSe+tRD12COyIqwF3Ma5ik78JVkIAI3p83kdMVacaNjv8hDOryxlbXcrN+Pq2oosTBrd5Q33/IH2MSCNieyWSAk+K/eGTDxE6DNNO8vti8wRP400X7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759866866; c=relaxed/relaxed;
	bh=yW/aQ0359kHD92Asr8l75TcASuOtUZ2H6uQ4aCH3qfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqxGcf01PVqMaODIenrrCGz9lYOQC/0kSWD800Zgt9S8RHLxX6Z/RfPxpPPmENYCVwiv+kKb3u2RQqAPXSs7mAMFzZ1nGfG8nyQTOew7f11T0D6t947DfyJE+//t0EOTEMnEYzIcMZlRMVWOA+fpZskfgCOSDBZxA0M8HMqOFZ5ZwNiakn69Tm2Mbjgon2gcHxZx5S2UDamk6ECbPosprZJiMkj1QSTHJni1Gezqv/j/fFxvOiztW8EBvc0nnwEBmb+4+0KEWKgMAA07qCSWeMfNqj9kKtiSWUaxvS6aRrI2V9v6X0R6FGa/zoD3kOjAl9/36YfAOsUuVqa86AIajg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VTB/NQUU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VTB/NQUU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ch6KY1tbKz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 06:54:23 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-782e93932ffso6137457b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759866862; x=1760471662; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW/aQ0359kHD92Asr8l75TcASuOtUZ2H6uQ4aCH3qfI=;
        b=VTB/NQUUFXolcvkunfBfoPO16cDkB5J+/v0sOBtms4lNTmIdZMrba39/X6DQV7l/X/
         VJ1kC85YycNR5Kll9Rn35xgkXg5QfFiAMtBEOZuZ3/r3IbdvydVkL7pMMeDdJ2cIcc3h
         zdzwNJDjUeSRPGuMMs9Ou4sammzr3lwsIINWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866862; x=1760471662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW/aQ0359kHD92Asr8l75TcASuOtUZ2H6uQ4aCH3qfI=;
        b=lUnfN7N9JvKvAVIvrsTKSIioTY/YyiJWB+0VMbAAVAKjI4K7LXoKyXOvorADtZc264
         eX1KjNYuOQ0Y/0zWztkn10jHRCpwzorKnRCNMBblvY9M4HNVpdSJAn9AMpD/biUrzAhM
         rgPG+TOD6QWi5ObGb6X8skMsiVmVteb2PHx5GjVq4UJ2mDPOP9Jn6fO0ZI5bPF3Ajqnf
         fJU7voEo1yJxhMuXF7ueMllfs1XH/VKuPTVBcOWV6pQkden6g+OXN+HRrAgR67R+DcLQ
         +Y9HuF5WUQ8qlNwFFDX3UBEowbDxRJgRGtAeXa4if6J7NTyO0sgagfVeFTNoVVe2714u
         UmuA==
X-Forwarded-Encrypted: i=1; AJvYcCWm2FvWKAOd9PstUrS2NP2BbGqXgxdliy5Jsa7SzgwEZ8J0s1iuKXvRaEB1kuRa+5AN64M8JBMCzGlvLwY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQueJ0Rq4bJ16/FdSbnXoBmciuymDs1HtPFLlbr2vymFjWxUOW
	QRCmFNm353QHMM74VNTPhQ4tOsrTzj1REzRoLrJOd3674HKpbdnws8YvnbOXuh9lABqdYSvnHsc
	MxvI=
X-Gm-Gg: ASbGncu62NL6tsoTUHkYkdStaDPBZ6P7d2AzSRiB8GXsKo10Tipv3JuIEKP6F4kuewD
	zLcyx1BbNYpWupfjHQ4gNe86AmC4tibRPDMSKLvZ7Fl23HIYuxPv/+oOmA/uH86v5Dug6pdrh3V
	xS5qvaJ1PdTOYr8Klw0aeopmqjo/0y+uT9qHyjZm+iV/QPaufX6c7zFO3fwI4y8Oez1EuO5hEqY
	3DtJsiBMHXWA+cNg55GFuE/kU7BzQ5qRQDWgGMm3/si5oBRZhX4pZ6pbCTj3DeDOVvRU2H3OvgL
	13YNXUYAXFewFDPzh/kh0F/imQVQhc4mXpCaKN77TVZYCdEPtYeE+UvVBsuRd3IsiRW/EaLO67/
	ctO8gzuqmFupadtuIrNf2iU6htDgeLZX7IITZGxBtWLDnP92UfHWHn24NxAybQ0hC/I3wwVLqDV
	uvTbwM4lGJIw==
X-Google-Smtp-Source: AGHT+IF3tYWvluZM7NB7+MpleUiieiY32T1VxCluUUzSPZ6tDhLDhXva/CDpNPpwV2+RDStsg5gOUg==
X-Received: by 2002:a05:6a20:7488:b0:2e3:a914:aac7 with SMTP id adf61e73a8af0-32da8130c42mr881664637.17.1759866862018;
        Tue, 07 Oct 2025 12:54:22 -0700 (PDT)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f99acesm16562444b3a.5.2025.10.07.12.54.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 12:54:21 -0700 (PDT)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-330b0bb4507so6037834a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 12:54:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMWRRbyIAaATCx02vZFWHclKRG31DdLMLk/QihfpCWLdU8KW6w55NYfmGZX9nuf+4QZUw9sreWpAYGZNY=@lists.ozlabs.org
X-Received: by 2002:a17:90b:48:b0:32e:5d87:8abc with SMTP id
 98e67ed59e1d1-33b51399953mr804760a91.36.1759866860576; Tue, 07 Oct 2025
 12:54:20 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
 <aMoTOXIKBYVTj7PV@mdev> <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
 <aMpIsqcgpOH1AObN@z2> <aMpRqlDXXOR5qYFd@mdev> <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com> <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
In-Reply-To: <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Oct 2025 12:54:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
X-Gm-Features: AS18NWApr4Rg-zXM3q8fbS_fiJ3b6uIVakfVzTHv9MBXxByROdeDBGbo6mNFQ44
Message-ID: <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	kees@kernel.org, masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com, 
	gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com, 
	arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com, 
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com, 
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org, 
	yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Mon, Oct 6, 2025 at 6:00=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Mon, Oct 6, 2025 at 4:32=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Mon, Oct 6, 2025 at 2:30=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> > >
> > > On Tue, Sep 16, 2025 at 11:14=E2=80=AFPM Jinchao Wang <wangjinchao600=
@gmail.com> wrote:
> > > >
> > > > On Tue, Sep 16, 2025 at 10:35:46PM -0700, Namhyung Kim wrote:
> > > > > Hello,
> > > > >
> > > > > On Tue, Sep 16, 2025 at 10:13:12PM -0700, Ian Rogers wrote:
> > > > > > On Tue, Sep 16, 2025 at 6:47=E2=80=AFPM Jinchao Wang <wangjinch=
ao600@gmail.com> wrote:
> > > > > > >
> > > > > > > On Tue, Sep 16, 2025 at 05:03:48PM -0700, Ian Rogers wrote:
> > > > > > > > On Tue, Sep 16, 2025 at 7:51=E2=80=AFAM Jinchao Wang <wangj=
inchao600@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > Currently, the hard lockup detector is selected at compil=
e time via
> > > > > > > > > Kconfig, which requires a kernel rebuild to switch implem=
entations.
> > > > > > > > > This is inflexible, especially on systems where a perf ev=
ent may not
> > > > > > > > > be available or may be needed for other tasks.
> > > > > > > > >
> > > > > > > > > This commit refactors the hard lockup detector to replace=
 a rigid
> > > > > > > > > compile-time choice with a flexible build-time and boot-t=
ime solution.
> > > > > > > > > The patch supports building the kernel with either detect=
or
> > > > > > > > > independently, or with both. When both are built, a new b=
oot parameter
> > > > > > > > > `hardlockup_detector=3D"perf|buddy"` allows the selection=
 at boot time.
> > > > > > > > > This is a more robust and user-friendly design.
> > > > > > > > >
> > > > > > > > > This patch is a follow-up to the discussion on the kernel=
 mailing list
> > > > > > > > > regarding the preference and future of the hard lockup de=
tectors. It
> > > > > > > > > implements a flexible solution that addresses the communi=
ty's need to
> > > > > > > > > select an appropriate detector at boot time.
> > > > > > > > >
> > > > > > > > > The core changes are:
> > > > > > > > > - The `perf` and `buddy` watchdog implementations are sep=
arated into
> > > > > > > > >   distinct functions (e.g., `watchdog_perf_hardlockup_ena=
ble`).
> > > > > > > > > - Global function pointers are introduced (`watchdog_hard=
lockup_enable_ptr`)
> > > > > > > > >   to serve as a single API for the entire feature.
> > > > > > > > > - A new `hardlockup_detector=3D` boot parameter is added =
to allow the
> > > > > > > > >   user to select the desired detector at boot time.
> > > > > > > > > - The Kconfig options are simplified by removing the comp=
lex
> > > > > > > > >   `HARDLOCKUP_DETECTOR_PREFER_BUDDY` and allowing both de=
tectors to be
> > > > > > > > >   built without mutual exclusion.
> > > > > > > > > - The weak stubs are updated to call the new function poi=
nters,
> > > > > > > > >   centralizing the watchdog logic.
> > > > > > > >
> > > > > > > > What is the impact on  /proc/sys/kernel/nmi_watchdog ? Is t=
hat
> > > > > > > > enabling and disabling whatever the boot time choice was? I=
'm not sure
> > > > > > > > why this has to be a boot time option given the ability to =
configure
> > > > > > > > via /proc/sys/kernel/nmi_watchdog.
> > > > > > > The new hardlockup_detector boot parameter and the existing
> > > > > > > /proc/sys/kernel/nmi_watchdog file serve different purposes.
> > > > > > >
> > > > > > > The boot parameter selects the type of hard lockup detector (=
perf or buddy).
> > > > > > > This choice is made once at boot.
> > > > > > >
> > > > > > >  /proc/sys/kernel/nmi_watchdog, on the other hand, is only a =
simple on/off
> > > > > > > switch for the currently selected detector. It does not chang=
e the detector's
> > > > > > > type.
> > > > > >
> > > > > > So the name "nmi_watchdog" for the buddy watchdog is wrong for =
fairly
> > > > > > obvious naming reasons but also because we can't differentiate =
when a
> > > > > > perf event has been taken or not - this impacts perf that is ch=
oosing
> > > > > > not to group events in metrics because of it, reducing the metr=
ic's
> > > > > > accuracy. We need an equivalent "buddy_watchdog" file to the
> > > > > > "nmi_watchdog" file. If we have such a file then if I did "echo=
 1 >
> > > > > > /proc/sys/kernel/nmi_watchdog" I'd expect the buddy watchdog to=
 be
> > > > > > disabled and the perf event one to be enabled. Similarly, if I =
did
> > > > > > "echo 1 > /proc/sys/kernel/buddy_watchdog" then I would expect =
the
> > > > > > perf event watchdog to be disabled and the buddy one enabled. I=
f I did
> > > > > >  "echo 0 > /proc/sys/kernel/nmi_watchdog; echo 0 >
> > > > > > /proc/sys/kernel/buddy_watchdog" then I'd expect neither to be
> > > > > > enabled. I don't see why choosing the type of watchdog implemen=
tation
> > > > > > at boot time is particularly desirable. It seems sensible to de=
fault
> > > > > > normal people to using the buddy watchdog (more perf events, po=
wer...)
> > > > > > and  CONFIG_DEBUG_KERNEL type people to using the perf event on=
e. As
> > > > > > the "nmi_watchdog" file may be assumed to control the buddy wat=
chdog,
> > > > > > perhaps a compatibility option (where the "nmi_watchdog" file c=
ontrols
> > > > > > the buddy watchdog) is needed so that user code has time to mig=
rate.
> > > > >
> > > > > Sounds good to me.  For perf tools, it'd be great if we can have =
a run-
> > > > > time check which watchdog is selected.
> > > > Considering backward compatibility, I prefer to keep
> > > > /proc/sys/kernel/nmi_watchdog and introduce a new file called
> > > > /proc/sys/kernel/hardlockup_detector_type, which only shows the def=
ault string
> > > > or the boot parameter.
> > >
> > > Is there code using the buddy watchdog that cares about the
> > > /proc/sys/kernel/nmi_watchdog file? My assumption is that everything
> > > except Android is using the NMI watchdog, so a new
> > > /proc/sys/kernel/buddy_watchdog file doesn't impact them.
> >
> > Buddy watchdog has been out there for a few years. At Google, I know
> > it's used by everything except Android. AKA I believe it is used in
> > Google's servers and also in ChromeOS. Both of those (presumably)
> > enable the buddy watchdog via calling it "nmi_watchdog". It's possible
> > that some Android phones are using the buddy watchdog too but I'm not
> > aware of it. I don't believe Pixel is using it, though that could
> > change in the future.
>
> I thought what motivated the buddy watchdog was patches implementing
> this approach on Android for ARM that lacked an NMI based hard lockup
> detector?

It's probably not worth a full rehash of the history, but suffice to
say that the buddy lockup detector did originally come out of Android
but isn't currently used there as far as I can tell.


> Anyway, while the buddy watchdog is in use by Google servers the
> nmi_watchdog file has an actively detrimental effect on that.
> Specifically the nmi_watchdog file having the value of "1" disables
> certain event groups for certain metrics in the perf tool as it is
> assumed there are too few performance counters due to the NMI watchdog
> stealing one. We want groups of events so that events are scheduled
> together and metrics are more accurate, we don't want groups that fail
> to schedule because of a lack of counters.

Fair enough, but that code could also change.


> > IMO at this point "nmi watchdog" is simply a synonym for the
> > hardlockup detector. That was what it looked like in the code before I
> > started messing around and adding the buddy lockup detector and it's
> > how it is now. While it's unfortunate that there are two names for the
> > same thing, I don't personally think that should change at this point.
> > FWIW, even the "buddy" watchdog relies on NMIs to actually get stack
> > crawls on stuck cores, so NMI still means something even there.
>
> I think this is misguided. Currently the only use of nmi_watchdog I'm
> aware of is by perf where the buddy watchdog's use of it causes issues
> (as mentioned above).
>
> > If we want to tell between the perf detector or the buddy detector we
> > should add a separate file for it.
>
> We could with perf then having to read from two files rather than one.
> Presumably the lack of presence of one file will be sufficient to also
> avoid a kernel version check.

This was what I was assuming


> > > On Android
> > > writing to /proc/sys/kernel/nmi_watchdog would switch from updating
> > > the buddy watchdog enable/disable to the NMI watchdog enable/disable,
> > > but it is a straightforward patch to make anything doing this update
> > > the buddy_watchdog file instead.
> >
> > Straightforward, but you've got to go find everyone that you break by
> > doing this. That's not something I want responsibility for. If you
> > want to convince others this is something worthwhile and you've got
> > someone signed up to deal with the fallout (if any) then I won't
> > object, but it's not something I'd be in support of.
>
> Stuff like this happens, check out this thread:
> https://lore.kernel.org/lkml/2025020304-chip-trench-4e56@gregkh/
> Imo we shouldn't design in using an actively misleading file name and
> incurring extra overhead in perf. Having two files nmi_watchdog and
> buddy_watchdog is fine as the latter case currently isn't in
> mainstream distro use and people shouldn't care. It also maintains and
> correct's perf's behavior when the buddy and not nmi watchdog is in
> use.
>
> > > If we have to keep "nmi_watchdog" then we should deprecate it and
> > > create an equivalent file with a better name (ie without NMI in it).
> > > It'll be moderately annoying in perf to determine whether the NMI
> > > watchdog is enabled by having to read two files.
> >
> > Again, up to you if you want to try to do this, but I'm not really in
> > support of it. It doesn't seem terribly hard to make a new file that
> > says which hardlockup detector is in use. If that file exists then
> > read it. If not then you fallback to what you have today.
>
> I don't mind a file that also says what kind of lockup detector is in
> use. I'd like the meaning of nmi_watchdog to keep meaning the kernel
> stole a perf counter as this is the behavior long assumed by perf
> which I think is the majority or only user of the file. I think the
> buddy watchdog being controlled by this file is less than intention
> revealing.

I'm more than happy to be outvoted, but IMO nothing about the name
"nmi_watchdog" says to me that a perf counter was stolen. It just says
that there's a watchdog that NMIs are part of its work.

...and, indeed, "nmi_watchdog" doesn't use perf on PPC, right? As far
as I can tell, from reading `arch/powerpc/kernel/watchdog.c` checks
`watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED`. ...and before I did
commit df95d3085caa ("watchdog/hardlockup: rename some "NMI watchdog"
constants/function") it was checking `watchdog_enabled &
NMI_WATCHDOG_ENABLED`. That was at least since 2019, I think...

...and you can see "PPC_WATCHDOG" depends on
"HARDLOCKUP_DETECTOR_ARCH", not "HARDLOCKUP_DETECTOR_PERF" so it's not
perf-backed.

I think this is just the critical question: does/should "nmi_watchdog"
mean perf-backed detector or is "nmi_watchdog" just a synonym for
"hard lockup detector". In your mind it's the former and in my mind
it's the latter. The correct way forward depends on which way we want
to jump, right? In either case some external code is going to need to
change...

The kernel docs are certainly pretty ambiguous here. "kernel.rst"
certainly mentions perf, but it also says that "nmi_watchdog" is only
for x86 which is certainly not true. "lockup-watchdogs.rst" doesn't
say anything about perf and just seems to indicate that "nmi_watchdog"
is another name for the hardlockup detector.  "kernel-parameters.txt"
makes some mention of tweaking which perf event would be used, but
otherwise makes it sound like the nmi_watchdog is just another name
for the hardlockup detector.

My vote would be two files:

* "nmi_watchdog" - simply a synonym for "hardlockup detector". 1
enabled, 0 if not (like today)

* "hardlock_detector" - could be "buddy", "perf", or "arch"

...if the "hardlockup_detector" file doesn't exist and "nmi_watchdog"
is enabled, you could probably guess that a perf event was in use. If
the "hardlockup_detector" file exists then a perf event is only in use
if the value of that file is "perf". It doesn't feel terribly hard to
do this and it doesn't break anyone who was assuming they could turn
on the hardlockup detector with "/proc/nmi_watchdog".

-Doug

