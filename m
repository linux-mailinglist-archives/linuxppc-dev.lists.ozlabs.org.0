Return-Path: <linuxppc-dev+bounces-12697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8EBC2AAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 22:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ch7Py2tFZz3bjb;
	Wed,  8 Oct 2025 07:43:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759869798;
	cv=none; b=nDhCw86q4bfxSsYLDYLROqbbFk8Y58JdVIH+WY1uHmLvSDRTsxFTjp+FuTW/ZkCRFCXczccvzJ247WBAP87yEOcXB/5pkN10OLdqi/UOpiJ0fXhdtPqMhoy1kJjM7pwsOKQP8ULhHf71p18PMlRC+Ig3qTgTkUa83jL2GOrjw2wnV+L8qtkqZNnGbYDbdk9+oTjG7rz3OEoXBZJpPARw0R/d1bFhDBAXsbMJIcsS31+zA5GP57kmR+Qa9lgbr2zJsZU0FN1utUpoxS6AdlevGnixkTvHHHPyt5Gem1nfAtKnBWQyMEsFoyGWexPvMSSvaqFDIi/JhtShyiJW+aMnMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759869798; c=relaxed/relaxed;
	bh=JrvroDu2Y58Bd2NdGW9gMhnFH6MprmLVyBvqC8xWpCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wea3HxAEN29qLoSR2GTOeJPTKs2erz2T3rJfM8oIjnaL8OGgQvi+2kPjSQq8Fvv0a0NCXDhxFuWNmCY2uNax5DL03Ufdw4X9agytawAhBAfEaUiRxd5ya91t2PTNrWYhyoVxpgyYWOX13A2woBWUxjpjfduNGqQ2KAcUUoz7gsdvcen3+1oqoHt2OZj0SJaV/sw7a/EZ85iZ/kIYZPh4XZ1aZvFmmJmzr3L7sq/Ui3rrp+Dg8gf/bB7i8MM1uMj5jqmPTiRaMPY3MjbTOuY4N/X7W9LWytcE7IReaJvQetWNRdC0jmFGOTR9QTEQO4dgalRa54oF4+147kUC0yMvRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ClaNq2M+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ClaNq2M+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ch7Px13qBz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 07:43:16 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-27d67abd215so74425ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 13:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759869794; x=1760474594; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrvroDu2Y58Bd2NdGW9gMhnFH6MprmLVyBvqC8xWpCY=;
        b=ClaNq2M+0/gn4TSflCORWUNDPS5AUdfHQ6kIM1l6RChgP2UKKyWdyAicyKlWtDI86A
         yH6G1qy9Yai9mSbq0d9vUWv5L/yN73dQZxdq/xbc62SDzC7sjISfPr7oF46zlmM7tjGO
         dGp+nR9VBLav3kIDGDSei3bEzjduY7yg+dwIh3LrImKxy83AyciTYDQhHrJwe1UbQJ24
         Y4RVqCVYM6tzJ53oXQ8eGj7dRjYCDA06Y+buQfhzhNhgavoDacHkgpgtHmzvGhlyz3NY
         /3PmvBU8D0cLrrpMKEU+C2vciUD3NpZl7JO+KoC7kqu4Glkjl73gRoTyEV+wBgTNGQ02
         /9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759869794; x=1760474594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrvroDu2Y58Bd2NdGW9gMhnFH6MprmLVyBvqC8xWpCY=;
        b=XQAhkjBEbe9HRPzwGYVQPmBQyY4bE6q0+abOcUmhlfSTPdlwhUJLJpXha2Ek4uuxYa
         xG3tvtCtalqisVEqAnTcYtOLgbT8AXDlu/Kc1miJWbfzJSO6ODcuEueZltSnV17l7HU/
         835rjSVgS+eHe2mh4ZicnMBPdVNaCFaqZgTT6472mrSYE8J1wUrBplbN3b3p9PJDuJy/
         xsNYpfaAY50mb0Xpji1Y62tb0AQXSg2/DhPUZcM2NFCCG6o92uaNLnTSK7AK/8VMR9ME
         VIN8EMCR4e9+uWbaC09dghYI+uRxj+PxZRWEGmEycoASfrROZUpF4NiIhZFqS4lWFofl
         XPuw==
