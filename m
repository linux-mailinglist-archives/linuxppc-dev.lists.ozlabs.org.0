Return-Path: <linuxppc-dev+bounces-17755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF1NBEiPqGmzvgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 21:00:08 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2947020759F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 21:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fR3Rm54d8z3cBP;
	Thu, 05 Mar 2026 07:00:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772643213;
	cv=none; b=IYYcAxjKp2FnkjLR+065KRxIZzDSWed5XA6XT2TmsvqX2HsedXi9SAHmYHdRKnA0mvQoLXXlgM9YQq9R+w/WW+7gc5LZolY5tTFtBq+xQjMtYTowuHGlV7/fPqkCK5wwpL/HGITX482/bC2hC54R1Gnma9kTuBYw8csj3ZDTxe0gTzkepEFAPfpCZ9bf//D/kYjmU5RJhldcU84UpV2d/1Ya8Yhv+iMZJpAEIiavLO42E0uTUs1wLEI8/W44RaeAlUIeCb/1Ja6l0ycEmyhizG1wo3eJT7nKjWTEoPfKvAwRZ8n/xMSBhHoaUSgTYVyFMQOSitM/VIM30g2jn9DhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772643213; c=relaxed/relaxed;
	bh=2sR/y/6RjXKZA2Xb/NJXLggqVzGt3wK9gVfzabs/UkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xvq9ZLmBQscwRk/L3izwYHUjDBfnEGSCXwHg0/Q/X507YRZSN373aeBWuMDuin5HyqD00l2k01Dy75xiCkjPzeYWmPmQ6pKtdixmGzxsdSXlCEMNegkXlRAyeB9AjpND9VlXS42kPSF6JrTcgAOXNz/bzQhfR7YagxxHgY+/xZwiuSvHGKycYAGHqKoiS/loRvyolw0vcGebNQhBAyaTnEL6xGCkiiDrTuYd+iSB4esuOWzB8OWOhJ5tzzS32zmtgIUPNsLnt5Men5Ky0ETnq6eVNkP1yX4fseTP99k+Ximgvmyzwwb0veIIDoeO6WuGPZiQzp4KAFpajDAach/NWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p8cv67e9; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p8cv67e9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ljs@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQzJX6b0tz3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2026 03:53:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5EFE43D55;
	Wed,  4 Mar 2026 16:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E293FC4CEF7;
	Wed,  4 Mar 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772643210;
	bh=sDB+az1bAXOGbWMmUUUu0SDGfeabr+ekuNO1hj8thSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8cv67e9ssUeWrFJGzAnKEG//LYmeqoUbvIrlKriZR7tjoP6HIKPNDX8pAccTwBH3
	 kXINSbiaDo1xDJrz/JeaCLaBaVqAnxS7nhEA2lvzOiuDnxxjG11JLenaxDm+s3Lxj2
	 gBLGMkVgja0Q4hASgoNQuIwIlGSxpW6FrxNNdPNh4/g6M+m2IOlHz4cIUNw50qQg28
	 S1E1hSZaFUqKAdRvL5ekKo6FKeATDlnWWE64vY5pnnLHk4JSh7QwNEnHPKQCu7T+j6
	 PIJ1RxF0irx8ZP6DGic6mucNZ5qkVhr+BkuZBSZI1pTlvap4lmikyHjbTLgwLSHuAZ
	 l9ami0VnilBOQ==
Date: Wed, 4 Mar 2026 16:53:27 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: Re: [PATCH v3 2/3] mm: replace vma_start_write() with
 vma_start_write_killable()
Message-ID: <76aff8f9-1c08-449a-a034-f3b93440d1a8@lucifer.local>
References: <20260226070609.3072570-1-surenb@google.com>
 <20260226070609.3072570-3-surenb@google.com>
 <74bffc7a-2b8c-40ae-ab02-cd0ced082e18@lucifer.local>
 <CAJuCfpHBfhKFeWAtQo4r-ofVtO=5MvG+OToEgc2DEY+cuZDSGw@mail.gmail.com>
 <aadeHiMqhHF0EQkt@casper.infradead.org>
 <CAJuCfpFB1ON8=rkqu3MkrbD2mVBeHLK4122nm9RH31fH3hT2Hw@mail.gmail.com>
 <aael1XWaOJN134la@casper.infradead.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aael1XWaOJN134la@casper.infradead.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2947020759F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17755-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:surenb@google.com,m:lorenzo.stoakes@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.
 kernel.org,m:ritesh.list@gmail.com,m:joshuahahnjy@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[google.com,oracle.com,linux-foundation.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,infradead.org:email,oracle.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 03:24:05AM +0000, Matthew Wilcox wrote:
> On Tue, Mar 03, 2026 at 04:02:50PM -0800, Suren Baghdasaryan wrote:
> > On Tue, Mar 3, 2026 at 2:18 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Tue, Mar 03, 2026 at 02:11:31PM -0800, Suren Baghdasaryan wrote:
> > > > On Mon, Mar 2, 2026 at 6:53 AM Lorenzo Stoakes
> > > > <lorenzo.stoakes@oracle.com> wrote:
> > > > > Overall I'm a little concerned about whether callers can handle -EINTR in all
> > > > > cases, have you checked? Might we cause some weirdness in userspace if a syscall
> > > > > suddenly returns -EINTR when before it didn't?
> > > >
> > > > I did check the kernel users and put the patchset through AI reviews.
> > > > I haven't checked if any of the affected syscalls do not advertise
> > > > -EINTR as a possible error. Adding that to my todo list for the next
> > > > respin.
> > >
> > > This only allows interruption by *fatal* signals.  ie there's no way
> > > that userspace will see -EINTR because it's dead before the syscall
> > > returns to userspace.  That was the whole point of killable instead of
> > > interruptible.
> >
> > Ah, I see. So, IIUC, that means any syscall can potentially fail with
> > -EINTR and this failure code doesn't need to be documented. Is that
> > right?
>
> We could literally return any error code -- it never makes it to
> userspace.  I forget where it is, but if you follow the syscall
> return to user path, a dying task never makes it to running a single
> instruction.

Thanks for that Matthew, that makes life easier then.

We can probably replace some of the more horrid if (err == -EINTR) stuff with
fatal_signal_pending(current) to be clearer as a result.

Cheers, Lorenzo

