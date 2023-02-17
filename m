Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E8769AA41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 12:24:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ8bq68L8z3f3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 22:24:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2CJIZGX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2CJIZGX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2CJIZGX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2CJIZGX;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ8Zq1FcBz3btb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 22:23:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676633022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=seb+UnT6fXFwECQkziBuKI673IsXhXzJa3B+Rdcr3n8=;
	b=D2CJIZGXp8ohHiV17PZaxvN+DDgNmqgPizx+e31NNY0wtDq1a/xld7GlH1NHJ3FRFA22Qi
	Xywmw0gLKim3UQtQYqA+Iw1bC4i4yyKDg0GLLxgLui3FziV3l/xJB1m/+DNgQZj4D8Uq0r
	EX7kOfN1lv/d5kbTNFYh4jhlFARI+/8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676633022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=seb+UnT6fXFwECQkziBuKI673IsXhXzJa3B+Rdcr3n8=;
	b=D2CJIZGXp8ohHiV17PZaxvN+DDgNmqgPizx+e31NNY0wtDq1a/xld7GlH1NHJ3FRFA22Qi
	Xywmw0gLKim3UQtQYqA+Iw1bC4i4yyKDg0GLLxgLui3FziV3l/xJB1m/+DNgQZj4D8Uq0r
	EX7kOfN1lv/d5kbTNFYh4jhlFARI+/8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-fHba-TAxOxaZjKHLhfIKWw-1; Fri, 17 Feb 2023 06:23:41 -0500
X-MC-Unique: fHba-TAxOxaZjKHLhfIKWw-1
Received: by mail-wm1-f71.google.com with SMTP id bg7-20020a05600c3c8700b003e21a3f4e84so111359wmb.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 03:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=seb+UnT6fXFwECQkziBuKI673IsXhXzJa3B+Rdcr3n8=;
        b=Y9k7rn+ChdC89YEPwkxGUVPggE20XFAf+pSQiiNs5cfrmsVW4bimQ/EiOnVierKwYb
         Akkt+cVmFiI9cGO42G8xlJtFOOCLcfRZHNwYHWRmmVX4wYeAxoE+uKUj6Ue8srFOpdhv
         tJONO2y9YHLR8hMIIQkwTl/oRAdJRM39b8WaYqIP/1IrZKS0dg0AOcc2zEjs1JKqmtXa
         N/w1yiVenoA5hJ1Gou1LiEe2nD+qBVNI8AOTBf4NLeFX2IGLn78+hxuIKzKkDBRrnEYP
         zstzuh9DW6iLQztBDCyIvZlObIx7nOriFKNZa3aO29sGK8pNq2bEiy1DbKT/XvTtX8Lu
         39Hg==
X-Gm-Message-State: AO0yUKXm+PPXf19sNgXi6Z2wVh9jV5lvOwjbKJzoyXMxS5VS5EctSutv
	paACJ+KkwiR1n5oIjFI34hiKYhP9uVuM3lKagBds8Yju56/iJDKDIYj68UiouuMH76yN2q1aBg2
	YZoieMh5ZRsi52M+JX6RMkahQ4A==
X-Received: by 2002:a5d:49c4:0:b0:2c5:5f95:7746 with SMTP id t4-20020a5d49c4000000b002c55f957746mr7312226wrs.56.1676633019925;
        Fri, 17 Feb 2023 03:23:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9EFBEl4WDoRU8Iwut2hV1mfRRFMcd1jJye0+8k8u1HqbEZwr9yUu/4Qf4uxNyoSAl+SsFhNg==
X-Received: by 2002:a5d:49c4:0:b0:2c5:5f95:7746 with SMTP id t4-20020a5d49c4000000b002c55f957746mr7312210wrs.56.1676633019651;
        Fri, 17 Feb 2023 03:23:39 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d6612000000b002c551f7d452sm3893041wru.98.2023.02.17.03.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 03:23:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
In-Reply-To: <2c589464-bc37-4138-d9a6-b38cd05e5f99@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
 <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
 <2c589464-bc37-4138-d9a6-b38cd05e5f99@suse.de>
Date: Fri, 17 Feb 2023 12:23:37 +0100
Message-ID: <87y1ow4jt2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 17.02.23 um 09:37 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>>> In fb_get_options(), always duplicate the returned option string and
>>> transfer ownership of the memory to the function's caller.
>>>
>>> Until now, only the global option string got duplicated and transferred
>>> to the caller; the per-driver options were owned by fb_get_options().
>>> In the end, it was impossible for the function's caller to detect if
>>> it had to release the string's memory buffer. Hence, all calling drivers
>>> leak the memory buffer. The leaks have existed ever since, but drivers
>>> only call fb_get_option() once as part of module initialization. So the
>>> amount of leaked memory is not significant.
>>>
>>> Fix the semantics of fb_get_option() by unconditionally transferring
>>> ownership of the memory buffer to the caller. Later patches can resolve
>>> the memory leaks in the fbdev drivers.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>> 
>> [...]
>> 
>>> +	if (option) {
>>> +		if (options)
>>> +			*option = kstrdup(options, GFP_KERNEL);
>>> +		else
>>> +			*option = NULL;
>>> +	}
>>>
>> 
>> I know the old code wasn't checking if kstrdup() succeeded, but you should
>
> Kstrdup uses kmalloc, which already warns about failed allocations. I 
> think it's discouraged to warn again. (Wasn't there a warning in sparse 
> or checkpatch?)  So I'd rather leave it as is.
>

I didn't mean to warn but to return an error code.

>> do it here and let the caller know. And same if (!options). So I guess the
>> following check can be added (to be consistent with the rest of the code):
>> 
>> 	if (!*option)
>> 		retval = 1;
>
> Why is that needed for consistency?
>
> Retval is the state of the output: enabled or not. If there are no 
> options, retval should be 0(=enabled). 1(=disabled) is only set by 
> video=off or that ofonly thing.
>

Ah, I see. I misundertood what retval was about. Forget this comment then.

Maybe while you are there could have another patch to document the return
value in the fb_get_options() kernel-doc?

And this patch looks good to me too after your explanations.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

