Return-Path: <linuxppc-dev+bounces-17780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAXaCKKnqWlSBwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 16:56:18 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8C214F1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Mar 2026 16:56:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRYzy2XB9z3c8x;
	Fri, 06 Mar 2026 02:56:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::82d" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772726174;
	cv=pass; b=jAxHF+Vv6tDnAbmmwnoAeMfFk6fQr8hdSZeVxrEHKkw/E0Ad1qhazz5gAdCW4RIdgcZtJaY1jviIsAZlR+8yX0cZFecxU75zpjIokz/OoyyTFXWgyk9jV+6asPWndf9TRPftVCrJ1siZYpCfOfkjoRaDRcuJrf1H9xfQlEDCX8hnfA1lapkuayItc1N2r+BbVR/m2heuJXbx6fy5epqx/vlP9/k8T/r5b76uue0VZm775n+hu5s5UQqKLvIqkUd7ipkzIEC+KISTEg8ijkVkaoHOUK6XCdbiz3qKBpQBskO8O98eMB90JP5md7QQvS2pBxtEL/kTtKVEJtq0pUqQOA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772726174; c=relaxed/relaxed;
	bh=CL67FwLgJYo3bAjpZv3JUFOlo9GyDQqh66JIS6cOafI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LVjQaAnOwqPVCe9L7Kokk+egKCCwwdLOd0tLy5f6gcEfi3HDRBL0X7gnsMMxa8fg8GqyD/Czgy5ON1fLqozNfvDZbFE0hEQcZiMzw0yqE42D+D30PLh021K6rIt9cpzhmfbLEJuW7sJn3DosHMMLFKjd+gHATPDSG5v4NxuKtYBSJ+C72TogB0WHolN/mOTsfDXiMZIqXXuUUeW6xLGle7p9cKeYR+8w5nXVp8wlBxm5KZi3ohe5vceANVCUJkypGb42nbsOnUCwzOg1i0pd5SpN/XdBgy3NcmyzfyMx3OgKusafwTcAyK3m0L6RqXM2+TBntdxGoy2SL8gQpVyYcQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RRo+YJzp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RRo+YJzp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRYzx2JyRz3c5y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 02:56:13 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5069a785ed2so502921cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 07:56:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772726171; cv=none;
        d=google.com; s=arc-20240605;
        b=QYbGSHOm4+zX9p6fxNTlNbsjM9ZfL89zNy4hrktLDlQXHj77Rbd03kV+1uZUgKPE1c
         dp1k16yYn43jEyrw11x9uoAsHKeiHRxzowTY3TPDm7Lqbrmy/pd3pgqGEHczm1LMuHvb
         /cWcZ+hBgy5DWbMQ2BWBUjPUl9jEyrRTTfEWCgNgfD32m0BEHCqSH3r+czZ6Lx4gR6MF
         L+Sapx7ErvgADv7qqzZ5yh0H/Jf5yzbfOvfbgR8eIjb7UjBmbS8uxnG6fXRYh1uYRLlm
         6ER4pVz2CgDN0YCjNv4HA32P154Y61nvEPi2m3lASwYXT6BLjZX0/q0xuKB/DfblOnv2
         kVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CL67FwLgJYo3bAjpZv3JUFOlo9GyDQqh66JIS6cOafI=;
        fh=Zzpbb8NHovBYt51m3jWr1Vh+FH6S+XidquNcubOlOEM=;
        b=LwIy64cGJGa1JWFhCDd68hgVtKTvdwMQW8i9vwqB0ssYctqFEJA/KlvLMP86nrHnJ4
         hO/HWbin/a4SMyAmBoa7ba3mhonAGYNAUZBzpJX20vaXv75lDRNRvuzFUTh/rFpsiBjH
         wlBrelNUSk8XKumK1DOaDikavI+r41ux4u4aZzFTb4Mnwja+6xEIRsEmvINNMx5ihreo
         4+cQQtNs54dR7h7UKUjR05n1i20cUAJmHxCCTVPuH9me1KYkiO4C6r1R6Xvsj12jain3
         WngWvmMtZQEAdXcw+8nZo6EcvN09lq7jI7GhbxNCIITQK2rXBDQPJPgHJuqYlv4ClGYo
         2joA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772726171; x=1773330971; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CL67FwLgJYo3bAjpZv3JUFOlo9GyDQqh66JIS6cOafI=;
        b=RRo+YJzpqw5utLjC95WdA8FdWwRmPVhUXA7njmAFLMaV1XIH7wqeKg91KdbeWITqVe
         Vk4OvcX+BjpPNHUjquge9GhZmBcsfmPCd0GWIDKyXa4+opdfE5iSgWd21prdRPKIeRIK
         q7R3WIzF+opZUUjRyRjtHeh2K41xDCpAWj1Hsqo5tvTaRIMumGu/1vKONWWSX5Ae3r2f
         0l6CbWxhNKHyqZZemJu/vSD7rl+M5efSHhEWRX/WRQ4l87KwZFM5j3txilG6lgu4PaXZ
         LcEENUrW08VKLSgybUIOC7YFnMSJb1SxRpVxJXd0ZGlvAN1hk61hvNg1mS+hxT+GSzsO
         f9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772726171; x=1773330971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CL67FwLgJYo3bAjpZv3JUFOlo9GyDQqh66JIS6cOafI=;
        b=k+4EJR/sMuTGFT1QqFzcYtDeUSkPopwy5eRWzsNu1M8KrvfjxqR8QAZka12mIHc8c1
         baUPlFAwHehEGS5jqCrlWpMgUuxDO5fbuzqXqQ3aB9ZJ048CtLAJwsBL1pK7VmCwJm6f
         s0kcYQ/L4nIhVeonFrabkwld3aZhxR//zKk19pteBMTw+W9b74lyxp3zw1fSczZqOrf2
         rkzatnHl1n8I1pvD+HK5EhBrM2kMgrADTxp3WmudfXJG6w38wy5xi5QdhuVEfjD/4nv9
         HqNh6B/x5qUxmYbZG/I2WSGa1Tze3vKnR2mDV9lb7e0jXXl2SeLAI3HbL+4x3ItyzhR4
         Ut+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzWxuYAiRDZN+OYNjosrNVvyfEJX86F8cg73GmBL+JktcGbnxcWMJFJ+eENRvdImBpoNTjknfWIJZpezM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1+kg8eyjT6F3y4QVjinLtt2J/KyzmA8nQX03GOd5uC/sy3Ebm
	izkADeN/k2H3MYel+xhKcK1nTveM1xJyufeIOPmqeTe/ed2mW8MnZvsJHJXJABiDnLCsY7a8Cpf
	7HyJ3bGjohmx0JvESGZ6uCMbWHUqbUwVeWNbcwMZX
