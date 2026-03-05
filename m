Return-Path: <linuxppc-dev+bounces-17779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEmMOGKnqWlSBwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17779-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 16:55:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE06214ED7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 16:55:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRYyl2TxSz3c8s;
	Fri, 06 Mar 2026 02:55:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::835" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772726111;
	cv=pass; b=TmWi434v4YzMTYoSFybBHIXqg7YTe7A1A6w83mpL97P0KLePWDYFe6yxkWR8vE+T0mQLfhiK5gq/hYSVUkO6kxp24xor6XzdQ9OfFFMX7syiCIkHHzUinxs8OMrE54QnEavLgoJQn2hiKEGm9s/Nwz5H2kXCqmz/UCxLCp8j4GasJf4m1AAYIpCKiVNk0++r+cQChrzXa/j4iOkhKx2P4fZwDggLquaWWbFZGb/4p1wW16bdYACte9fxeEELvBrtknXoz/uUTpgLrtzZ1IFc9MCYF2/7IzBYu/+jgakKpKNV1fNPOTM8FRuXGNbybhmtdoFo47LFY1sMXpZr5fskMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772726111; c=relaxed/relaxed;
	bh=9rJMSnQTk934LiSmrfUCaBKYUciLa/bDO3L6bfIr3A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SUaiLCEwqTpy5T5vynYVep/5nx9Ic25b1OBkh7XEAxcxbUpiQxLjDCZeVvhQxc3QxDhEaQRZh9KpAvYo9fK7jPP4U06ftbIykWUfuEvHb0v49MJPkADsjcrhrx8kLjuSO8DxpW46lDZLugKnfD60vQgnJph34Tmmdi1Gy0fDE0vdRYEG7QFiaOohlE0iP/kjanU9DBG53f5kJbbpTXF2iO1I1Yxx2S5x4PtO+Rtx9aHok43TjMVVJHdOqtYZ94faymT5Nw/7GKjtQ8i3xB9GrrBN/Alyps+EEJBN6D7jghQ71n4IqlBIKxrK717sSOfb1XSeQtJ1sEIW+GeHgDPSgA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NotJZcGL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NotJZcGL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRYyj3Qzvz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 02:55:09 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-5069a785ed2so502041cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 07:55:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772726106; cv=none;
        d=google.com; s=arc-20240605;
        b=CJyhKAKUuWD6BSjX4OEf6lLkbDSaBAXa/OTl0bpVmPlETAc7I/rEmQotnAkgOW4e8h
         eHs3pv9/LgWvU6wn2ypwkLK1CpbxTvemfQH2eeW8CEVeRkr6ZhM4LX8KyQ0g8l6ivelC
         ioYMmWCW3x/VjSx7Copf5bSOnhYT+L1slzr7VOXrXSjhgXCOOSYnaDZN8/MlXfL/m0/S
         Ll9rPN9t9quNBtISwxP7nMyOFk0MBq/uRycTUq9iVJoNb8izmBbLrYUFIpMo2+5zxQqp
         lXCZAWTtQneIMMue3jc+8zyxCXeEujA84HVPM9pm4vq+qvmzRm6jtB2+kbpkMQbJrGeC
         8JpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9rJMSnQTk934LiSmrfUCaBKYUciLa/bDO3L6bfIr3A4=;
        fh=SLpSjBuWvQeLJYk9Pv2isX9AW761lUb7Ych9MGWhI3U=;
        b=ThlapTUMVJhIoDHecWuRVEUVW8WLcLWKe1ajayalXXid+a8beTsRfBwho5bgPKbqam
         2BBy53N/Fxg4EFQIwnH+wxn1oVbcv9qRBXbPWMBlbjs8HsIXpBRnR3GQgoGI/uF/pfbE
         Ga7Fjs+QYupaby3L+OrQX4qZFMZDyGVH+537HqXs2HbJ7Q/I4/YhDeh7rd7HOmws8NvX
         e9BP1w4NhOnUoww9AiMAKaVfdmKw8VgksJYSqqArlcwzQkMz+CGBA9+q0pZ40UKcTTzg
         AGkQK2tbwvRSZlq5IZoH1pzHxcTNlyXrTMRRVoMj8iGuFrO9ZQfVBakA5Vcdnwe3D10P
         2Mog==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772726106; x=1773330906; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rJMSnQTk934LiSmrfUCaBKYUciLa/bDO3L6bfIr3A4=;
        b=NotJZcGLNfFyv/uCiGZtcD9sio0BzLV28tA6YNlD4Z0jBIk1H8iRuUjNHvV/cijecE
         XYueNVUOhosxP35lbmPXPET4CIQsud7ApTtiuR0/xSi+55McoPHWeeB6vCBQNV43zNk5
         KUMTSffE8Rzc38GKf17EmduzUkuFBGkk48+moUSFmwfRh4Y51E2M4JeukX57mYBJTSTb
         xUlsBxk7wrLvtU4a4dUiykxqn4BhKQQx0yGX9FMF5GDjo3ZBYH4pH8hWLxerG6Xrd7np
         MIzVuzM78KC4FSAOHDjWtItIGXiEJ587OwAcBdu/DNly+VhmhhGuR42j2jETx7b9f219
         8QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772726106; x=1773330906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rJMSnQTk934LiSmrfUCaBKYUciLa/bDO3L6bfIr3A4=;
        b=ba4+gl12iIgcN0wkj6XI0wVpl5w/QSRDCrO8mhsbk3O4Src+Ps2RQXL6S5w+SDzTC1
         ++vFzr8fmgZ1Vya3gX4hQ/QTGYiDCc/BrWVB/38wIOV8tG1W6rWbARan6/KFBccWiVtH
         6vZTVlLXNhrLNRJ47Udl3N0mkcP0b4huSLsSgJ+HDMhbK41cuaGTas8wHODH0w+sJj8h
         ckArSbjIbhhsXbfInbulWq9mxeP/o9tC+oIg00aq4DIh7NKD8/Pt7RL7aXEXD5HSXG5A
         e5TSqF4V1YimjFrvRYK0NMNB6zGh35lAkpn2KwOIEKWOWKBbsMHRe783ExYXlupymMVn
         XN+A==
