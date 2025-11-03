Return-Path: <linuxppc-dev+bounces-13692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E03C0C2AA04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 09:47:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0QFj5BKxz306d;
	Mon,  3 Nov 2025 19:47:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762159657;
	cv=none; b=cDL616UqWue6inQGJsKEMy0MDW7hH6AMIXxZWcuWCr7hq/KrFEsO4hES1qL333EDLv9vM6sKLjcvP7u4qVH1nDGloltiwIt5jite0ChUbkB5eaF9EHmxgGWpHJFmtMKl/By1subIoyKk8x8k31G7tuVvPXYql8p9strixycoWNHDwTOGtD3dBR1cCVxY4UIK4R3yfeQr4alM52W28wWWqDP09ydq6+EDVMUM3a1jmnCPHMPkqV7p4DLE+WBmzlpQ72cxxpMuAiKcysb0YWIvoMYnDtDS+EbhIP1RYsdKFTiMZMt+G4DD6nTr/WxVzOVlQmnZtMpHPH6ZeL3KzY2i2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762159657; c=relaxed/relaxed;
	bh=1X2By9QoThsdGSa5CA88Md4gR1pD3mMBEB9rDlXDtgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6f06evucFbtncUraFZUotSbClR7cCXYRIICaX1pjcPu9gy/cAIwz84gmD1QHAj+XL3ydZMTtL6+W9tRUG6nYAGIYH7/MLf+Z2Ox7ycTGw4gt5De3TyAKlqzAEHOF4i+GSC/ubtYyPxOLkaAA66GlfrLPKHn9w+OhsmR+tVBGTWyytWZMdtKmRqErMGfNID7r95N48aKNQXadig1Qs3ESfB1jkW6NlTmlEkJlnqe1K9Xj/t9t5k5kMXdgN1rs1i56eOlP4fVJUxZ+wC9HI68fs/7Inkc5ASmJ4dunDfnWIP3cMuA8yulAY4NRtaFruuKNVrTpBspjDyYFRCt7cpRPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sl09BmYL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sl09BmYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=vincent.guittot@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0QFh1dj4z2xnx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 19:47:34 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2957850c63bso12170905ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Nov 2025 00:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762159651; x=1762764451; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1X2By9QoThsdGSa5CA88Md4gR1pD3mMBEB9rDlXDtgg=;
        b=sl09BmYLOEDgxcvDfFJwVezMRG5fyZ1Cnlb8Lt7lii5YwyKJy6gCIggLfLillKyQFx
         QDpRy68OjNSxkDkIfUfrTb7Zp4+Aik/7XbpwvNqoSinGjxP1zA4oQL8sKeBiNoWYDqWb
         ES218d53am7958Xg3gQsNF/5ebd8wKV+dGvGoZavktAicyZq6b/Ye4py/jZQ2nlX8G2r
         BZ0KeCJQ70hBY/3TkdnFTLk2Tr52sQbB+J9W95RJMGWgWiVjVh2yKFjs6Z5PfnfZnwPS
         v/D2cXyTtZuu6h1p3gVtI+JhvtHoGUuDv0MWH+YZS6vRotUdT46Hzav39OG2qDDATv79
         l/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762159651; x=1762764451;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X2By9QoThsdGSa5CA88Md4gR1pD3mMBEB9rDlXDtgg=;
        b=pAxgulu9dqn35g9F8+Ifm/EOAYx36/6fm3yiSAc5q5UXZ/b11bKgJO0H4dov/oa5QX
         3dxI2l9yTokt1rryaoOz9sT5yuU+Yv8+aHG/m7mmq6SJtEsRlscFdVOwewKIbyKPxJNO
         WfGvZWyTjmY4gqhF9rSSIEY8FUiQ9RBMe1i5hv1d2rdTKm5gQiUQiIHXbszgzkyOYcqv
         kQPCTk0qcZDChlJOJNmgfrP1gIqpjw/jw2DdKpb5sU8owmb+clfp4k3lEVgUERObEGRp
         tIVGAQsubRVYcQhsTmVtAZ4eTxJLW9vsZpbJZwk3QEBhw7HDeC0R4zfuJJY3AKYJKF5X
         BoIw==
X-Forwarded-Encrypted: i=1; AJvYcCU+124V9IYXaTeB72HRME8VBFWOnKg3FMI1Z0ZR85U165+HDUWPw7VrL4cjECntRCERa3IFwTp7c+l5/1E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxqkYFMlcfySNXUtYrOSLxcf5Y1S2H90cqGC+vxeGlKU3z4T+XH
	FLpSy4dwQofTYJ6ouNpsLN/IMRNkEuJle2kRj/Kp5hFjxnXJ7c3t97Tlulyj2BvdlRauCZs2amX
	Hw19mbALMTaRIuQvutBUPwVTJhdRc+GSjEmAPld9FyQ==
