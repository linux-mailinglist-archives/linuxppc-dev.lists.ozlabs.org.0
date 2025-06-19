Return-Path: <linuxppc-dev+bounces-9550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF6AE0508
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 14:07:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNK936kBHz30V7;
	Thu, 19 Jun 2025 22:07:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750334823;
	cv=none; b=fV3wvhgsMaRw5FhUfGAL49L+YkECRRzyUjDUEYCXV8/lTAagXSSTmX2MwPaZTsx/Nx8eb/k4TplJ4Y2C8O9+AJqRFrw+o/SKwxkqISzFUCDggZY/dz/L0XTa/tVhK9v1i8KjakMv6seLKdaExX9sf9XeDUvo9uwwSwQu3XgvCz4InF823r8nnk4VR0DxPiCtMDFCYg3XYzVVna62+fc836qeG/qLcLy5Li3fC8LZtfkNCe9zOsDqz/x2CKYM4UKDafn6h8PVANVcuz1SVoiR88CGJ3KdZuQxUEORzmbTH+R0K7IeaSytJfjGRe9Zh8f8DhsYkgbOZWECTiYn2jZItw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750334823; c=relaxed/relaxed;
	bh=KDAuEsNXKXygaILSEXeEMNcT2WMigGIcctwMV7a0cE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kx35VrdPllAbgnJP0a2WbibiP+vkdagB6QaVkYJ3U/1RBllTpZ9CVt7WcmX1GrPqmy/pkh3s0p8YBRsalU48RARoEMj/juyL0BWET0J28kt6AfGEothkvMSThfxqRBQMUI4VGsJEy8orvKReOQGFfXwShgrH2qMaE03unvswh36AK5vtIR5e26jr4C/qDX9I/8Zq7tuV3MoSSPu3oqV0Opsor00qRS1czCfXVj/nKLpKuY1WFzPUHwi80MnFZhLQRLPxTvlcL3+ORtewoxwS5Ezg0KMgULfJHDpZ7PFwU/iEx4T/uq1LYP2T2FRek2I58/KcDrpWzW1f+dQrFfFUCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zqPcFbLf; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jEwdsj8r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zqPcFbLf; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jEwdsj8r; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zqPcFbLf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jEwdsj8r;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zqPcFbLf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jEwdsj8r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNK914WJBz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 22:07:01 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9CA91F38D;
	Thu, 19 Jun 2025 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750334815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDAuEsNXKXygaILSEXeEMNcT2WMigGIcctwMV7a0cE8=;
	b=zqPcFbLfpUQLjy+Nw4cOX/B2LiApdKR7t9DEm9m3vLLybWpiWlFBWTl6QNGFMMJe81DLE6
	1uGk7SLFk0EUnA6QiPQBz3Kv/z1D/ZNALQXlfFywd0PzUqn46btyJOJmbpixQ6uQ0pR4Mz
	lMMpI0foMRv6N403hLovr2WkJq9iRKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750334815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDAuEsNXKXygaILSEXeEMNcT2WMigGIcctwMV7a0cE8=;
	b=jEwdsj8rqU+sAaEm1rAhYOm4nratZdmqMyGOXNSbv1Zh1lQm/lkFeChFWsq3xyo2+/dtFQ
	eI1mhCTdCBSEvaDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750334815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDAuEsNXKXygaILSEXeEMNcT2WMigGIcctwMV7a0cE8=;
	b=zqPcFbLfpUQLjy+Nw4cOX/B2LiApdKR7t9DEm9m3vLLybWpiWlFBWTl6QNGFMMJe81DLE6
	1uGk7SLFk0EUnA6QiPQBz3Kv/z1D/ZNALQXlfFywd0PzUqn46btyJOJmbpixQ6uQ0pR4Mz
	lMMpI0foMRv6N403hLovr2WkJq9iRKQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750334815;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KDAuEsNXKXygaILSEXeEMNcT2WMigGIcctwMV7a0cE8=;
	b=jEwdsj8rqU+sAaEm1rAhYOm4nratZdmqMyGOXNSbv1Zh1lQm/lkFeChFWsq3xyo2+/dtFQ
	eI1mhCTdCBSEvaDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB002136CC;
	Thu, 19 Jun 2025 12:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QUQhJlv9U2iXdgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 19 Jun 2025 12:06:51 +0000
Date: Thu, 19 Jun 2025 14:06:49 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: update core kernel code to use vm_flags_t
 consistently
Message-ID: <aFP9WQSn2AZbRIb4@localhost.localdomain>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[localhost.localdomain:mid,imap1.dmz-prg2.suse.org:helo,suse.de:email,oracle.com:email];
	TO_DN_SOME(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLj6zumtikrrmnnbmzkety5zmd)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,arm.com,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,davemloft.net,gaisler.com,linux.intel.com,linutronix.de,redhat.com,alien8.de,zytor.com,infradead.org,zeniv.linux.org.uk,suse.cz,nvidia.com,linux.alibaba.com,oracle.com,zte.com.cn,linux.dev,google.com,suse.com,surriel.com,intel.com,goodmis.org,efficios.com,ziepe.ca,suse.de,cmpxchg.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,kvack.org,lists.linux.dev];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[64];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,oracle.com:email]
X-Spam-Level: 
X-Spam-Score: -8.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 08:42:53PM +0100, Lorenzo Stoakes wrote:
> The core kernel code is currently very inconsistent in its use of
> vm_flags_t vs. unsigned long. This prevents us from changing the type of
> vm_flags_t in the future and is simply not correct, so correct this.
> 
> While this results in rather a lot of churn, it is a critical pre-requisite
> for a future planned change to VMA flag type.
> 
> Additionally, update VMA userland tests to account for the changes.
> 
> To make review easier and to break things into smaller parts, driver and
> architecture-specific changes is left for a subsequent commit.
> 
> The code has been adjusted to cascade the changes across all calling code
> as far as is needed.
> 
> We will adjust architecture-specific and driver code in a subsequent patch.
> 
> Overall, this patch does not introduce any functional change.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Oscar Salvador <osalvador@suse.de>

Heh, for one second I thought this was about to convert vm_fault->flags to
the actual enum fault_flag (which wouldn't be bad if you ask me, because
"unsigned int flags" is not very descriptive).

But this is quite good as well, brings in some consistency.


-- 
Oscar Salvador
SUSE Labs

