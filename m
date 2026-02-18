Return-Path: <linuxppc-dev+bounces-16937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF9uNkvglWneVgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 16:52:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D901157810
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 16:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGLck4lyBz30hq;
	Thu, 19 Feb 2026 02:52:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::829" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771429958;
	cv=pass; b=HlR17MyDmWAlvYPzmbmk5uEqb3+Q32f0fnfBPabKJGiCBfYWyp9A3e6rmhxOBSHkNUkTrOli6exLKYvv1AVJBGRXHoS7Dbu5OiGX/uV5lpz0OkMqN8ljOQMZ8m11wTwE6RcXBTYEt/AtFUjT2zVgdwgOxLenRt2e7Iv1V3nZITISBAd8f35GRXEaGSH1/m9Cib3qeyfxCqrB7OrT2PvmUuYFG9boUTeW3qXYx3IcrGPHyPQvv+U2bWWZP7s23K0s5Pfz+EVXa/7c9MFvq6QJAfwXVPdQf2fzMjCJhkDCOTlmtVc16maU2UWCRgEn2VHvlanpI+/BDz6KF7CaDOPbLA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771429958; c=relaxed/relaxed;
	bh=K/8JkWJqRGjG1Au+HIiW6y70F8UXIF6b3iEb+LfAizM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4K8b3gLcQqVdpUbsyuqvMjNMsFT5UiNHYbyfn0UZ4IrmU0LXJhXeN6itzo+ephUKNGhjzc/EhI8T1L5SkzTXnXhDlplT4KEeDSlrhm1DFTcfh4sEam71WWx6ATSVDwO+jg+JBGTJWX6K6VJ4HZ6LCI1tpK+obPzZCgWMp/Xie95xDQsQjasP+co4XbBUQ+yMJbrkraDVqpZ9VPp2D32oecNaVEal0wyxSOoYfnABFisjy9VExsP8AJYaZc1Yoz5pFACPw5gZqux2kgBBlGTUFZpRH1kbcSZznH4jjlyN/LmNL1V1UP4e35ccgqefO5o9121yO8czmIGJu83fJO9GQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Tgy+70yD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Tgy+70yD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGLch3Xm4z2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 02:52:35 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5069a785ed2so554591cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 07:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771429953; cv=none;
        d=google.com; s=arc-20240605;
        b=PLYCA0XygGqeoFONETlsD88f9mFbb1xrWPK6jwyW8J3CdzCxSjv2RMQldei5EoPN8k
         NX2ueBPYwaM18k8Pj8d2s03I+FznID69GrpX8OOoOcGJqGr1RSOSzAIooLxEjY2dwyLf
         KShsLP8iku9Hv/OwIyGh36k2UCXIn8BIXp4hGDzP+5KpsBUKIgNTqvJp4W/NPODmu6lp
         9FC3t86ML4CfwJRIw0nFXXtmcz01GJ7JWPJVlsNkIonbrmRbA+1a08UItvMvoK0ULD4c
         c02KY1bKEiTOwPuX/gEtEc3cb3pZVfdnt/YCp7amc/ZnNjlPJwgDbfKTwyC9fIiFo6K2
         ywxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K/8JkWJqRGjG1Au+HIiW6y70F8UXIF6b3iEb+LfAizM=;
        fh=hG3I1eL+mFqMpC1SLJkjqu99yZM5vuPMmiA9RKqKMOo=;
        b=ZNW89fKw5avY0SrDaQdkvFbiNiq2hwL+6qUdc55VliAmAhQBTrR7GeglLNixMP5ixj
         wwge000QJ6tTcXYVSPyJAW4lCr38Yq3kDiV+78j1bLgs5IkEY7xdbh9RRG97gLKs9rpU
         RcDUjmS4PCOHd2tVdD4MFE9fN+STYAh2/uCMIzqe2RchzyqiSX2mFRyag/DAr/vFZjj8
         dwr5PSSKzD+ZuG1OlL4+5FdpIvb9Mh+WB8ROpcPU+YhoP/g3KnyjwreqPxt4XvR8Xbcl
         nZcz4l3qpCisH8hkfgTrooltn04pM7M7ZJZkZ2IeGHZKL69yV+ZAViC4OFa8jlidzKN0
         EPMA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771429953; x=1772034753; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/8JkWJqRGjG1Au+HIiW6y70F8UXIF6b3iEb+LfAizM=;
        b=Tgy+70yD4eY8sZZ812JlJuZztzgyoni0EhleAHrmL6qObk1nOttgungxrBBaMoFbw1
         +w4U9dyIelXReSVFSDXs4cFkVGGHUryiRzWsI7XWfdUe12vPwlvehjguwu0/zuRcE/i6
         iXgi2Bd3O8T1zHBs8h6q6t1q/5Nrh1TBL0h6rewqhdLlykMQ6m8HpAiU+jHL2lsR11e7
         m1Rhn5trze6cGOtJSvYhLazxxZXZsTJ/ioTwGo41soiF8I/ssFuGpW6NRHEfLflNiuT3
         laY0V4RiAbLs0tktMsBkjfNS4xva8h7LZUU/CB4I7nU0sU/ORB7cNl1rFE4xSMl8rTat
         8V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771429953; x=1772034753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/8JkWJqRGjG1Au+HIiW6y70F8UXIF6b3iEb+LfAizM=;
        b=fhtDZQVaUKFiVvYvwXoLRTWeImOki21w/0ksY6uEWk9qqltooWtgBnlSUJceXcjIGH
         vXdm3x5tpY0dE+BbSrcTa9B4enxTClok6BXRw/xOg49y0DGtCgT9V66n8qY/PosUFLCr
         3lMevsgr+i1E5jLUEnuvFcsiL7MZ6NBrA+o3pmzC0Nx9xe24ylzSFegZM14af9sJ6r88
         2v17zRlLyCZHSakZNEUFbXiuaoHHNYuGxrLwd/vLUgzD3YlfqBaJYDH9FdkZVOGuWwQZ
         ZcCzQ4VYoeGxG1uc2dzOT7WZ+1rE7DJxx0CcXNlrKEV5VafQoMGZfL7Ds+O44Uv3CmYW
         pJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUoTMP47X9prkjY2hfKsIjdsIovsrNg4RKfccDCyzsZQHeuwAkYHEScIUSkbPqJ94ryKJVSDpS/6GOr2Oo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx+jxFtv6U1y6JuU6HxHbEBgZL47j/ZWUgipYiWp4nzBqqDLP83
	4phhnFC5v3mqFJLbkYwxyR8v5kLoQ42ZCReJdk/muDCgMHb+3auNIR7+9KGZwCRsQJL6Ggy9/7c
	NKS6gNNga858vP8DxeGk9VnYTZmt0XFSCk4sPP/HA
