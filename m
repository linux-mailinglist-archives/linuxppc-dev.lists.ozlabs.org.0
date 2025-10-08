Return-Path: <linuxppc-dev+bounces-12701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8477BC309A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 02:12:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chD2x02CKz30V7;
	Wed,  8 Oct 2025 11:12:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759882328;
	cv=none; b=aVfazFVq6mn+0j3x/UrkL5Vrw/qKqD7QFyM3VK6gCCqKiPDJvH+wn+yAvGSDYgiXQhG0GGZZqEYuqJ1gHMdYx/GP6tCgLAggtBeXLA/at88QZLWElewg+hqC+/knBJPFHlzOciCi4kH09SEtBJm6/0oUIJwVcZgWadLAt1XXgD+zBA3WSJmpIfU6J3GCUXx4fMuOdh5+9IO5L1sBlAjI2GwaOcfst3FarMSjOmto8m94YJK1tIdZBQS7X8YuaF1ZI9/TRoVVjXhePEO/dNoXLEJWRaviiJ4xDuxDnBVeqpHiBAjJ3P8k1GSQr5P6suaOIFI+9cRgRwhf6tGHlfK6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759882328; c=relaxed/relaxed;
	bh=d4s+V4FbLGaf41FAvlBu/thUUG5t6W0OPczp2pqdLV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSiIkSSo/6lh0RxZON+AtVWDsgr0cVfscZrNLkIjK1+R3z2pm10YYcP6hyTOa/gr3lvniyx10LD0y6oDAOkdluZPEowwzxtdaQhlmOwi61x78PF2exkEw1FBhIp9QtzKo9x7lYQxtDG09hG6u2gUKVLTR23wNmbNzo6cJfz/BnUfvW7KeVPd+L/RYupR7LWc6ITH38VbZ16W2UBr2ho5d0FLV3LCWciK578TI2SCZOLGUHsSwapV4yjjXXAXHjD6rqz96J03Uq1GE634KSQ/VwlvLY7/FL0wZy9kc4Rg0aUVg80BdveseGWpkREPYuqF0ZThImq/HEJTBQ5I61yySA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IiSk53Dl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IiSk53Dl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chD2v4xNGz302b
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 11:12:07 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2681645b7b6so50285ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 17:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759882325; x=1760487125; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4s+V4FbLGaf41FAvlBu/thUUG5t6W0OPczp2pqdLV4=;
        b=IiSk53DlCNkuuDABvZfWcGDrI6eQm3Sczoy//8BiKhWkCYgsxYSCvukWSwK1faWqxP
         u1VhDoeP14+/EQ4XGKTQz/dHxxV3jy996Ew6JJraVInLJLktqLOcruN8IbORcL+0yXnr
         4aK5aUhbP95u+iI1vLGR/UR2VsrqYbRxuhgnzdtT2iNbb5pv/SyKiZqlhkNT04CnGxYM
         1E35Oule6jOzfFc6XAYZ/S5KMA94Pin8OUgF0TUw+T/xSEyoX7mmoeG7V/IrwT5RL82i
         sJewJMEgdqp98s/GegLsI9yzrhCq4K213LVmWFj8HgmQr/PHVAM8TSU+bUyhU40LpnSP
         m21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882325; x=1760487125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4s+V4FbLGaf41FAvlBu/thUUG5t6W0OPczp2pqdLV4=;
        b=oIZMYrzOUc5p04gIo2IE94qy4V5TWMjt0JX+pvnfdtpe2CWxlih43U/jMZe8Rwp+TG
         2LkKbnn3h3wQMH1WziIzNtTBQNcnSFXYMTk6I7EeJqT8iQdfMLPhUqYjXxi26TqxMk7t
         uY5MnjUcjOi9bFuIDO7PdOqueOysxN1A+CgfYLxQ+yYOJcqDgrG0Tc/0Bd+iNLTb4W/v
         Xbd8tPEcB9Lb2UGu91ygoFfpbj/SosggwM9YLHRdz5ZaZStd4jWxsv8hL94yk484pjNL
         7ShCU6STE+jnRTdhAvwToiblnr4qwRGJbXO0emjK9mfhDJCktrVKU0L+xrCllFIKkah2
         kxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8mSPwylLduC22FiAfHZ3gaPT7QIyHjPczxpFfMrd27apQrDI+PJ8xSqViP+F03a8ULais1KNfTgNRW/g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyY9o2z4qAEc0ag3IjntLIc9mvQPkP6AQoNCUkG4L2Gwv3cuxIj
	HYA1n+VR5YXvMesRGyRts2oU6Nb35oGP/JMQhEOeOz3tgY+S6kcxffpgaXAQ7kYgj7q+IkcxhLv
	UlQi2Q7tVezCXR5Fg7GD/O2YU8wAoQvWsuBaF9kC0
