Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 324DE4FF741
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 14:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdjLw1c2Qz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 22:58:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvWwsX42;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvWwsX42;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YvWwsX42; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YvWwsX42; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdfX138LSz3bcR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 20:50:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649847054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8f/PwshmkguRT4VixsIFRRZxWGHz2g1FKjPSgvCys1U=;
 b=YvWwsX42oWJbar3pG2gGY6mBxHDHtTLTuDYGUjDDjmLlUpUs614PFbTHJEsHtV1lAYyvnj
 vk3zTUN8KrpLj9zBM7mb6fm6EGmeEooGpDuoSVj+IOEL2KiGwfIN6695wsgpTZX1jVgp4/
 qXB8rZiu8oWoiK7Wc5xcMWP0bZzkb3I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649847054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8f/PwshmkguRT4VixsIFRRZxWGHz2g1FKjPSgvCys1U=;
 b=YvWwsX42oWJbar3pG2gGY6mBxHDHtTLTuDYGUjDDjmLlUpUs614PFbTHJEsHtV1lAYyvnj
 vk3zTUN8KrpLj9zBM7mb6fm6EGmeEooGpDuoSVj+IOEL2KiGwfIN6695wsgpTZX1jVgp4/
 qXB8rZiu8oWoiK7Wc5xcMWP0bZzkb3I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-R1MjPulaMCSm9Y91xqzjNA-1; Wed, 13 Apr 2022 06:50:53 -0400
X-MC-Unique: R1MjPulaMCSm9Y91xqzjNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 46-20020adf8031000000b00207ad3febaeso256089wrk.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 03:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8f/PwshmkguRT4VixsIFRRZxWGHz2g1FKjPSgvCys1U=;
 b=JiOXb0aX3B+Gi+vQoc1bgsQxN+ekfDHc1h232ECjN8P4iolrVNgrqJUmaHyWI03jxg
 u1Drnur0Sj199GTDUtJCaEpHLs+vI6V/PAmAXMGc2hPlXENbCmh6SnoiQAdUMXtcj7CJ
 okPbcVCnTlMQkJLLCd0+Ouv+Qc/Gcn/BR6dLZpooKmh3i6/iCC1NLUaggQjPY+XCgiAZ
 HKiLQUHJN/Pi4zfkXr1rEqIx6d1ONhIhfp1vwgpx0rH50VQEqUMeBM01wHQTABkB0JYW
 Mb1ZpSedZCnoOokblFd8o3nQ/J4Q/oYhUJk4A2wILzCYtiel1w7ZRx1lDMI4EosyGfKY
 njHQ==
X-Gm-Message-State: AOAM532m3Qo50MmChoNR40C4oCEkTqkGGRmcYP5HeF/AKSTkSkBgpxK5
 JGj3uZXJ1guy21jQneej/08pRNd8vjpwWYj0Z/SX8QqgC9V12DH8BVqogNI9XPkTajUjIfpLXni
 mA433f3pBWpBAYsFe1i/DrqTxRw==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr32602168wrj.199.1649847052082; 
 Wed, 13 Apr 2022 03:50:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRxfN1JAPTNpXMTTDU9DhECg4cctSX/rrDt8wkv7XgQMTGGJbHn9zb6tPrmr8j280opAJ2Jg==
X-Received: by 2002:adf:e2cb:0:b0:203:7564:1076 with SMTP id
 d11-20020adfe2cb000000b0020375641076mr32602150wrj.199.1649847051871; 
 Wed, 13 Apr 2022 03:50:51 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm2157211wmr.8.2022.04.13.03.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 03:50:51 -0700 (PDT)
Message-ID: <2e183cc9-603d-f038-54aa-5601f11b0484@redhat.com>
Date: Wed, 13 Apr 2022 12:50:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] fbdev: Remove hot-unplug workaround for framebuffers
 without device
To: Thomas Zimmermann <tzimmermann@suse.de>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220413092454.1073-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 13 Apr 2022 22:57:01 +1000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/13/22 11:24, Thomas Zimmermann wrote:
> A workaround makes fbdev hot-unplugging work for framebuffers without
> device. The only user for this feature was offb. As each OF framebuffer
> now has an associated platform device, the workaround is no longer
> needed. Remove it. Effectively reverts commit 0f525289ff0d ("fbdev: Fix
> unregistering of framebuffers without device").
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/fbmem.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index bc6ed750e915..bdd00d381bbc 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1579,14 +1579,7 @@ static void do_remove_conflicting_framebuffers(struct apertures_struct *a,
>  			 * If it's not a platform device, at least print a warning. A
>  			 * fix would add code to remove the device from the system.
>  			 */
> -			if (!device) {
> -				/* TODO: Represent each OF framebuffer as its own
> -				 * device in the device hierarchy. For now, offb
> -				 * doesn't have such a device, so unregister the
> -				 * framebuffer as before without warning.
> -				 */
> -				do_unregister_framebuffer(registered_fb[i]);

Maybe we could still keep this for a couple of releases but with a big
warning that's not supported in case there are out-of-tree drivers out
there that still do this ?

Or at least a warning if the do_unregister_framebuffer() call is removed.

Regardless of what you chose to do, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

