Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5052FDF33
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 14:45:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47F02y0p8qzF7MY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 00:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Xma2EgzK"; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47F00M2JGQzF55L
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 00:42:42 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id q28so8060603lfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 05:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7M8XWf+aSDuZ60G0e6vwA3UVsGqy52moHTICwgTGdKE=;
 b=Xma2EgzKd5UJeq5rjgYO/fzDuIC/Z9BgtHLjQs9+P5c/7/SXXE2ft7Hh+9GwYMfTE+
 9du2iMEIHbg/0YaeyOJHFdSyMe9GMWHFRsBrm9DXPfQ+JJIx7HZWZ8DNnGCQrqRN50pY
 8CiCBcoL8DRIdBmVshEqN4b0TeAtXiVOcIOLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7M8XWf+aSDuZ60G0e6vwA3UVsGqy52moHTICwgTGdKE=;
 b=bnpUmddxpp/1ck0/bYm6KF5jv/XoyRcYyd4GCDG1ZPdSTy0HwZQRq7+kR28VF15DD7
 jH+9RgAd9zEgpwTaR1ENzEGzDzIqnqo3XNjBLinYYqyFHKCIlB8KAEC5GZzcMilozmHw
 QtE9F1wIb+dzMoa/Fdod7bUpj2za1f/cefO4oRMI36OoTDDAZf8uiwdoObI74VWk0Ff3
 W1midz0ZJXuFAjILsTLsNPUFXxYaf7SlOItm6HoJawaDqswL8Jb/BWhWhGTyTN8bs6cw
 gWc09Jzb3Ib/fepsdgQzYKqmrOJH1VC/ugF9DJuAfZdkxiNg4/Sf8JaDrO+xFuDOvS2w
 +eDQ==
X-Gm-Message-State: APjAAAWTmaggRK3mSjejf/7lzmce+0mGiel89sNICcLAEY0Li+IedjnD
 uAqIheMDrSsnH5L+mdRlprRP0w==
X-Google-Smtp-Source: APXvYqwHN2Yvm0PLT+a7BaSRp11SLB5XySfnSHH3TF13kuNUSwKuiAUR9T+ZHUG0/JfvfbuuNjwNSA==
X-Received: by 2002:ac2:43a3:: with SMTP id t3mr11623097lfl.150.1573825355715; 
 Fri, 15 Nov 2019 05:42:35 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u4sm4063165ljj.87.2019.11.15.05.42.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Nov 2019 05:42:35 -0800 (PST)
Subject: Re: [PATCH v3 36/36] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
To: kbuild test robot <lkp@intel.com>
References: <20191101124210.14510-37-linux@rasmusvillemoes.dk>
 <201911152105.ojcD68ZC%lkp@intel.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <41765275-dbd5-406e-8ba1-bd0f92b737ee@rasmusvillemoes.dk>
Date: Fri, 15 Nov 2019 14:42:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201911152105.ojcD68ZC%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/11/2019 14.31, kbuild test robot wrote:
> Hi Rasmus,
> 
> Thank you for the patch! Perhaps something to improve:

Hello kbuild

Thanks for your reports, but this has already been fixed. Is there some
way to indicate to the kbuild bot that it should stop using resources on
a specific patch set? There's really no point in the bot doing lots of
builds and sending out reports for a series that has already been
superseded - and reviewers might easily think that the report concerns
the latest revision. Perhaps something like

kbuild-ignore: <msg id of cover letter of revision N-1>

in the cover-letter of revision N? Or is there some smarter (automatic)
way of doing this?

Rasmus
