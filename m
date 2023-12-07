Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C7D809223
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 21:16:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmQXh54h2z3vhL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 07:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.170; helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmQWt5gT9z3dSf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 07:16:10 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b8b0ced0f4so1162664b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Dec 2023 12:16:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701980168; x=1702584968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bk4U8w544A5cs9ptpOKuXEkNLJWX9biIDjwL9bsBG8k=;
        b=gsmL3dyjDUEv5s6ByU6AQmlaN01ZviPYB1BNDDiPSVMC7KLmugwcEtflopk10ze0Ss
         e79cOS46j18cN6C8GOxhC1YjRaAAj8fT9n6VMlgf/5BniSnOwpAy9A67LbTlusKjxrII
         I2Enl7T+Pe4pRIm7g4fLNE2RC9tfURLFLk9Etozy7x8VLQigpulIixdJkxod5tpr02GZ
         jDtTTzt0Fh5eS4y0eo+G+qaHLb+vi1KqVlryrqdsxNNJVoWjMtoJuIFjaeWHGQ06zpAO
         hClRryYZTELrUobfkMrkoJjdb1TYkmvEmoXRvf5GHyIxEsRAGciqlyZwOUmJHoAevpze
         PExg==
X-Gm-Message-State: AOJu0YzV8MksoLc5mZk3ypv2wtfX6NxJaDltZso3AV/Hi89VODs7A5tJ
	bk1ON8t5o8HopW24+rqEWQ==
X-Google-Smtp-Source: AGHT+IHHknHFsQe5zButja2bS0xh3H3H8KOzYKZLuMDkpBYA6fZz2jfZcEfUts5Z0OMZElHi1A2dBQ==
X-Received: by 2002:a05:6808:1391:b0:3af:63ac:2f96 with SMTP id c17-20020a056808139100b003af63ac2f96mr1625806oiw.6.1701980168014;
        Thu, 07 Dec 2023 12:16:08 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y16-20020a056808061000b003ae11a7ab80sm76101oih.47.2023.12.07.12.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 12:16:07 -0800 (PST)
Received: (nullmailer pid 3351122 invoked by uid 1000);
	Thu, 07 Dec 2023 20:16:06 -0000
Date: Thu, 7 Dec 2023 14:16:06 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/4] of: Add of_machine_compatible_match()
Message-ID: <170198016525.3351044.1591427782941011681.robh@kernel.org>
References: <e6cf01d41502b15e688b6f5aa5c3b68c62b8ac64.1701878821.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cf01d41502b15e688b6f5aa5c3b68c62b8ac64.1701878821.git.christophe.leroy@csgroup.eu>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 06 Dec 2023 17:13:32 +0100, Christophe Leroy wrote:
> From: Michael Ellerman <mpe@ellerman.id.au>
> 
> We have of_machine_is_compatible() to check if a machine is compatible
> with a single compatible string. However some code is able to support
> multiple compatible boards, and so wants to check for one of many
> compatible strings.
> 
> So add of_machine_compatible_match() which takes a NULL terminated
> array of compatible strings to check against the root node's
> compatible property.
> 
> Compared to an open coded match this is slightly more self
> documenting, and also avoids the caller needing to juggle the root
> node either directly or via of_find_node_by_path().
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/of/base.c  | 21 +++++++++++++++++++++
>  include/linux/of.h |  6 ++++++
>  2 files changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

