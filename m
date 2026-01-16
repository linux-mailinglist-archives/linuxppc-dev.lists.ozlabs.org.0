Return-Path: <linuxppc-dev+bounces-15915-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D27D336A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 17:13:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt4fX54R2z2xnj;
	Sat, 17 Jan 2026 03:13:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768580036;
	cv=none; b=Sd7LWQS/pBS1HVJ2/OH7DkKUWMGxwsyxnp+K05lSp/a9CnA7a/qf/4EESEb6PJEerKXRX4/cXmwv+tmhe5nY/921pO3D0qj5rPIcqQDgoOUJMi1uOddn5+ue4IBnPSLCLY0xVl8td1mBU7olxHck4Bm53dNknF9uVZkTogLPXrQPjR1l2dqu193X8/9V7rN5ygFtA7w1wonNcxQP4yy4td77mspfCVsL1HD2wQ9grqIOZtDAMwqB15/cqK0VK705U6s4nfs2NNySsEhktQ94mWnjAeo58T/4k5zeaIasoRcKO1VM7+6Z3lNLAZIQn9EPHoOCL/JMswtd/bHGEY+iEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768580036; c=relaxed/relaxed;
	bh=Eu7FGbt83JuqaI2GZ8CBZNSB/GJc1ePvSsMg2SYrNlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k77GTPR2Ox9DnGuQm5dVQMgO3MiE+b/XjdeMCe68sHiAtA8VbzRzQmoVC6khHLFxV2SUNfPyprx9g6xEe8MR3t/e0xZDEYwk6ptEhQIm8MSBHw2livwnNoAsqnJ4Pv1FON6ZpBl5NyuEukrI1F0QpDgy8UKUkg2lswOrVLhcPj4lg7CyNZ4FYltefJnh8JmaD6/ZVFT4HyWVwPLsBi8ecR8fJi1XWlRkQeW5ExrHxSAG55s4CfyVwCpPlGJNEK435Fx1PzaUDSIkT2QBwOiPYn7aEOXDpSrYpaOTjlvNPWMKIGSuj2MCU75C3rXsFgRMhAH3YnVkRa78gMcZP98YqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Tp+SnuvD; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7zohlGHJ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Tp+SnuvD; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7zohlGHJ; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Tp+SnuvD;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7zohlGHJ;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Tp+SnuvD;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7zohlGHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt4fW0n9Zz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 03:13:54 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7589633712;
	Fri, 16 Jan 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768580031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Eu7FGbt83JuqaI2GZ8CBZNSB/GJc1ePvSsMg2SYrNlU=;
	b=Tp+SnuvD9xXh8oJXbqxfnya/oVrooIOCFcCbOfDYJVeO2lFxYHkfit5YzIRgLUJiYYIuQ2
	VlW9z9ttkBCrHLgWERJfnL7g+485BZ2OA1t4qWsrZlojqRAnBIZeW/IxIY5ZeHkcM2/5Te
	b0NIDdvCikKhU+llQucfIawjlv2HLXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768580031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Eu7FGbt83JuqaI2GZ8CBZNSB/GJc1ePvSsMg2SYrNlU=;
	b=7zohlGHJReZ+IEVybf5dEbx4LSoFHdBs6KIlmdg5N2JsjT7zT2hYT6lrgCWZgW/Tctwu+x
	PD1WGLY5hhxZodCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768580031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Eu7FGbt83JuqaI2GZ8CBZNSB/GJc1ePvSsMg2SYrNlU=;
	b=Tp+SnuvD9xXh8oJXbqxfnya/oVrooIOCFcCbOfDYJVeO2lFxYHkfit5YzIRgLUJiYYIuQ2
	VlW9z9ttkBCrHLgWERJfnL7g+485BZ2OA1t4qWsrZlojqRAnBIZeW/IxIY5ZeHkcM2/5Te
	b0NIDdvCikKhU+llQucfIawjlv2HLXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768580031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Eu7FGbt83JuqaI2GZ8CBZNSB/GJc1ePvSsMg2SYrNlU=;
	b=7zohlGHJReZ+IEVybf5dEbx4LSoFHdBs6KIlmdg5N2JsjT7zT2hYT6lrgCWZgW/Tctwu+x
	PD1WGLY5hhxZodCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 352233EA63;
	Fri, 16 Jan 2026 16:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G+EfC79jammyVQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Fri, 16 Jan 2026 16:13:51 +0000
