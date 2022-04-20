Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6C50824D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 09:36:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjstT1nmRz3bYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 17:36:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c2+6o3Vj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c2+6o3Vj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c2+6o3Vj; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=c2+6o3Vj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjssn11jqz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 17:35:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650440152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDRif+t8FPfoSOxs98NyECVWbLIHSIo6HCNUFdi+s6k=;
 b=c2+6o3VjIs5muBzmcORdMPg4Xbr39Q9kvJ4vngRu/r1ouVHR+FQgDoCHorrvgIfsclO80E
 vgpGgqA1MT8ryrAz+DSC6VPjhI+Kpm0b+hfCaMLEQezGN4mUbuveYsW5OjNVlC0ZsqGyGg
 1+Ky89OGIpOE1LbyKNOSQ1EkRVLAKg8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650440152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDRif+t8FPfoSOxs98NyECVWbLIHSIo6HCNUFdi+s6k=;
 b=c2+6o3VjIs5muBzmcORdMPg4Xbr39Q9kvJ4vngRu/r1ouVHR+FQgDoCHorrvgIfsclO80E
 vgpGgqA1MT8ryrAz+DSC6VPjhI+Kpm0b+hfCaMLEQezGN4mUbuveYsW5OjNVlC0ZsqGyGg
 1+Ky89OGIpOE1LbyKNOSQ1EkRVLAKg8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-EdpE1givPfO8f7GP7Xwt5Q-1; Wed, 20 Apr 2022 03:35:50 -0400
X-MC-Unique: EdpE1givPfO8f7GP7Xwt5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so1743327wmr.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 00:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EDRif+t8FPfoSOxs98NyECVWbLIHSIo6HCNUFdi+s6k=;
 b=PUf0ZAPWSpQ5HbwpIwY8SBHzmyIOhCXYRgCExtsZ5dTQ5UyqrxaMHWSUv/hobh6QU1
 oeoeC5BrTW4ouSMBekSncJ5HG/zDbYCDXyXyg2RVREXqJjNuNo0kLN7WkB2eK0Gz1K3q
 oq+EtXZM3jfr1/S2OOLXR7NIsS9qOb1WV0M+FVYi6pGEEvMIg5GFEAMSYTmdHTt+4b9n
 IDsQd554iq7+LDYYuaWTVfrZ6OK/8cDRR+7WHYijLdVhn63/sl0XM9X5wZxBRlJJ3t9j
 6ed/uQgrSX+i3vJHG4k+oABJmr32mcQtA2MZthfLaODWUzIcEeMRsUR/MPyQvFbICZl/
 ngRg==
X-Gm-Message-State: AOAM531Uc3o7fyVjltqoaGs6ak4CkBY2DOWUMNIyJaQcO+vHdHA+Ji7W
 9rCnTcQ4wfy+zpUHAzlJFQWccJh8N/MYn119Y/NCy7Lx5OD5/Ql7vSR8FTTXKZPNBCjwSEhRT22
 y2O9H/YwyJE0XS3rhSToFKgvqGA==
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr2900236wrm.673.1650440149340; 
 Wed, 20 Apr 2022 00:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6sgyKJ2RuJP3SIGSvgHxw4lhTuGdu8X/eI4ANvHsCXwV93n7yUdOaGB6Ll1aJVD0L1RwOfA==
X-Received: by 2002:adf:e3c1:0:b0:20a:aba9:9b38 with SMTP id
 k1-20020adfe3c1000000b0020aaba99b38mr2900217wrm.673.1650440149133; 
 Wed, 20 Apr 2022 00:35:49 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c4ec800b0039290a5b827sm10994151wmq.24.2022.04.20.00.35.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:35:48 -0700 (PDT)
Message-ID: <621dcf6a-c23d-24cd-951e-26227f465ab0@redhat.com>
Date: Wed, 20 Apr 2022 09:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/2] fbdev: Warn in hot-unplug workaround for
 framebuffers without device
To: Thomas Zimmermann <tzimmermann@suse.de>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220419100405.12600-1-tzimmermann@suse.de>
 <20220419100405.12600-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220419100405.12600-3-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hello Thomas,

Thanks a lot for re-spinning your series.

On 4/19/22 12:04, Thomas Zimmermann wrote:
> A workaround makes fbdev hot-unplugging work for framebuffers without
> device. The only user for this feature was offb. As each OF framebuffer
> now has an associated platform device, the workaround hould no longer
> be triggered. Update it with a warning and rewrite the comment. Fbdev
> drivers that trigger the hot-unplug workaround really need to be fixed.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