X-Gm-Gg: AZuq6aIdhyaBDKlGmolkJEvplaLety27YcirlbFcKUh6bwXmE2sC3ZxxuB5PbxNF+Lj
	v98ehff7tuZJeTHGRqWtHhvFI3uj2RxI805xukuGakFHU4Ke8Z7CJEx04vODMJYvM6NqCARerGt
	dmECVaGt80t2e7xyAyIGDDfSUgNjvhRnoZYlc9oDUdglkZmdjMygHMfVohw+BqPPbJc+HcZbbG/
	dfGxvCsTQy2L2xeI4hcS6awAtvlInTVz2WT9ohrkcV8F/MFmG/JeEVcKTuG87Brw1y0/mnKZ1TQ
	tvinKgrLjEWCqMmgk5ak3m9kD6xdAUcIvTQ=
X-Received: by 2002:ac8:5848:0:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-506eac6b96dmr6584461cf.8.1771429952470; Wed, 18 Feb 2026
 07:52:32 -0800 (PST)
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
 <20260217191530.13857Aae-hca@linux.ibm.com> <CAJuCfpGxsX6kZAzZJZo7aGNxEbeqOhTV8epF+sHXyqUFOP1few@mail.gmail.com>
 <aZW5i4cqU1qUy3aa@casper.infradead.org>
In-Reply-To: <aZW5i4cqU1qUy3aa@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Feb 2026 15:52:20 +0000
X-Gm-Features: AaiRm53m6s_G40CJP3vmJv4jXAYSm18GE46B6GFp27WgSQ5QeI3l-eaZ79M4lt4
Message-ID: <CAJuCfpH6c9q=W9ynrjV+UEpsoBpdoAw7ADchW2Wvnx+WYkaN6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm: use vma_start_write_killable() in process_vma_walk_lock()
To: Matthew Wilcox <willy@infradead.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, akpm@linux-foundation.org, david@kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:hca@linux.ibm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuah
 ahnjy@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	TAGGED_FROM(0.00)[bounces-16937-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,linux-foundation.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,infradead.org:email]
X-Rspamd-Queue-Id: 5D901157810
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 1:07=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Feb 17, 2026 at 12:31:32PM -0800, Suren Baghdasaryan wrote:
> > Hmm. My patchset is based on mm-new. I guess the code was modified in
> > some other tree. Could you please provide a link to that patchset so I
> > can track it? I'll probably remove this patch from my set until that
> > one is merged.
>
> mm-new is a bad place to be playing; better to base off mm-unstable.

Ah, I see. I'll redo my patchset on top of that then. Thanks for the tip!

