Return-Path: <linuxppc-dev+bounces-9047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6235AAC93DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 18:48:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b88MJ424Lz2y92;
	Sat, 31 May 2025 02:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748623724;
	cv=none; b=fopkNEpAeChZsvV2gLisfERvZW2lgkG6rvveV2NxjfKePY8P5grAgXGsmR31jc2//JcC47IUYprv56nZPXMecVx2fewbE3tslaEfzhmM8GHSHbIeAhD+kGLM5LVKawYfRJkLhXroJFq/zGLIHK6qqQlo5JRHOyRqo+KVySWs4/MgBVsLiHaeTV7YySPg0eDD1UBCE2Vq7UdOk2AEaNd85qEbmM2FVYivsfBRS5evBnGc8pfDfLJI1r5lhfVJLKCtl4sE6eTj4K+E0B5YnSHX2anR3pLRyb6I/Zk+bOknqhy1/5BJcjLMjio8fJFK8u4Gtk1OnrgHhWsSo7k7kCJ8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748623724; c=relaxed/relaxed;
	bh=SfmVEdWuub4CI3JVXdpcy9od0u589O5saOKcmY0n2jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qty5nALybvH0oo3xr57RZr3dtrn84vB7S4mRTKBgcQ0F4IML7ve5QGmwswzzP4FUiAhiwS+4THDlq0o41jthbhs4j/M+qgVFNlBF1OSWHAFXQTnhtSTD3XDKbMVvyQL/I36n3koMcZurzBbU2iTo3pALjwZCPh794HMs0WCm+FX8G1pje0+mXyf7ilPVxRtSgSlxoF6O57Yp0k43C9l0KYUGU69bwnnWdFfrURT9bvvEjfME3wDbCRvL7Nd2HtQrl/6vyYbuOy0K7+CjKQizbEqiBKbg1gjMAcZrptH8OjAdSgCTaq6qmQygyridzxNvhWn2+6ikYTFiiXOkThTbfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=U2ZT46qP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=U2ZT46qP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b88MH2xVtz2y82
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 02:48:42 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so103a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 09:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748623720; x=1749228520; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfmVEdWuub4CI3JVXdpcy9od0u589O5saOKcmY0n2jY=;
        b=U2ZT46qPW/cGz5cjax8evW1+qkw9Ec9CZbb5moqVJERDX0nYe9itcHZKHQertxcKsE
         VzzrW5rcSu9J5TTvlRLfy6yx8SKBoK552oaT8U3AL+/+E1MdrnoMJFDtetu/kykaFcbp
         e8DRFOdDScpQF3cMo5+G5Uxn2lEmDQFZqiXba7sg066wEszmxHyBa5QTKl6gqXtCck/j
         3TMDnOqLLLBzmQDhnIncaUN2Uw9BUdw24+R8OL76XyF5yi/vQilKUJ8gOwDVgNHPUD4X
         R8QrzRo1pUIc05/PmgDdzetAkkPfJs16xIIfcWUc7H4yIvSixj8XjYYutD0S8HksCLLV
         ctvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748623720; x=1749228520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfmVEdWuub4CI3JVXdpcy9od0u589O5saOKcmY0n2jY=;
        b=T/lstebPyJ8dL2eN97R7bj9tqbSY3OqF0cSr613mLEQ6NDVZ/KXZH/rxT2m1xaK4K7
         K1s7YkfOSmr03V3c0TU4RjPN4ujgQNL22msg/7zm2xvHmq5C3QVyDeUYYf3EOWnk4TAk
         3+pAwbxqs+XSpdAnFw4Kzsn9tby8J2KrkNk8eWVNUMmXW2woYNbzvbIpRg4lLVFR24Vu
         Y/nlk+bNsVL5PTrAQK1EaZdr+s+LOKY7tzPxFaQS+8WpDGDWXkSKyROaXS+D8Nkw/Wtz
         F98rPCz0fm4FAMDqzx2V8NsQo+GjJ9P+Ea/Z2Vx5NYq4NipFmn2b4UzUMeUzZkbih3DR
         Mosw==
X-Forwarded-Encrypted: i=1; AJvYcCWgsFQ7dAsDkU+tQd2ic43o2B3jcJ/fOJtsR67AxhLbGxzWaynDjWP91mPYt1iu4RdvgR6GeCqW0yeUrwU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTiz6HgoVeHCutfPrp2SArHxlH8EtmEdsTth1Isu/MRgSeQ1ld
	kr0GfG3Bg7Q95DSr/j1isCfUyK91f0yzzhuiyjuWO3gV0BnHMPm7JaiYaiJsh0eti1SiOBnRZUc
	rQRDK1hpP46263q/q4OYiC03JgilHn6azAPs/hdNO
