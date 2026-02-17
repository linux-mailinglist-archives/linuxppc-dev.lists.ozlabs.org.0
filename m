Return-Path: <linuxppc-dev+bounces-16916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAjpLjnQlGlGIAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:31:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21314FFB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:31:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFrsK4XQGz2yFb;
	Wed, 18 Feb 2026 07:31:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::834" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771360309;
	cv=pass; b=aO7jSf1PCwBp++6Lt6i9wrglk601TSSFEFos0mALuEt/tiHk8K7BvqmEPWEL3R0ywrMBgBIAiRoONiyZQ041P17hh9QmZ/jQW4OPuk5NEla2f8XBnt/kFxY7xlBjMDe2RNHnB33tvrutbhUGwKIZY3u7Lv/exSEDBQYBEuCQ/uhGdKfEQMuBfeMAqLds3meFpxlC7N3g15nNVcRFZJQVvO0Of4sKrU0VJXr22f5pC1pMRH4YwgThcmWcXraef2056ORdV02eIOb1g+1A94jWvkvdMd6CmVGcXtGPAzx7kgP7BOnJ1+qx0eW3klheDZ30D3CILpjm8ky/AyuLXFRXcg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771360309; c=relaxed/relaxed;
	bh=bBuR5hoi+JIoThnLErWVLc3d8raQLXMxIFo7dRHtl7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jujvGdQ52DU9wJDUuV4nAiTtXQ1imSv3bJdagJH2CGrhhCVI1SD062/0BxAAZjmJh2xKHEuElJnX0b3kCH1I4O2YWiPpPSf2Eb3vwDcz9ax/vN4EPjgzV338n/qhO1HjpkOanDahyWbfzHS4lh01xtJHkZ1vdubs4rweYuJiJs0PhutxuTfSDET+VB5OqX6cZU2g0N27TEz77N+koH4yV8F3KsrspmYPyE7mKSeH9WymsycZRjaPKTMaN5rN47vZI28A27YR1Zt0MK9EzMEW51x15W6hJZ2EcXjn/pI4o8RMKU+WKFn03DKeDTO0Off5U6Z22hBj80zdlZXcy9pWUw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=C012EdMf; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=C012EdMf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFrsJ1Ztzz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 07:31:47 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-505d3baf1a7so14421cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 12:31:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771360305; cv=none;
        d=google.com; s=arc-20240605;
        b=e/awGX08w7XLqvfB27RstWbHhpb7zxIYCHK8iyCpACM5W0lzcwJcm+Hh8PJChuXRRl
         S+qbtihqslk5G8tWmWGZ0paVoYviPFu/nmJu0r3AvT/ua5beUynByCxDXv04PpeLDdXU
         kjXFZiazW1tn0ky0QbFY0A/zUv+yGC35IbVxgjf1lyBC0LXQjZ7xu2+tlmmjrPWEvRM7
         o3cH0tvGmqOe0NqQHbne/htQFeHrDNrHNiXE0Kid1RRturygxH6OGx6knALEwWiqq/ea
         9YjLCVaEVoD+jhaYZ9Y6U1FSQCRgPGFM6DfX7xFCbhU9cmwaDL6GfgSyEyBQHRw4JqFl
         UlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bBuR5hoi+JIoThnLErWVLc3d8raQLXMxIFo7dRHtl7Q=;
        fh=YnUHp8GiYAqCtyJ2+B0mGw2dOY7KyJQQ3KF1t8d+y4M=;
        b=E9EvfR0u9ciYZFpfPixT3hE+Efyb0HW6g0JEJieTjN+DHp0L1NKOtYRdxtCVHSu0Bm
         n+chxmrav8K4S+k/DvMLv/FM/Xdm4TmPT0JyQ4X6LtyD6Zc6XdwLzlTRQZ6abbhZf8Gs
         V0BT1qlEA52lKWx1iRHICt9TBZD3rZSP2hSOCIk+mdLzAKxJkKyKgAdBl71BWzW1Xeu7
         4kRxsdrZHc3q8jPoszARXvbrM+8PCMwRPaef5eV6UnFTnlSgxsari3mLuPehHW1nqhay
         K5v+0omDPZGRC9vfnmt9g+XqBgJM07ihBx6P8z2WoezkQ7ztBMPQsRLGqxt5STuCQl2H
         1O4Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771360305; x=1771965105; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBuR5hoi+JIoThnLErWVLc3d8raQLXMxIFo7dRHtl7Q=;
        b=C012EdMfj/C+SLiwNxxiBPEbJPS+cAi6cIVGMVwXhF31TDngEpzDMW6/Fp79bv5ISa
         g3OHdo61jln96l0EolXuVoQLDuMvW+iCLUetLoR1XZ+7Ok22nhhBsD3Mr++WoEo/wRMO
         SSuL4b7jEaRdtCLbffxmbu0Jqq7Fnoe0tmf8+vQbGFAaVvMZJPc9gqPwv43tMMabqO46
         Bg+uKV/+dFqe/7z/c0p0CmdagHcSPbX6HCX01peiRW3q6F7McHMyvVFJAB3QoCNxGmuc
         YiM8hc5aKCBnVaAVACMID+Oz2/w7tCJR6v3BtZKJ7B/B341nD4Kco57XMyR1A8E+XMhm
         2SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771360305; x=1771965105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bBuR5hoi+JIoThnLErWVLc3d8raQLXMxIFo7dRHtl7Q=;
        b=rgu5PvP0sDd+daPcGTUaiSsGzKThNjmrFOA9VoE7aQIZPnwKVG8btzq33M2BEr2l0O
         TCGqZXO4Ig4m8jv2ZDKFU4jo01pd8x8GIiub4P2OJV/Px8hWVUIgqhXdypsUWBfTpmeq
         rxHuvDxGbWB/tAkCrG9Yvp7EYGZZ4smRzKDKmcr8DhRAepiqcsIK5VQTpzxtmSvJA4h5
         jaSkzK8B7YSJfuFQ1NhdWYHxES7Z4BghKqih/m462qncGCFQdr9SbsMJA8rO/D45WwQl
         WhuYQHoy03bnNlC0UV04tRsUxPjOvEgqpxRV75WUSiCHQxw4aXx5LZa/N8SdgwiRooQe
         nfrg==
