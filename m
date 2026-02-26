Return-Path: <linuxppc-dev+bounces-17327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ODXJui+oGk1mQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:45:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60E1AFFDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:45:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMQ3k1X6Yz2xQr;
	Fri, 27 Feb 2026 08:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::836" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772142306;
	cv=pass; b=Noj9X8NGLkCKeHWDP1kHWcU1xzqNjay8EqJfEwvQIooLaMt+Z+aIUS+BKWkUoVXFqd6Nui7cEHHC8dYdSeNAe55yN1+92IqHEriDTZFfzl5lDzm1WqQ5AdTmJamx/QnxusVkdCRIY6Pr6+4kj2WmWc5SNqrFRU3/2O/VmJRNlc+OWU27jE6gcN0kLl84FGibQS56ck4nmHPlTX/sMayWUJZgbA3Uzh2GFk9nufb5oO33TJdeRQ4fI3sdnmANk0HLBiCMcjPyES/ycuAJr1fZdVEr2cu/bCPbf11vLxdODatlBdnhtrVsgZik+HzLHcnIOWLu71suFeDB4JepAEtVFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772142306; c=relaxed/relaxed;
	bh=1Y9uOSKBgHqz2G18bc8Hl7qpgXohCsZrLcFX0O6OtFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=d/ffA6+KqlzbMJy8MPbqXoX6GCvMYSyDu4+tOO5B17jwqjlaFRxAQf3RY/NJrbcjs7MWZXP/6r11+MHlQ4sIo13nfaybACZStJBhjocfnyZYvMfJv+jPKNNApS4wkZYN5hKFbjJeOc2f9kI9o8Y24lyjFvIxccTS27Lm8KVffWIo8RNxlejSGv+PG1yRXoj/LjQt/Qgt6dkvHlEoxK/gQuatU8Hw5z6A2sHkI+jgTCYptQQeJE3mIfJ3UTjaBbsOCRfT7Vp/wEqVYZPaFxD/voNYbvgVr+GEhA6bFLryf8blxsR6xwIvpUf/ypFb6QauP/3TbKxrC0dw+yAThDWMgw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ILQrHO8h; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ILQrHO8h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMQ3h1KTmz2xN8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 08:45:03 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-506a355aedfso125941cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 13:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772142301; cv=none;
        d=google.com; s=arc-20240605;
        b=aq7Tep5/ZQ1zfSvoHGSXYev+O277nPAlYO31DbRyUKtf8/YdDv6z9kpDOxhtSYSepk
         tFohsz6sQffp1WUmOJDd35oUto8qM6emL905wkpdoEsCMtdKEmbTRpHyWPyGNM78qguK
         ZLDIQksOaYbmXq7R5XaBUo0gOiVFakOR9k8VCMMVQL4twTF0UBsHu0x6kM+L7Qqd/UZv
         C9+fEGO3E0yrkyDnBUIwqISaWJanYwuOxBKdR9MVSVai1/2msqSZ+YxSzqo8gM0ebKNJ
         6WAEQzzA63IfOY752X2M7+pEjFLaRjmFnD7PHVPwMdLcFv2zYuMYa49Pxmnh7gSDWt9v
         VhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Y9uOSKBgHqz2G18bc8Hl7qpgXohCsZrLcFX0O6OtFs=;
        fh=V9uq+s/DDmjRNAoEVPd9hI/AKIcyY9nYzbrJv0cNnZY=;
        b=aY2kLER/XzhdJqe4yxnGLSJ8OBJ2SnfTGJh8dAjjdswaHWsn73iive2rzrRhkt/o4/
         2n7pIiRZqH5gSRI/+C+DZTW5GvxjFQyTJpbacFKfMC99DZfwMMRTj/TECzCC9+/1tViz
         hSJ9MNpwtJEPwhdzMdD1zrVmofQn+vg/NX5vnqFfvxDRu3vk2Ebsed4+wR2tlPKGbM6q
         ZV6IaSwGLz/2usyqXpdLSZjbTEhXUG2X7Wpy6tIkBSwv7A2zW6MwoKiP4giXc1eXGqO2
         GxLdyGJHkS0e3wpC6WANasliBqNl/4mOCF/gRxeDOhR7jRHUMdX+p0jR/h7aypHK6r/7
         xjjw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772142301; x=1772747101; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Y9uOSKBgHqz2G18bc8Hl7qpgXohCsZrLcFX0O6OtFs=;
        b=ILQrHO8hBOf3/UJ0AK+TmPGCKWPpsLfTGlhNExmbDxXdj2VPLJhmSzNF9o3jGbK5F6
         dugEi13Ct04uO47HG9HfLB7RAikBOvUCD41GaRh0KEqCBoodVvY0Ce537nZSq0qj2sXw
         9FGuIzKFCzb5ukYPkSJfz5cyLWeJJWIZPwzXRiwsWNIWll4gK59KM1OzAHz3bsa58hHJ
         YDxm09UZP/3iOulXczUxfuyQKPffG8SrJjhddYB/XrKmrDw9yEnHqUqsa6OU4a6MYqYt
         i+R2afRAe0xORZ0Saia+gTViHfBdD9M75nmnGsT3Q2owHheqGUp71Db8Nw6OxiIlbX5D
         L5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772142301; x=1772747101;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Y9uOSKBgHqz2G18bc8Hl7qpgXohCsZrLcFX0O6OtFs=;
        b=Xg3X1qLoyDZTbDM4awvNbSaofMI8FlDMVOGBSsejFGxBYfwMMJzxK4mshxTnZdYpf2
         RMe5A+h5SRZahzT9Msfe5QH6iO9KH8En4JmkKt40AzyGokwPEa6XVMKSzWs/4YaNeqrY
         cKn5KYeWHdTxC81YkPbQJdgzrFBVn71N/Yjh85fugOTYPniwRGaIdSsH91P76fsf5EMj
         LTbQaTHaM9cH2XFI83ib+q2H9wjtYOpBksrsKBtE0VtJS3H2F6K3yTAJygdbm+g8Ssrv
         DUZ3Y4wdnP0I5nSLXAjsMF6rED/PzVNaYhbplRS+fdTp0XmBVOd4wwJVqVqtImkkLspW
         oLyg==
