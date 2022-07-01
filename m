Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B795629D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 05:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ1Vl5tqfz3dpv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 13:52:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GLcr3gfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GLcr3gfP;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ1V36HMQz3cdp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 13:51:54 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id l6so1171769plg.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 20:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kbHNoy/D3cNiXfyNj8YldC8JHJVzaByF82iFcVVNbwc=;
        b=GLcr3gfP8Qcbse+eIjfHA5BEjjuWwZ2xMNlfYk0SPDVfb0To+K0o2n8aHCrTc/r9mM
         SAqwhvvJNa1pLN21Et9RIWM5uzuvjoF+DOnILDmk25/UzO14c0vmbzJXRGXNw2vRfYuh
         A9qFU/ztCY680GxLVbFVsHDRW6qb6WJKlbxiCeZTBVuu1g1HzycpvbOo8C+1n9mhG2Uq
         SbNvCxEoTEIVhEEiGH1QUL3oNKLlYUpUAJxFHEnPpK96qXPDhOIeFjep7K35IrnegA+7
         UJjFT7Zjm+OrcQmbgfPX1VqCeceT5WAvh1MtSsF1BLrt/NEFI9SJDev8yLhiYtbahCGH
         X/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kbHNoy/D3cNiXfyNj8YldC8JHJVzaByF82iFcVVNbwc=;
        b=26yu34I9qlLplFPJ9+g/971bh/N+1BKd5mTd9gacIMzI9P0W1Beb6N7cZQjYBx6Env
         uxn4/iUi70RJBdeeK8if8J/PFL+XQWzzObna1JV3pDSx2Ta44QsIoSPl9htSKOC3JLWJ
         w8vZON2aUue2FZtVKYj5Vu0lpLh6PQJ0AXwN5j4yKDt5hP7uA+FicRMrjD6nbGKxc9RF
         7Dg2cTlsgCqDVsfWP6cMIUBB1e2vsP0nkEMy1DpvQLl//vl9bEIENYebTnZJZelIEyQr
         alHQjyvtUjXh8hMHogP6KJgNh9sS4GrvxFY8CSXVolX2gqRDBgu+esO627md6aQL/cUe
         wQIA==
X-Gm-Message-State: AJIora8twSS/SLsamaTbHCuwIC73zmodc8YP/+3nPSYDxa5ymtGk0RgY
	ZbK8hr2VDABGsksW5nKaysY=
X-Google-Smtp-Source: AGRyM1vby6V9va2wYN3IhEcFFyfeIozhUXpiwFJiqDBM5YerqCL10fUuAGkozbnIrksOg/jQXafXlw==
X-Received: by 2002:a17:902:aa4b:b0:164:11ad:af0f with SMTP id c11-20020a170902aa4b00b0016411adaf0fmr19017670plr.54.1656647511480;
        Thu, 30 Jun 2022 20:51:51 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-70.three.co.id. [180.214.233.70])
        by smtp.gmail.com with ESMTPSA id cq13-20020a17090af98d00b001eeeb40092fsm5338799pjb.21.2022.06.30.20.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 20:51:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 05178102D1B; Fri,  1 Jul 2022 10:51:46 +0700 (WIB)
Date: Fri, 1 Jul 2022 10:51:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 5.15 00/28] 5.15.52-rc1 review
Message-ID: <Yr5vUlg+8cr3MTIQ@debian.me>
References: <20220630133232.926711493@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220630133232.926711493@linuxfoundation.org>
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
Cc: f.fainelli@gmail.com, torvalds@linux-foundation.org, slade@sladewatkins.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, patches@kernelci.org, Paul Mackerras <paulus@samba.org>, lkft-triage@lists.linaro.org, pavel@denx.de, akpm@linux-foundation.org, jonathanh@nvidia.com, shuah@kernel.org, sudipm.mukherjee@gmail.com, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 03:46:56PM +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.15.52 release.
> There are 28 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 

Successfully cross-compiled for arm64 (bcm2711_defconfig, GCC 12.1.0)
and powerpc (ps3_defconfig, GCC 12.1.0).

I get two warnings on powerpc build (vdso related):

  VDSO32L arch/powerpc/kernel/vdso32/vdso32.so.dbg
<prefix>/lib/gcc/powerpc64-unknown-linux-gnu/12.1.0/../../../../powerpc64-unknown-linux-gnu/bin/ld: warning: cannot find entry symbol nable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang; not setting start address
  VDSO64L arch/powerpc/kernel/vdso64/vdso64.so.dbg
<prefix>/lib/gcc/powerpc64-unknown-linux-gnu/12.1.0/../../../../powerpc64-unknown-linux-gnu/bin/ld: warning: cannot find entry symbol nable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang; not setting start address

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