X-Forwarded-Encrypted: i=1; AJvYcCUjGptfd2CKIM+mv7W418zNlbbDEiFTECULFnKRDLf6mDZNXKbEafV0Ad9V63CYZ7tQVkaCZcYIzHc8KrE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2s6N0A2b6ZXZLJDwMnLygN9hurobKFVFquYS6exIAjSiB4Eq6
	prrEqBpOZ5lde2JURRrKBKibhqVoW/xQS5JEI7YgZPAykECQzM6+79fgJSPQ6dB+j8BwVgykN/G
	dRKKiqJzf5KdfMYdCZLQnT2WvvFf4o0qR8/0xuXng
X-Gm-Gg: ATEYQzzg70415NXGdsjNLlZm7zZZ73m8LgelOMYM/CImbkGbO8fNkjyX0KS3OR+xrN9
	g9aDDic3pcRppk4ITv+qTm3asaPU79OXbLfMvMW36CuUW0+goxkJzNTcJHPjM6L3p6OHiMt2mhI
	hnk72OR3x1nEbSzi8cbC+UeUWY1hy2phddwgy+nxcT7JQuAv/1e+Ty63VZoL1HAI1Thd8Yutjoz
	rAR6WtieQVbeI5NEQov+yiWpo1XqQH0r8I85Wwud9yh2VTkepgdbjBOQWvBRX7WtuCyF+b8N/oU
	N+kGpVNE4fI/n7X/QnycSObAglpNtQD3Hl9B9w==
X-Received: by 2002:ac8:5846:0:b0:503:2e98:7842 with SMTP id
 d75a77b69052e-508e5d3f631mr12974331cf.4.1772726104233; Thu, 05 Mar 2026
 07:55:04 -0800 (PST)
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
 <0433a4f0-d183-438f-8063-3e4425b14d77@lucifer.local>
In-Reply-To: <0433a4f0-d183-438f-8063-3e4425b14d77@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 5 Mar 2026 07:54:53 -0800
X-Gm-Features: AaiRm539YQ4AtocEzQy8VgXboiGeYaDtPB3q5vqburr8wvTjQyjuv86tApuw4po
Message-ID: <CAJuCfpEZODp2KFAB90Jdn2NUxmTo0veMTWtDY7TsAdgPw+AxPA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with vma_start_write_killable()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, 
	willy@infradead.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
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
X-Rspamd-Queue-Id: EAE06214ED7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17779-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.ker
 nel.org,m:ritesh.list@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,oracle.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 8:51=E2=80=AFAM Lorenzo Stoakes (Oracle) <ljs@kernel=
.org> wrote:
>
> On Tue, Mar 03, 2026 at 02:11:31PM -0800, Suren Baghdasaryan wrote:
> > On Mon, Mar 2, 2026 at 6:53=E2=80=AFAM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > On Wed, Feb 25, 2026 at 11:06:08PM -0800, Suren Baghdasaryan wrote:
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
> > >
> > > Surprise surprise :))
> > >
> > > >
> > > > 4. mpol_rebind_mm() which is used by cpusset controller for migrati=
ons
> > >
> > > Incredibly nitty but cpusset -> cpuset?
> >
> > Ack.
> >
> > >
> > > > and operates on a remote mm. Incomplete operations here would resul=
t
> > > > in an inconsistent cgroup state.
> > > >
> > > > 5. vm_flags_{set|mod|clear} require refactoring that involves movin=
g
> > > > vma_start_write() out of these functions and replacing it with
> > > > vma_assert_write_locked(), then callers of these functions should
> > > > lock the vma themselves using vma_start_write_killable() whenever
> > > > possible.
> > >
> > > This should be dealt with by my ongoing mmap_prepare, vma flags work.
> >
> > That would be great! It makes it much simpler once you are done with
> > that refactoring.
>
> Yeah will be a big series ;) stats++;
>
> >
> > >
> > > >
> > > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> # powerpc
> > >
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
> Ah yeah as per Matthew's, fair enough. And yes it's only fatal signals.
>
> But then is there any point in doing special handling/not filtering? We m=
ay as
> well not :)
>
> I also don't want us to run into an issue where something other than a fa=
tal
> error results in an -EINTR.

Ok, that's a good point. I'll reconsider the special handling of -EINTR.

