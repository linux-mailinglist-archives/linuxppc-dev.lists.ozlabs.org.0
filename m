Return-Path: <linuxppc-dev+bounces-16171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFdKF4SZcmnBmwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16171-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:41:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 697DC6DDF5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jan 2026 22:41:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxvdY01TFz30M6;
	Fri, 23 Jan 2026 08:41:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769118080;
	cv=none; b=egfzN3g/66wUo5S5QI1dr0U2gQQ3iLiEYpb6E9j1pbypXriFGHz/SU6viRegsKy5poe4QjTZULJQNCaIUYGfb5vcREUc48JEOAu9KM96Dyy1Zv9ZakHnvoyz0J+1h/yeKd6U8XNT2qgn6DlTRmF9gCcX5UlWzckaWhOxrmjZ5OndQa23kaBiCOKl62dLHZVVMkeGnKX8ghA9TJbJ3k11KCoNlIkrCnsKCUetAiBNPnWVRWezSXilFfezjQpct01D5dcVuw/g1TV4AtjZN1sD35xJDKQzRp9PZYpMGAnhK9GFz88JFjVYLSwCX7R68iBBN+NjeulpRu3SaYAOgtfk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769118080; c=relaxed/relaxed;
	bh=OpYFVQ+VNJG8H/bYcBfO1oxUpkQ5dAYJneF97kYBjLE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O53Vbl+vAVXyUQJIeFIhjUeJk7ZGlp9FHV9VV8XlXk58lLiHlY51KOd+ZsKqyTKGdNka1jxUo23RmBC0k+CwJVCGb1NqGvB3V0wbiupWc7Tcjo+jnI9g6LQsP5yyq3jA28T/bNhcx+nDqY7jg6XdkDcakmHQb1APIaspGyGwBC5YIGNbE7kf9Av4seReu6z6GH319CBjvhM1SLcCSwImSZ1ttCQBKem53AewIxJzKkixkMxPOUO0aTmnooB3UDp+H2MFtdjn1ijQSmxU2k7l5jNsgpf1R8/Z491XmiUt17mDQKz5tvMa7Z7l48ihrsoxW6M+qAymqCVCCyu1oOCj2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nbhvWI6F; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nbhvWI6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxvdW4W4jz2xdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 08:41:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD66160018;
	Thu, 22 Jan 2026 21:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482E1C116C6;
	Thu, 22 Jan 2026 21:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769118076;
	bh=o3gdWNkDSd9Vm/DMgr4/ykIAOvt43+NsJA/Imw15e/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nbhvWI6FsmrV2v6DkoSqN8213V2yIRhOd6eP75LypoUaN54UBoDiDxVp1akq7FG3f
	 CVLIelPV0CkF4x7Juc3HDczRCXMl0AOZY4EUYaiK0pNhQfi7cbwzUhOkV6AnNppJ9U
	 SqiE6hXL+nm2nlnc5o4hmp73evXdLpeOeMX2qi64=
Date: Thu, 22 Jan 2026 13:41:14 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Matthew Brost
 <matthew.brost@intel.com>, Zi Yan <ziy@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Matthew Wilcox <willy@infradead.org>, Alistair Popple
 <apopple@nvidia.com>, Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, adhavan
 Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Hildenbrand <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-mm@kvack.org, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-Id: <20260122134114.a04ddf4c34a4b926d057032f@linux-foundation.org>
In-Reply-To: <626c34fc-34df-4629-baf3-fbebc9abafbb@nvidia.com>
References: <eb94d115-18a6-455b-b020-f18f372e283a@nvidia.com>
	<aWsdv6dX2RgqajFQ@lstrano-desk.jf.intel.com>
	<4k72r4n5poss2glrof5fsapczkpcrnpokposeikw5wjvtodbto@wpqsxoxzpvy6>
	<20260119142019.GG1134360@nvidia.com>
	<96926697-070C-45DE-AD26-559652625859@nvidia.com>
	<20260119203551.GQ1134360@nvidia.com>
	<ef6ef1e2-25f1-4f1b-a8d4-98c0d7b4ad0c@nvidia.com>
	<EE2956E3-CCEA-4EF9-A1A4-A483245091FC@nvidia.com>
	<20260120135340.GA1134360@nvidia.com>
	<F7E3DF24-A37B-40A0-A507-CEF4AB76C44D@nvidia.com>
	<aXHPkQfwhMHU/oP6@lstrano-desk.jf.intel.com>
	<9077ab5b-f2c8-4c8d-8441-631e7c2cf384@suse.cz>
	<626c34fc-34df-4629-baf3-fbebc9abafbb@nvidia.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:balbirs@nvidia.com,m:vbabka@suse.cz,m:matthew.brost@intel.com,m:ziy@nvidia.com,m:jgg@nvidia.com,m:willy@infradead.org,m:apopple@nvidia.com,m:francois.dugast@intel.com,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lyude@redhat.com,m:dakr@kernel.org,m:david@kernel.org,m:osalvador@suse.de,m:leon@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:nouveau@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-cxl@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16171-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[39];
	DMARC_NA(0.00)[linux-foundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[suse.cz,intel.com,nvidia.com,infradead.org,lists.freedesktop.org,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nvidia.com:email,amd.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 697DC6DDF5
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 20:10:44 +1100 Balbir Singh <balbirs@nvidia.com> wrote:

> >> - Intel has demonstrated that this works and is still getting blocked.
> >>
> >> - This entire thread is about a fixes patch for large device pages.
> >>   Changing prep_compound_page is completely out of scope for a fixes
> >>   patch, and honestly so is most of the rest of what’s being proposed.
> > 
> > FWIW I'm ok if this lands as a fix patch, and perceived the discussion to be
> > about how refactor things more properly afterwards, going forward.
> > 
> 
> I've said the same thing and I concur, we can use the patch as-is and
> change this to set the relevant identified fields after 6.19

So the plan is to add this patch to 6.19-rc and take another look at
patches [2-5] during next -rc cycle?

I think the plan is to take Matthew's work via the DRM tree?  But if people
want me to patchbunny this fix then please lmk.

I presently have

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Balbir Singh <balbirs@nvidia.com>

If people wish to add to this then please do so.

I'll restore this patch into mm.git's hotfix branch (and hence
linux-next) because testing.