X-Forwarded-Encrypted: i=1; AJvYcCX/b+aqJwTeaMMLxtBlQWnBKhSkQ+qK3enka+HmmGXTgIG4BqTTXGeYDkbqj26qbGzUY+a9s/04aMzHfzY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFAJY6lE+GHxub7O+WJeMDtKDGekpAdbcbG0iGsNthiYRo4rjm
	Q1BxEaluFE85VvO8511R0bzyMnBPBhsUuYziG2+0GmiuD/bpcyN5YsL1ETaskrz2fSKhNgjjIno
	Wg5x/wVNJ3rfAOnz7f36Gi7ir8syABVXQeR+K6Qmh
X-Gm-Gg: AZuq6aKIwFF/UAUqBJn2mHU9zI9b3sn1437j7Y55xz7JYZx4DwbS44fK+6DQTabq4rf
	VbZBAwqo2iphPu2rblgKDt7wpA1mvzzuXVYARlsZkggiHQ2rcCYdS9HUGB8Ih3SWX/jbt0r522V
	5qhjXzIg9hoIBTVSMATWXhZfgIYbObxRu9XYGpHNhzSOAi32bjRf/GJ9n0MJ8UIo1w1MWxxKG8d
	4Fr1QeuqVMGm6RDjHj/pDooWGgx0L/vu4u4FgEZ2tH/0i450+PKXgWrql8vtMfyPq/wiVZmBF9w
	7IWw6G7QmHwos39dU53I/IyY8JqY5ullblkL0Q==
X-Received: by 2002:ac8:5746:0:b0:506:9852:75ec with SMTP id
 d75a77b69052e-506cdb4c09cmr21741071cf.9.1771360303253; Tue, 17 Feb 2026
 12:31:43 -0800 (PST)
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
References: <20260217163250.2326001-1-surenb@google.com> <20260217163250.2326001-4-surenb@google.com>
 <20260217191530.13857Aae-hca@linux.ibm.com>
In-Reply-To: <20260217191530.13857Aae-hca@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Feb 2026 12:31:32 -0800
X-Gm-Features: AaiRm503YYR0kTgCvbJHDicLagxX0QqBNRpofu84bYZnAbv1-xnaYHyLZPIeE6k
Message-ID: <CAJuCfpGxsX6kZAzZJZo7aGNxEbeqOhTV8epF+sHXyqUFOP1few@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
To: Heiko Carstens <hca@linux.ibm.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, rppt@kernel.org, 
	mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, 
	npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com, 
	gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:hca@linux.ibm.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuah
 ahnjy@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	TAGGED_FROM(0.00)[bounces-16916-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: DD21314FFB7
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:15=E2=80=AFAM Heiko Carstens <hca@linux.ibm.com>=
 wrote:
>
> On Tue, Feb 17, 2026 at 08:32:50AM -0800, Suren Baghdasaryan wrote:
> > Replace vma_start_write() with vma_start_write_killable() when
> > process_vma_walk_lock() is used with PGWALK_WRLOCK option.
> > Adjust its direct and indirect users to check for a possible error
> > and handle it.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  arch/s390/kvm/kvm-s390.c |  5 +++--
> >  arch/s390/mm/gmap.c      | 13 ++++++++++---
> >  fs/proc/task_mmu.c       |  7 ++++++-
> >  mm/pagewalk.c            | 20 ++++++++++++++------
> >  4 files changed, 33 insertions(+), 12 deletions(-)
>
> The s390 code modified with this patch does not exist upstream
> anymore. It has been replaced with Claudio's huge gmap rewrite.

Hmm. My patchset is based on mm-new. I guess the code was modified in
some other tree. Could you please provide a link to that patchset so I
can track it? I'll probably remove this patch from my set until that
one is merged.

