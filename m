Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B876D69A7C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:05:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ5W64X4Lz3fHL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:05:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ic29crjQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ic29crjQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ic29crjQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ic29crjQ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5Tz0SSYz3fJd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:04:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r/Vg/oi7sg0lEBjm9qSqwVJEQFFplyI3DAHqU5zgGyM=;
	b=Ic29crjQhXdj+/58Dde0zupPGkQ5yEsSpu1IaQFE/Qk8ypYWggSSgVgFHO6IqjAEzIEXny
	7TmVwQQoWg07Tr+GXbGy10CWTSMYVKJnx1vA12De0Zq5J/Y+VC8fQl8MEnJLDHpDmTLhFL
	bVhc7aGsnPmSWXyvSWlzU7EyzAbttsw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676624660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r/Vg/oi7sg0lEBjm9qSqwVJEQFFplyI3DAHqU5zgGyM=;
	b=Ic29crjQhXdj+/58Dde0zupPGkQ5yEsSpu1IaQFE/Qk8ypYWggSSgVgFHO6IqjAEzIEXny
	7TmVwQQoWg07Tr+GXbGy10CWTSMYVKJnx1vA12De0Zq5J/Y+VC8fQl8MEnJLDHpDmTLhFL
	bVhc7aGsnPmSWXyvSWlzU7EyzAbttsw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-98wyEZ3WMLCUKQy2kOXXcw-1; Fri, 17 Feb 2023 04:04:19 -0500
X-MC-Unique: 98wyEZ3WMLCUKQy2kOXXcw-1
Received: by mail-wm1-f71.google.com with SMTP id m7-20020a05600c090700b003e2249bd2b4so465697wmp.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 01:04:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Vg/oi7sg0lEBjm9qSqwVJEQFFplyI3DAHqU5zgGyM=;
        b=tWS1Ub5dIEX+7xtYpG7W0ytJ3ENmWe/OfBvRzMFtyyl/9WzuZXfSXsWCri7VFsSybv
         re5khG/ucB5JWjUt/8xGwTK18RLOtIlk+ULL6+PXPfwBEFFmCd8htTZphowLAr8kDSya
         mqTHJ6ELzyvYSJ1SRPI5fMqENdMAplKrBt2ChjaAmIYs+2ok/+DgbofEvkoDLjAAk6nf
         R7/fvLi0KXcvnjB2KaIWssJrD7djGUytuXIwfBTLjJLpjyR370aWVZHr7kiuZ88K75H5
         E11D8LpawhJNNgWUGbQt1kSBbDWKFIF9Rc72n7++l+csnwTjMyerNp0qg3P/Csc70A5W
         1nQA==
X-Gm-Message-State: AO0yUKXH8gJJRte85IH/os5rlSMTTIiFYZJTr5tkSIfbH48RCp/EaDY8
	/ZF6les+NourCu7k0EcpQyJCkkzFCVn345Kb6qq50PWG5XgIYVMxpzYidoWnJoLX5nS/SnB7LzF
	AQEXH+iXyCngIf9MvNS+trcHxFQ==
X-Received: by 2002:a5d:5274:0:b0:2c5:6c26:1f73 with SMTP id l20-20020a5d5274000000b002c56c261f73mr7413161wrc.20.1676624658127;
        Fri, 17 Feb 2023 01:04:18 -0800 (PST)
X-Google-Smtp-Source: AK7set98GWM304I+yPyS58qtsFdfDQC0E6UdjQSZ+kNzg9KXWfZpJwMOLAHu6SxeCJt3DfODLkCIXA==
X-Received: by 2002:a5d:5274:0:b0:2c5:6c26:1f73 with SMTP id l20-20020a5d5274000000b002c56c261f73mr7413138wrc.20.1676624657852;
        Fri, 17 Feb 2023 01:04:17 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d6806000000b002c6d0462163sm965896wru.100.2023.02.17.01.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 01:04:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 11/11] drm: Fix comment on mode parsing
In-Reply-To: <20230209135509.7786-12-tzimmermann@suse.de>
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-12-tzimmermann@suse.de>
Date: Fri, 17 Feb 2023 10:04:16 +0100
Message-ID: <87h6vkwtm7.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Do not claim that there's a default mode in the video= option parser.
> if no option string has been given, the parser does nothing.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Best regards,
Javier