X-Forwarded-Encrypted: i=1; AJvYcCWt1C72xnHSKmCG3dq/IFR3v0dVoj7dLfJ3PiU/4h0EAk5DcQAUWPTx02GzjF3qiutjZFyViYwtl/fk/kY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziB7lKRTFTF1SNl9PEapJFDkaip0EdZMzI4y32EEMweJaw1YhJ
	b8i8juj4A+yWJP9aEJ7KrWzyLaWYOCuaZtdYOHPAXcHOWpLureyvMI8fOAVIkV2GFFx6zzTeg3v
	z4L6DPXk+0eVyLFHs4qI0q2dechpJoarR2/ygdTUz
X-Gm-Gg: ATEYQzyVFFyJoaQk5/mbwj3qHv6sewXiJd8yAcjAuw9JO1O3QSIoVX9ZgsTPLld9mCD
	EU649tYaRP0yeuazhrYe9UdW4ZNvTUV7Y3tf/UkPxmFaqencxp0jwySSySQ7lNqi3TeVUJ0wG0B
	A7Q8mIdUYGoZACE3dPUvJT/STrXfV+bsFbRr0VAyoZ6jdyyM34PQkHdtEafh5ILHt8a8uoz7Fyx
	iKiVVpeC6vaT61fphwahVU/SMuqQXRFEcH1B4Rlz/xIxQQ3+FvW5UeR3RtjwPGcyRqAZAxeAZkl
	AdNtn7w8aaxM9ROnr6MXxSWKu83cf8A/F8ykJA==
