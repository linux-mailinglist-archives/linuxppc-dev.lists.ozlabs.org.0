Return-Path: <linuxppc-dev+bounces-17644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMVZCMJ2p2nyhgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 01:03:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2579D1F8A1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 01:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQXtd2r0Cz3bfG;
	Wed, 04 Mar 2026 11:03:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82a" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772582585;
	cv=pass; b=DxAkKx48qq5w+1tcWHVgINqF4pf7DQNICDkg6B3V9wPJ9cJMqjq4578DFs0KMXLdlo4ubqfrXZ9TBYjQJxDXq9Z98/Os8R7xbuZB7B7aZj4W/WJz87oK4L0tZx/Fs19HcV9fl/eIyg43V1fwe1qgmS9lFxFRR8CcJcbcKsNwQtcG2644jW+nVNb6GvsWM+hIplHWOwue0k+ECNv+V3fNywzAB/WH6L8+AuWwJbxwNC5CLLT9BarfVj9b0N5szKNEhGsKlKKHyLWvlT9XYVFOBV1MT9qHaSXMzBJBK/Kd9KOB1VlyH6yLrFjMjijIwECn2i0dhUVsotAaT9rxHPAOJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772582585; c=relaxed/relaxed;
	bh=SsGLIEWyUhkmkGScny7/X0CBVSAQV23MQbI8yP5TZUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA5GLSTGKe3sdtN1WyoWfwLaGzKhMZGvwDT/XE7VaP1DBMGSaheIM2vSq+RWHPRtmSzTw7M7fXilpYs+d7MAe7M82OQyYFk2Bc5C9uL112+P1k3DVmWnmEeDg8Vea+5uHzXzKqgGu5kPUHaoO4wv9wKodGWRn9EuN/IAO3GFCyIL3xhuJZLq/fJS6cc0IY4t479fregw9otv+JcCsJXjnW02OEvJYmjoWXxO0HqrcmHUvkEnojTth7+GuDOKyPuaVX9cDlxIv5PzSF5boueolDWpXpS04eFr5QUr9hlRYzqEC7BshYLNahSNATlhQDKni9W598UGw8pKXQ18Snvgyw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Dm4h6B0D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Dm4h6B0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQXtc4hTjz3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 11:03:04 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-505d3baf1a7so737481cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 16:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772582582; cv=none;
        d=google.com; s=arc-20240605;
        b=L3mNsTrAYSJtZxaeaqNVI9DudbPqcg1JMbkVGg6UgmveF+3Nri9bL/3d+tcu6OPY1L
         Pm+bkZDF3q8Gt6B6eUdK1H3NRVba0moYnUmMadOpk4cYTFD4dLqeyFI/WNSZpDV6IEIt
         3Zm7ADCSpuu3VHUw6H6MKnKozKqZyHNJnI2P5cr2VrlqfPGPv9fOu2cpAttnbOobaNgH
         O39v1iPcsIFhyF5gQCt2JxidXtPhFpHxTfohsNUptu54DD40nDPO+cfwq9p/IPoAApl5
         06dG6eg+7IEvglSXgfZXY1IEDnl0SOZZucm68oYWwbiAdOjNNb1ijkI0lIAzWcrFIBjY
         yCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SsGLIEWyUhkmkGScny7/X0CBVSAQV23MQbI8yP5TZUY=;
        fh=IujkTW5e0xQ2hT7o4OLcJucZ5GJSpxtUPr8d163VQoc=;
        b=iOfw/SRpNUSRSWWHakiHeDl0M8nRsntlcrADs9V2nlU/lgN49PDEAYfLXJNLLsVcwh
         OwBAt5zahvPFN3m1pKz23ZeOdwDCHl0W41kkc/LuzjZFBdv2hITsUvtvBJLuTsttiEgA
         cZN+lNBJQwj/xV0tF1Hh249TSBlD6ijiSacX8EV41bMMKZiiQrSymwJ1Difn1Gw2ls4e
         dqwfX/28Vgmhey8goZq3hSG9SB7gcZVghm+QkHHgThSlAuRf1AFXZwRs/v/eSDvEzJsk
         Vab7N9g4bMXitHcY6TiyCrhq8J6sKLtJvyGpQ3iW4LXWRo6ZcBrTO4RzS/BM+ds1qjXQ
         BUAw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772582582; x=1773187382; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsGLIEWyUhkmkGScny7/X0CBVSAQV23MQbI8yP5TZUY=;
        b=Dm4h6B0DKzIfdzEb43FNg8qt2uDEA5ZRpa46tzRJcwTRuVWj+y9kAPaVCoStGNoGdd
         +T5G/n4fjD/2TYPQ7SDHHJwsv2h/VWbvisNoAf16CoF0VvL3ltxjYgVxH2BhcqX66uhB
         l9pQkEoGYTl9G6fjIMEEcJk2W1mznc2QfDJdqb4D9+z9mhV1NAEcYmGBBSesqR2nVBOl
         6wynCZVk3c6z++Za5l2xzi/AhK0C5iZsiSMWpGFsQtethw96xhfJMNlTzIfxxzZtoec/
         81Je/IqSdWRvpzXo0GbQVRHmx/bjlNugE9iJ5NyhwFB4DZBERSIQ5hM5zpZxE+jEv1IA
         pcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772582582; x=1773187382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SsGLIEWyUhkmkGScny7/X0CBVSAQV23MQbI8yP5TZUY=;
        b=R5gPAe+habPmmxoFf3hnY4GUDbNyI+71uDcI6iC3PdqUz9v+3Ehs3jAOd7KcTomNrK
         joVf8u0108gEJWAqC/KD3C0uLhc8yMQzFQU/NBH71mc3onKeh/o/trAGyYlIwev4VibZ
         /srb1bPjKzQBjvD/2XqlNeRkMfOxdgAhctbixpalIRPja6xufGMOPPslCJfVazJQCb8M
         WGzC+gTJHm9FQwgTPSm5+TfvZtux7+ikZxXqHH9MadyQYM6a/9FR6rsgTDIhj89pF9MN
         V3sqEHurQQVtV+PCVuYQPWqNlTkGH/1rB0dqjlVXsdDCR1Ax972ZFmQlCl0tqWnHOk7x
         KyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdQbAK7uFhTMUIXmMWl6At3ECCKJRhkdjVsWAzKv1e0bDIke5ua6i//B+CAJ1C9xdtpf0kytUe6Ntcn9E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz80UeYdgvHPOcaOgv+dXbImpsdzsg/ilhDo1cCn/bYEYtVxGUh
	3lreMtofvRO0jewJiN7eT5iXaPmn+SPR8n3v2wXD+ZDvYjbIi/98V8emZhayl8fE4nsBp/EuaHA
	fKv9v2rFefiBHZYuOpRQFkiX4VnJiWB2CVb6ERuif
