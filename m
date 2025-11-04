Return-Path: <linuxppc-dev+bounces-13758-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CFC328EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 19:11:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1Gjg5xGQz3bf8;
	Wed,  5 Nov 2025 05:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762279879;
	cv=none; b=Cs/o+1VUyIQEnwSyV3IB/BiiSHFeOPTUSw+aIzBvkEjiI/GPu6oA3fHWXnyYrNVXmZdydbhtqLIDiy8Qe7oCyrJf6A4LdPIuzwddchdtZ21CQuKt/Po2yin/VzNtg8ldH+i3MGftwsE2HfyqPxj6a//eCbPj1SMKVNkTrWYdhMAsqSORM7nIIELDAAxstoqCTlKzGpp5mQuaztRocgf9muwawVSO54su+Jgcgsy+gvNl8hlxqdj/ZvftH1+rmwMO7HZDkJI97PwIMjnqkqqaS6Nikc+EfOcRDoWfykbuQ/XeBTwTsAMm+qECLs2mF99gr5CwU2YYgp37AmuooL3SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762279879; c=relaxed/relaxed;
	bh=yvJofQ7zgV2S0QGyZ+jnZqrgNYVRXLa+r1OXEPMLaDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APxGLlMDzLIpymY05JbUf59uSgWTtCWdN2YFpjtL0PNqtxzedaDw77yfJheX7Kea7A3TuRaPsYc6wrwz/GngeMUZ99RyzW3RkXPetAhQcwhrWDEPAks0KPDLTpuJOo4vbjhZ+YIm/Q6P7j6Aqnzj1fqe1XxXypY9oDZlLn5SN2N04G3nMoZkyBXItLutK8IOd4oXgfUuCeii4EA7cNqHJJ2Vn5xurF8iZc/hEQtIEjMWvGK3SzbOXS/WdoCn3/qPp6aTVDiseJMTXG+w7pVj860eqMNV7UE4HLwxpNAjZLet92eMMp5sabxg3/p0yV1iXcmYeH7d9AQERjsPAoaE5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=e5BBAaOF; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+PwCGwPf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=e5BBAaOF; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+PwCGwPf; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=e5BBAaOF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+PwCGwPf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=e5BBAaOF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+PwCGwPf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1Gjf248Wz2yvv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 05:11:17 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D04021194;
	Tue,  4 Nov 2025 18:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762279873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yvJofQ7zgV2S0QGyZ+jnZqrgNYVRXLa+r1OXEPMLaDg=;
	b=e5BBAaOF6TUFVfPxOLW5CvpFxRjKpayJ7yuP7atu6Mw0f1ig8Xl2n3YoBH6HCcEfO90yp+
	60CnWX6A7VBWkXbqGM4f6K/s+c5dde/+IaPWd84vuJQUVz7AVw+oQXfsGQs69rTSrEgUcp
	j15hKrtWHXCMl//guCyl93M5OuXgU6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762279873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yvJofQ7zgV2S0QGyZ+jnZqrgNYVRXLa+r1OXEPMLaDg=;
	b=+PwCGwPfdwsQNfczEFtL0L9EQV+qxV5QnXvrQXNXB+0Qhl7PwpJ8Ra4NZ9+WdfRgoob1Ws
	fbY5nyTd2OgYpYAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762279873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yvJofQ7zgV2S0QGyZ+jnZqrgNYVRXLa+r1OXEPMLaDg=;
	b=e5BBAaOF6TUFVfPxOLW5CvpFxRjKpayJ7yuP7atu6Mw0f1ig8Xl2n3YoBH6HCcEfO90yp+
	60CnWX6A7VBWkXbqGM4f6K/s+c5dde/+IaPWd84vuJQUVz7AVw+oQXfsGQs69rTSrEgUcp
	j15hKrtWHXCMl//guCyl93M5OuXgU6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762279873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yvJofQ7zgV2S0QGyZ+jnZqrgNYVRXLa+r1OXEPMLaDg=;
	b=+PwCGwPfdwsQNfczEFtL0L9EQV+qxV5QnXvrQXNXB+0Qhl7PwpJ8Ra4NZ9+WdfRgoob1Ws
	fbY5nyTd2OgYpYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37BC0136D1;
	Tue,  4 Nov 2025 18:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G/hUC8FBCmmwLQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 04 Nov 2025 18:11:13 +0000
Message-ID: <0827d0ea-9831-4839-989f-13e33d8d6729@suse.de>
Date: Tue, 4 Nov 2025 19:11:12 +0100
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
Subject: Re: [PATCH 2/2] macintosh/via-pmu-backlight: Include linux/of.h and
 uapi/linux/fb.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org,
 patches@lists.linux.dev
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
 <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-2-d256858d86a6@kernel.org>
 <c1aecfba-fa12-4572-885d-925e9afa1494@suse.de>
 <20251104170104.GA1416336@ax162>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20251104170104.GA1416336@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,ffwll.ch,lists.ozlabs.org,lists.linux.dev];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi

Am 04.11.25 um 18:01 schrieb Nathan Chancellor:
> On Tue, Nov 04, 2025 at 01:43:26PM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 26.09.25 um 01:46 schrieb Nathan Chancellor:
>>> After the recent removal of the fb.h include from backlight.h, which
>>> transitively included of.h, there are several errors from
>>> via-pmu-backlight.c (errors from bl_curve not being properly defined
>>> omitted):
>>>
>>>     drivers/macintosh/via-pmu-backlight.c:22:20: error: 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
>>>        22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
>>>           |                    ^~~~~~~~~~~~~~~~~~~
>>>     drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_get_level_brightness':
>>>     drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX' undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
>>>        63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
>>>           |                                      ^~~~~~~~~~~~~~~~
>>>           |                                      BACKLIGHT_RAW
>>>     drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
>>>     drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit declaration of function 'of_machine_is_compatible' [-Wimplicit-function-declaration]
>>>       144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
>>>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> FB_BACKLIGHT_{LEVELS,MAX} are available from the userspace API fb.h so
>>> just include that avoid dragging in the full fb.h header unnecessarily.
>>> Include linux/of.h for of_machine_is_compatible().
>>>
>>> Fixes: 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header file")
>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>> ---
>>>    drivers/macintosh/via-pmu-backlight.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
>>> index 26bd9ed5e664..f7b7853b3802 100644
>>> --- a/drivers/macintosh/via-pmu-backlight.c
>>> +++ b/drivers/macintosh/via-pmu-backlight.c
>>> @@ -11,7 +11,9 @@
>>>    #include <asm/ptrace.h>
>>>    #include <linux/adb.h>
>>>    #include <linux/backlight.h>
>>> +#include <linux/of.h>
>>>    #include <linux/pmu.h>
>>> +#include <uapi/linux/fb.h>
>> Should this not be <linux/fb.h> ?
> It could be but as I mention above, this file only needs the UAPI
> FB_BACKLIGHT_LEVELS and FB_BACKLIGHT_MAX constants so I did not really
> feel like it was worth it to drag in the whole fb.h header.

I mean that I thought that the internal header would be preferred over 
the UAPI header if both exist. But maybe I misremember.

Best regards
Thomas

>
>>>    #include <asm/backlight.h>
>>>    #define MAX_PMU_LEVEL 0xFF
>>>
>> -- 
>> --
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
>> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
>>
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



