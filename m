Return-Path: <linuxppc-dev+bounces-16794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA33D8gAjGlgegAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 05:08:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2621211F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 05:08:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9lKb53fNz2xlk;
	Wed, 11 Feb 2026 15:08:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770782915;
	cv=none; b=eDA62xPSPLbHoDF6psrB7tKQSPZH3pEVeV7ELde7ScBLf523JuiJSX05wqtJ2lECAdr9NFs3DNS3KR4BqK9VOpRaqxKtioZkpFqTgcmFLp5QZiDiNBGYlvL6D3SHSFJcQEadS3whMCbKj90Bhjp0dtVYykwMRTnVE+Uqr6IghW9AugWfz41ygDgsg8a/4+thh9k+MWwgy8Y81p+IInUZjN/LtlAAYG4m3BxslBbGuARGH6YbgILsC6XcCu8O4YmLGFHrqfVWPKELFuJpPi3fxKDIbItQQM6r0ur6j6iHJtC7uJjRrvEZpjb4o/TD1G8w7Ah4kIbEBNj58vqYlfNGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770782915; c=relaxed/relaxed;
	bh=D2eMYc+39p5sjw2VZLfFJ4kKNtq8lBxRgNa5raKSCaw=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=nPPegbNS04iD/ZwUxPoL/6SZ42rWFPqzPsRMK/jMDJoOGMbcMNeUoN6hy07z11ACSNe2oV3e7U6rCYdN//QEHW4HnH12M5dKucSGPynFj42UwvpuOIwlKUZlf1K+SFX2hXVqUwN56adyFW8iHbmwZ8H3gk9zN7o7dGE4ifTdd7jFm57s3WPpP9KEbK/BNwG3a1zjuoivjP8kJXWDQMH5ihSwoUo4qqv8VctLEBauGWhqWka88CkIFhlyIIUOtZtb0iPyp/tkhA9rSAwvFlqTEp07lnKLoSkyrv72tKFOq/SGk/of+1Cc32va+TgJJvKsSjFCpAgFNw+Ingi/00CrEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ROEcnX3D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ROEcnX3D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9lKZ1NVWz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 15:08:32 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c6788f3db37so582477a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 20:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782910; x=1771387710; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D2eMYc+39p5sjw2VZLfFJ4kKNtq8lBxRgNa5raKSCaw=;
        b=ROEcnX3DJGbtvulfPo9VAwVUhxNEU5rTcbJcpuBqkZgdpFW/ScOan7yVW6fJKWVUI/
         O823pYzru9sIlV+AE8j910S5cUEBCJAeUfwvCQJV6QVIqSMZEslcHR0A4ZHnNg4w1BoY
         YF2MhwvYCoW+d4qlztfK51MqsSQePI1iSCHWXzBjRK8XFwkmD55Ku+/hOewSBPzD2GPE
         PL7h21eTVAG9iPvSkWBSZqhh7wYENmIGHOfuDU7FyWZneX6eORH4KFA/I71heWVC7dyr
         Ci+aJpkzcRRnZEnlXpUBBeffDFUegbvU3R3JkKPnmGThBJpJUcBkpidXDVYSs/8zTUPE
         zSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782910; x=1771387710;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D2eMYc+39p5sjw2VZLfFJ4kKNtq8lBxRgNa5raKSCaw=;
        b=JXQAYwujSyJHfKjql1sKGPe90/MtxKX2iacWSsXV83WySkUskVIbiP5FdTddgxElN8
         ydy5P+KJ8PF6xo1dkxU//Dnnc2NMCcTK6ltbPfVa97YO8BdP01PqSRKR5vYQt+HgWev7
         DH7mJlY2WOcRd3Ig5sXpSGQsX3cUHZ+Ql4Ov/p3HvlCupFPZ/dXP/HrczmZtrxypUa41
         kiTu4kZvvNuOKdhOZNeuUXdMV3VBxv1gjRTTqed/xjm+shajSX1X7c9LZVYjaaxfgybF
         x00gYrLgkRiRvjlVJYHmv4MFHXOiX3s3Z0OzyeRR1K4L+6N6vnig/0VRl2dQmoiWuezn
         52tg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZSGf2GRn72np1uOIbeEAbL0IgwsaWCiOdqx2i9n/gb/84f1D+PH1uV5Nwzn528A71fQEakzzQSQ5XtQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwliGrPsx7pbidO8eFJ9oTcmKaWXJu7HR+WPY2qa3l+BTNw1HRi
	ZsEMpcQYXvDOmVxp7t8zLBv+Sx73+p/KLvt3K/yw+jcrO2TnnABM0W40
