Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740D1809221
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 21:16:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmQXC0BDTz3dTP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 07:16:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.44; helo=mail-ot1-f44.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmQWk2rLzz3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 07:16:02 +1100 (AEDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d7e56f6845so899152a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 12:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701980160; x=1702584960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cQkDdnzepc6At1PDW9suBRg6vKVDLjVoo/BJeFLK1g=;
        b=ByvBCyREei6rckyjkkgg2oVsrJOFUinXksH+C6bAXv5EMll+fN7cjuEGRPAJ/8TYkk
         RSAcj0y6pfWxL5CsewaNq5erTYSfXvV+smlY0E341XusDG/THzbyoI76VfAG8pbWuS//
         nwXjjV45YLMxYWRSL7eBXVaEiJJFvXC329XuVhDFg+qmns/Xv99O65i58hzhSBkh1tTG
         rfwzmNTsW6aMMjMvajSuL3ard286O1QSb/4HiKaX9Z0fWSQiynTBlF+MlVukiAVfhSp4
         fYC/BjgS5+bV3YB9JPvFdsqFzZevIZjy4DYCXVv9WyemJrJF2AhzbbgnnC7Y0W8Q1x3y
         o4LA==
X-Gm-Message-State: AOJu0YyWUeARTxqrmW2k01SQDunioyyTmK9xPOegL6tlFIQzU4MlHCep
	zR+cOfwiYLEhK32CbZv3ew==
X-Google-Smtp-Source: AGHT+IFa/J/UWM9ONWck/IBcMt0yTQGD1q3vexfwZIVq0OcVUIh+Jxedgy1LdSaEjeGZFUduSZ6QrA==
X-Received: by 2002:a9d:6d85:0:b0:6d8:7ffc:d878 with SMTP id x5-20020a9d6d85000000b006d87ffcd878mr2821370otp.16.1701980160090;
        Thu, 07 Dec 2023 12:16:00 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r17-20020a056830135100b006d98106678esm83811otq.18.2023.12.07.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:15:59 -0800 (PST)
Received: (nullmailer pid 3350935 invoked by uid 1000);
	Thu, 07 Dec 2023 20:15:58 -0000
Date: Thu, 7 Dec 2023 14:15:58 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 4/4] powerpc: Stop using of_root
Message-ID: <20231207201558.GB3348285-robh@kernel.org>
References: <e6cf01d41502b15e688b6f5aa5c3b68c62b8ac64.1701878821.git.christophe.leroy@csgroup.eu>
 <b2f23f982ef414f0eaf7c55ccb79f30bec3c86cd.1701878821.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2f23f982ef414f0eaf7c55ccb79f30bec3c86cd.1701878821.git.christophe.leroy@csgroup.eu>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 06, 2023 at 05:13:35PM +0100, Christophe Leroy wrote:
> Replace all usages of of_root by of_find_node_by_path("/")
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/secure_boot.c        |  8 ++++++--
>  arch/powerpc/kexec/ranges.c              |  8 +++++---
>  arch/powerpc/mm/drmem.c                  | 10 +++++-----
>  arch/powerpc/mm/numa.c                   |  6 ++++--
>  arch/powerpc/platforms/52xx/efika.c      |  4 +++-
>  arch/powerpc/platforms/pasemi/pci.c      |  4 +++-
>  arch/powerpc/platforms/pseries/lparcfg.c |  6 +++++-
>  arch/powerpc/platforms/pseries/setup.c   | 12 +++++++++---
>  8 files changed, 40 insertions(+), 18 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
