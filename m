Return-Path: <linuxppc-dev+bounces-3733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C99E231A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 16:32:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2l5N5mF5z2yyT;
	Wed,  4 Dec 2024 02:32:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733239944;
	cv=none; b=N/tlNxsqPgL7s5Y9wVNWryM7zICBjY5NjzkckzTrh2omFuIMTqc+SYRNp6E3uRLtHWSL9UXKjPog5dFkAF5Eg+jdzZjBMFUDigXCFzERm/EuCBpnw6yJu7Q8gq6gvm5HQCNnrlRVL+7VYk9dtGQdsX4a3/7m7ss1gmTqhUMqZRZ9bb9uv+PEhqEDUta4hCHqH1FIv4R5WfK8b22RHcoBzzDzWdZXx75x1bXqzcCdMbxeth3ZWNJZquQcwmulP8kd1lfAr7zwUDBKwUdze1CvKIMkEzapLSvwmDtvuhvfsbyEvcYUAcocBtffdTteIABCy1Q/hwPR6ZrpIkCP9S0b0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733239944; c=relaxed/relaxed;
	bh=sQEPANKUT0cfADuBgnXFUugp30DVlgxMGy/pm9+LgAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1coWt079c68Y4+D9Kcgvgck67Xp/N80eoI09vnff+nI4W+s4/n5s2UwsYd0uti4oGzUTqX6gFBC9MeQQ3VYIz8w95AFI91uE19wZAsKlZssdPemibEfy+kVxfWAp2Avfl78nUmoNw0gOqYkJ7ogxvQNFlSFiDlS3a7SYZVkQlJyUDx0lB7CRBPp6T+otPJAXaYkYn7svM5bKFuS93R5hKsJP1acTGGpf+AvXAo3lLH4IguattZmF49JMcOf8mXg2f/BeOd9VB3cH5JALNeDKICegCMrztF9rFEuASr39oWXU7brA/o4L5neDgxA2hJnbmx+mdPmxVE7jQJqWUhICQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TOvI03bd; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CPfMiSxv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TOvI03bd; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CPfMiSxv; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TOvI03bd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CPfMiSxv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TOvI03bd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CPfMiSxv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 82 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 02:32:21 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2l5K3lH1z2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 02:32:21 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DB6D81F44F;
	Tue,  3 Dec 2024 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733239938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQEPANKUT0cfADuBgnXFUugp30DVlgxMGy/pm9+LgAM=;
	b=TOvI03bdyxJ4Lq3UN+Mk8rfoTSUlMXsX6spi+bN2NZG18Uz2WAj7xFxHX914XqkK48k0Bz
	4+WeV/5mmYtMavM0eeCb4WRy2HQ3yJxnxL65kpk0eNzgD2W/sCgTOIRvTcqLEYSpfvBbxg
	rgVWmZOjEhGAEzhDZAS8INMZmJgVcMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733239938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQEPANKUT0cfADuBgnXFUugp30DVlgxMGy/pm9+LgAM=;
	b=CPfMiSxvT5UIg8zMYu1DkDeI14ZiNXUF4pziyMwb5mLyoV3Q2bG3pLVeIdoPpoGVD0vZ/4
	2510+XqdSMJJPHDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1733239938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQEPANKUT0cfADuBgnXFUugp30DVlgxMGy/pm9+LgAM=;
	b=TOvI03bdyxJ4Lq3UN+Mk8rfoTSUlMXsX6spi+bN2NZG18Uz2WAj7xFxHX914XqkK48k0Bz
	4+WeV/5mmYtMavM0eeCb4WRy2HQ3yJxnxL65kpk0eNzgD2W/sCgTOIRvTcqLEYSpfvBbxg
	rgVWmZOjEhGAEzhDZAS8INMZmJgVcMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1733239938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sQEPANKUT0cfADuBgnXFUugp30DVlgxMGy/pm9+LgAM=;
	b=CPfMiSxvT5UIg8zMYu1DkDeI14ZiNXUF4pziyMwb5mLyoV3Q2bG3pLVeIdoPpoGVD0vZ/4
	2510+XqdSMJJPHDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3ACD113A15;
	Tue,  3 Dec 2024 15:32:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5v9oC4IkT2dZSQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 03 Dec 2024 15:32:18 +0000
Date: Tue, 3 Dec 2024 16:32:12 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v2 2/6] mm/page_isolation: don't pass gfp flags to
 start_isolate_page_range()
Message-ID: <Z08kfBOXMiu7FFXN@localhost.localdomain>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-3-david@redhat.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203094732.200195-3-david@redhat.com>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.ozlabs.org,linux-foundation.org,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,nvidia.com:email]
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 03, 2024 at 10:47:28AM +0100, David Hildenbrand wrote:
> The parameter is unused, so let's stop passing it.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