Message-ID: <c034a80b-1fb5-4e20-b9d8-6f079cdc1d09@suse.cz>
Date: Fri, 16 Jan 2026 17:13:50 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zi Yan <ziy@nvidia.com>, adhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Balbir Singh <balbirs@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, linux-cxl@vger.kernel.org
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-2-francois.dugast@intel.com>
 <6spceodgfobizdaziju4yvvfydwvvik2wjyoyfuglozq533rgl@vmkotau3m3kw>
 <aWiBy3nZ4FrPYURF@lstrano-desk.jf.intel.com>
 <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 xsFNBFZdmxYBEADsw/SiUSjB0dM+vSh95UkgcHjzEVBlby/Fg+g42O7LAEkCYXi/vvq31JTB
 KxRWDHX0R2tgpFDXHnzZcQywawu8eSq0LxzxFNYMvtB7sV1pxYwej2qx9B75qW2plBs+7+YB
 87tMFA+u+L4Z5xAzIimfLD5EKC56kJ1CsXlM8S/LHcmdD9Ctkn3trYDNnat0eoAcfPIP2OZ+
 9oe9IF/R28zmh0ifLXyJQQz5ofdj4bPf8ecEW0rhcqHfTD8k4yK0xxt3xW+6Exqp9n9bydiy
 tcSAw/TahjW6yrA+6JhSBv1v2tIm+itQc073zjSX8OFL51qQVzRFr7H2UQG33lw2QrvHRXqD
 Ot7ViKam7v0Ho9wEWiQOOZlHItOOXFphWb2yq3nzrKe45oWoSgkxKb97MVsQ+q2SYjJRBBH4
 8qKhphADYxkIP6yut/eaj9ImvRUZZRi0DTc8xfnvHGTjKbJzC2xpFcY0DQbZzuwsIZ8OPJCc
 LM4S7mT25NE5kUTG/TKQCk922vRdGVMoLA7dIQrgXnRXtyT61sg8PG4wcfOnuWf8577aXP1x
 6mzw3/jh3F+oSBHb/GcLC7mvWreJifUL2gEdssGfXhGWBo6zLS3qhgtwjay0Jl+kza1lo+Cv
 BB2T79D4WGdDuVa4eOrQ02TxqGN7G0Biz5ZLRSFzQSQwLn8fbwARAQABzSBWbGFzdGltaWwg
 QmFia2EgPHZiYWJrYUBzdXNlLmN6PsLBlAQTAQoAPgIbAwULCQgHAwUVCgkICwUWAgMBAAIe
 AQIXgBYhBKlA1DSZLC6OmRA9UCJPp+fMgqZkBQJnyBr8BQka0IFQAAoJECJPp+fMgqZkqmMQ
 AIbGN95ptUMUvo6aAdhxaOCHXp1DfIBuIOK/zpx8ylY4pOwu3GRe4dQ8u4XS9gaZ96Gj4bC+
 jwWcSmn+TjtKW3rH1dRKopvC07tSJIGGVyw7ieV/5cbFffA8NL0ILowzVg8w1ipnz1VTkWDr
 2zcfslxJsJ6vhXw5/npcY0ldeC1E8f6UUoa4eyoskd70vO0wOAoGd02ZkJoox3F5ODM0kjHu
 Y97VLOa3GG66lh+ZEelVZEujHfKceCw9G3PMvEzyLFbXvSOigZQMdKzQ8D/OChwqig8wFBmV
 QCPS4yDdmZP3oeDHRjJ9jvMUKoYODiNKsl2F+xXwyRM2qoKRqFlhCn4usVd1+wmv9iLV8nPs
 2Db1ZIa49fJet3Sk3PN4bV1rAPuWvtbuTBN39Q/6MgkLTYHb84HyFKw14Rqe5YorrBLbF3rl
 M51Dpf6Egu1yTJDHCTEwePWug4XI11FT8lK0LNnHNpbhTCYRjX73iWOnFraJNcURld1jL1nV
 r/LRD+/e2gNtSTPK0Qkon6HcOBZnxRoqtazTU6YQRmGlT0v+rukj/cn5sToYibWLn+RoV1CE
 Qj6tApOiHBkpEsCzHGu+iDQ1WT0Idtdynst738f/uCeCMkdRu4WMZjteQaqvARFwCy3P/jpK
 uvzMtves5HvZw33ZwOtMCgbpce00DaET4y/UzsBNBFsZNTUBCACfQfpSsWJZyi+SHoRdVyX5
 J6rI7okc4+b571a7RXD5UhS9dlVRVVAtrU9ANSLqPTQKGVxHrqD39XSw8hxK61pw8p90pg4G
 /N3iuWEvyt+t0SxDDkClnGsDyRhlUyEWYFEoBrrCizbmahOUwqkJbNMfzj5Y7n7OIJOxNRkB
 IBOjPdF26dMP69BwePQao1M8Acrrex9sAHYjQGyVmReRjVEtv9iG4DoTsnIR3amKVk6si4Ea
 X/mrapJqSCcBUVYUFH8M7bsm4CSxier5ofy8jTEa/CfvkqpKThTMCQPNZKY7hke5qEq1CBk2
 wxhX48ZrJEFf1v3NuV3OimgsF2odzieNABEBAAHCwXwEGAEKACYCGwwWIQSpQNQ0mSwujpkQ
 PVAiT6fnzIKmZAUCZ8gcVAUJFhTonwAKCRAiT6fnzIKmZLY8D/9uo3Ut9yi2YCuASWxr7QQZ
 lJCViArjymbxYB5NdOeC50/0gnhK4pgdHlE2MdwF6o34x7TPFGpjNFvycZqccSQPJ/gibwNA
 zx3q9vJT4Vw+YbiyS53iSBLXMweeVV1Jd9IjAoL+EqB0cbxoFXvnjkvP1foiiF5r73jCd4PR
 rD+GoX5BZ7AZmFYmuJYBm28STM2NA6LhT0X+2su16f/HtummENKcMwom0hNu3MBNPUOrujtW
 khQrWcJNAAsy4yMoJ2Lw51T/5X5Hc7jQ9da9fyqu+phqlVtn70qpPvgWy4HRhr25fCAEXZDp
 xG4RNmTm+pqorHOqhBkI7wA7P/nyPo7ZEc3L+ZkQ37u0nlOyrjbNUniPGxPxv1imVq8IyycG
 AN5FaFxtiELK22gvudghLJaDiRBhn8/AhXc642/Z/yIpizE2xG4KU4AXzb6C+o7LX/WmmsWP
 Ly6jamSg6tvrdo4/e87lUedEqCtrp2o1xpn5zongf6cQkaLZKQcBQnPmgHO5OG8+50u88D9I
 rywqgzTUhHFKKF6/9L/lYtrNcHU8Z6Y4Ju/MLUiNYkmtrGIMnkjKCiRqlRrZE/v5YFHbayRD
 dJKXobXTtCBYpLJM4ZYRpGZXne/FAtWNe4KbNJJqxMvrTOrnIatPj8NhBVI0RSJRsbilh6TE
 m6M14QORSWTLRg==