X-Gm-Gg: ATEYQzz8IjirrF+HjB+Y41x1ttn1HKoQUeRLfZBHaOWrKdZIM5ZvEQLjTLVKyrZW/hy
	qAeo69GYhX2R3lvG6ctd1WJJh/34J4QvJ2pOvwcTV57HyCiw8OTGB6yw7oaNO8uhMMbg1+BiU92
	fQQs2kV2YquwBEVWA0D46Pq0kgkXPnpqlSnBCBwJb0bXsbSBRW9ABvyNaTGh4OAxNnDUaSzZ/G/
	beaOvdWuzxjFlm4c90+bdtiMcheoiA6bh87aWiv5KG9/fCo/5lzXz3fhmAo8kMIw6YmzjE167+7
	qkYuyDbh72yX17crk2AxWjrw0aGccHoYZuaSy2h2Qlm+eH0=
X-Received: by 2002:a05:622a:1916:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-5076186da97mr2167841cf.17.1772582581904; Tue, 03 Mar 2026
 16:03:01 -0800 (PST)
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
References: <20260226070609.3072570-1-surenb@google.com> <20260226070609.3072570-3-surenb@google.com>
 <74bffc7a-2b8c-40ae-ab02-cd0ced082e18@lucifer.local> <CAJuCfpHBfhKFeWAtQo4r-ofVtO=5MvG+OToEgc2DEY+cuZDSGw@mail.gmail.com>
 <aadeHiMqhHF0EQkt@casper.infradead.org>
In-Reply-To: <aadeHiMqhHF0EQkt@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Mar 2026 16:02:50 -0800
X-Gm-Features: AaiRm525OgcepzAJNzfaRHa0oE6Zi6kSq3Az8BaDbo99H969zeTJWZ4WhKpE7cQ
Message-ID: <CAJuCfpFB1ON8=rkqu3MkrbD2mVBeHLK4122nm9RH31fH3hT2Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with vma_start_write_killable()
To: Matthew Wilcox <willy@infradead.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, rppt@kernel.org, 
	mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, 
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2579D1F8A1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17644-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:ritesh.
 list@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 2:18=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Tue, Mar 03, 2026 at 02:11:31PM -0800, Suren Baghdasaryan wrote:
> > On Mon, Mar 2, 2026 at 6:53=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > > Overall I'm a little concerned about whether callers can handle -EINT=
R in all
> > > cases, have you checked? Might we cause some weirdness in userspace i=
f a syscall
> > > suddenly returns -EINTR when before it didn't?
> >
> > I did check the kernel users and put the patchset through AI reviews.
> > I haven't checked if any of the affected syscalls do not advertise
> > -EINTR as a possible error. Adding that to my todo list for the next
> > respin.
>
> This only allows interruption by *fatal* signals.  ie there's no way
> that userspace will see -EINTR because it's dead before the syscall
> returns to userspace.  That was the whole point of killable instead of
> interruptible.

Ah, I see. So, IIUC, that means any syscall can potentially fail with
-EINTR and this failure code doesn't need to be documented. Is that
right?

