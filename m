Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5544C7A1645
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 08:40:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mjuE2FMG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn4LS1374z3dJV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 16:40:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mjuE2FMG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn4Kb53q3z3dFv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 16:39:15 +1000 (AEST)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1d5bb38117dso1019535fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694759948; x=1695364748; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9krPXP60RvOc/Jly4MzMbTGFZqB63oEeqar0n+mZto=;
        b=mjuE2FMGinsLWBczeSzUb0mM31+ajIUbXEo3F0CLBS4KOUOun80+qeSCoJLOXZAHHf
         Sn1DSTJ4TIvnY49sS3x7EGA6r/0IBTymJAFLD5jJA8nwvV4ZpVB5CgY+hLc/gE7/gvKc
         4CXwXnCH3tkEfOrIqamVaV4ypqwbKMrv4e7vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694759948; x=1695364748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9krPXP60RvOc/Jly4MzMbTGFZqB63oEeqar0n+mZto=;
        b=OGCBAdEweO61oOfeR+YWqywdaynM0YYIvrA1LlPPMqUZkLiMee1djPOOMA3UwP0eVm
         aCJ5ziK5mBtHHcymLX3m9DjfB7lyadpPXnxOJOeQh1/tES9oGu55kygy3FBkhPBk8spC
         +GMoGs0mj700HJEN5HHLtGV8Uyl0kA9U0w/kLV9Ncs0iUam2h+yPExG6QTZ9Foj0XPyU
         svUphAj3zBjIJrARefc08X77dx4wFquvXeKMbCfUpeyFpoFrZX+Z6+tZXPOkZk+AxVk3
         gH9K5IKURi0QcRSRbnPihByojMLSGdiiyTV/oRJLIEKOfRLzQIMlaLguiigTzPc4XBk3
         CBxA==
X-Gm-Message-State: AOJu0YySxYz63UT377gMDQVDAeoEyK55dSLLcKNs+S/z/RSc1yW2wl9r
	BcKuqUTPaImJxe9SK1KGjV+K4Q==
X-Google-Smtp-Source: AGHT+IFDmhw7ZRBNGNOL6ig8k8GdAMIkgXC0ino4cM4yA0zOj4mNkUi7jC3Ss/34A3XxvP1tmTpnBg==
X-Received: by 2002:a05:6870:64a2:b0:1d6:3f77:c214 with SMTP id cz34-20020a05687064a200b001d63f77c214mr725392oab.55.1694759948598;
        Thu, 14 Sep 2023 23:39:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n19-20020a637213000000b0056c52d25771sm2114306pgc.69.2023.09.14.23.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:39:07 -0700 (PDT)
Date: Thu, 14 Sep 2023 23:39:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ibmpowernv) refactor deprecated strncpy
Message-ID: <202309142334.0F81E0EA2D@keescook>
References: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
 <202309142223.D16446A30D@keescook>
 <4b490305-0ab7-403f-7bec-a08fb8f20b56@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b490305-0ab7-403f-7bec-a08fb8f20b56@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Justin Stitt <justinstitt@google.com>, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 10:40:37PM -0700, Guenter Roeck wrote:
> It is really sad that the submitters of such "cleanup" patches can't be bothered
> to check what they are doing. They can't even be bothered to write a coccinelle
> script that would avoid pitfalls like this one, and they expect others to do their
> homework for them.

Well I'm not sure that's entirely fair to Justin's efforts (I know he's
been studying these changes and everyone makes mistakes), but that's why
I'm helping review his findings -- some code behaviors are more obvious
than others. :)

-- 
Kees Cook
