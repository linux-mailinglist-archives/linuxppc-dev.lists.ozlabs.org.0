Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F3871A2B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 11:05:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G5vasWwx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R4fg3BR+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G5vasWwx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R4fg3BR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tprlq4tzqz3dXB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 21:05:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G5vasWwx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R4fg3BR+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G5vasWwx;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=R4fg3BR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tprl26t7Nz3cRB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 21:04:30 +1100 (AEDT)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE2BF6AB06;
	Tue,  5 Mar 2024 10:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709633066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TER6JpIJ4/RVnjarJCWAeQTVqdl0Kel7dheCcqNkqMA=;
	b=G5vasWwxzx8tORqS9VBloBUYmuFmH7Eu+pmP6W3ZHVbna7BR1ELrAGtJemQeU3LILk08a0
	DPAALqc7QW81E5BfOUlRx8dv707dKiF+aJYJpI8E/ebkyoXZ7NET2BGJ17HvxWDFXKplyz
	7tOuexj/93nBplcGrj1+5vE6iirbxpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709633066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TER6JpIJ4/RVnjarJCWAeQTVqdl0Kel7dheCcqNkqMA=;
	b=R4fg3BR+ZzWyyBENiRZ+/DanzPr+KLoMkcrRN+tn2nuUmCuYRP+96LN6yVOgO4y35WF+ZN
	H0JDieqbO5vaYbAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709633066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TER6JpIJ4/RVnjarJCWAeQTVqdl0Kel7dheCcqNkqMA=;
	b=G5vasWwxzx8tORqS9VBloBUYmuFmH7Eu+pmP6W3ZHVbna7BR1ELrAGtJemQeU3LILk08a0
	DPAALqc7QW81E5BfOUlRx8dv707dKiF+aJYJpI8E/ebkyoXZ7NET2BGJ17HvxWDFXKplyz
	7tOuexj/93nBplcGrj1+5vE6iirbxpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709633066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TER6JpIJ4/RVnjarJCWAeQTVqdl0Kel7dheCcqNkqMA=;
	b=R4fg3BR+ZzWyyBENiRZ+/DanzPr+KLoMkcrRN+tn2nuUmCuYRP+96LN6yVOgO4y35WF+ZN
	H0JDieqbO5vaYbAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5086113A5D;
	Tue,  5 Mar 2024 10:04:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id GT4iEiru5mUhcgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 05 Mar 2024 10:04:26 +0000
Message-ID: <f7503198-ab1b-463c-a8c8-9addbdcdab1b@suse.de>
Date: Tue, 5 Mar 2024 11:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
 "deller@gmx.de" <deller@gmx.de>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
 "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-4-tzimmermann@suse.de>
 <15e13364-8b43-402c-836b-436499906b74@csgroup.eu>
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
In-Reply-To: <15e13364-8b43-402c-836b-436499906b74@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G5vasWwx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=R4fg3BR+
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.992];
	 FREEMAIL_TO(0.00)[csgroup.eu,ellerman.id.au,intel.com,linaro.org,gmx.de,gmail.com,kernel.org,linux.ibm.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -4.50
X-Rspamd-Queue-Id: AE2BF6AB06
X-Spam-Flag: NO
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

Am 05.03.24 um 10:25 schrieb Christophe Leroy:
>
> Le 05/03/2024 à 10:01, Thomas Zimmermann a écrit :
>> Replace <linux/fb.h> with a forward declaration in <asm/backlight.h> to
>> resolves an unnecessary dependency. Remove pmac_backlight_curve_lookup()
>> and struct fb_info from source and header files. The function and the
>> framebuffer struct is unused. No functional changes.
> When you remove pmac_backlight_curve_lookup() prototype you'll then get
> a warning/error about missing prototype when building
> arch/powerpc/platforms/powermac/backlight.c
>
> The fonction is not used outside of that file so it should be static.
> And then it is not used in that file either so it should be removed
> completely. Indeed last use of that function was removed by commit
> d565dd3b0824 ("[PATCH] powerpc: More via-pmu backlight fixes") so the
> function can safely be removed.

Isn't that what my patch is doing? I have no callers of the function in 
my tree (drm-tip), so I removed it entirely. Should I add a Fixes tag 
against commit d565dd3b0824? Best regards Thomas
>
> Christophe
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>    arch/powerpc/include/asm/backlight.h        |  5 ++--
>>    arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
>>    2 files changed, 2 insertions(+), 29 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
>> index 1b5eab62ed047..061a910d74929 100644
>> --- a/arch/powerpc/include/asm/backlight.h
>> +++ b/arch/powerpc/include/asm/backlight.h
>> @@ -10,15 +10,14 @@
>>    #define __ASM_POWERPC_BACKLIGHT_H
>>    #ifdef __KERNEL__
>>    
>> -#include <linux/fb.h>
>>    #include <linux/mutex.h>
>>    
>> +struct backlight_device;
>> +
>>    /* For locking instructions, see the implementation file */
>>    extern struct backlight_device *pmac_backlight;
>>    extern struct mutex pmac_backlight_mutex;
>>    
>> -extern int pmac_backlight_curve_lookup(struct fb_info *info, int value);
>> -
>>    extern int pmac_has_backlight_type(const char *type);
>>    
>>    extern void pmac_backlight_key(int direction);
>> diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
>> index aeb79a8b3e109..12bc01353bd3c 100644
>> --- a/arch/powerpc/platforms/powermac/backlight.c
>> +++ b/arch/powerpc/platforms/powermac/backlight.c
>> @@ -9,7 +9,6 @@
>>     */
>>    
>>    #include <linux/kernel.h>
>> -#include <linux/fb.h>
>>    #include <linux/backlight.h>
>>    #include <linux/adb.h>
>>    #include <linux/pmu.h>
>> @@ -72,31 +71,6 @@ int pmac_has_backlight_type(const char *type)
>>    	return 0;
>>    }
>>    
>> -int pmac_backlight_curve_lookup(struct fb_info *info, int value)
>> -{
>> -	int level = (FB_BACKLIGHT_LEVELS - 1);
>> -
>> -	if (info && info->bl_dev) {
>> -		int i, max = 0;
>> -
>> -		/* Look for biggest value */
>> -		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++)
>> -			max = max((int)info->bl_curve[i], max);
>> -
>> -		/* Look for nearest value */
>> -		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++) {
>> -			int diff = abs(info->bl_curve[i] - value);
>> -			if (diff < max) {
>> -				max = diff;
>> -				level = i;
>> -			}
>> -		}
>> -
>> -	}
>> -
>> -	return level;
>> -}
>> -
>>    static void pmac_backlight_key_worker(struct work_struct *work)
>>    {
>>    	if (atomic_read(&kernel_backlight_disabled))

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

