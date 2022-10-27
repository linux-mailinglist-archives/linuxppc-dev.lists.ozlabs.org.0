Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECA60F102
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 09:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MycPL6jyzz3cDq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 18:14:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tz5mhNIF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Tz5mhNIF;
	dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MycNM6rtyz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 18:13:37 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id k2so2025163ejr.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MDxbGJrw6ODYsB7ZdyD4/84nlR1jBff/NV+grX5V3Bs=;
        b=Tz5mhNIF+/mpMprs4Y6gUBmDWkzyVobMrFo5/UU48sEYvCG2FuZ2moCLwMtBpu1uSk
         fckgdxFABiXavxRr7zTImcwYGTYN2MIY/gJRsxupEMvy5nJ/Q5r5MdR3qB3GLLRo14p/
         3rusLtUVUMllo4RQhR7IpNTOD2fLAWcFS+a8fFw6mIO60CBTPDyOurQnnTP+4vLZT6+G
         ttDQxem84uINniF9Ha279HH1ni9dtTODY7Fa6jZ51uMsvzMTfRBwQKWswy264TMs16pZ
         5ooze8s8MrIR0L+WDIVDVfKYYVglYkWDUn+CRk2ANAXvB+nLCRFjcjLDWOK0CikJBk+q
         uPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDxbGJrw6ODYsB7ZdyD4/84nlR1jBff/NV+grX5V3Bs=;
        b=uX4jKhEtJ2CTqSXA+TkDsCfK6sjXzwAmKzqUey+4w9WtKg0DrP+1ECvheJHFdLTtiw
         hL+cIWUnzrK4NmcXE719v6UROB/PY2K2c1/0kTneUuYmXN+e6Zi6PehrAG8gdt7nvHZf
         b5ymX7HSEDDErs/YH4//CgtZa5P9lKVyUdMYBa0JMgsix5SmYAGfhvw1RO4HgFzKXxe6
         GeTILEZx93g3cE2Cx3tLExeDPrUJSyuVxaJUxL83iSy93IgOkkfb2hN0cyHqM0lqKdnF
         1QgbCzqNzzchezaFbfmvQm6IGXMjHYVJ2vaZLzpE/yLbi7LY03SJw26AXHACqiWb0cnD
         Nv/A==
X-Gm-Message-State: ACrzQf3aZDQW87VdtmRrf4vZ0cS1mUXS4kPXuponKFnL57djXH2HJ9sY
	8kpEgYTackzy9tZURVB54h+cZel9CiOX+sDEnEo=
X-Google-Smtp-Source: AMsMyM7SJjmDy81uIp59EMVnOgbrq10xzO0jl74Jy5bcQqegFeZgsV1CK7dqzobdLEyH6QNX7eaGJJ3NXd7r0cBwTDQ=
X-Received: by 2002:a17:907:31c3:b0:770:852b:71a2 with SMTP id
 xf3-20020a17090731c300b00770852b71a2mr40960769ejb.557.1666854809089; Thu, 27
 Oct 2022 00:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221027060311.2549711-1-chancel.liu@nxp.com>
In-Reply-To: <20221027060311.2549711-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 27 Oct 2022 10:13:17 +0300
Message-ID: <CAEnQRZAr9HQ6LNAdwOnvAKUrazr1Q0CognQfd-+67Sfo1zoOHw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for SAI on i.MX93 platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, festevam@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, shengjiu.wang@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 27, 2022 at 9:14 AM Chancel Liu <chancel.liu@nxp.com> wrote:
>
> This patchset supports SAI on i.MX93 platform.
>
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX93 platform
>   ASoC: fsl_sai: Add support for i.MX93 platform
>   ASoC: fsl_sai: Specify the maxburst to 8 on i.MX93 platform

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