X-Gm-Gg: ATEYQzzdJ24pQforjVm2d/uTNPTXgeAbuT6NBWOaZNWfg6Q8qbaQgjmf+9U9nCGu3mq
	L/f8TjriXrYcGJIp5s3+x/q+Y/uH6DRQMO494t5HztQap0eItdnxBVwWhBQI00oI4ZuikMZUO1l
	MJaXsd7c4tRueIWoQVhNv+8Wg9qyUXWL3Kj+y45fBEJ4ts+xEpWp6/GOybh/dGVekYmnf7O2Iar
	EhIoLkY7tD/dNq7tAePqR3+L94Z4KnUsCmFOvdRuHsL1mUOH5oRV9/LMhQvjNBud90Dm6E+qnLA
	nnNwiCn+pr7lS2AUyQqoqFgmlRYIBspcSY+M9A==
X-Received: by 2002:a05:622a:508:b0:506:a1b1:422d with SMTP id
 d75a77b69052e-508e5e2b30dmr8659941cf.14.1772726170353; Thu, 05 Mar 2026
 07:56:10 -0800 (PST)
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
 <aadeHiMqhHF0EQkt@casper.infradead.org> <CAJuCfpFB1ON8=rkqu3MkrbD2mVBeHLK4122nm9RH31fH3hT2Hw@mail.gmail.com>
 <aael1XWaOJN134la@casper.infradead.org> <76aff8f9-1c08-449a-a034-f3b93440d1a8@lucifer.local>
 <aaiBX5Mm36Kg0wq1@casper.infradead.org>
In-Reply-To: <aaiBX5Mm36Kg0wq1@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 5 Mar 2026 07:55:59 -0800
X-Gm-Features: AaiRm53SpNsDBZ1BZJy_J-KSVGaLXeUaHRvKuxEZ4rqtXprCC3pHIR_HRRDvcVY
Message-ID: <CAJuCfpF1=DP4Whe9YkuMcqkE7CXnDWMDbvBAg9pAsut0YSeKEA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with vma_start_write_killable()
To: Matthew Wilcox <willy@infradead.org>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
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
X-Rspamd-Queue-Id: 39F8C214F1A
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
	TAGGED_FROM(0.00)[bounces-17780-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:ljs@kernel.org,m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.ker
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
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,linux-foundation.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 11:00=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Mar 04, 2026 at 04:53:27PM +0000, Lorenzo Stoakes (Oracle) wrote:
> > On Wed, Mar 04, 2026 at 03:24:05AM +0000, Matthew Wilcox wrote:
> > > We could literally return any error code -- it never makes it to
> > > userspace.  I forget where it is, but if you follow the syscall
> > > return to user path, a dying task never makes it to running a single
> > > instruction.
> >
> > Thanks for that Matthew, that makes life easier then.
> >
> > We can probably replace some of the more horrid if (err =3D=3D -EINTR) =
stuff with
> > fatal_signal_pending(current) to be clearer as a result.
>
> Umm.  Be careful?  fatal_signal_pending() may become true at a later
> point, so you may have acquired the lock _and_ fatal_signal_pending()
> can be true.  I'd need to audit a patch to be sure that it's a
> reasonable replacement.

Good point. I'll evaluate each case for this potential.
Thanks!

