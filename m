Return-Path: <linuxppc-dev+bounces-3723-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A399E1D9C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 14:32:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2hQz6Q43z304f;
	Wed,  4 Dec 2024 00:32:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733232747;
	cv=none; b=LspocY/fxsCTBCmWzrGDKf5eupZS16wg8XJ9iFuj9JGCFKdh+hJxfbMW4gCH0TKcoMOJznAP6ifevPAyZYYK+U66buU7kihZZpN/K84Ia65EbfOFKBEmC69fPvZMl8gMauOav3VAthWR5n73E0a7kVeMOceAUAfbfTSeACNnOcT6qDrFnsgtXxmGeTL14NVA1AqBKVsN8XRK3x+Uhet0dEmMRb3SJmjVXzdQtM6Kmu0IXaTbuUh6gHJZHCnOVOuS4bvw3E+++hwaUgxaJgDuF0iwdUIDTMJzDsE+WSPhsrAdLKCVH+wz+jNldyBmYZAD7zHMKCJCDXfkGw/pmwgwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733232747; c=relaxed/relaxed;
	bh=vYzXnKehfIU28laXyz2nR7XnSwW3vsPBzROaW+SYIBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVRf2edtG8kaQpfY9KMNgZ84Wh4TdeY6OArQKZZS500+PcgMBCVHiCdjZbcG1ZbW0jBrTflQPQeqeLmoBYw0WqyGIymc0W6Zir0/srHFCDYXbEY6T2Jkk4vrlqJNm2FpHCA1X9q7TEseXPOfsB59p3CQwhfRutWWTvEQA6x7hc7pfmyI7zzVjp/PFc9/CM7Z1QUiLnkWNt1SL0pCvQN3gEq/DtdNdS5kVjzUmHTtZyIjTlHT+tDk0QhOLnEGI0FMkF652cM+bKxx9wODkXoiiK5eF9wO45Yy6hRIAjD68DZkwWjHOcLVTUN6w7maLB+Ezra4FnOFG+tGIrynNbfy1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bplN164b; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FxuL+eFG; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bplN164b; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FxuL+eFG; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bplN164b;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FxuL+eFG;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=bplN164b;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FxuL+eFG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 77 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 00:32:26 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2hQy1m66z301T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 00:32:25 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C7E7321166;
	Tue,  3 Dec 2024 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733232742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYzXnKehfIU28laXyz2nR7XnSwW3vsPBzROaW+SYIBc=;
	b=bplN164bETmPHUoP7iZoA7j7T9mHRv5HmEb5svi0BDFjTkU9OcN0oD6JRSqmb/L2Tp9Qoh
	uNFyiWBDTKyOVMlgulztv6g9GHRgwGcWc5NgbNHd28WpX17dD0hNZE3xVFDVk1tz8Wjqy/
	408HCAqEnwgrDJliHvxeXyUFD5TLuiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733232742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYzXnKehfIU28laXyz2nR7XnSwW3vsPBzROaW+SYIBc=;
	b=FxuL+eFGyuocRThHTIynUeDZ91aSObypXM/NXnS7RDrL6njMYMPZCEm+haqm/irT04ZCFw
	zCFoyXpXKHp4/XDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733232742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYzXnKehfIU28laXyz2nR7XnSwW3vsPBzROaW+SYIBc=;
	b=bplN164bETmPHUoP7iZoA7j7T9mHRv5HmEb5svi0BDFjTkU9OcN0oD6JRSqmb/L2Tp9Qoh
	uNFyiWBDTKyOVMlgulztv6g9GHRgwGcWc5NgbNHd28WpX17dD0hNZE3xVFDVk1tz8Wjqy/
	408HCAqEnwgrDJliHvxeXyUFD5TLuiI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733232742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYzXnKehfIU28laXyz2nR7XnSwW3vsPBzROaW+SYIBc=;
	b=FxuL+eFGyuocRThHTIynUeDZ91aSObypXM/NXnS7RDrL6njMYMPZCEm+haqm/irT04ZCFw
	zCFoyXpXKHp4/XDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC1D213A15;
	Tue,  3 Dec 2024 13:32:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Y+J5KWYIT2d+IQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Dec 2024 13:32:22 +0000
Message-ID: <48096e18-6e68-4844-904d-ada10e071f46@suse.cz>
Date: Tue, 3 Dec 2024 14:32:22 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 2/6] mm/page_isolation: don't pass gfp flags to
 start_isolate_page_range()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-3-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20241203094732.200195-3-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.987];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,linux-foundation.org,suse.de,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 10:47, David Hildenbrand wrote:
> The parameter is unused, so let's stop passing it.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>


