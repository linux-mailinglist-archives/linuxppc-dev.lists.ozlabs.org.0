Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A638255BB4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 19:19:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWvbq5bkGz3cj4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 03:19:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.41; helo=mail-io1-f41.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWvbM0Xk7z3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 03:19:10 +1000 (AEST)
Received: by mail-io1-f41.google.com with SMTP id a10so10243554ioe.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 10:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZbXCZRn2tkLFwe+xZcXJJfs/8AzyxZ5b05h2ymqyzKo=;
        b=SfqP4dHVvNzNYWNC1ZCd/LnMs7KF1GnUNb0cwNbE/x+pyWgjXrYJwzu5d7HYGoqvHN
         m+8212r1VDFiHBOQfMajbiIEHXekW3gW6BvojxuvJBzPmuaXehtPGT4IKg0cMwR9PELx
         0TMBp2+y4/TVP7YkiLh6QQs450mBYmjbLss8brwqljClwxetMkCkAoE5oTRUyYs54Wti
         k5C2T1bEQka1xp2tmEK4rOO58Ge40he0N/8t9TpXrN+nnYd0YzmnZ2LTLszGTmt7lEpd
         0c//qWbZme8QFIprPvzSU/eyBTihFnD1mAUEo14lpDp6Hsqzskh9xaVMmgf3gORjKZ0n
         2l/A==
X-Gm-Message-State: AJIora9cCnYZt/JoRJ82TpUBSFw9vxNws1FJ/NUz+OU/gv0OgzlloVbl
	Zy/5eSlAwZ1RfG1vh2zuOA==
X-Google-Smtp-Source: AGRyM1tu45zAsL+jIjvM+WaRtbHInJM639b0nwxc8mz53mtK5ZKqGi9kXi5EUH4/ZuQxDwX/kohBUQ==
X-Received: by 2002:a6b:7711:0:b0:674:fcb2:1256 with SMTP id n17-20020a6b7711000000b00674fcb21256mr7103853iom.32.1656350347617;
        Mon, 27 Jun 2022 10:19:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id bm13-20020a05663842cd00b0032ead96ee5csm4863972jab.165.2022.06.27.10.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 10:19:07 -0700 (PDT)
Received: (nullmailer pid 2614372 invoked by uid 1000);
	Mon, 27 Jun 2022 17:19:05 -0000
Date: Mon, 27 Jun 2022 11:19:05 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>
Subject: Re: [PATCH v3 1/5] of: constify of_property_check_flags() prop
 argument
Message-ID: <20220627171905.GA2612959-robh@kernel.org>
References: <20220620104123.341054-1-clement.leger@bootlin.com>
 <20220620104123.341054-2-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620104123.341054-2-clement.leger@bootlin.com>
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
Cc: David Hildenbrand <david@redhat.com>, Paul Mackerras <paulus@samba.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ohhoon Kwon <ohoono.kwon@samsung.com>, Frank Rowand <frowand.list@gmail.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, YueHaibing <yuehaibing@huawei.com>, Bjorn Helgaas <helgaas@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>, devicetree@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, Laurent Dufour <ldufour@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Lizhi Hou <lizhi.hou@xilinx.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 20, 2022 at 12:41:19PM +0200, Clément Léger wrote:
> This argument is not modified and thus can be set as const.
> 
> Signed-off-by: Clément Léger <clement.leger@bootlin.com>
> ---
>  include/linux/of.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

I already applied this patch, don't resend it.

Rob
