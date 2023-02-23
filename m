Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2916A110F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:11:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN40R55g4z3f3y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:11:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Buy8GsfJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e32; helo=mail-vs1-xe32.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Buy8GsfJ;
	dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN3zW3RJZz3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:10:15 +1100 (AEDT)
Received: by mail-vs1-xe32.google.com with SMTP id d7so11836539vsj.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 12:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tb4E/KDAfmO+OWY5M3vwQnCShVGqXeIPzhu+t6ji2TI=;
        b=Buy8GsfJbaC7xe6w4gIMVDaR17FRMpXubc52+8pPyuvFEIOFipuVV1KBEuKEAKh0El
         7DlCtGhjvPy6R3F83LlbXWVkFsviditFGOnyOFNuaCOFkrNwI/obEofFnE7fHFIFAjz5
         TS0RlbZVFOqi87gU5+jO/2VyNSZYlD1MRdH/KauUtlrOFE91xF4O4zPf42C2bpL/k3d4
         f10eOthZsxd161U/wfkLecBG0lA6RlgWgp1Y7V0lS1+X71MKNI7c2knUOng4oSETF3N3
         4wA3dsBYF7sv1XPjiAiCOtvvfYyIrBnGgsjlWHce/SoH5Z12GmZZtRDih8OTERcpCo1Z
         77Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tb4E/KDAfmO+OWY5M3vwQnCShVGqXeIPzhu+t6ji2TI=;
        b=yvttfZTSNUi/q5Wf2hgPbcderv7UCccWhqDeQPR/5yRJp4/PdGJ2NNnynR0Ue3b2uz
         3SfSost9hdnnOxscrpqQgVyj+60ZuHUV6vlfkwQgyjQAF4ssIGk6fqyDNQW+Fh9GwphM
         JqiEqU8t+PcxbUiXbsTVldzVYxt1bK4cqe+ZxR8qE1AsbO0E3B/ZYbDe/umhPdCMonvC
         ZCPPLFazYRI43JqijRyX/rbjmxFWxUmWmErQA/IpqpgRoZtBpp71bECdwqTeCodlRMUw
         f9GrmjQw88T8yuVIo5h87ucPLQB5alNo6J9OCrtU4IMIkNYW37srcUdX6EMSlyuPbyFS
         u8sQ==
X-Gm-Message-State: AO0yUKUAW9ibiDD1ShVsH7qV7rocN1nYqT8yOy6TjeI2d+uaUKV7s/uV
	mTg88pJhDcrajuoB7fucWny18o12ms3LFkWGryt4xw==
X-Google-Smtp-Source: AK7set/BdoUj1YfuS8JpwJQ04kHrKoqkmuSB4hZ/qUc3HI+kpJOsmACSu4zfNA2VRxx+6n1Ke4C2BNibi2yxxoTp1zE=
X-Received: by 2002:a05:6102:3181:b0:414:34d3:89a with SMTP id
 c1-20020a056102318100b0041434d3089amr752650vsh.6.1677183012138; Thu, 23 Feb
 2023 12:10:12 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
 <Y/elw7CTvVWt0Js6@google.com> <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
 <Y/e6Z+KIl6sYJoRg@google.com> <CAOUHufbwcqx21T=zmvYpnX_Mnd2A0KkPORbtxnJEwKuUKVSPzA@mail.gmail.com>
 <Y/fFWyYPu5Jf0de1@google.com>
In-Reply-To: <Y/fFWyYPu5Jf0de1@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 13:09:33 -0700
Message-ID: <CAOUHufYWktz4SNjL_o_2oZNcJLXserwCot-Prv4UEG9uzn57rg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
To: Sean Christopherson <seanjc@google.com>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 12:58=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
>
> On Thu, Feb 23, 2023, Yu Zhao wrote:
> > On Thu, Feb 23, 2023 at 12:11=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > > As alluded to in patch 1, unless batching the walks even if KVM d=
oes _not_ support
> > > > > a lockless walk is somehow _worse_ than using the existing mmu_no=
tifier_clear_flush_young(),
> > > > > I think batching the calls should be conditional only on LRU_GEN_=
SPTE_WALK.  Or
> > > > > if we want to avoid batching when there are no mmu_notifier liste=
ners, probe
> > > > > mmu_notifiers.  But don't call into KVM directly.
> > > >
> > > > I'm not sure I fully understand. Let's present the problem on the M=
M
> > > > side: assuming KVM supports lockless walks, batching can still be
> > > > worse (very unlikely), because GFNs can exhibit no memory locality =
at
> > > > all. So this option allows userspace to disable batching.
> > >
> > > I'm asking the opposite.  Is there a scenario where batching+lock is =
worse than
> > > !batching+lock?  If not, then don't make batching depend on lockless =
walks.
> >
> > Yes, absolutely. batching+lock means we take/release mmu_lock for
> > every single PTE in the entire VA space -- each small batch contains
> > 64 PTEs but the entire batch is the whole KVM.
>
> Who is "we"?

Oops -- shouldn't have used "we".

> I don't see anything in the kernel that triggers walking the whole
> VMA, e.g. lru_gen_look_around() limits the walk to a single PMD.  I feel =
like I'm
> missing something...

walk_mm() -> walk_pud_range() -> walk_pmd_range() -> walk_pte_range()
-> test_spte_young() -> mmu_notifier_test_clear_young().

MGLRU takes two passes: during the first pass, it sweeps entire VA
space on each MM (per MM/KVM); during the second pass, it uses the rmap on =
each
folio (per folio). The look around exploits the (spatial) locality in
the second pass, to get the best out of the expensive per folio rmap
walk.

(The first pass can't handle shared mappings; the second pass can.)
