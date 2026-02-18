Return-Path: <linuxppc-dev+bounces-16943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uINpAP1NlmmbdgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 00:40:45 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B21E215AF8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 00:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGY0n1lJfz2xnj;
	Thu, 19 Feb 2026 10:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771458041;
	cv=pass; b=PhoAGjAWDeKIpQUxVcoIIXkTFCTwjPNmHZqaHcPPK2kPqFzulE0r1i1/3wH+hG0bUzPzsgWjARQP5qR6PnyI0INu1sQmpu7xnARqbm/CrM2PA7SCEaQbuGlPr3o3fKd9G7pmvE+4oFmkGmiNtAzUXQiZ9ydkNrpvqHeEz0wS7HMCOu9FE4qcd5QD3c6JQesUYlTXSAv+RFzj513NHnU1gHoUimyiD0w6IhE00vvrzoHq+ZafJLkbmgR9OdeKx8C5kVN6g9qKB7+rlXodSvgoOYtRu+N+RrQeM/BeTfD9/JIYVTeLfVbQlbbF7JxHuiUNKfLvPjgSlo0HAbeA0zyd8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771458041; c=relaxed/relaxed;
	bh=xjxPiN30X7H58ROVHwhzf4/X04sTDdl8fl/0yuhsL/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=edPB348YBaphmq+4ZoaYXRZKpkmPMSYlxrH+TYhdtbxyvTRXFPnn7R42Qtl5E51N5NyqiAm5ddfViEQ0wlx9MAe3uYmXCCMomCSFv77pOHyGcQ1Ma0D+EiYlp4+5Lr2VIiMzGPieC45naesv3rL//1m7pkH9kmXUJQ9s02JfNjwQH0P2LHg9un6Hvqdm1TkypxxTw+OzqBT8oO8iFm2IxFimmnq+EPZWbrr9epzI/gyHCgsLcvN76MiXSsQgiaBbHMifVYQ/eR9kxiQXUYQfa0BJUAaeKfGwWI6IZYkQp7yrH4ngG8GxHWV4JAsisPVb2lRUV0nexBHhluoKuJLmDw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=knigUtDm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=knigUtDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGY0l3G1Zz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 10:40:38 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5033b64256dso200221cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 15:40:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771458035; cv=none;
        d=google.com; s=arc-20240605;
        b=JwjRUdAkrh7PK79FLeCAkqNr/KTp8u3GkZ2OfkYBv+ax+kWEzqGeR/U48zSDPwlYXQ
         LYvoE4aD5kM7BMmrKYDPyyUgs2AFLNdH9q0HwDw4j9xtpgrpTba0PEnpHbfJehMJxlvI
         +VqIsKw4bpVsEsyA3anql3xWkG801ldBxEnuglz/pxdZN33uGODLWqWpFSPO+v2vR0Nv
         n6UPog8b2AUs0Xsezv3bMjIfF44p4HaEP57mZMy8Tw/xrcgmabxuZAeTolLnG31SeG9B
         3eEYIcnY3qgS4bka+SFq0ZL/4ICNRcVrWkfsg9eZ9whsWKTRtaEvIONCle+yYcVgOcSR
         LjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xjxPiN30X7H58ROVHwhzf4/X04sTDdl8fl/0yuhsL/4=;
        fh=GTUOfUgxjpC5CKtr/jJUcxn4/0vG7/6MuDIOmDYCgiE=;
        b=ZJtpxHdm+u/SSxpmjN6St5MoxJtPKxx92o0VA035uTr3Ody3cVP5ELThz+hwi97ttU
         HrCZz800LQ+3r3NeY/cdtw6ExJTuUgxt6iqo32UJioKeXyKhsHIkY5uuBUJ8oRCvc3K1
         vgMAvUAZZ+LOGkyqq2HvTaVht4cK+gp8ZgHk7hMOF2lsgZaB6tldxwU5rwNaeOabLxu7
         ixUgSIZkw7E8pA1i9+7kgSli1LOgJmWavZuw5BuEIyC0Ki6m3HTpGliOe8gpfYOk3zfy
         RY1D9SYB0ai3D6Tcgy/rlnHzwFaxmZec+YCun6nMQuYkrZ15ayZCBypP3srRh7EgtBQe
         ZMJw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771458035; x=1772062835; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjxPiN30X7H58ROVHwhzf4/X04sTDdl8fl/0yuhsL/4=;
        b=knigUtDmiP2hxaL4bEmXiO6H6nKXaa9JE022lVXeX2AL58HpSJnej1xQ/M3v0AphlD
         CB8tlq1F3QsC/pr5bnyfCWgcUXYU5aJEYjQTLC5YZYcq9VVsofsnWGsjVjoC/G5dUWI5
         Q6vSPavpd5zyTyS9S6J4TkM6k3LFJg5yinEaZQYXtm79cEwsxbwaI5Ut9buld6JW2I55
         mAsoyrgHJX06pL+YU8L9E6dUD7DY5XmYT1CtjcLsA15pDT/uLeSrONzTFTH31eaMBjnQ
         ZH2b9n4RNG4Q9qyrHCaAkTyc0vOpPkAHqQXF6AAp5/js4CjV9QjA49iNQnbJK+WudMNy
         wz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771458035; x=1772062835;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xjxPiN30X7H58ROVHwhzf4/X04sTDdl8fl/0yuhsL/4=;
        b=H0abGLcvrovEybvgV71qeFZt+SKbawBdAezYz+inBAr3cUjolh0m3etFaBI60Hu4hu
         pj4M+7muC3ZdJBlyis+mojEE5Q1zfaGN4u6wUR1KTF+bnSz+qpR4IpOORhqjNqcNW42D
         HNCiARjQ9HmgNJ4v4d70cr3lHqdbzSo96J7d9WgLZB1jNcpGyvqi1uZbxkqS7VDBSDZB
         mDLTH6p72eg2ODgLbdckODz9FNJqfv11rvOfTt7b92No8V+lsXq1uSiOKJ67RiJshilC
         zcgjZVNfUxyOX+eYe7jTr3sdU94pCgYha9/vpRO3SmtMCSwZI1VEDdbvbtKh3vF0zi01
         ZvKw==