X-Gm-Gg: AZuq6aKhETUFubUnE70A4M/cAk25gYceP4qEBGz6OGiRd45rhuntX1d1Eqgw/sAqxS8
	NvcgSmGsBVpe52LoLRmCqDn+iXMJkWhC6yC9jgPBDVI7161iqb6TgreG81bP1qTnbtoDbEfQd61
	Jxtpy6QENMDxfJu1SSX262Qo+oHOrQNYKQ/+4rbXLyvJOVXgAa1TJ4BUWmceubMNqjiBfQ/wQ9Q
	kmG1gmRAPxenS+NGbmWLjMUSaveYLSjsXZeyYu/rwQmtccD+OKw9VTY8Ue8rtpldI+VW5/Yh23Q
	Gv/N95S3Regall8/ML7kaZeGdvN46ZotAtUOhAzSVxzdCV8nqQ9DCuBjKWaVwRURSBqsqR7rbu1
	K28DO1qS/GLK3BpYvyb/zDmgA5sJ8I8tFsuGzdZcx1sdk93PTsAnDHrvm5x6E9P4K1tILW2Ro3r
	LLtLpESDUwedHLm3Mj
X-Received: by 2002:a05:6a20:c995:b0:38b:ee34:24f4 with SMTP id adf61e73a8af0-393acf8d036mr17280014637.15.1770782909791;
        Tue, 10 Feb 2026 20:08:29 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e7d5e7csm568794b3a.33.2026.02.10.20.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 20:08:29 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: willy@infradead.org, david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, surenb@google.com
Subject: Re: [PATCH 1/1] mm: replace vma_start_write() with vma_start_write_killable()
In-Reply-To: <20260209220849.2126486-1-surenb@google.com>
Date: Wed, 11 Feb 2026 09:25:51 +0530
Message-ID: <874ino0w8o.ritesh.list@gmail.com>
References: <20260209220849.2126486-1-surenb@google.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-16794-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email]
X-Rspamd-Queue-Id: 9C2621211F7
X-Rspamd-Action: no action

Suren Baghdasaryan <surenb@google.com> writes:

> Now that we have vma_start_write_killable() we can replace most of the
> vma_start_write() calls with it, improving reaction time to the kill
> signal.
>
> There are several places which are left untouched by this patch:
>
> 1. free_pgtables() because function should free page tables even if a
> fatal signal is pending.
>
> 2. userfaultd code, where some paths calling vma_start_write() can
> handle EINTR and some can't without a deeper code refactoring.
>
> 3. vm_flags_{set|mod|clear} require refactoring that involves moving
> vma_start_write() out of these functions and replacing it with
> vma_assert_write_locked(), then callers of these functions should
> lock the vma themselves using vma_start_write_killable() whenever
> possible.
>
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
>  include/linux/mempolicy.h          |  5 +-
>  mm/khugepaged.c                    |  5 +-
>  mm/madvise.c                       |  4 +-
>  mm/memory.c                        |  2 +
>  mm/mempolicy.c                     | 23 ++++++--
>  mm/mlock.c                         | 20 +++++--
>  mm/mprotect.c                      |  4 +-
>  mm/mremap.c                        |  4 +-
>  mm/pagewalk.c                      | 20 +++++--
>  mm/vma.c                           | 94 +++++++++++++++++++++---------
>  mm/vma_exec.c                      |  6 +-
>  12 files changed, 139 insertions(+), 53 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 7cf9310de0ec..69750edcf8d5 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -410,7 +410,10 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  			ret = H_STATE;
>  			break;
>  		}
> -		vma_start_write(vma);
> +		if (vma_start_write_killable(vma)) {
> +			ret = H_STATE;
> +			break;
> +		}
>  		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
>  		vm_flags = vma->vm_flags;
>  		ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,


The above change w.r.t. powerpc error handling in function
kvmppc_memslot_page_merge() looks good to me. 

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc

-ritesh

