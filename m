Return-Path: <linuxppc-dev+bounces-7882-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0DA95E5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 08:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhXbr1QF7z2xd4;
	Tue, 22 Apr 2025 16:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745303864;
	cv=none; b=D3mkGNI09T364Do/UDR1Y/tuEbIMRaTxdm1WLIpSuf4Wm+inrjvdoQAiZDVOyluLlUZG6i0nsdT/0I8Aa7UgodoiC7PItUDslUbBZ8VY/Yv032z9t3xC9BcziaduosQqVZMnzwmh9fSuHgNsPmPvMxYETbBnIxR5uIzkuEnzXW39aMKF6rXZ7+dFIV/d0iZHucbQg92XnT3q09WDsrIEJF4qX+vAP3SEsTd9CO9o4tDzieA0VgEFkFQsp4FiERjPZ+3SZBa9CQ8IwuJXeAPC16wIMumjQtWcY88IPNwlrPrSzGFP0G0r/ctYA1HUnv1PB1pHcscW6t32SjMmtMgjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745303864; c=relaxed/relaxed;
	bh=znn97olydfurbU8I1YKq2FVYV1KXqvh/uxg7YALmhjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=c5kKrE7kDlAmY/IWkXxH+MAZxYSXq7rCJNovfDQ4fcp8U9B9lDRoObRgTfTUzJJPGnSpwesIskwEl+vZbyie7SYG3kvc4MIbc+gofz0nbCKRduttTqVgF8ZOmmoPVOU2M+kANUvGM7WXrO3m3glaWoJLwa1TgUKUV0hTCppN2oA8WDxTXASquKtzV1I8re4VWk0tNn5oBQRFcbEXqy/Cc5oGwNc16VJRaP5Ji8wcPT8oTe6q+8liM492AtvzU3Qb2NHceQk7u4Vhc6USKaiVCtLN8L5jnd5YtJuEEOPaOgsibloyG295cysDruCSzAVri8pQivO4gpYPrPp+ZZltpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L1Lf9Jh5; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pwh25zNM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L1Lf9Jh5; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pwh25zNM; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=hare@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L1Lf9Jh5;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pwh25zNM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L1Lf9Jh5;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pwh25zNM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=hare@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhXbn5sRrz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 16:37:41 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0739C1F7C1;
	Tue, 22 Apr 2025 06:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745303854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znn97olydfurbU8I1YKq2FVYV1KXqvh/uxg7YALmhjw=;
	b=L1Lf9Jh563HnDAlC7XT599vndMOaowWHuGPDJFDR8uDibvek38+0AVpyF6yA5DNngdcoxm
	DhKJ1NF5MQeblYDD8qKOGqGUmGumvC4asiTqZOQEAuCXRpJBb3P0u2fW0CMNY+PXNUWHOv
	cjc/ZMXxZJnDdBvNAWC9sHLwPlSSHzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745303854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znn97olydfurbU8I1YKq2FVYV1KXqvh/uxg7YALmhjw=;
	b=pwh25zNMPmBWItgOJ7j9TqCLxiKUrj8XoW79uV6QCFkwAsKweXL2G8Uj4kre3U4LRoFM1R
	QTboZsUO9OIkHWCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L1Lf9Jh5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pwh25zNM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745303854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znn97olydfurbU8I1YKq2FVYV1KXqvh/uxg7YALmhjw=;
	b=L1Lf9Jh563HnDAlC7XT599vndMOaowWHuGPDJFDR8uDibvek38+0AVpyF6yA5DNngdcoxm
	DhKJ1NF5MQeblYDD8qKOGqGUmGumvC4asiTqZOQEAuCXRpJBb3P0u2fW0CMNY+PXNUWHOv
	cjc/ZMXxZJnDdBvNAWC9sHLwPlSSHzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745303854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=znn97olydfurbU8I1YKq2FVYV1KXqvh/uxg7YALmhjw=;
	b=pwh25zNMPmBWItgOJ7j9TqCLxiKUrj8XoW79uV6QCFkwAsKweXL2G8Uj4kre3U4LRoFM1R
	QTboZsUO9OIkHWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86E30137CF;
	Tue, 22 Apr 2025 06:37:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PXesHS05B2goKwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 22 Apr 2025 06:37:33 +0000
Message-ID: <a13592e6-0259-4c12-ab6f-0e014bd62b3b@suse.de>
Date: Tue, 22 Apr 2025 08:37:32 +0200
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
Subject: Re: frozen PHB on IBM Power9 system in 6.15-rc2 (bisected)
To: =?UTF-8?Q?Dan_Hor=C3=A1k?= <dan@danny.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-nvme@lists.infradead.org, Hannes Reinecke <hare@kernel.org>
References: <20250417171026.b4474b4e2d0b528411c0e508@danny.cz>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250417171026.b4474b4e2d0b528411c0e508@danny.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0739C1F7C1
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/17/25 17:10, Dan Horák wrote:
> Hi,
> 
> I am seeing "frozen PHB" on Power9 bare-metal (PowerNV ppc64le) system
> leading to non-accessible nvme drives (they are behind a switch) in the
> 6.15-rc2 kernel (originally with kernel-6.15.0-0.rc2.22.fc43). I was
> able to bisect the issue to commit
> 62baf70c327444338c34703c71aa8cc8e4189bd6 [1].
> 
> Please see [2] for full console log and other details. Please ignore
> the "soft-lockup" messages, they are unrelated and going to be resolved
> with [3]. We are building the kernel with CONFIG_NVME_MULTIPATH=y
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=62baf70c327444338c34703c71aa8cc8e4189bd6
> [2] https://fedora.danny.cz/ppc/rdsosreport.txt
> [3] https://lore.kernel.org/all/20250410125110.1232329-1-gshan@redhat.com/
> 
Already fixed with 'nvme: fixup scan failure for non-ANA multipath
controllers', included in the latest pull request to Jens.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