X-Received: by 2002:a05:622a:1a9e:b0:503:2e98:7842 with SMTP id
 d75a77b69052e-50744154bb3mr5754741cf.4.1772142299044; Thu, 26 Feb 2026
 13:44:59 -0800 (PST)
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
 <vb6lgskvpmk6qcdo7tthmc3hpo7jppbx4ke75vepx2nqos65je@wxv7muptiiq5>
In-Reply-To: <vb6lgskvpmk6qcdo7tthmc3hpo7jppbx4ke75vepx2nqos65je@wxv7muptiiq5>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Feb 2026 13:44:47 -0800
X-Gm-Features: AaiRm52-yhPjcJA4soN2rj5ypaM3v6Q5403GLGvYx9bEFNQre_RUQhPEFl7VO2s
Message-ID: <CAJuCfpExatqPmdzSzRupURQ84Cme3JBT2gPvAS3WmK0G24xnPA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with vma_start_write_killable()
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
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Liam.Howlett@oracle.com,m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.
 kernel.org,m:ritesh.list@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oracle.com,google.com,linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17327-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,oracle.com:email]
X-Rspamd-Queue-Id: CF60E1AFFDF
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 9:43=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [260226 02:06]:
> > Now that we have vma_start_write_killable() we can replace most of the
> > vma_start_write() calls with it, improving reaction time to the kill
> > signal.
> >
> > There are several places which are left untouched by this patch:
> >
> > 1. free_pgtables() because function should free page tables even if a
> > fatal signal is pending.
> >
> > 2. process_vma_walk_lock(), which requires changes in its callers and
> > will be handled in the next patch.
> >
> > 3. userfaultd code, where some paths calling vma_start_write() can
> > handle EINTR and some can't without a deeper code refactoring.
> >
> > 4. mpol_rebind_mm() which is used by cpusset controller for migrations
> > and operates on a remote mm. Incomplete operations here would result
> > in an inconsistent cgroup state.
> >
> > 5. vm_flags_{set|mod|clear} require refactoring that involves moving
> > vma_start_write() out of these functions and replacing it with
> > vma_assert_write_locked(), then callers of these functions should
> > lock the vma themselves using vma_start_write_killable() whenever
> > possible.
> >
> > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc
>
> Some nits below, but lgtm.
>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Thanks!