X-Gm-Gg: ASbGncuW3rKNYCtpPDlx4VjjeLnDWDTOaYhEc3Bi2qdnh0p52mFNQ5sjVuZXvgPw8r1
	GWS5PyyhwwekkUOHkOcJDQ1ftUVWTJnnHhifFmhlrUfKKYMFlpdVHkuc44AyNBA/4Jg93gCJekJ
	oMrRnva678RG1JkZUv//dFfV2faMStH7MmX9KyrVxsDo9x2ob5UDFF5GznhF5qT+ZbKYP6ubDDK
	Xb7HKrWTHgrvMD0ytnvgOTc/ElYNtAxZKFZ15alKWVwz1KySQ==
X-Google-Smtp-Source: AGHT+IH+yIGcsp4+CFLpohDGf/cUkctKYAedGH2G5UnTvDt75JS4P+J8+FQ8PDuGaGOvQ1lq/+LMPX2feI/OOwB8H0k=
X-Received: by 2002:a17:902:dacd:b0:248:f683:e980 with SMTP id
 d9443c01a7336-29027602620mr3056445ad.2.1759882324220; Tue, 07 Oct 2025
 17:12:04 -0700 (PDT)
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
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
 <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
 <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com> <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
In-Reply-To: <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Oct 2025 17:11:52 -0700
X-Gm-Features: AS18NWC-sVWRHhiacA7_GdnjNxZp2uG6VtSCGmRNgb1MOSdJV-yT9mBtxj51skw
Message-ID: <CAP-5=fX4=fV70N3GCdXgV6o-YoJynnSppxJp0MwdRrtsyDrs0w@mail.gmail.com>
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

On Tue, Oct 7, 2025 at 3:58=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, Oct 7, 2025 at 3:45=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
> >
> > On Tue, Oct 7, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
> > ...
> > > The buddy watchdog was pretty much following the conventions that wer=
e
> > > already in the code: that the hardlockup detector (whether backed by
> > > perf or not) was essentially called the "nmi watchdog". There were a
> > > number of people that were involved in reviews and I don't believe
> > > suggesting creating a whole different mechanism for enabling /
> > > disabling the buddy watchdog was never suggested.
> >
> > I suspect they lacked the context that 1 in the nmi_watchdog is taken
> > to mean there's a perf event in use by the kernel with implications on
> > how group events behave. This behavior has been user
> > visible/advertised for 9 years. I don't doubt that there were good
> > intentions by PowerPC's watchdog and in the buddy watchdog patches in
> > using the file, that use will lead to spurious warnings and behaviors
> > by perf.
> >
> > My points remain:
> > 1) using multiple files regresses perf's performance;
> > 2) the file name by its meaning is wrong;
> > 3) old perf tools on new kernels won't behave as expected wrt warnings
> > and metrics because the meaning of the file has changed.
> > Using a separate file for each watchdog resolves this. It seems that
> > there wasn't enough critical mass for getting this right to have
> > mattered before, but that doesn't mean we shouldn't get it right now.
>
> Presumably your next steps then are to find someone to submit a patch
> and try to convince others on the list that this is a good idea. The
> issue with perf has been known for a while now and I haven't seen any
> patches. As I've said, I won't stand in the way if everyone else
> agrees, but given that I'm still not convinced I'm not going to author
> any patches for this myself.

Writing >1 of:
```
static struct ctl_table watchdog_hardlockup_sysctl[] =3D {
{
.procname       =3D "nmi_watchdog",
.data =3D &watchdog_hardlockup_user_enabled,
.maxlen =3D sizeof(int),
.mode =3D 0444,
.proc_handler   =3D proc_nmi_watchdog,
.extra1 =3D SYSCTL_ZERO,
.extra2 =3D SYSCTL_ONE,
},
};
```
is an exercise of copy-and-paste, if you need me to do the copy and
pasting then it is okay.

Thanks,
Ian


> -Doug
>

