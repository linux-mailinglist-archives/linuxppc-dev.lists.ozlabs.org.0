Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9615FD59E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 09:40:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp1df3hNPz3drW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 18:40:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0/Iogbb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0/Iogbb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0/Iogbb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J0/Iogbb;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp1cj0X5rz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 18:39:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665646767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxL2Gm5Nvf7A3sd8fkrST2jbFEtQq1oZHcJN0U6gqnU=;
	b=J0/IogbbfE3A8CWgLZ4fghNrOmYkjJ55N5O1qSml78lnyS2ZQWZOSPcwjTeCw+YpR4cCwk
	CMQwD1RmeQreVg14KdBa2RoHg7TD9vGvJHZyxDp3k/AhEQzlLU8A74LmtPWm9ADHWq3M/X
	gR8LQHX32zN1Ht/eG4iQ5dAOr06CJYg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665646767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SxL2Gm5Nvf7A3sd8fkrST2jbFEtQq1oZHcJN0U6gqnU=;
	b=J0/IogbbfE3A8CWgLZ4fghNrOmYkjJ55N5O1qSml78lnyS2ZQWZOSPcwjTeCw+YpR4cCwk
	CMQwD1RmeQreVg14KdBa2RoHg7TD9vGvJHZyxDp3k/AhEQzlLU8A74LmtPWm9ADHWq3M/X
	gR8LQHX32zN1Ht/eG4iQ5dAOr06CJYg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-pzWHZkopOp6RvKuPrbLq-w-1; Thu, 13 Oct 2022 03:39:25 -0400
X-MC-Unique: pzWHZkopOp6RvKuPrbLq-w-1
Received: by mail-wr1-f72.google.com with SMTP id j8-20020adfa548000000b0022e2bf8f48fso222608wrb.23
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 00:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxL2Gm5Nvf7A3sd8fkrST2jbFEtQq1oZHcJN0U6gqnU=;
        b=niv/Y7Die2Qvc5g9YNoTteQL9IM2r1w+u9Wxuw0Uxg+EB/tZP8pIF9thGEIYU8kC+m
         gk8v2hP29DqzOd0rgJBnAP3/gpc5bBr0HanD3FyABGYxoTtUHtDTp2j9Bbchku6Pk/+N
         qCd5Uxt09DOrma1DBLlnllilaWXXs7DRrvDqEwGyab8ShDtBXlBh/dajX7eDNMqmSARu
         x2PwWOfYspAtK+IaxavJz505BZqb639MvRrghhkqo7ligV2gLqGm7rOKpDacyQrnBAcw
         AGGO8C9ELtLR9SiTF3eCIf/IfbNwA9TpTNWzmHxUivLgJUhhMD+Qcu74uSTXFRpKlcsF
         sTiw==
X-Gm-Message-State: ACrzQf3G3/gy/qyuNQDtbLtOUcp3Xk+KDP/gKpsrV392Bo3O/NpsJ06N
	J8UIlbsxcYw8QdGuwwqw0/+6N+YfIRa9DbT7uYaw1LrpulDkR8eC/9ijvPEsdBqZOM61qMtPWw5
	bcQCcxvg4viMRuGc6UCZyXQAgaQ==
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id d12-20020adfa40c000000b0022e47fe7ea3mr19557219wra.248.1665646763678;
        Thu, 13 Oct 2022 00:39:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KMxO3Yw68jgmaoO2Rl19Ndp0XdvFGPmI3mYt2GmovFka1lcVoPsM/CwVUy1TT0FzKmzx5lw==
X-Received: by 2002:adf:a40c:0:b0:22e:47fe:7ea3 with SMTP id d12-20020adfa40c000000b0022e47fe7ea3mr19557212wra.248.1665646763475;
        Thu, 13 Oct 2022 00:39:23 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d456e000000b0022ccae2fa62sm1423311wrc.22.2022.10.13.00.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 00:39:22 -0700 (PDT)
Message-ID: <de796dba-1e75-e5a8-a908-f0aed4e01fec@redhat.com>
Date: Thu, 13 Oct 2022 09:39:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Arnd Bergmann <arnd@arndb.de>
References: <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
 <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
 <0a15ecf5-939d-3b00-bcde-0fc7b449cfda@suse.de>
 <76d8a408-fc3e-4bd1-91c5-8278f7469979@app.fastmail.com>
 <20221012142707.GD28810@kitsune.suse.cz>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221012142707.GD28810@kitsune.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, mark.cave-ayland@ilande.co.uk, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On 10/12/22 16:27, Michal Suchánek wrote:

[...]

>>
>> If you are using the framebuffer code from vga.c, I would guess that
>> that you can run a big-endian kernel with qemu-system-ppc64,
>> or a little-endian kernel with qemu-system-ppc64le and get the
>> correct colors, while running a little-endian kernel with
>> qemu-system-ppc64 and vga.c, or using a different framebuffer
>> emulation on a big-endian kernel would give you the wrong colors.
> 
> Thanks for digging this up.
> 
> That makes one thing clear: qemu does not emulate this framebuffer
> property correctly, and cannot be relied on for verification.
> 
> If you can provide test results from real hardware that show the current
> logic as flawed it should be changed.
> 
> In absence of such test results I think the most reasonable thing is to
> keep the logic that nobody complained about for 10+ years.
> 

I agree with Michal and Thomas on this. I don't see a strong reason to not
use the same heuristic that the offb fbdev driver has been doing for this.

Otherwise if this turns out to be needed, it will cause a regression for a
user that switches to this driver instead. Specially since both fbdev and
DRM drivers match against the same "display" OF compatible string.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