X-Gm-Gg: ASbGncsOq5e6l8bIySMiXGUE4YoXhZxPNgaMwiaVxX9hBW9AQehfisbhDWoGi4H+uDX
	JaX2YEDu/Q7nrWpGZCIpdqp4i7cbeb3vSK/P/J0g0nUl+3O+C6WZjXgJpyIz7+CPrExLjU536NU
	FUitq0W0PDUhdir+Nela4/1rOsNzXcZ1oPfYEJoZLK89OxJY/EESfgnu1kLqTmAtwyVj0DJmzd5
	zjcvj/1Ag==
X-Google-Smtp-Source: AGHT+IE4j04MEyqUQCgfbrapQs0vaUyWF/djR96KweNRHT1cvPKfDr7hIyG719V7LSGCiiciPXhWHE48ON6aHoH7Fnc=
X-Received: by 2002:a50:d781:0:b0:601:7b94:b80e with SMTP id
 4fb4d7f45d1cf-60577a3ffadmr87988a12.3.1748623719573; Fri, 30 May 2025
 09:48:39 -0700 (PDT)
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
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-2-ryan.roberts@arm.com> <CAG48ez2k6ZmM-335EQjXeL6OtKzuOjVPWQDuJ75ww9Z6NMeg5w@mail.gmail.com>
 <d183b3ff-ab61-4dc4-98c8-7ab9c1f6a4aa@arm.com>
In-Reply-To: <d183b3ff-ab61-4dc4-98c8-7ab9c1f6a4aa@arm.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 18:48:03 +0200
X-Gm-Features: AX0GCFuAT1zEtvLEHv4Z2Un3xyWjY8-HX0RQ4IFigWsX-k02Th9HNwh8AhT-yZ8
Message-ID: <CAG48ez27zfTAPrm-UX7_oqLs5S14-Miw9qreKyq2sMjxkn7q7A@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/6] fs/proc/task_mmu: Fix pte update and tlb
 maintenance ordering in pagemap_scan_pmd_entry()
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Juergen Gross <jgross@suse.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mm@kvack.org, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-16.2 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 6:45=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
> On 30/05/2025 17:26, Jann Horn wrote:
> > On Fri, May 30, 2025 at 4:04=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >> pagemap_scan_pmd_entry() was previously modifying ptes while in lazy m=
mu
> >> mode, then performing tlb maintenance for the modified ptes, then
> >> leaving lazy mmu mode. But any pte modifications during lazy mmu mode
> >> may be deferred until arch_leave_lazy_mmu_mode(), inverting the requir=
ed
> >> ordering between pte modificaiton and tlb maintenance.
> >>
> >> Let's fix that by leaving mmu mode, forcing all the pte updates to be
> >> actioned, before doing the tlb maintenance.
> >>
> >> This is a theorectical bug discovered during code review.
> >>
> >> Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and opt=
ionally clear info about PTEs")
> >
> > Hmm... isn't lazy mmu mode supposed to also delay TLB flushes, and
> > preserve the ordering of PTE modifications and TLB flushes?
> >
> > Looking at the existing implementations of lazy MMU:
> >
> >  - In Xen PV implementation of lazy MMU, I see that TLB flush
> > hypercalls are delayed as well (xen_flush_tlb(),
> > xen_flush_tlb_one_user() and xen_flush_tlb_multi() all use
> > xen_mc_issue(XEN_LAZY_MMU) which delays issuing if lazymmu is active).
> >  - The sparc version also seems to delay TLB flushes, and sparc's
> > arch_leave_lazy_mmu_mode() seems to do TLB flushes via
> > flush_tlb_pending() if necessary.
> >  - powerpc's arch_leave_lazy_mmu_mode() also seems to do TLB flushes.
> >
> > Am I missing something?
>
> I doubt it. I suspect this was just my misunderstanding then. I hadn't
> appreciated that lazy mmu is also guarranteed to maintain flush ordering;=
 it's
> chronically under-documented. Sorry for the noise here. On that basis, I =
expect
> the first 2 patches can definitely be dropped.

Yeah looking at this code I agree that it could use significantly more
verbose comments on the API contract.