X-Forwarded-Encrypted: i=1; AJvYcCV9jhX9Tla34zWuGpb5De7zX6iTri0VirDzleUAmxOW/E21xj5DFAE0lbI4lUgY47C4rA0V1uDWRLbRF1U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGI0bHi6XFIHwfdP1/6IP4BMv103A2inrYeu+QrPYQY2ixmu58
	N5dPV5wlCbGuP9os1MsGzoJL17amwYTVtTk6ho2Do5aYgnewcmapejCALS4dSDxftaY67MA6cN6
	mTsOb/72v4xKlZ5stIW3Po2++QGMbE5idsnoZEqTp
X-Gm-Gg: AZuq6aKYKy3EDVUeu6KSu1ckH0Mj/XX7V27dT2eAzcpPegjYKY3spp2fx6FceURc1za
	TxmBIWYfYvQWbjX3X6TJcAXdU0gRnZpCJ3esp/zj3axWD5OEflvQqFbE6khQHXbSvrl3OcYY/sP
	RJwa995r6nT+NJFGTSuVS8LUozZMgVz9+4wIEJzOmCFqSp/0z3lVkbjm2/qzJL6S5DJZXhZPtMv
	kPurXjg3j9ssXmIKdcDEqBkzB6/YPjob73qBkggqW8xbeCbyt1lu+dOnT+xC82hHGqkeGsW7ZtJ
	Va43Xw==
X-Received: by 2002:a05:622a:1a8d:b0:506:1f23:e22c with SMTP id
 d75a77b69052e-506f1dbd1b1mr2143471cf.6.1771458034886; Wed, 18 Feb 2026
 15:40:34 -0800 (PST)
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
References: <20260217163250.2326001-1-surenb@google.com> <20260217163250.2326001-3-surenb@google.com>
 <dtdfrko7uqif6flc4mefnlar7wnmrbyswfu7bvb2ar24gkeejo@ypzhmyklbeh7>
 <CAJuCfpGViU4dDaLtPR8U0C+=FXO=1TuU-hT3fypNQO3LGOjbcA@mail.gmail.com> <lfnqadtmpkxjhsne3nto6bpourjv3nxw26y2a5kovump3beld7@c2pdvgxxj3ar>