In-Reply-To: <aWiGtlKI3LOtjUl6@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[intel.com,lists.freedesktop.org,nvidia.com,linux.ibm.com,gmail.com,ellerman.id.au,kernel.org,amd.com,ffwll.ch,linux.intel.com,suse.de,redhat.com,linux-foundation.org,ziepe.ca,oracle.com,google.com,suse.com,lists.ozlabs.org,vger.kernel.org,kvack.org];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLzhxcfrrwnfnqtbioy5kgo5ee)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.com:email,oracle.com:email,suse.cz:mid,suse.cz:email]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/15/26 07:18, Matthew Brost wrote:
> On Wed, Jan 14, 2026 at 09:57:31PM -0800, Matthew Brost wrote:
>> On Thu, Jan 15, 2026 at 04:27:26PM +1100, Alistair Popple wrote:
>> > On 2026-01-15 at 06:19 +1100, Francois Dugast <francois.dugast@intel.com> wrote...
>> > > From: Matthew Brost <matthew.brost@intel.com>
>> > > 
>> > > Reinitialize metadata for large zone device private folios in
>> > > zone_device_page_init prior to creating a higher-order zone device
>> > > private folio. This step is necessary when the folio’s order changes
>> > > dynamically between zone_device_page_init calls to avoid building a
>> > > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
>> > > must be passed in from the caller because the pgmap stored in the folio
>> > > page may have been overwritten with a compound head.
>> > 
>> > Thanks for fixing, a couple of minor comments below.
>> > 
>> > > Cc: Zi Yan <ziy@nvidia.com>
>> > > Cc: Alistair Popple <apopple@nvidia.com>
>> > > Cc: adhavan Srinivasan <maddy@linux.ibm.com>
>> > > Cc: Nicholas Piggin <npiggin@gmail.com>
>> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
>> > > Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
>> > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> > > Cc: Alex Deucher <alexander.deucher@amd.com>
>> > > Cc: "Christian König" <christian.koenig@amd.com>
>> > > Cc: David Airlie <airlied@gmail.com>
>> > > Cc: Simona Vetter <simona@ffwll.ch>
>> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > > Cc: Maxime Ripard <mripard@kernel.org>
>> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> > > Cc: Lyude Paul <lyude@redhat.com>
>> > > Cc: Danilo Krummrich <dakr@kernel.org>
>> > > Cc: David Hildenbrand <david@kernel.org>
>> > > Cc: Oscar Salvador <osalvador@suse.de>
>> > > Cc: Andrew Morton <akpm@linux-foundation.org>
>> > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> > > Cc: Leon Romanovsky <leon@kernel.org>
>> > > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> > > Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
>> > > Cc: Vlastimil Babka <vbabka@suse.cz>
>> > > Cc: Mike Rapoport <rppt@kernel.org>
>> > > Cc: Suren Baghdasaryan <surenb@google.com>
>> > > Cc: Michal Hocko <mhocko@suse.com>
>> > > Cc: Balbir Singh <balbirs@nvidia.com>
>> > > Cc: linuxppc-dev@lists.ozlabs.org
>> > > Cc: kvm@vger.kernel.org
>> > > Cc: linux-kernel@vger.kernel.org
>> > > Cc: amd-gfx@lists.freedesktop.org
>> > > Cc: dri-devel@lists.freedesktop.org
>> > > Cc: nouveau@lists.freedesktop.org
>> > > Cc: linux-mm@kvack.org
>> > > Cc: linux-cxl@vger.kernel.org
>> > > Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
>> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> > > ---
>> > >  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>> > >  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>> > >  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>> > >  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>> > >  include/linux/memremap.h                 |  9 ++++++---
>> > >  lib/test_hmm.c                           |  4 +++-
>> > >  mm/memremap.c                            | 20 +++++++++++++++++++-
>> > >  7 files changed, 32 insertions(+), 9 deletions(-)
>> > > 
>> > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> > > index e5000bef90f2..7cf9310de0ec 100644
>> > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> > > @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>> > >  
>> > >  	dpage = pfn_to_page(uvmem_pfn);
>> > >  	dpage->zone_device_data = pvt;
>> > > -	zone_device_page_init(dpage, 0);
>> > > +	zone_device_page_init(dpage, &kvmppc_uvmem_pgmap, 0);
>> > >  	return dpage;
>> > >  out_clear:
>> > >  	spin_lock(&kvmppc_uvmem_bitmap_lock);
>> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> > > index af53e796ea1b..6ada7b4af7c6 100644
>> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>> > > @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>> > >  	page = pfn_to_page(pfn);
>> > >  	svm_range_bo_ref(prange->svm_bo);
>> > >  	page->zone_device_data = prange->svm_bo;
>> > > -	zone_device_page_init(page, 0);
>> > > +	zone_device_page_init(page, page_pgmap(page), 0);
>> > >  }
>> > >  
>> > >  static void
>> > > diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
>> > > index 03ee39a761a4..c497726b0147 100644
>> > > --- a/drivers/gpu/drm/drm_pagemap.c
>> > > +++ b/drivers/gpu/drm/drm_pagemap.c
>> > > @@ -201,7 +201,7 @@ static void drm_pagemap_get_devmem_page(struct page *page,
>> > >  					struct drm_pagemap_zdd *zdd)
>> > >  {
>> > >  	page->zone_device_data = drm_pagemap_zdd_get(zdd);
>> > > -	zone_device_page_init(page, 0);
>> > > +	zone_device_page_init(page, zdd->dpagemap->pagemap, 0);
>> > >  }
>> > >  
>> > >  /**
>> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> > > index 58071652679d..3d8031296eed 100644
>> > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> > > @@ -425,7 +425,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
>> > >  			order = ilog2(DMEM_CHUNK_NPAGES);
>> > >  	}
>> > >  
>> > > -	zone_device_folio_init(folio, order);
>> > > +	zone_device_folio_init(folio, page_pgmap(folio_page(folio, 0)), order);
>> > >  	return page;
>> > >  }
>> > >  
>> > > diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> > > index 713ec0435b48..e3c2ccf872a8 100644
>> > > --- a/include/linux/memremap.h
>> > > +++ b/include/linux/memremap.h
>> > > @@ -224,7 +224,8 @@ static inline bool is_fsdax_page(const struct page *page)
>> > >  }
>> > >  
>> > >  #ifdef CONFIG_ZONE_DEVICE
>> > > -void zone_device_page_init(struct page *page, unsigned int order);
>> > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>> > > +			   unsigned int order);
>> > >  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>> > >  void memunmap_pages(struct dev_pagemap *pgmap);
>> > >  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> > > @@ -234,9 +235,11 @@ bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>> > >  
>> > >  unsigned long memremap_compat_align(void);
>> > >  
>> > > -static inline void zone_device_folio_init(struct folio *folio, unsigned int order)
>> > > +static inline void zone_device_folio_init(struct folio *folio,
>> > > +					  struct dev_pagemap *pgmap,
>> > > +					  unsigned int order)
>> > >  {
>> > > -	zone_device_page_init(&folio->page, order);
>> > > +	zone_device_page_init(&folio->page, pgmap, order);
>> > >  	if (order)
>> > >  		folio_set_large_rmappable(folio);
>> > >  }
>> > > diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> > > index 8af169d3873a..455a6862ae50 100644
>> > > --- a/lib/test_hmm.c
>> > > +++ b/lib/test_hmm.c
>> > > @@ -662,7 +662,9 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror *dmirror,
>> > >  			goto error;
>> > >  	}
>> > >  
>> > > -	zone_device_folio_init(page_folio(dpage), order);
>> > > +	zone_device_folio_init(page_folio(dpage),
>> > > +			       page_pgmap(folio_page(page_folio(dpage), 0)),
>> > > +			       order);
>> > >  	dpage->zone_device_data = rpage;
>> > >  	return dpage;
>> > >  
>> > > diff --git a/mm/memremap.c b/mm/memremap.c
>> > > index 63c6ab4fdf08..6f46ab14662b 100644
>> > > --- a/mm/memremap.c
>> > > +++ b/mm/memremap.c
>> > > @@ -477,10 +477,28 @@ void free_zone_device_folio(struct folio *folio)
>> > >  	}
>> > >  }
>> > >  
>> > > -void zone_device_page_init(struct page *page, unsigned int order)
>> > > +void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>> > > +			   unsigned int order)
>> > >  {
>> > > +	struct page *new_page = page;
>> > > +	unsigned int i;
>> > > +
>> > >  	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>> > >  
>> > > +	for (i = 0; i < (1UL << order); ++i, ++new_page) {
>> > > +		struct folio *new_folio = (struct folio *)new_page;
>> > > +
>> > > +		new_page->flags.f &= ~0xffUL;	/* Clear possible order, page head */
>> > 
>> > This seems odd to me, mainly due to the "magic" number. Why not just clear
>> > the flags entirely? Or at least explicitly just clear the flags you care about
>> > which would remove the need for the comment and  should let you use the proper
>> > PageFlag functions.
>> > 
>> 
>> I'm copying this from folio_reset_order [1]. My paranoia about touching
>> anything related to struct page is high, so I did the same thing
>> folio_reset_order does here.
>> 
>> [1] https://elixir.bootlin.com/linux/v6.18.5/source/include/linux/mm.h#L1075
>> 
> 
> This immediately hangs my first SVM test...
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 6f46ab14662b..ef8c56876cf5 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -488,7 +488,7 @@ void zone_device_page_init(struct page *page, struct dev_pagemap *pgmap,
>         for (i = 0; i < (1UL << order); ++i, ++new_page) {
>                 struct folio *new_folio = (struct folio *)new_page;
> 
> -               new_page->flags.f &= ~0xffUL;   /* Clear possible order, page head */
> +               new_page->flags.f = 0;
>  #ifdef NR_PAGES_IN_LARGE_FOLIO
>                 ((struct folio *)(new_page - 1))->_nr_pages = 0;
>  #endif

the flags field includes also zone and node id, so clearing that will break
the pages's node+zone association, that's probably why...