>
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
> >  mm/khugepaged.c                    |  5 +-
> >  mm/madvise.c                       |  4 +-
> >  mm/memory.c                        |  2 +
> >  mm/mempolicy.c                     |  8 ++-
> >  mm/mlock.c                         | 21 +++++--
> >  mm/mprotect.c                      |  4 +-
> >  mm/mremap.c                        |  4 +-
> >  mm/vma.c                           | 93 +++++++++++++++++++++---------
> >  mm/vma_exec.c                      |  6 +-
> >  10 files changed, 109 insertions(+), 43 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book=
3s_hv_uvmem.c
> > index 5fbb95d90e99..0a28b48a46b8 100644
> > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > @@ -410,7 +410,10 @@ static int kvmppc_memslot_page_merge(struct kvm *k=
vm,
> >                       ret =3D H_STATE;
> >                       break;
> >               }
> > -             vma_start_write(vma);
> > +             if (vma_start_write_killable(vma)) {
> > +                     ret =3D H_STATE;
> > +                     break;
> > +             }
> >               /* Copy vm_flags to avoid partial modifications in ksm_ma=
dvise */
> >               vm_flags =3D vma->vm_flags;
> >               ret =3D ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 1dd3cfca610d..6c92e31ee5fb 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -1141,7 +1141,10 @@ static enum scan_result collapse_huge_page(struc=
t mm_struct *mm, unsigned long a
> >       if (result !=3D SCAN_SUCCEED)
> >               goto out_up_write;
> >       /* check if the pmd is still valid */
> > -     vma_start_write(vma);
> > +     if (vma_start_write_killable(vma)) {
> > +             result =3D SCAN_FAIL;
> > +             goto out_up_write;
> > +     }
> >       result =3D check_pmd_still_valid(mm, address, pmd);
> >       if (result !=3D SCAN_SUCCEED)
> >               goto out_up_write;
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index c0370d9b4e23..ccdaea6b3b15 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -173,7 +173,9 @@ static int madvise_update_vma(vm_flags_t new_flags,
> >       madv_behavior->vma =3D vma;
> >
> >       /* vm_flags is protected by the mmap_lock held in write mode. */
> > -     vma_start_write(vma);
> > +     if (vma_start_write_killable(vma))
> > +             return -EINTR;
> > +
> >       vm_flags_reset(vma, new_flags);
> >       if (set_new_anon_name)
> >               return replace_anon_vma_name(vma, anon_name);
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 07778814b4a8..691062154cf5 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -379,6 +379,8 @@ void free_pgd_range(struct mmu_gather *tlb,
> >   * page tables that should be removed.  This can differ from the vma m=
appings on
> >   * some archs that may have mappings that need to be removed outside t=
he vmas.
> >   * Note that the prev->vm_end and next->vm_start are often used.
> > + * We don't use vma_start_write_killable() because page tables should =
be freed
> > + * even if the task is being killed.
> >   *
> >   * The vma_end differs from the pg_end when a dup_mmap() failed and th=
e tree has
> >   * unrelated data to the mm_struct being torn down.
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index 0e5175f1c767..90939f5bde02 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -1784,7 +1784,8 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned=
 long, start, unsigned long, le
> >               return -EINVAL;
> >       if (end =3D=3D start)
> >               return 0;
> > -     mmap_write_lock(mm);
> > +     if (mmap_write_lock_killable(mm))
> > +             return -EINTR;
> >       prev =3D vma_prev(&vmi);
> >       for_each_vma_range(vmi, vma, end) {
> >               /*
> > @@ -1801,13 +1802,16 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsign=
ed long, start, unsigned long, le
> >                       err =3D -EOPNOTSUPP;
> >                       break;
> >               }
> > +             if (vma_start_write_killable(vma)) {
> > +                     err =3D -EINTR;
> > +                     break;
> > +             }
> >               new =3D mpol_dup(old);
> >               if (IS_ERR(new)) {
> >                       err =3D PTR_ERR(new);
> >                       break;
> >               }
> >
> > -             vma_start_write(vma);
> >               new->home_node =3D home_node;
> >               err =3D mbind_range(&vmi, vma, &prev, start, end, new);
> >               mpol_put(new);
> > diff --git a/mm/mlock.c b/mm/mlock.c
> > index 2f699c3497a5..c562c77c3ee0 100644
> > --- a/mm/mlock.c
> > +++ b/mm/mlock.c
> > @@ -420,7 +420,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned lon=
g addr,
> >   * Called for mlock(), mlock2() and mlockall(), to set @vma VM_LOCKED;
> >   * called for munlock() and munlockall(), to clear VM_LOCKED from @vma=
.
> >   */
> > -static void mlock_vma_pages_range(struct vm_area_struct *vma,
> > +static int mlock_vma_pages_range(struct vm_area_struct *vma,
> >       unsigned long start, unsigned long end, vm_flags_t newflags)
> >  {
> >       static const struct mm_walk_ops mlock_walk_ops =3D {
> > @@ -441,7 +441,9 @@ static void mlock_vma_pages_range(struct vm_area_st=
ruct *vma,
> >        */
> >       if (newflags & VM_LOCKED)
> >               newflags |=3D VM_IO;
> > -     vma_start_write(vma);
> > +     if (vma_start_write_killable(vma))
> > +             return -EINTR;
> > +
> >       vm_flags_reset_once(vma, newflags);
> >
> >       lru_add_drain();
> > @@ -452,6 +454,7 @@ static void mlock_vma_pages_range(struct vm_area_st=
ruct *vma,
> >               newflags &=3D ~VM_IO;
> >               vm_flags_reset_once(vma, newflags);
> >       }
> > +     return 0;
> >  }
> >
> >  /*
> > @@ -501,10 +504,12 @@ static int mlock_fixup(struct vma_iterator *vmi, =
struct vm_area_struct *vma,
> >        */
> >       if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
> >               /* No work to do, and mlocking twice would be wrong */
> > -             vma_start_write(vma);
> > +             ret =3D vma_start_write_killable(vma);
> > +             if (ret)
> > +                     goto out;
> >               vm_flags_reset(vma, newflags);
> >       } else {
> > -             mlock_vma_pages_range(vma, start, end, newflags);
> > +             ret =3D mlock_vma_pages_range(vma, start, end, newflags);
> >       }
> >  out:
> >       *prev =3D vma;
> > @@ -733,9 +738,13 @@ static int apply_mlockall_flags(int flags)
> >
> >               error =3D mlock_fixup(&vmi, vma, &prev, vma->vm_start, vm=
a->vm_end,
> >                                   newflags);
> > -             /* Ignore errors, but prev needs fixing up. */
> > -             if (error)
> > +             /* Ignore errors except EINTR, but prev needs fixing up. =
*/
> > +             if (error) {
> > +                     if (error =3D=3D -EINTR)
> > +                             return error;
> > +
> >                       prev =3D vma;
> > +             }
> >               cond_resched();
> >       }
> >  out:
> > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > index c0571445bef7..49dbb7156936 100644
> > --- a/mm/mprotect.c
> > +++ b/mm/mprotect.c
> > @@ -765,7 +765,9 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu=
_gather *tlb,
> >        * vm_flags and vm_page_prot are protected by the mmap_lock
> >        * held in write mode.
> >        */
> > -     vma_start_write(vma);
> > +     error =3D vma_start_write_killable(vma);
> > +     if (error < 0)
> > +             goto fail;
> >       vm_flags_reset_once(vma, newflags);
> >       if (vma_wants_manual_pte_write_upgrade(vma))
> >               mm_cp_flags |=3D MM_CP_TRY_CHANGE_WRITABLE;
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 2be876a70cc0..aef1e5f373c7 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -1286,7 +1286,9 @@ static unsigned long move_vma(struct vma_remap_st=
ruct *vrm)
> >               return -ENOMEM;
> >
> >       /* We don't want racing faults. */
> > -     vma_start_write(vrm->vma);
> > +     err =3D vma_start_write_killable(vrm->vma);
> > +     if (err)
> > +             return err;
> >
> >       /* Perform copy step. */
> >       err =3D copy_vma_and_data(vrm, &new_vma);
> > diff --git a/mm/vma.c b/mm/vma.c
> > index bb4d0326fecb..9f2664f1d078 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -530,6 +530,13 @@ __split_vma(struct vma_iterator *vmi, struct vm_ar=
ea_struct *vma,
> >       if (err)
> >               goto out_free_vmi;
> >
> > +     err =3D vma_start_write_killable(vma);
> > +     if (err)
> > +             goto out_free_mpol;
> > +     err =3D vma_start_write_killable(new);
> > +     if (err)
> > +             goto out_free_mpol;
> > +
> >       err =3D anon_vma_clone(new, vma, VMA_OP_SPLIT);
> >       if (err)
> >               goto out_free_mpol;
> > @@ -540,9 +547,6 @@ __split_vma(struct vma_iterator *vmi, struct vm_are=
a_struct *vma,
> >       if (new->vm_ops && new->vm_ops->open)
> >               new->vm_ops->open(new);
> >
> > -     vma_start_write(vma);
> > -     vma_start_write(new);
> > -
> >       init_vma_prep(&vp, vma);
> >       vp.insert =3D new;
> >       vma_prepare(&vp);
> > @@ -895,16 +899,22 @@ static __must_check struct vm_area_struct *vma_me=
rge_existing_range(
> >       }
> >
> >       /* No matter what happens, we will be adjusting middle. */
> > -     vma_start_write(middle);
> > +     err =3D vma_start_write_killable(middle);
> > +     if (err)
> > +             goto abort;
> >
> >       if (merge_right) {
> > -             vma_start_write(next);
> > +             err =3D vma_start_write_killable(next);
> > +             if (err)
> > +                     goto abort;
> >               vmg->target =3D next;
> >               sticky_flags |=3D (next->vm_flags & VM_STICKY);
> >       }
> >
> >       if (merge_left) {
> > -             vma_start_write(prev);
> > +             err =3D vma_start_write_killable(prev);
> > +             if (err)
> > +                     goto abort;
> >               vmg->target =3D prev;
> >               sticky_flags |=3D (prev->vm_flags & VM_STICKY);
> >       }
> > @@ -1155,10 +1165,12 @@ int vma_expand(struct vma_merge_struct *vmg)
> >       struct vm_area_struct *next =3D vmg->next;
> >       bool remove_next =3D false;
> >       vm_flags_t sticky_flags;
> > -     int ret =3D 0;
> > +     int ret;
> >
> >       mmap_assert_write_locked(vmg->mm);
> > -     vma_start_write(target);
> > +     ret =3D vma_start_write_killable(target);
> > +     if (ret)
> > +             return ret;
> >
> >       if (next && target !=3D next && vmg->end =3D=3D next->vm_end)
> >               remove_next =3D true;
> > @@ -1187,6 +1199,9 @@ int vma_expand(struct vma_merge_struct *vmg)
> >        * we don't need to account for vmg->give_up_on_mm here.
> >        */
> >       if (remove_next) {
> > +             ret =3D vma_start_write_killable(next);
> > +             if (ret)
> > +                     return ret;
> >               ret =3D dup_anon_vma(target, next, &anon_dup);
> >               if (ret)
> >                       return ret;
> > @@ -1197,10 +1212,8 @@ int vma_expand(struct vma_merge_struct *vmg)
> >                       return ret;
> >       }
> >
> > -     if (remove_next) {
> > -             vma_start_write(next);
> > +     if (remove_next)
> >               vmg->__remove_next =3D true;
> > -     }
> >       if (commit_merge(vmg))
> >               goto nomem;
> >
> > @@ -1233,6 +1246,7 @@ int vma_shrink(struct vma_iterator *vmi, struct v=
m_area_struct *vma,
> >              unsigned long start, unsigned long end, pgoff_t pgoff)
> >  {
> >       struct vma_prepare vp;
> > +     int err;
> >
> >       WARN_ON((vma->vm_start !=3D start) && (vma->vm_end !=3D end));
> >
> > @@ -1244,7 +1258,11 @@ int vma_shrink(struct vma_iterator *vmi, struct =
vm_area_struct *vma,
> >       if (vma_iter_prealloc(vmi, NULL))
> >               return -ENOMEM;
> >
> > -     vma_start_write(vma);
> > +     err =3D vma_start_write_killable(vma);
> > +     if (err) {
> > +             vma_iter_free(vmi);
> > +             return err;
> > +     }
>
> Could avoid allocating here by reordering the lock, but this is fine.

Ack. I'll move it before vma_iter_prealloc().

>
> >
> >       init_vma_prep(&vp, vma);
> >       vma_prepare(&vp);
> > @@ -1434,7 +1452,9 @@ static int vms_gather_munmap_vmas(struct vma_munm=
ap_struct *vms,
> >                       if (error)
> >                               goto end_split_failed;
> >               }
> > -             vma_start_write(next);
> > +             error =3D vma_start_write_killable(next);
> > +             if (error)
> > +                     goto munmap_gather_failed;
> >               mas_set(mas_detach, vms->vma_count++);
> >               error =3D mas_store_gfp(mas_detach, next, GFP_KERNEL);
> >               if (error)
> > @@ -1828,12 +1848,17 @@ static void vma_link_file(struct vm_area_struct=
 *vma, bool hold_rmap_lock)
> >  static int vma_link(struct mm_struct *mm, struct vm_area_struct *vma)
> >  {
> >       VMA_ITERATOR(vmi, mm, 0);
> > +     int err;
> >
> >       vma_iter_config(&vmi, vma->vm_start, vma->vm_end);
> >       if (vma_iter_prealloc(&vmi, vma))
> >               return -ENOMEM;
> >
> > -     vma_start_write(vma);
> > +     err =3D vma_start_write_killable(vma);
> > +     if (err) {
> > +             vma_iter_free(&vmi);
> > +             return err;
> > +     }
>
> Ditto here, ordering would mean no freeing.

Ack. Will move.

>
> >       vma_iter_store_new(&vmi, vma);
> >       vma_link_file(vma, /* hold_rmap_lock=3D */false);
> >       mm->map_count++;
> > @@ -2215,9 +2240,8 @@ int mm_take_all_locks(struct mm_struct *mm)
> >        * is reached.
> >        */
> >       for_each_vma(vmi, vma) {
> > -             if (signal_pending(current))
> > +             if (signal_pending(current) || vma_start_write_killable(v=
ma))
> >                       goto out_unlock;
> > -             vma_start_write(vma);
> >       }
> >
> >       vma_iter_init(&vmi, mm, 0);
> > @@ -2522,6 +2546,11 @@ static int __mmap_new_vma(struct mmap_state *map=
, struct vm_area_struct **vmap)
> >       if (!vma)
> >               return -ENOMEM;
> >
> > +     /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> > +     error =3D vma_start_write_killable(vma);
> > +     if (error)
> > +             goto free_vma;
> > +
>
> There's no way this is going to fail, right?

You are technically correct but this is only true because of how
vma_start_write_killable() is implemented, so it's a technical detail
of the implementation, which might change in the future...
To clarify, __vma_start_exclude_readers() always succeeds if the vma
is detached (which is the case here) because in that case it bails out
before calling rcuwait_wait_event().

>
> >       vma_iter_config(vmi, map->addr, map->end);
> >       vma_set_range(vma, map->addr, map->end, map->pgoff);
> >       vm_flags_init(vma, map->vm_flags);
> > @@ -2552,8 +2581,6 @@ static int __mmap_new_vma(struct mmap_state *map,=
 struct vm_area_struct **vmap)
> >       WARN_ON_ONCE(!arch_validate_flags(map->vm_flags));
> >  #endif
> >
> > -     /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> > -     vma_start_write(vma);
> >       vma_iter_store_new(vmi, vma);
> >       map->mm->map_count++;
> >       vma_link_file(vma, map->hold_file_rmap_lock);
> > @@ -2864,6 +2891,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct=
 vm_area_struct *vma,
> >                unsigned long addr, unsigned long len, vm_flags_t vm_fla=
gs)
> >  {
> >       struct mm_struct *mm =3D current->mm;
> > +     int err =3D -ENOMEM;
> >
> >       /*
> >        * Check against address space limits by the changed size
> > @@ -2908,7 +2936,10 @@ int do_brk_flags(struct vma_iterator *vmi, struc=
t vm_area_struct *vma,
> >       vma_set_range(vma, addr, addr + len, addr >> PAGE_SHIFT);
> >       vm_flags_init(vma, vm_flags);
> >       vma->vm_page_prot =3D vm_get_page_prot(vm_flags);
> > -     vma_start_write(vma);
> > +     if (vma_start_write_killable(vma)) {
> > +             err =3D -EINTR;
> > +             goto mas_store_fail;
> > +     }
>
> I'd rather have another label saying write lock failed.  Really, this
> will never fail though (besides syzbot..)

Sure, I'll add another label.

>
> >       if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
> >               goto mas_store_fail;
> >
> > @@ -2928,7 +2959,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct=
 vm_area_struct *vma,
> >       vm_area_free(vma);
> >  unacct_fail:
> >       vm_unacct_memory(len >> PAGE_SHIFT);
> > -     return -ENOMEM;
> > +     return err;
> >  }
> >
> >  /**
> > @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma, un=
signed long address)
> >       struct mm_struct *mm =3D vma->vm_mm;
> >       struct vm_area_struct *next;
> >       unsigned long gap_addr;
> > -     int error =3D 0;
> > +     int error;
> >       VMA_ITERATOR(vmi, mm, vma->vm_start);
> >
> >       if (!(vma->vm_flags & VM_GROWSUP))
> > @@ -3126,12 +3157,14 @@ int expand_upwards(struct vm_area_struct *vma, =
unsigned long address)
> >
> >       /* We must make sure the anon_vma is allocated. */
> >       if (unlikely(anon_vma_prepare(vma))) {
> > -             vma_iter_free(&vmi);
> > -             return -ENOMEM;
> > +             error =3D -ENOMEM;
> > +             goto free;
> >       }
> >
> >       /* Lock the VMA before expanding to prevent concurrent page fault=
s */
> > -     vma_start_write(vma);
> > +     error =3D vma_start_write_killable(vma);
> > +     if (error)
> > +             goto free;
> >       /* We update the anon VMA tree. */
> >       anon_vma_lock_write(vma->anon_vma);
> >
> > @@ -3160,6 +3193,7 @@ int expand_upwards(struct vm_area_struct *vma, un=
signed long address)
> >               }
> >       }
> >       anon_vma_unlock_write(vma->anon_vma);
> > +free:
> >       vma_iter_free(&vmi);
> >       validate_mm(mm);
> >       return error;
> > @@ -3174,7 +3208,7 @@ int expand_downwards(struct vm_area_struct *vma, =
unsigned long address)
> >  {
> >       struct mm_struct *mm =3D vma->vm_mm;
> >       struct vm_area_struct *prev;
> > -     int error =3D 0;
> > +     int error;
> >       VMA_ITERATOR(vmi, mm, vma->vm_start);
> >
> >       if (!(vma->vm_flags & VM_GROWSDOWN))
> > @@ -3205,12 +3239,14 @@ int expand_downwards(struct vm_area_struct *vma=
, unsigned long address)
> >
> >       /* We must make sure the anon_vma is allocated. */
> >       if (unlikely(anon_vma_prepare(vma))) {
> > -             vma_iter_free(&vmi);
> > -             return -ENOMEM;
> > +             error =3D -ENOMEM;
> > +             goto free;
> >       }
> >
> >       /* Lock the VMA before expanding to prevent concurrent page fault=
s */
> > -     vma_start_write(vma);
> > +     error =3D vma_start_write_killable(vma);
> > +     if (error)
> > +             goto free;
> >       /* We update the anon VMA tree. */
> >       anon_vma_lock_write(vma->anon_vma);
> >
> > @@ -3240,6 +3276,7 @@ int expand_downwards(struct vm_area_struct *vma, =
unsigned long address)
> >               }
> >       }
> >       anon_vma_unlock_write(vma->anon_vma);
> > +free:
> >       vma_iter_free(&vmi);
> >       validate_mm(mm);
> >       return error;
> > diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> > index 8134e1afca68..a4addc2a8480 100644
> > --- a/mm/vma_exec.c
> > +++ b/mm/vma_exec.c
> > @@ -40,6 +40,7 @@ int relocate_vma_down(struct vm_area_struct *vma, uns=
igned long shift)
> >       struct vm_area_struct *next;
> >       struct mmu_gather tlb;
> >       PAGETABLE_MOVE(pmc, vma, vma, old_start, new_start, length);
> > +     int err;
> >
> >       BUG_ON(new_start > new_end);
> >
> > @@ -55,8 +56,9 @@ int relocate_vma_down(struct vm_area_struct *vma, uns=
igned long shift)
> >        * cover the whole range: [new_start, old_end)
> >        */
> >       vmg.target =3D vma;
> > -     if (vma_expand(&vmg))
> > -             return -ENOMEM;
> > +     err =3D vma_expand(&vmg);
> > +     if (err)
> > +             return err;
> >
> >       /*
> >        * move the page tables downwards, on failure we rely on
> > --
> > 2.53.0.414.gf7e9f6c205-goog
> >
> >
>

