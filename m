Return-Path: <linuxppc-dev+bounces-9352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF08AD8C42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 14:37:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJf6k6sWYz30HB;
	Fri, 13 Jun 2025 22:37:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749818238;
	cv=none; b=XBoLIq1eTGoUMHkPc35CA2BTfF/H0IPAdJAs6oU8+8w477zEIusKm6uZYvKlH9LEn1Uz7ga3woG02d8KCwX0UvTI1y/fyKLHLfcmMTjcZ/RI5qQd+/UpMLLPoJvmfZPmgkY+fHUxCukaxIhLsyy3pDqmg5hI78XzwJ3e6zGZnmE2AtS/3CVtzKqYEqB83ac//76QcxgEFOnKbY0LQkYnXhlX59pmudejYhY7RzWtuLLId+Bzfh52foEj192IShnOD4+jExsTbA8MmUqf5Z+9xwWxSpVxoEZoYZ1RSnqSs8yDzs4YJ92q3UZf7A1pRr9hgnW/0trYI6x80FeC1jQI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749818238; c=relaxed/relaxed;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQcaX0FKdxEERGVguYiRRD80Dhi8uu0fhklT42vHWD5WMG8iSMwXiPTULjvrDM1N3YwhcLh83KecNBrllFbcyqtIUoIYXJIa1nhEpNlb8QsDqdnwdCTuY8JsOkchPp0xr839lJmlcbn23Rj6zGqgaZncAMBlTxFScVUSoacCJap2QHmiXRtzMmCD+wX77n4Pusx7f8ClzUFe7ynaU3DKti0eg3ahTbnSyuV3CxDf/gct6Z/MCXUf6ZU5Bhbn27jRyumGWMvSDRq5a/lzBZ2Em/lbOrxget4N8V3xK1W2g618nTZG6ZgS7qCy3YIl3TkbvkVezShSIMVtleAHypwANA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kCCrcdFT; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zQujh0/5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kCCrcdFT; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zQujh0/5; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kCCrcdFT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zQujh0/5;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kCCrcdFT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zQujh0/5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 12120 seconds by postgrey-1.37 at boromir; Fri, 13 Jun 2025 22:37:17 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJf6j63G0z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 22:37:17 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7C8E21A23;
	Fri, 13 Jun 2025 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749818234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=kCCrcdFTYqrZUYuBN/pBMasKboKwHTZiQZUKz5OXDm1VT0q6deaATpqQrUBT3MOetNInd5
	vN71hH58Klp8dYim2DqSqd0agTlZdrYbULxkGkz4/Duk25WycMr0l8PDAHhXr8zMTMAPg8
	7EsXZDZD+noCrm5n1gGR8XP5Bggz8tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749818234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=zQujh0/5m0F7qHNo6Y8TZIlFlZMoGQHLZqqAgCngNWCM5wyBLTzvSFxe87w9JxORxkjU0p
	nKm4FFKyJCrcwpAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749818234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=kCCrcdFTYqrZUYuBN/pBMasKboKwHTZiQZUKz5OXDm1VT0q6deaATpqQrUBT3MOetNInd5
	vN71hH58Klp8dYim2DqSqd0agTlZdrYbULxkGkz4/Duk25WycMr0l8PDAHhXr8zMTMAPg8
	7EsXZDZD+noCrm5n1gGR8XP5Bggz8tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749818234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ons9VlAWyS5iGbbTVkDBgSxgXbxKUV7OAg/2/YmOuTQ=;
	b=zQujh0/5m0F7qHNo6Y8TZIlFlZMoGQHLZqqAgCngNWCM5wyBLTzvSFxe87w9JxORxkjU0p
	nKm4FFKyJCrcwpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6DC6913782;
	Fri, 13 Jun 2025 12:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oI1fGXobTGj9cgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Jun 2025 12:37:14 +0000
Date: Fri, 13 Jun 2025 14:37:14 +0200
Message-ID: <87wm9frf5x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH 3/3] ALSA: pcm: Convert snd_pcm_sync_ptr() to user_access_begin/user_access_end()
In-Reply-To: <2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
References: <7baa34d4046c7750799b11830d38a46f8b581765.1749724478.git.christophe.leroy@csgroup.eu>
	<79b86a0618328ba1d0cb5cf4011fd73ac6900e8f.1749724478.git.christophe.leroy@csgroup.eu>
	<878qlwrnv1.wl-tiwai@suse.de>
	<2df61bbf-76f6-4932-a347-7820350a156e@csgroup.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 13 Jun 2025 13:03:04 +0200,
Christophe Leroy wrote:
> 
> 
> 
> Le 13/06/2025 à 11:29, Takashi Iwai a écrit :
> > On Thu, 12 Jun 2025 12:51:05 +0200,
> > Christophe Leroy wrote:
> >> 
> >> Now that snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user()
> >> are converted to user_access_begin/user_access_end(),
> >> snd_pcm_sync_ptr_get_user() is more efficient than a raw get_user()
> >> followed by a copy_from_user(). And because copy_{to/from}_user() are
> >> generic functions focussed on transfer of big data blocks to/from user,
> >> snd_pcm_sync_ptr_put_user() is also more efficient for small amont of
> >> data.
> >> 
> >> So use snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() in
> >> snd_pcm_sync_ptr() too.
> >> 
> >> In order to have snd_pcm_mmap_status32 similar to snd_pcm_mmap_status,
> >> replace to tsamp_{sec/nsec} and audio_tstamp_{sec/nsec} by equivalent
> >> struct __snd_timespec.
> >> 
> >> snd_pcm_ioctl_sync_ptr_buggy() is left as it is because the conversion
> >> wouldn't be straigh-forward do to the workaround it provides.
> >> 
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > Through a quick glance, all patches look almost fine, but one favor to
> > ask: this patch contains the convert from s32/s32 pair to struct
> > __snd_timespec.  It should be factored out to a prerequisite patch
> > instead of burying in a big change.
> 
> Shall I understand you prefer this series over the more simple "ALSA:
> pcm: Convert snd_pcm_ioctl_sync_ptr_{compat/x32} to
> user_access_begin/user_access_end()" patch ?

Err, no, sorry for ambiguity.
I wanted to move the replacement of tstamp_sec/nsec with struct
__snd_timespec as a small preliminary patch from patch#3.
That is,
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3103,11 +3103,9 @@ struct snd_pcm_mmap_status32 {
 	snd_pcm_state_t state;
 	s32 pad1;
 	u32 hw_ptr;
-	s32 tstamp_sec;
-	s32 tstamp_nsec;
+	struct __snd_timespec tstamp;
 	snd_pcm_state_t suspended_state;
-	s32 audio_tstamp_sec;
-	s32 audio_tstamp_nsec;
+	struct __snd_timespec audio_tstamp;
 } __packed;
etc.  By factoring this out, it becomes clear that the timespec
compatibility is fully cared.

__snd_timespec may be defined in different ways on user-space, but in
the kernel code, it's a single definition of s32/s32 pair.  This needs
to be emphasized.


thanks,

Takashi