In-Reply-To: <lfnqadtmpkxjhsne3nto6bpourjv3nxw26y2a5kovump3beld7@c2pdvgxxj3ar>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Feb 2026 15:40:23 -0800
X-Gm-Features: AaiRm53lCb3-A9mP4T-Ip4RZ_UT27OIlQVbKAc0RvblZzhy-3EiGT7cqg8sX1Wc
Message-ID: <CAJuCfpFr-MvDAo5wur0gGX-AMCd2kP=pBYOemwAP=G3UUVP4vQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mm: replace vma_start_write() with vma_start_write_killable()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16943-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oracle.com,google.com,linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Liam.Howlett@oracle.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.
 kernel.org,m:ritesh.list@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B21E215AF8F
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 8:46=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [260217 16:03]:
> > On Tue, Feb 17, 2026 at 11:19=E2=80=AFAM Liam R. Howlett
> > <Liam.Howlett@oracle.com> wrote:
> > >
> > > * Suren Baghdasaryan <surenb@google.com> [260217 11:33]:
> > > > Now that we have vma_start_write_killable() we can replace most of =
the
> > > > vma_start_write() calls with it, improving reaction time to the kil=
l
> > > > signal.
> > > >
> > > > There are several places which are left untouched by this patch:
> > > >
> > > > 1. free_pgtables() because function should free page tables even if=
 a
> > > > fatal signal is pending.
> > > >
> > > > 2. process_vma_walk_lock(), which requires changes in its callers a=
nd
> > > > will be handled in the next patch.
> > > >
> > > > 3. userfaultd code, where some paths calling vma_start_write() can
> > > > handle EINTR and some can't without a deeper code refactoring.
> > > >
> > > > 4. vm_flags_{set|mod|clear} require refactoring that involves movin=
g
> > > > vma_start_write() out of these functions and replacing it with
> > > > vma_assert_write_locked(), then callers of these functions should
> > > > lock the vma themselves using vma_start_write_killable() whenever
> > > > possible.
> > > >
> > > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc
> > > > ---
> > > >  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
> > > >  include/linux/mempolicy.h          |  5 +-
> > > >  mm/khugepaged.c                    |  5 +-
> > > >  mm/madvise.c                       |  4 +-
> > > >  mm/memory.c                        |  2 +
> > > >  mm/mempolicy.c                     | 23 ++++++--
> > > >  mm/mlock.c                         | 20 +++++--
> > > >  mm/mprotect.c                      |  4 +-
> > > >  mm/mremap.c                        |  4 +-
> > > >  mm/vma.c                           | 93 +++++++++++++++++++++-----=
----
> > > >  mm/vma_exec.c                      |  6 +-
> > > >  11 files changed, 123 insertions(+), 48 deletions(-)
> > > >
>
> ...
>
> > >
> > >
> > > ...
> > >
> > > > @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma=
, unsigned long address)
> > >
> > > Good luck testing this one.
> >
> > Yeah... Any suggestions for tests I should use?
>
> I think you have to either isolate it or boot parisc.
>
> To boot parisc, you can use the debian hppa image [1].  The file is a
> zip file which can be decompressed to a qcow2, initrd, and kernel.  You
> can boot with qemu-system-hppa (debian has this in qemu-system-misc
> package), there is a readme that has a boot line as well.
>
> Building can be done using the cross-compiler tools for hppa [2] and the
> make command with CROSS_COMPILE=3D<path>/bin/hppa64-linux-

Ah, I thought you were referring to the difficulty of finding specific
tests to verify this change but these instructions are helpful too.
Thanks!


>
> Cheers,
> Liam
>
> [1]. https://people.debian.org/~gio/dqib/
> [2]. https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64/15.2.0/
>
>

