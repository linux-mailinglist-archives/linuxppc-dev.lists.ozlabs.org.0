Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7845F10AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 08:58:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Jmp6QvXzDqsQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 18:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="SRkgLFaa"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477Jks67tVzF5fs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 18:56:19 +1100 (AEDT)
Received: by mail-lj1-x243.google.com with SMTP id n21so11317223ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 23:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xweVifWZ/YqguIkP3wRFBeRke8fVrDKetgEyLrXZK4A=;
 b=SRkgLFaa63C9qmcFdcf/s/KAPgAENphVcMUoM+vz9BIEzbf8c06I0Y1Hb5KXR42LXI
 G+i3eaIvU5rZa0kOrwSOnHxSXGm7OyVoMHx/peFrsf/OMV0cjkz5laiG3DlkVHfPCESn
 Pq9m25d73Eymy1sG4V505XAYT460OEuZk3NdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xweVifWZ/YqguIkP3wRFBeRke8fVrDKetgEyLrXZK4A=;
 b=dzV/gO6M8coyP4DVsLSHKBldryZKUFmAptSKjIMHBivbVOiPXfCMcAe03TljF6VOGG
 AlYRprjykLYw9hiSZjG1xvIRtPBOMCL0qmpYNDY97v3VOOYW2KroJa76HJLdlWtBMpKK
 uWtCvoo0JLywiFxKBzbZRcZJiDokWt9BHVlpLCQb3hQpd2R8wmdukw3Xo5fRMsjlpleu
 /IVJuDXE8tJinmx82T6iWBo0edoIhSX7QRER05Ge9U34WrxfyGVBAQlrbvRsBtPV8rmN
 WFCRyd1Uhh1nqz/ZDk/n8po/6CtcrOmsl6Ro4XtBxYZ7Z8kn4zknzr+Fvm/8rB8tTKhv
 sXNA==
X-Gm-Message-State: APjAAAVVjSEhCfAvyH50O6FA0pvGmWXDsZ0d7OLQtGvDlFchKWH2eqZ2
 tE5VeC18WjY4wv9aLCZZVhCXug==
X-Google-Smtp-Source: APXvYqx0UMAxK46d8rifJbbO0Iei8z4btT+kJJezWPrwvpREfmjRSXZQf51n+CDfByMCvypaqmMFbg==
X-Received: by 2002:a05:651c:105:: with SMTP id a5mr819866ljb.45.1573026973653; 
 Tue, 05 Nov 2019 23:56:13 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id d27sm11001361lfb.3.2019.11.05.23.56.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 23:56:12 -0800 (PST)
Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly depend on
 PPC32
To: Qiang Zhao <qiang.zhao@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-36-linux@rasmusvillemoes.dk>
 <4e2ac670-2bf4-fb47-2130-c0120bcf0111@c-s.fr>
 <VE1PR04MB6687D4620E32176BDC120DBA8F620@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <24ea27b6-adea-cc74-f480-b68de163f531@rasmusvillemoes.dk>
 <VE1PR04MB67686E14A4E0D33C77B43EA6917E0@VE1PR04MB6768.eurprd04.prod.outlook.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d8bf1d7f-b4c6-ef92-9fac-a3668ff37d8d@rasmusvillemoes.dk>
Date: Wed, 6 Nov 2019 08:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB67686E14A4E0D33C77B43EA6917E0@VE1PR04MB6768.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Scott Wood <oss@buserror.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/11/2019 07.16, Qiang Zhao wrote:

> 
> I tested your v3 patches on ls1043ardb which is arm64 for fsl_ucc_hdlc, it can work,
> Only it will put a compile warning, I also made a patch to fix it.
> I can send a patch to remove PPC32 dependency when I send my patch to support ARM64.
> Or I add my patch in your patchset.

Please send your patch (without whatever Kconfig hunk you needed to add)
with a proper changelog etc. If it looks reasonable (to me, reviewers of
the whole thing obviously also need to agree), I'll include it in my
series and drop adding the PPC32 addition to FSL_UCC_HDLC. Otherwise
I'll keep that and then you can later drop the PPC32 dependency.

Rasmus

