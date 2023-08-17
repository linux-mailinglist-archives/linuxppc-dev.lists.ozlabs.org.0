Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EAC77F568
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 13:38:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EHVGSdB8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRNLZ646Vz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 21:38:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=EHVGSdB8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=twoerner@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRNKh730Jz2yVs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 21:37:59 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-40fe9c38800so46342871cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692272274; x=1692877074;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w31IQ5YkuY2ltFjG4ujyeSdaSaelLhYfdYtgX94Kf4E=;
        b=EHVGSdB8PoUrtTCoQFXL+MK+2xc+VAtPK4qKUYQwyzjM5DBPYrCKcPmzfgsVCpr4Cw
         Ebfe/1EtiuLdE0T/m99L0FuBCVRELNfBzDg+8n9tvhQCFZcqXLXhLlRZADiUn2n7I9wi
         WcyDAEnxKkc9AZGWAbHlBZhXrJlees9LEUFrOcTDcnWMHX8haQk3ATXoTp1E8lyFoyUd
         qwCEQreDh3Zyda1l8U2rFHCgUKoqVICpGSmUM+324uwRYvlnh+aZh8YKDdQb44WVTcle
         DDjNZQUIPKuVWpEK1CsvwtxQnouYWI485BC9zeteA/+abMq9yb1K/HOKACy1ztRQVn/+
         ilSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692272274; x=1692877074;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w31IQ5YkuY2ltFjG4ujyeSdaSaelLhYfdYtgX94Kf4E=;
        b=eztCuq7QZKC2VJ15psk9B7a/hhRKAIh70oErE7x4DbnwH4RjTwrQM5qHqoELHWO6tk
         SqmjuB6a+Zh05xFemFBo5KKqnFkJIOZgVF8cT+U3aTSBAjsmUA1FZyEiI/djrlQi411V
         bTUb+ZE04WdF0Ox4cCK0zbW8wUNzNYKXVlJuAvppwebKPmyjLIZaMTGO74vy1YwDYxVu
         NiEOGIdeUKB3vRBpwGUAoO4ZjC6dfcimnXBjoL30Sworfsg8tRE4ZZbLOsgiPxqjS/Kg
         2NhSdtAXj8gubSEg8IQE5LaKDKrQK9dItR/8A+a7A6A8smOhw2hcFzcuaDjgj/el/v+1
         b8Gw==
X-Gm-Message-State: AOJu0YyGsNP+IMn6gWB3dt3Cew4HjKpEB6e7c+4gaVEsHCsPz8oZsUaL
	ABM64efWH5V0zLPAhY7aD80=
X-Google-Smtp-Source: AGHT+IFI3+CHPpKULX2tpEaGS8l+bPl1rOS8rSkMfyrr656mErrSbDd1H1POnL349Ph/iwf4YakojA==
X-Received: by 2002:a05:622a:182:b0:40e:6f1:3d38 with SMTP id s2-20020a05622a018200b0040e06f13d38mr6443538qtw.8.1692272274313;
        Thu, 17 Aug 2023 04:37:54 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id ay24-20020a05622a229800b00403cc36f318sm5161369qtb.6.2023.08.17.04.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 04:37:53 -0700 (PDT)
Date: Thu, 17 Aug 2023 07:37:51 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 3/4] arch/mips/configs/*_defconfig cleanup
Message-ID: <20230817113751.GA25020@localhost>
References: <20230817025942.3209-1-twoerner@gmail.com>
 <20230817025942.3209-4-twoerner@gmail.com>
 <f7230276-decf-2248-52b2-c2de4a13647c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7230276-decf-2248-52b2-c2de4a13647c@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2023-08-17 @ 09:33:13 AM, Philippe Mathieu-Daudé wrote:
> Hi Trevor,
> 
> On 17/8/23 04:59, Trevor Woerner wrote:
> > Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> > was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
> > glue layer").
> 
> How 57f8e00d8a82 is related? Do you mean commit 9db5d918e2c0
> ("netfilter: ip_tables: remove clusterip target")?

Yes thank you. I'll send a v3.

> 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >   arch/mips/configs/ip22_defconfig        | 1 -
> >   arch/mips/configs/malta_defconfig       | 1 -
> >   arch/mips/configs/malta_kvm_defconfig   | 1 -
> >   arch/mips/configs/maltaup_xpa_defconfig | 1 -
> >   arch/mips/configs/rm200_defconfig       | 1 -
> >   5 files changed, 5 deletions(-)
> > 
> > diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
> > index 44821f497261..dc49b09d492b 100644
> > --- a/arch/mips/configs/ip22_defconfig
> > +++ b/arch/mips/configs/ip22_defconfig
> > @@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
> >   CONFIG_IP_NF_FILTER=m
> >   CONFIG_IP_NF_TARGET_REJECT=m
> >   CONFIG_IP_NF_MANGLE=m
> > -CONFIG_IP_NF_TARGET_CLUSTERIP=m
> >   CONFIG_IP_NF_TARGET_ECN=m
> >   CONFIG_IP_NF_TARGET_TTL=m
> >   CONFIG_IP_NF_RAW=m
> 