>
> >
> > >
> > > Also maybe we should update the manpages to reflect this, as semi-usl=
ess as the
> > > 'possible error codes' sections are...
> >
> > Ok, I'll check which syscalls need to be updated and will note that in
> > cover letter. Once the patchset is accepted I'll update the manpages
> > for them.
>
> Yeah obv nop as per Matthew.

Ack.

>
> >
> > >
> > > > ---
> > > >  arch/powerpc/kvm/book3s_hv_uvmem.c |  5 +-
> > > >  mm/khugepaged.c                    |  5 +-
> > > >  mm/madvise.c                       |  4 +-
> > > >  mm/memory.c                        |  2 +
> > > >  mm/mempolicy.c                     |  8 ++-
> > > >  mm/mlock.c                         | 21 +++++--
> > > >  mm/mprotect.c                      |  4 +-
> > > >  mm/mremap.c                        |  4 +-
> > > >  mm/vma.c                           | 93 +++++++++++++++++++++-----=
----
> > > >  mm/vma_exec.c                      |  6 +-
> > > >  10 files changed, 109 insertions(+), 43 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/=
book3s_hv_uvmem.c
> > > > index 5fbb95d90e99..0a28b48a46b8 100644
> > > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > > @@ -410,7 +410,10 @@ static int kvmppc_memslot_page_merge(struct kv=
m *kvm,
> > > >                       ret =3D H_STATE;
> > > >                       break;
> > > >               }
> > > > -             vma_start_write(vma);
> > > > +             if (vma_start_write_killable(vma)) {
> > > > +                     ret =3D H_STATE;
> > > > +                     break;
> > > > +             }
> > > >               /* Copy vm_flags to avoid partial modifications in ks=
m_madvise */
> > > >               vm_flags =3D vma->vm_flags;
> > > >               ret =3D ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > > > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > > > index 1dd3cfca610d..6c92e31ee5fb 100644
> > > > --- a/mm/khugepaged.c
> > > > +++ b/mm/khugepaged.c
> > > > @@ -1141,7 +1141,10 @@ static enum scan_result collapse_huge_page(s=
truct mm_struct *mm, unsigned long a
> > > >       if (result !=3D SCAN_SUCCEED)
> > > >               goto out_up_write;
> > > >       /* check if the pmd is still valid */
> > > > -     vma_start_write(vma);
> > > > +     if (vma_start_write_killable(vma)) {
> > > > +             result =3D SCAN_FAIL;
> > > > +             goto out_up_write;
> > > > +     }
> > > >       result =3D check_pmd_still_valid(mm, address, pmd);
> > > >       if (result !=3D SCAN_SUCCEED)
> > > >               goto out_up_write;
> > > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > > index c0370d9b4e23..ccdaea6b3b15 100644
> > > > --- a/mm/madvise.c
> > > > +++ b/mm/madvise.c
> > > > @@ -173,7 +173,9 @@ static int madvise_update_vma(vm_flags_t new_fl=
ags,
> > > >       madv_behavior->vma =3D vma;
> > > >
> > > >       /* vm_flags is protected by the mmap_lock held in write mode.=
 */
> > > > -     vma_start_write(vma);
> > > > +     if (vma_start_write_killable(vma))
> > > > +             return -EINTR;
> > > > +
> > > >       vm_flags_reset(vma, new_flags);
> > > >       if (set_new_anon_name)
> > > >               return replace_anon_vma_name(vma, anon_name);
> > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > index 07778814b4a8..691062154cf5 100644
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@ -379,6 +379,8 @@ void free_pgd_range(struct mmu_gather *tlb,
> > > >   * page tables that should be removed.  This can differ from the v=
ma mappings on
> > > >   * some archs that may have mappings that need to be removed outsi=
de the vmas.
> > > >   * Note that the prev->vm_end and next->vm_start are often used.
> > > > + * We don't use vma_start_write_killable() because page tables sho=
uld be freed
> > > > + * even if the task is being killed.
> > > >   *
> > > >   * The vma_end differs from the pg_end when a dup_mmap() failed an=
d the tree has
> > > >   * unrelated data to the mm_struct being torn down.
> > > > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > > > index 0e5175f1c767..90939f5bde02 100644
> > > > --- a/mm/mempolicy.c
> > > > +++ b/mm/mempolicy.c
> > > > @@ -1784,7 +1784,8 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsi=
gned long, start, unsigned long, le
> > > >               return -EINVAL;
> > > >       if (end =3D=3D start)
> > > >               return 0;
> > > > -     mmap_write_lock(mm);
> > > > +     if (mmap_write_lock_killable(mm))
> > > > +             return -EINTR;
> > >
> > > Hmm mmap write lock as well now :) I guess it makes sense here, esp g=
iven mmap
> > > write lock part of VMA write lock.
> >
> > Yeah, I thought while we are at it we can make this part a bit better t=
oo...
>
> Yup that's fair.
>
> >
> > >
> > >
> > > >       prev =3D vma_prev(&vmi);
> > > >       for_each_vma_range(vmi, vma, end) {
> > > >               /*
> > > > @@ -1801,13 +1802,16 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, un=
signed long, start, unsigned long, le
> > > >                       err =3D -EOPNOTSUPP;
> > > >                       break;
> > > >               }
> > > > +             if (vma_start_write_killable(vma)) {
> > > > +                     err =3D -EINTR;
> > > > +                     break;
> > > > +             }
> > > >               new =3D mpol_dup(old);
> > > >               if (IS_ERR(new)) {
> > > >                       err =3D PTR_ERR(new);
> > > >                       break;
> > > >               }
> > > >
> > > > -             vma_start_write(vma);
> > >
> > > Are we ok with moving this to before mpol_dup()? Does this matter? Co=
nfused as
> > > to why you moved this up?
> >
> > I thought if locking fails, it would be better to check that earlier
> > before allocating a new mempolicy. That seems to be safe, but thinking
> > about this now, if allocation goes into direct reclaim and causes the
> > lock to be held for longer then that might not be such a hot idea...
>
> Yeah :) it's stuff like this that makes me worry. But moreso some horrend=
ous
> lock ordering issue...

I think we are good on lock ordering since we already hold the mmap
write lock but I'll try to minimize the lock movements.

>
> >
> > >
> > > >               new->home_node =3D home_node;
> > > >               err =3D mbind_range(&vmi, vma, &prev, start, end, new=
);
> > > >               mpol_put(new);
> > > > diff --git a/mm/mlock.c b/mm/mlock.c
> > > > index 2f699c3497a5..c562c77c3ee0 100644
> > > > --- a/mm/mlock.c
> > > > +++ b/mm/mlock.c
> > > > @@ -420,7 +420,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned=
 long addr,
> > > >   * Called for mlock(), mlock2() and mlockall(), to set @vma VM_LOC=
KED;
> > > >   * called for munlock() and munlockall(), to clear VM_LOCKED from =
@vma.
> > > >   */
> > >
> > > You should update the comment to reflect this possible return value.
> >
> > Ack.
>
> Thanks!
>
> >
> > >
> > > > -static void mlock_vma_pages_range(struct vm_area_struct *vma,
> > > > +static int mlock_vma_pages_range(struct vm_area_struct *vma,
> > > >       unsigned long start, unsigned long end, vm_flags_t newflags)
> > > >  {
> > > >       static const struct mm_walk_ops mlock_walk_ops =3D {
> > > > @@ -441,7 +441,9 @@ static void mlock_vma_pages_range(struct vm_are=
a_struct *vma,
> > > >        */
> > > >       if (newflags & VM_LOCKED)
> > > >               newflags |=3D VM_IO;
> > > > -     vma_start_write(vma);
> > > > +     if (vma_start_write_killable(vma))
> > > > +             return -EINTR;
> > > > +
> > > >       vm_flags_reset_once(vma, newflags);
> > > >
> > > >       lru_add_drain();
> > > > @@ -452,6 +454,7 @@ static void mlock_vma_pages_range(struct vm_are=
a_struct *vma,
> > > >               newflags &=3D ~VM_IO;
> > > >               vm_flags_reset_once(vma, newflags);
> > > >       }
> > > > +     return 0;
> > > >  }
> > > >
> > > >  /*
> > > > @@ -501,10 +504,12 @@ static int mlock_fixup(struct vma_iterator *v=
mi, struct vm_area_struct *vma,
> > > >        */
> > > >       if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
> > > >               /* No work to do, and mlocking twice would be wrong *=
/
> > >
> > > I'd move this comment down to the vm_flags_reset() line as it's not a=
pplicable
> > > if we fail to get the lock.
> >
> > Ack.
>
> Thanks!
>
> >
> > >
> > >
> > > > -             vma_start_write(vma);
> > > > +             ret =3D vma_start_write_killable(vma);
> > > > +             if (ret)
> > > > +                     goto out;
> > > >               vm_flags_reset(vma, newflags);
> > > >       } else {
> > > > -             mlock_vma_pages_range(vma, start, end, newflags);
> > > > +             ret =3D mlock_vma_pages_range(vma, start, end, newfla=
gs);
> > > >       }
> > > >  out:
> > > >       *prev =3D vma;
> > > > @@ -733,9 +738,13 @@ static int apply_mlockall_flags(int flags)
> > > >
> > > >               error =3D mlock_fixup(&vmi, vma, &prev, vma->vm_start=
, vma->vm_end,
> > > >                                   newflags);
> > > > -             /* Ignore errors, but prev needs fixing up. */
> > > > -             if (error)
> > > > +             /* Ignore errors except EINTR, but prev needs fixing =
up. */
> > >
> > > Well, except you're not fixing it up on -EINTR? This comment should b=
e redone.
> >
> > Hmm, should we fixup if the process is terminating? Does it matter at
> > this point?
>
> We may as well keep the comment accurate though? I mean this isn't a big =
deal :)

Ack.

>
> >
> > >
> > > But I wonder if this is correct? We are ignoring all other errors tha=
t
> > > interrupted the operation, so why are we special casing -EINTR?
> >
> > Well, -EINTR means all the work you are doing here is useless because
> > the process is about to go away. So, in that respect I think it's
> > different from other errors.
>
> Well -EINTR doesn't _just_ mean fatal signal. We happen to know here that=
 what
> we're calling will only return -EINTR in that case, but if somebody chang=
es
> downstream code to return -EINTR for _another_ reason there's an issue.

Fair point.

>
> Can we just replace these horrid -EINTR checks with
> is_fatal_signal_pending(current)?

I think here that would be fine. I'll evaluate each individual case I
check for EINTR.

>
> >
> > >
> > > > +             if (error) {
> > > > +                     if (error =3D=3D -EINTR)
> > > > +                             return error;
> > > > +
> > > >                       prev =3D vma;
> > > > +             }
> > > >               cond_resched();
> > > >       }
> > > >  out:
> > > > diff --git a/mm/mprotect.c b/mm/mprotect.c
> > > > index c0571445bef7..49dbb7156936 100644
> > > > --- a/mm/mprotect.c
> > > > +++ b/mm/mprotect.c
> > > > @@ -765,7 +765,9 @@ mprotect_fixup(struct vma_iterator *vmi, struct=
 mmu_gather *tlb,
> > > >        * vm_flags and vm_page_prot are protected by the mmap_lock
> > > >        * held in write mode.
> > > >        */
> > > > -     vma_start_write(vma);
> > > > +     error =3D vma_start_write_killable(vma);
> > > > +     if (error < 0)
> > >
> > > Weird inconstency here, this should be if (error).
> >
> > Ack.
>
> Thanks!
>
> >
> > >
> > > > +             goto fail;
> > > >       vm_flags_reset_once(vma, newflags);
> > > >       if (vma_wants_manual_pte_write_upgrade(vma))
> > > >               mm_cp_flags |=3D MM_CP_TRY_CHANGE_WRITABLE;
> > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > index 2be876a70cc0..aef1e5f373c7 100644
> > > > --- a/mm/mremap.c
> > > > +++ b/mm/mremap.c
> > > > @@ -1286,7 +1286,9 @@ static unsigned long move_vma(struct vma_rema=
p_struct *vrm)
> > > >               return -ENOMEM;
> > > >
> > > >       /* We don't want racing faults. */
> > > > -     vma_start_write(vrm->vma);
> > > > +     err =3D vma_start_write_killable(vrm->vma);
> > > > +     if (err)
> > > > +             return err;
> > > >
> > > >       /* Perform copy step. */
> > > >       err =3D copy_vma_and_data(vrm, &new_vma);
> > > > diff --git a/mm/vma.c b/mm/vma.c
> > > > index bb4d0326fecb..9f2664f1d078 100644
> > > > --- a/mm/vma.c
> > > > +++ b/mm/vma.c
> > > > @@ -530,6 +530,13 @@ __split_vma(struct vma_iterator *vmi, struct v=
m_area_struct *vma,
> > > >       if (err)
> > > >               goto out_free_vmi;
> > > >
> > > > +     err =3D vma_start_write_killable(vma);
> > > > +     if (err)
> > > > +             goto out_free_mpol;
> > > > +     err =3D vma_start_write_killable(new);
> > > > +     if (err)
> > > > +             goto out_free_mpol;
> > > > +
> > > >       err =3D anon_vma_clone(new, vma, VMA_OP_SPLIT);
> > > >       if (err)
> > > >               goto out_free_mpol;
> > > > @@ -540,9 +547,6 @@ __split_vma(struct vma_iterator *vmi, struct vm=
_area_struct *vma,
> > > >       if (new->vm_ops && new->vm_ops->open)
> > > >               new->vm_ops->open(new);
> > > >
> > > > -     vma_start_write(vma);
> > > > -     vma_start_write(new);
> > > > -
> > >
> > > Again you're changing ordering seemingly arbitrarily.
> >
> > I moved it up to avoid undoing all the work above (vm_ops->open,
> > vma_dup_policy, vma_iter_prealloc, vm_area_dup,..)
> >
> > > I think this is actually a
> > > more problematic case as you're now invoking vm_ops->open() with a VM=
A write
> > > lock held.
> >
> > Are you concerned about potential increased duration of the vma lock
> > being held or that open() might try to take that lock itself (which is
> > not a problem because vma write locks are reentrant)? Maybe some other
> > concern I'm missing?
>
> General concern about reordering, but fair point re: undoing.
>
> rmap.c says it's ok so we're good:

Ack.

>
>  *           vma_start_write
>  *             mapping->i_mmap_rwsem
>  *               anon_vma->rwsem
>
> >
> > >
> > > So I think you should keep the existing position.
> >
> > If we do that then we would have to undo a bunch of operations. I'm
> > fine adding that if there are reasons to avoid this move.
>
> OK fair enough in this case.

Ack.

>
> >
> > >
> > > >       init_vma_prep(&vp, vma);
> > > >       vp.insert =3D new;
> > > >       vma_prepare(&vp);
> > > > @@ -895,16 +899,22 @@ static __must_check struct vm_area_struct *vm=
a_merge_existing_range(
> > > >       }
> > > >
> > > >       /* No matter what happens, we will be adjusting middle. */
> > > > -     vma_start_write(middle);
> > > > +     err =3D vma_start_write_killable(middle);
> > > > +     if (err)
> > > > +             goto abort;
> > > >
> > > >       if (merge_right) {
> > > > -             vma_start_write(next);
> > > > +             err =3D vma_start_write_killable(next);
> > > > +             if (err)
> > > > +                     goto abort;
> > > >               vmg->target =3D next;
> > > >               sticky_flags |=3D (next->vm_flags & VM_STICKY);
> > > >       }
> > > >
> > > >       if (merge_left) {
> > > > -             vma_start_write(prev);
> > > > +             err =3D vma_start_write_killable(prev);
> > > > +             if (err)
> > > > +                     goto abort;
> > > >               vmg->target =3D prev;
> > > >               sticky_flags |=3D (prev->vm_flags & VM_STICKY);
> > > >       }
> > > > @@ -1155,10 +1165,12 @@ int vma_expand(struct vma_merge_struct *vmg=
)
> > > >       struct vm_area_struct *next =3D vmg->next;
> > > >       bool remove_next =3D false;
> > > >       vm_flags_t sticky_flags;
> > > > -     int ret =3D 0;
> > > > +     int ret;
> > > >
> > > >       mmap_assert_write_locked(vmg->mm);
> > > > -     vma_start_write(target);
> > > > +     ret =3D vma_start_write_killable(target);
> > > > +     if (ret)
> > > > +             return ret;
> > > >
> > > >       if (next && target !=3D next && vmg->end =3D=3D next->vm_end)
> > > >               remove_next =3D true;
> > > > @@ -1187,6 +1199,9 @@ int vma_expand(struct vma_merge_struct *vmg)
> > > >        * we don't need to account for vmg->give_up_on_mm here.
> > > >        */
> > > >       if (remove_next) {
> > > > +             ret =3D vma_start_write_killable(next);
> > > > +             if (ret)
> > > > +                     return ret;
> > > >               ret =3D dup_anon_vma(target, next, &anon_dup);
> > > >               if (ret)
> > > >                       return ret;
> > > > @@ -1197,10 +1212,8 @@ int vma_expand(struct vma_merge_struct *vmg)
> > > >                       return ret;
> > > >       }
> > > >
> > > > -     if (remove_next) {
> > > > -             vma_start_write(next);
> > > > +     if (remove_next)
> > > >               vmg->__remove_next =3D true;
> > > > -     }
> > >
> > > Hmm you're moving the ordering of things around again :) You should h=
ave made
> > > this change as part of patch 1 anyway first so this patch wouldn't ha=
ve a
> > > refactoring in it too.
> > >
> > > Top of rmap.c suggests you _can_ take the VMA write lock prior to try=
ing the dup
> > > but I'm just not sure why you'd want to switch these around in this p=
atch?
> > >
> > > Can we try to keep original ordering unless there's a really good rea=
son not to?
> >
> > Again, I'm trying to avoid undoing things if locking fails but this
> > function already has rollback code, so I can reuse it. I'll keep the
> > old placement here.
>
> Ack yeah... :)
>
> We're safe with vma -> anon rmap lock anyway.

Ack.

>
> >
> > >
> > > >       if (commit_merge(vmg))
> > > >               goto nomem;
> > > >
> > > > @@ -1233,6 +1246,7 @@ int vma_shrink(struct vma_iterator *vmi, stru=
ct vm_area_struct *vma,
> > > >              unsigned long start, unsigned long end, pgoff_t pgoff)
> > > >  {
> > > >       struct vma_prepare vp;
> > > > +     int err;
> > > >
> > > >       WARN_ON((vma->vm_start !=3D start) && (vma->vm_end !=3D end))=
;
> > > >
> > > > @@ -1244,7 +1258,11 @@ int vma_shrink(struct vma_iterator *vmi, str=
uct vm_area_struct *vma,
> > > >       if (vma_iter_prealloc(vmi, NULL))
> > > >               return -ENOMEM;
> > > >
> > > > -     vma_start_write(vma);
> > > > +     err =3D vma_start_write_killable(vma);
> > > > +     if (err) {
> > > > +             vma_iter_free(vmi);
> > > > +             return err;
> > > > +     }
> > > >
> > > >       init_vma_prep(&vp, vma);
> > > >       vma_prepare(&vp);
> > > > @@ -1434,7 +1452,9 @@ static int vms_gather_munmap_vmas(struct vma_=
munmap_struct *vms,
> > > >                       if (error)
> > > >                               goto end_split_failed;
> > > >               }
> > > > -             vma_start_write(next);
> > > > +             error =3D vma_start_write_killable(next);
> > > > +             if (error)
> > > > +                     goto munmap_gather_failed;
> > > >               mas_set(mas_detach, vms->vma_count++);
> > > >               error =3D mas_store_gfp(mas_detach, next, GFP_KERNEL)=
;
> > > >               if (error)
> > > > @@ -1828,12 +1848,17 @@ static void vma_link_file(struct vm_area_st=
ruct *vma, bool hold_rmap_lock)
> > > >  static int vma_link(struct mm_struct *mm, struct vm_area_struct *v=
ma)
> > > >  {
> > > >       VMA_ITERATOR(vmi, mm, 0);
> > > > +     int err;
> > > >
> > > >       vma_iter_config(&vmi, vma->vm_start, vma->vm_end);
> > > >       if (vma_iter_prealloc(&vmi, vma))
> > > >               return -ENOMEM;
> > > >
> > > > -     vma_start_write(vma);
> > > > +     err =3D vma_start_write_killable(vma);
> > > > +     if (err) {
> > > > +             vma_iter_free(&vmi);
> > > > +             return err;
> > > > +     }
> > > >       vma_iter_store_new(&vmi, vma);
> > > >       vma_link_file(vma, /* hold_rmap_lock=3D */false);
> > > >       mm->map_count++;
> > > > @@ -2215,9 +2240,8 @@ int mm_take_all_locks(struct mm_struct *mm)
> > > >        * is reached.
> > > >        */
> > > >       for_each_vma(vmi, vma) {
> > > > -             if (signal_pending(current))
> > > > +             if (signal_pending(current) || vma_start_write_killab=
le(vma))
> > > >                       goto out_unlock;
> > > > -             vma_start_write(vma);
> > > >       }
> > > >
> > > >       vma_iter_init(&vmi, mm, 0);
> > > > @@ -2522,6 +2546,11 @@ static int __mmap_new_vma(struct mmap_state =
*map, struct vm_area_struct **vmap)
> > > >       if (!vma)
> > > >               return -ENOMEM;
> > > >
> > > > +     /* Lock the VMA since it is modified after insertion into VMA=
 tree */
> > > > +     error =3D vma_start_write_killable(vma);
> > > > +     if (error)
> > > > +             goto free_vma;
> > > > +
> > >
> > > You're doing it again :)
> > >
> > > Can we please keep the lock acquisition at the point it is in unless =
there's a
> > > really good reason not to.
> > >
> > > And if there is a good reason, please do it in another commit prior t=
o the
> > > massive 'change everything' one so it's more easily reviewable :)
> >
> > The reason for this one is that I want to avoid undoing
> > __mmap_new_file_vma() if we fail to lock the VMA later. Undoing that
> > one would be messy, so I would prefer locking it earlier. These
> > operations are already performed under the mmap write lock. Is that
> > really a problem if we write-lock the VMA as well?
>
> This is a fair point, I obviously glanced over this without thinking abou=
t that
> :)
>
> I think you should include in the commit message why you're reordering th=
ough.

Yeah, I should have explained more about the reasons. I will add a
section in the comments about this.

>
> >
> > >
> > > >       vma_iter_config(vmi, map->addr, map->end);
> > > >       vma_set_range(vma, map->addr, map->end, map->pgoff);
> > > >       vm_flags_init(vma, map->vm_flags);
> > > > @@ -2552,8 +2581,6 @@ static int __mmap_new_vma(struct mmap_state *=
map, struct vm_area_struct **vmap)
> > > >       WARN_ON_ONCE(!arch_validate_flags(map->vm_flags));
> > > >  #endif
> > > >
> > > > -     /* Lock the VMA since it is modified after insertion into VMA=
 tree */
> > > > -     vma_start_write(vma);
> > > >       vma_iter_store_new(vmi, vma);
> > > >       map->mm->map_count++;
> > > >       vma_link_file(vma, map->hold_file_rmap_lock);
> > > > @@ -2864,6 +2891,7 @@ int do_brk_flags(struct vma_iterator *vmi, st=
ruct vm_area_struct *vma,
> > > >                unsigned long addr, unsigned long len, vm_flags_t vm=
_flags)
> > > >  {
> > > >       struct mm_struct *mm =3D current->mm;
> > > > +     int err =3D -ENOMEM;
> > >
> > > I hate this 'default error code' pattern, it's a code smell. Please u=
pdate
> > > everything that jumps to the failure case to set err, and leave this
> > > uninitialised.
> > >
> > > We've had real bugs come out of this before!
> >
> > Ack.
>
> Thanks!
>
> >
> > >
> > > >
> > > >       /*
> > > >        * Check against address space limits by the changed size
> > > > @@ -2908,7 +2936,10 @@ int do_brk_flags(struct vma_iterator *vmi, s=
truct vm_area_struct *vma,
> > > >       vma_set_range(vma, addr, addr + len, addr >> PAGE_SHIFT);
> > > >       vm_flags_init(vma, vm_flags);
> > > >       vma->vm_page_prot =3D vm_get_page_prot(vm_flags);
> > > > -     vma_start_write(vma);
> > > > +     if (vma_start_write_killable(vma)) {
> > > > +             err =3D -EINTR;
> > > > +             goto mas_store_fail;
> > > > +     }
> > > >       if (vma_iter_store_gfp(vmi, vma, GFP_KERNEL))
> > > >               goto mas_store_fail;
> > > >
> > > > @@ -2928,7 +2959,7 @@ int do_brk_flags(struct vma_iterator *vmi, st=
ruct vm_area_struct *vma,
> > > >       vm_area_free(vma);
> > > >  unacct_fail:
> > > >       vm_unacct_memory(len >> PAGE_SHIFT);
> > > > -     return -ENOMEM;
> > > > +     return err;
> > > >  }
> > > >
> > > >  /**
> > > > @@ -3089,7 +3120,7 @@ int expand_upwards(struct vm_area_struct *vma=
, unsigned long address)
> > > >       struct mm_struct *mm =3D vma->vm_mm;
> > > >       struct vm_area_struct *next;
> > > >       unsigned long gap_addr;
> > > > -     int error =3D 0;
> > > > +     int error;
> > > >       VMA_ITERATOR(vmi, mm, vma->vm_start);
> > > >
> > > >       if (!(vma->vm_flags & VM_GROWSUP))
> > > > @@ -3126,12 +3157,14 @@ int expand_upwards(struct vm_area_struct *v=
ma, unsigned long address)
> > > >
> > > >       /* We must make sure the anon_vma is allocated. */
> > > >       if (unlikely(anon_vma_prepare(vma))) {
> > > > -             vma_iter_free(&vmi);
> > > > -             return -ENOMEM;
> > > > +             error =3D -ENOMEM;
> > > > +             goto free;
> > > >       }
> > > >
> > > >       /* Lock the VMA before expanding to prevent concurrent page f=
aults */
> > > > -     vma_start_write(vma);
> > > > +     error =3D vma_start_write_killable(vma);
> > > > +     if (error)
> > > > +             goto free;
> > > >       /* We update the anon VMA tree. */
> > > >       anon_vma_lock_write(vma->anon_vma);
> > > >
> > > > @@ -3160,6 +3193,7 @@ int expand_upwards(struct vm_area_struct *vma=
, unsigned long address)
> > > >               }
> > > >       }
> > > >       anon_vma_unlock_write(vma->anon_vma);
> > > > +free:
> > >
> > > Nitty, but this kinda sucks as a label name, generally when the error=
 label
> > > contains 'free' it is free_xxx where 'xxx' is some specific thing.
> > >
> > > So somethiing like 'fail' would be good.
> >
> > Ack. Will change to something more appropriate.
>
> Thanks!
>
> >
> > >
> > > >       vma_iter_free(&vmi);
> > > >       validate_mm(mm);
> > > >       return error;
> > > > @@ -3174,7 +3208,7 @@ int expand_downwards(struct vm_area_struct *v=
ma, unsigned long address)
> > > >  {
> > > >       struct mm_struct *mm =3D vma->vm_mm;
> > > >       struct vm_area_struct *prev;
> > > > -     int error =3D 0;
> > > > +     int error;
> > > >       VMA_ITERATOR(vmi, mm, vma->vm_start);
> > > >
> > > >       if (!(vma->vm_flags & VM_GROWSDOWN))
> > > > @@ -3205,12 +3239,14 @@ int expand_downwards(struct vm_area_struct =
*vma, unsigned long address)
> > > >
> > > >       /* We must make sure the anon_vma is allocated. */
> > > >       if (unlikely(anon_vma_prepare(vma))) {
> > > > -             vma_iter_free(&vmi);
> > > > -             return -ENOMEM;
> > > > +             error =3D -ENOMEM;
> > > > +             goto free;
> > > >       }
> > > >
> > > >       /* Lock the VMA before expanding to prevent concurrent page f=
aults */
> > > > -     vma_start_write(vma);
> > > > +     error =3D vma_start_write_killable(vma);
> > > > +     if (error)
> > > > +             goto free;
> > > >       /* We update the anon VMA tree. */
> > > >       anon_vma_lock_write(vma->anon_vma);
> > > >
> > > > @@ -3240,6 +3276,7 @@ int expand_downwards(struct vm_area_struct *v=
ma, unsigned long address)
> > > >               }
> > > >       }
> > > >       anon_vma_unlock_write(vma->anon_vma);
> > > > +free:
> > >
> > > Obviously same comment her :)
> >
> > Ack.
>
> Thanks!
>
> >
> > >
> > > >       vma_iter_free(&vmi);
> > > >       validate_mm(mm);
> > > >       return error;
> > > > diff --git a/mm/vma_exec.c b/mm/vma_exec.c
> > > > index 8134e1afca68..a4addc2a8480 100644
> > > > --- a/mm/vma_exec.c
> > > > +++ b/mm/vma_exec.c
> > > > @@ -40,6 +40,7 @@ int relocate_vma_down(struct vm_area_struct *vma,=
 unsigned long shift)
> > > >       struct vm_area_struct *next;
> > > >       struct mmu_gather tlb;
> > > >       PAGETABLE_MOVE(pmc, vma, vma, old_start, new_start, length);
> > > > +     int err;
> > > >
> > > >       BUG_ON(new_start > new_end);
> > > >
> > > > @@ -55,8 +56,9 @@ int relocate_vma_down(struct vm_area_struct *vma,=
 unsigned long shift)
> > > >        * cover the whole range: [new_start, old_end)
> > > >        */
> > > >       vmg.target =3D vma;
> > > > -     if (vma_expand(&vmg))
> > > > -             return -ENOMEM;
> > > > +     err =3D vma_expand(&vmg);
> > > > +     if (err)
> > > > +             return err;
> > >
> > > Hmm. But before we were filtering the errors and now we're not... I g=
uess not an
> > > issue as before it could _only_ return -ENOMEM, but again, are we sur=
e all
> > > callers are fine with -EINTR I guess :)
> >
> > This function is called only from setup_arg_pages() and all its
> > callers end up being linux_binfmt.load_binary handlers. The returned
> > error propagates all the way to execve() and its friends. And with my
> > extreme "luck" the execve syscall lists probably every single possible
> > error code except EINTR :) This is depressing...
>
> Well as per Matthew's point this is probably fine.

Yes, Matthew made my job much easier :)

>
> >
> > Thanks for the detailed review, Lorenzo! I guess we need to discuss
> > these lock moves a bit more before I start on the new version.
>
> Nah I think we're good after this!

Ack. I'll make the changes we agreed on and will post v4 likely on Monday.
Thanks!

>
> >
> > >
> > > >
> > > >       /*
> > > >        * move the page tables downwards, on failure we rely on
> > > > --
> > > > 2.53.0.414.gf7e9f6c205-goog
> > > >
> > >
> > > Cheers, Lorenzo
> > >
>
> Cheers, Lorenzo

