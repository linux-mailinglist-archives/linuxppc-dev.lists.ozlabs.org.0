Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C088A558F72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 06:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTk405B3Mz3cfF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 14:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L8Dq1Fdr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=frowand.list@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L8Dq1Fdr;
	dkim-atps=neutral
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTk3L4Ylfz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 14:02:21 +1000 (AEST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-101ec2d6087so2224423fac.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 21:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=C38bDs4A1JfWnOqmeYv1BTYo2A48cLLwdXZTR1jlAA0=;
        b=L8Dq1FdrKjrt2f3l9xNpRgivDT0iEZF2jKKlVhypq6/jyWdJZBKRHLkcEjI7nujJ0z
         RbPakAI00kU0HoXSksL29V5uU+OUHrYEeHt13nzKvqjpkfVj0bNVzmaFpbD21vD7/qm3
         UpP7ouJO5jmt38uinYPE+7fQXzRJBz6hbCXgpH/PIzlBDmPiuoy7I1W6M6KUVe8HPRJ8
         ulMhnTjMEwSeMnRn9SbNkWWjaaDMrJ3QOpa8KFAvoA9kc/OtgWS1VuN5PVrKWXmbOVks
         5vkK/l1T/Q6c4jC30zLoFYAxZ6MVDhYflfNRyqGeF6rIujLD2nejHeZeIZA2zC/FlxQn
         Zjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=C38bDs4A1JfWnOqmeYv1BTYo2A48cLLwdXZTR1jlAA0=;
        b=m6Z9QRdWnm1JFbWZMWYGA3emJNqKi/TbQ8sX9SMtAIzyXrmnFy+x3N9cKapLK5sZ+1
         nxGPiwMPWxAvY8a5vEICp12jMbSnunzIS4fGgIxjqpzxgEkLE/vV0Zlr+lliUwZG923j
         j85F8x7meibJ2h2hlZEEd8b6vldOwUsSXzFluFsplgF0JXd8nF0MrwjJE+hRZID3IAvT
         tMQZoaD0XPstL7/kEB/iSO18FKPmS9Wv8aw4CrDH5xcLuTMWSaKm3Nmqa5P6FCit42Hs
         3hZeKzVW04hlB43q75XURRDzNzJHZZFAxppKJkRRMGm95NcYI+2hAdxrqZLUT7ucbpgu
         1prw==
X-Gm-Message-State: AJIora/fETnxQg9M3iJjmywTtGaxDMyFG8iKAhS1t3Vt+asSBRZFwmOa
	klgRkqNwl0m5gjMpJ7aOtW0=
X-Google-Smtp-Source: AGRyM1uun8x0X75mHWSZsw5pqOFbPlSawWvIGWizmZFosmSrSxO1YfFuABH899fP3OhK9Cw5i1rnjg==
X-Received: by 2002:a05:6870:ea01:b0:f1:e631:ed6f with SMTP id g1-20020a056870ea0100b000f1e631ed6fmr819106oap.89.1656043339416;
        Thu, 23 Jun 2022 21:02:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:742c:47ee:54c0:bcc7? ([2600:1700:2442:6db0:742c:47ee:54c0:bcc7])
        by smtp.gmail.com with ESMTPSA id 14-20020a9d080e000000b0061691239049sm848171oty.60.2022.06.23.21.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 21:02:18 -0700 (PDT)
Message-ID: <fc6ff5a8-75c3-fcc9-5809-ffbea058d4c7@gmail.com>
Date: Thu, 23 Jun 2022 23:02:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 0/5] of: add of_property_alloc/free() and
 of_node_alloc()
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Nathan Lynch <nathanl@linux.ibm.com>, Laurent Dufour
 <ldufour@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 YueHaibing <yuehaibing@huawei.com>
References: <20220620104123.341054-1-clement.leger@bootlin.com>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <20220620104123.341054-1-clement.leger@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org, Lizhi Hou <lizhi.hou@xilinx.com>, Allan Nielsen <allan.nielsen@microchip.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org, Horatiu Vultur <horatiu.vultur@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry for the lack of response, it's been a busy week.  I will get to this
soon.

-Frank

On 6/20/22 06:41, Clément Léger wrote:
> In order to be able to create new nodes and properties dynamically from
> drivers, add of_property_alloc/free() and of_node_alloc(). These
> functions can be used to create new nodes and properties flagged with
> OF_DYNAMIC and to free them.
> 
> Some powerpc code was already doing such operations and thus, these
> functions have been used to replace the manual creation of nodes and
> properties. This code has been more than simply replaced to allow using
> of_node_put() rather than a manual deletion of the properties.
> Unfortunately, as I don't own a powerpc platform, it would need to be
> tested.
> 
> ---
> 
> Changes in V3:
> - Remove gfpflag attribute from of_node_alloc() and of_property_alloc().
> - Removed allocflags from __of_node_dup().
> - Rework powerpc code to only use of_node_put().
> - Fix properties free using of_node_property in OF unittests.
> 
> Changes in V2:
> - Remove of_node_free()
> - Rework property allocation to allocate both property and value with
>   1 allocation
> - Rework node allocation to allocate name at the same time the node is
>   allocated
> - Remove extern from definitions
> - Remove of_property_alloc() value_len parameter and add more
>   explanation for the arguments
> - Add a check in of_property_free to check OF_DYNAMIC flag
> - Add a commit which constify the property argument of
>   of_property_check_flags()
> 
> Clément Léger (5):
>   of: constify of_property_check_flags() prop argument
>   of: remove __of_node_dup() allocflags parameter
>   of: dynamic: add of_property_alloc() and of_property_free()
>   of: dynamic: add of_node_alloc()
>   powerpc/pseries: use of_property_alloc/free() and of_node_alloc()
> 
>  arch/powerpc/platforms/pseries/dlpar.c        |  62 +-------
>  .../platforms/pseries/hotplug-memory.c        |  21 +--
>  arch/powerpc/platforms/pseries/reconfig.c     | 123 ++++++----------
>  drivers/of/dynamic.c                          | 137 ++++++++++++------
>  drivers/of/of_private.h                       |  19 ++-
>  drivers/of/overlay.c                          |   2 +-
>  drivers/of/unittest.c                         |  24 ++-
>  include/linux/of.h                            |  24 ++-
>  8 files changed, 191 insertions(+), 221 deletions(-)
> 