X-Forwarded-Encrypted: i=1; AJvYcCXPLi66J2kw0cF+prXePANuZQnsLOgTF8lozpQ3JywGo6XL+yRWeNLg35psZ2D864BfyPJFKr/piEtYgHs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyh325um25lORE6etAI/33lVh3zZnn6TX2ZyQk7Z33WbVnYD61s
	tsaN4rtZCfxFHFWdXVWDpTO9LWdbqPNtQ+Opgfz6kHo46mP6JPpTi7H50m6qdy9EWa7yLeudHNG
	3GKt8i14vqAJbvPSsCTsd+kYZSW6HsdavsWR6c3sZ
X-Gm-Gg: ASbGncshBG0cO6NzYQBpBvVSWoqAnndsatBS5d3bDgs7qMc0ghsC4bYwo+zU16JGeNu
	K/OniO2XljkMuJGITumNBdMVHkUSuNU1BlgYmgNvprEspWDkXFK9/oUdH9wxdrPKKC4fcANAf1o
	o7e6NfkDgGiSh9NIH37oDkuXBXlznhel3Iigio2fQnWeEAOVXGik6/nDBtYGJVOA4TKKz/50UqJ
	DiTBjsyMcSoRc8AYGZKW0cCtUUAM/eiMBhwm+55NOikpUwPxmUs0SCjne5LmfDkNT+5k/1YZdrB
	Iko=
