Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58244672311
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 17:25:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxrhW6g1zz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 03:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.176; helo=mail-oi1-f176.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxrgx4bR3z3cD9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 03:24:44 +1100 (AEDT)
Received: by mail-oi1-f176.google.com with SMTP id s66so28394904oib.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLKcoDALgcZRRERyZiAG5jr/svh+5o9z/KSymkfcfvs=;
        b=hVaNbamalyU4L9ShUq7eka7TUIeIu8VaeZvRn7vZpe8FrqUi5x11luGToe9obfKjby
         LC7XUnLcPCfpr1kfEd4CvvCqa3D+VFhWKK4Bazi6IK6ceDxrQmbR/koSp/0KMJa/zrku
         j8q4QPsZIQELORd3evIt2su/A6zDoHBzndEdCmlN5/w2cW2dnhVnwSRJApqvSqvrkvLG
         HIR8kVCNPXcasXVNTALEo81xzGunMFHWOY7C3sfddzGowxjKdbOFrNytCwjV9khv/tKo
         JCoRLNQ/RbYCipqK5vl0PLMN0QV273YKsWG1u568i+w2up1HDYznzjRVlQnsCPMFsjZf
         nixw==
X-Gm-Message-State: AFqh2kp0p6HDu+gGADh08APGt0M7GGAj2FGEsr05vNrSgtqQV7MDlCUe
	KQx6+uN8d6UaYl/W74lDeA==
X-Google-Smtp-Source: AMrXdXtm0y3C+j4QS0qnUyLJyugYaKfylubqxMyLMxyM4AMIqsUK/Uqdq/g4sL8kemFKghbIMFrHFw==
X-Received: by 2002:aca:b882:0:b0:35e:d30c:e918 with SMTP id i124-20020acab882000000b0035ed30ce918mr3131659oif.39.1674059081490;
        Wed, 18 Jan 2023 08:24:41 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id v2-20020a544d02000000b00364b516055bsm7641924oix.13.2023.01.18.08.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:24:41 -0800 (PST)
Received: (nullmailer pid 115499 invoked by uid 1000);
	Wed, 18 Jan 2023 16:24:40 -0000
Date: Wed, 18 Jan 2023 10:24:40 -0600
From: Rob Herring <robh@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Subject: Re: [PATCH] of: Make of framebuffer devices unique
Message-ID: <167405907668.115378.12014688448945768358.robh@kernel.org>
References: <20230117165804.18036-1-msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117165804.18036-1-msuchanek@suse.de>
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
Cc: devicetree@vger.kernel.org, "Erhard F ." <erhard_f@mailbox.org>, Frank Rowand <frowand.list@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 17 Jan 2023 17:58:04 +0100, Michal Suchanek wrote:
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
>  drivers/of/platform.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Applied, thanks!