X-Gm-Gg: ASbGnctgieJwr5AsiZDH1f3Qtm/i0MzWIzkIKUiGwou6JoWv6T9waFCfGhYc86ZnX8/
	dbBpySB8ByuX3QHT32a3duKbCprr9J03CEbC+m00z9+7p4BDVud4PTV9voqunl8MVdX+/BEN1kV
	/fwT0rjGEscDopa4wa2nhzGu+d96e4PRj9LnG56NZgJqOTQb6sjxRXbEJU4fBxul2DibVLW5O31
	mDsKTFfVFXqhHRuQwGljcPVVwT0cekmecu4cETiWkKr5Fy2UFUDYuKC3v5YtQ==
X-Google-Smtp-Source: AGHT+IEiPTsQwQmjnN2J2GJDQ9Za9zoUC977FiwEF1W5fvbJaKj2P0HWSCM/QFTK/S/yIJvxhgV0PffM5gtHzmdjQQw=
X-Received: by 2002:a17:903:228b:b0:295:4d97:84f9 with SMTP id
 d9443c01a7336-2954d978dfbmr90787815ad.26.1762159651160; Mon, 03 Nov 2025
 00:47:31 -0800 (PST)
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
References: <20251029060757.2007601-1-srikar@linux.ibm.com>
 <20251029060757.2007601-2-srikar@linux.ibm.com> <CAKfTPtDW9rApEm+4qSrEpRDMA+68BnVOgegKUZUa5S-gKnR--A@mail.gmail.com>
 <aQHQ7UyaK849BKV8@linux.ibm.com>
In-Reply-To: <aQHQ7UyaK849BKV8@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 3 Nov 2025 09:46:26 +0100
X-Gm-Features: AWmQ_bmrR_yvsXkBlqoY42TLV69O97bhzwYzWqV56CRBaYZDsYsoTTM21b2VC28
Message-ID: <CAKfTPtDtfy7=rb6rPVMAk1+Bq4w=+opiWuo_Y+3dy3me--6KsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] powerpc/smp: Disable steal from updating CPU capacity
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ben Segall <bsegall@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sikar,

On Wed, 29 Oct 2025 at 09:32, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
>
> * Vincent Guittot <vincent.guittot@linaro.org> [2025-10-29 08:43:34]:
>
> > Hi Srikar,
> >
> > On Wed, 29 Oct 2025 at 07:09, Srikar Dronamraju <srikar@linux.ibm.com> wrote:
> > >
> > > In a shared LPAR with SMT enabled, it has been observed that when a CPU
> > > experiences steal time, it can trigger task migrations between sibling
> > > CPUs. The idle CPU pulls a runnable task from its sibling that is
> > > impacted by steal, making the previously busy CPU go idle. This reversal
> >
> > IIUC, the migration is triggered by the reduced capacity case when
> > there is 1 task on the CPU
>
> Thanks Vincent for taking a look at the change.
>
> Yes, Lets assume we have 3 threads running on 6 vCPUs backed by 2 Physical
> cores. So only 3 vCPUs (0,1,2) would be busy and other 3 (3,4,5) will be
> idle. The vCPUs that are busy will start seeing steal time of around 33%
> because they cant run completely on the Physical CPU. Without the change,
> they will start seeing their capacity decrease. While the idle vCPUs(3,4,5)
> ones will have their capacity intact. So when the scheduler switches the 3
> tasks to the idle vCPUs, the newer busy vCPUs (3,4,5) will start seeing steal
> and hence see their CPU capacity drops while the newer idle vCPUs (0,1,2)
> will see their capacity increase since their steal time reduces. Hence the
> tasks will be migrated again.

Thanks for the details
This is probably even more visible when vcpu are not pinned to separate cpu


>
> >
> > > can repeat continuously, resulting in ping-pong behavior between SMT
> > > siblings.
> >
> > Does it mean that the vCPU generates its own steal time or is it
> > because other vcpus are already running on the other CPU and they
> > starts to steal time on the sibling vCPU
>
> There are other vCPUs running and sharing the same Physical CPU, and hence
> these vCPUs are seeing steal time.
>
> >
> > >
> > > To avoid migrations solely triggered by steal time, disable steal from
> > > updating CPU capacity when running in shared processor mode.
> >
> > You are disabling the steal time accounting only for your arch. Does
> > it mean that only powerpc are impacted by this effect ?
>
> On PowerVM, the hypervisor schedules at a core granularity. So in the above
> scenario, if we assume SMT to be 2, then we have 3 vCores and 1 Physical
> core. So even if 2 threads are running, they would be scheduled on 2 vCores
> and hence we would start seeing 50% steal. So this steal accounting is more
> predominant on Shared LPARs running on PowerVM.
>
> However we can use this same mechanism on other architectures too since the
> framework is arch independent.
>
> Does this clarify?

yes, thanks
I see 2 problems in your use case, the idle cpu doesn't have steal
time even if the host cpu on which it will run, is already busy with
other things
and with not pinned vcpu, we can't estimate what will be the steal
time on the target host
And I don't see a simple way other than disabling steal time

>
> --
> Thanks and Regards
> Srikar Dronamraju