X-Google-Smtp-Source: AGHT+IGbXb7nFN5J4p1/T3D5a/IxHPzmlMZifarQz/afbkDMwBvBlnMVxodYD8mtYvw0vq22RqLnRdIlnOCbKvzs1c0=
X-Received: by 2002:a17:903:380b:b0:26a:befc:e7e1 with SMTP id
 d9443c01a7336-2902768ec26mr1656665ad.12.1759869794130; Tue, 07 Oct 2025
 13:43:14 -0700 (PDT)
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
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com> <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
In-Reply-To: <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Oct 2025 13:43:02 -0700
X-Gm-Features: AS18NWBJDZpgfMKp4dMPapMw2PYlBgKsiMEPgy_0H0wauCMcp7CJDsUIkIcziJs
Message-ID: <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Doug Anderson <dianders@chromium.org>
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 7, 2025 at 1:00=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
> On Mon, Oct 6, 2025 at 6:00=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
..
> > I don't mind a file that also says what kind of lockup detector is in
> > use. I'd like the meaning of nmi_watchdog to keep meaning the kernel
> > stole a perf counter as this is the behavior long assumed by perf
> > which I think is the majority or only user of the file. I think the
> > buddy watchdog being controlled by this file is less than intention
> > revealing.
>
> I'm more than happy to be outvoted, but IMO nothing about the name
> "nmi_watchdog" says to me that a perf counter was stolen. It just says
> that there's a watchdog that NMIs are part of its work.
>
> ...and, indeed, "nmi_watchdog" doesn't use perf on PPC, right? As far
> as I can tell, from reading `arch/powerpc/kernel/watchdog.c` checks
> `watchdog_enabled & WATCHDOG_HARDLOCKUP_ENABLED`. ...and before I did
> commit df95d3085caa ("watchdog/hardlockup: rename some "NMI watchdog"
> constants/function") it was checking `watchdog_enabled &
> NMI_WATCHDOG_ENABLED`. That was at least since 2019, I think...
>
> ...and you can see "PPC_WATCHDOG" depends on
> "HARDLOCKUP_DETECTOR_ARCH", not "HARDLOCKUP_DETECTOR_PERF" so it's not
> perf-backed.
>
> I think this is just the critical question: does/should "nmi_watchdog"
> mean perf-backed detector or is "nmi_watchdog" just a synonym for
> "hard lockup detector". In your mind it's the former and in my mind
> it's the latter. The correct way forward depends on which way we want
> to jump, right? In either case some external code is going to need to
> change...

So we could say it is one-idea against another, I'm hoping to be
objective and come from the viewpoint of the perf code as part of its
function is to be a demonstration of APIs and the buddy watchdog has
altered this. The perf tool has referred to the nmi_watchdog's
behavior in man pages and code since 2016:
http://lkml.kernel.org/r/1459810686-15913-1-git-send-email-andi@firstfloor.=
org
```
+Globally pinned events can limit the number of counters available for
+other groups. On x86 systems, the NMI watchdog pins a counter by default.
+The nmi watchdog can be disabled as root with
+
+       echo 0 > /proc/sys/kernel/nmi_watchdog
```
http://lkml.kernel.org/r/1464119559-17203-1-git-send-email-andi@firstfloor.=
org
```
+void arch_topdown_group_warn(void)
+{
+       fprintf(stderr,
+               "nmi_watchdog enabled with topdown. May give wrong results.=
\n"
+               "Disable with echo 0 > /proc/sys/kernel/nmi_watchdog\n");
+}
```

Probably the most common error message dates back to 2017:
http://lkml.kernel.org/r/20170211183218.ijnvb5f7ciyuunx4@pd.tnic
```
      Some events weren't counted. Try disabling the NMI watchdog:
           echo 0 > /proc/sys/kernel/nmi_watchdog
           perf stat ...
           echo 1 > /proc/sys/kernel/nmi_watchdog
```
and that is saying "NMI watchdog" not "buddy watchdog". Users are
familiar with the idea that the /proc/sys/kernel/nmi_watchdog is
unremarkably controlling the NMI watchdog.

I've not found another use of /proc/sys/kernel/nmi_watchdog outside of
the perf tool.

> The kernel docs are certainly pretty ambiguous here. "kernel.rst"
> certainly mentions perf, but it also says that "nmi_watchdog" is only
> for x86 which is certainly not true. "lockup-watchdogs.rst" doesn't
> say anything about perf and just seems to indicate that "nmi_watchdog"
> is another name for the hardlockup detector.  "kernel-parameters.txt"
> makes some mention of tweaking which perf event would be used, but
> otherwise makes it sound like the nmi_watchdog is just another name
> for the hardlockup detector.
>
> My vote would be two files:
>
> * "nmi_watchdog" - simply a synonym for "hardlockup detector". 1
> enabled, 0 if not (like today)
>
> * "hardlock_detector" - could be "buddy", "perf", or "arch"
>
> ...if the "hardlockup_detector" file doesn't exist and "nmi_watchdog"
> is enabled, you could probably guess that a perf event was in use. If
> the "hardlockup_detector" file exists then a perf event is only in use
> if the value of that file is "perf". It doesn't feel terribly hard to
> do this and it doesn't break anyone who was assuming they could turn
> on the hardlockup detector with "/proc/nmi_watchdog".

It is not hard but:
1) it means whenever perf wants to determine the NMI watchdog is
present it needs to read two files rather than the existing 1, which
has some runtime cost;
2) the name nmi_watchdog for controlling the behavior of the buddy
watchdog isn't intention revealing as the buddy mechanisms whole point
is to avoid the NMI;
3) old perf tools with the buddy watchdog have the wrong behavior
(they've regressed).

It is also not hard to have the watchdog files named
<mechanism>_watchdog, such as buddy_watchdog, nmi_watchdog,
arch_watchdog and have the contents be 0 or 1 as appropriate. Such a
scheme would have less overhead for perf, make the name more intention
revealing and not alter old perf tools. I'm really not sure what
problem we're trying to fix by not adopting this approach. I was
surprised the buddy watchdog merged but using the nmi_watchdog file.

Thanks,
Ian

> -Doug
>

