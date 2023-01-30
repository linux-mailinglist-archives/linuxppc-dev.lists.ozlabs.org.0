Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6366816E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jan 2023 17:51:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5Dhv15Xtz3f3K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 03:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.178; helo=mail-oi1-f178.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5DhH5KxCz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 03:50:39 +1100 (AEDT)
Received: by mail-oi1-f178.google.com with SMTP id t19so2280578oiw.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jan 2023 08:50:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNHGc+FYLfWuI0WyP8cgi2QoONQjOUTwM6TUqLZs8f4=;
        b=xh5Cxh+1Szv65fADkKmRFqS5Zr0yGEvIFhm119DnghLgag8WCTcF5JU2AtvQUVmgXn
         eA6rMEBvR71I2r4gzkHtb/AZsgJYaNaDtx3ixW6LBy5iLhShdU5uVG5TYaoxL8jakLMO
         jmycmMxLe6VmYOTOgFCrT+/zHUuynRg4t0tsVs7Zg8BoFPHBbCfsvvtpHO/x/JoDRKf4
         GG0M4vrp9FmNBnC70JSr2rHi1jxt0N9wAUcz7tDbTi2pOPdjRk+b6p1A+LntIwvvLiCi
         YLh+IJoEzdNpmpzsYYnIfsjkOiYB59Ww9NRVtYgwzyTQYvWbS7fSuRvYGUOA0qvyT0kt
         yxBw==
X-Gm-Message-State: AFqh2kr+WS91axhOG/NtQb7nCXTyNkhOZ2oHmCB9OQvkxVk1Q9Q3nwzt
	njv4BJK+5+Cnp6lxznNdBA==
X-Google-Smtp-Source: AMrXdXti2G0mwexjQfuiuQB27g1A+0HBQf48DMV3lRqSFJr1OJsLGzadxFlqI5+H0l2a2gHK/KRN6g==
X-Received: by 2002:a05:6808:1495:b0:364:3de2:bfd1 with SMTP id e21-20020a056808149500b003643de2bfd1mr27752455oiw.32.1675097436054;
        Mon, 30 Jan 2023 08:50:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z11-20020aca330b000000b003458d346a60sm4899521oiz.25.2023.01.30.08.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 08:50:35 -0800 (PST)
Received: (nullmailer pid 2794298 invoked by uid 1000);
	Mon, 30 Jan 2023 16:50:34 -0000
Date: Mon, 30 Jan 2023 10:50:34 -0600
From: Rob Herring <robh@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH v3] of: Make of framebuffer devices unique
Message-ID: <167509742194.2793991.9757556857543301296.robh@kernel.org>
References: <20230120180958.30798-1-msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120180958.30798-1-msuchanek@suse.de>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "Erhard F." <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 20 Jan 2023 19:09:57 +0100, Michal Suchanek wrote:
> Since Linux 5.19 this error is observed:
> 
> sysfs: cannot create duplicate filename '/devices/platform/of-display'
> 
> This is because multiple devices with the same name 'of-display' are
> created on the same bus.
> 
> Update the code to create numbered device names for the non-boot
> disaplay.
> 
> cc: linuxppc-dev@lists.ozlabs.org
> References: https://bugzilla.kernel.org/show_bug.cgi?id=216095
> Fixes: 52b1b46c39ae ("of: Create platform devices for OF framebuffers")
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> v3:
> - merge fix into original patch
> - Update the device name format
> - add missing const
> - do not continue with iterating display devices when formatting device
>   name fails
> ---
>  drivers/of/platform.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Applied, thanks!
