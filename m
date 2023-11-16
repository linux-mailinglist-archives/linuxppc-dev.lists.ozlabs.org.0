Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5487EE4F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 17:10:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWQ3n0xR2z3dSm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 03:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.53; helo=mail-oo1-f53.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWQ3B64NJz307y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 03:09:41 +1100 (AEDT)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58a7d13b00bso540117eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 08:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700150978; x=1700755778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOcig5yxgC/BK7paxQilGIUUqt33158KEtjyWWD9YNQ=;
        b=mKasOQgrqsd9x5d6LinLEeVrlK5VV/Fj8W8Z3D3Rg5zHmJJW2hg1uBO7xpQReqWrcT
         XBc2vC9nf9fhplvHlxe5Xf1623BL5piNgraJE9qp/nM2xe1Cuo1aj8Aqhgr4XSex1DcD
         pREpE0f0vN3qgVX41CuhB8voB+urWMzeb22Qtsp2U1UmEoNA3uc10P//okq9FDy5fIlz
         L1RfJBJT+ND++at15R94POErV+mxLlhjEo4gpI9rC8FXxA1KgR4Q9VoELg225JFWTPXK
         WUiz/WOWHHX7T0KFEp6dh4Yc19WRss3FMhhRlNbj5VErYWsLs8TELadqcx6FGUmrU+dA
         WQIw==
X-Gm-Message-State: AOJu0YwD5U5CyppcCS8xPV2Lt7C6x6oYhRBuV2TIusyA0LUrQIGUBcss
	u1lHO5zCGArehfgfYmYMEqiedAOXuA==
X-Google-Smtp-Source: AGHT+IF+0KlzPHTSAYd8f0qoIp2VoeCx7YS9oDEEvzGxQfpBkJopgD5yuI9JsZg7rhEeaLCizK3xpA==
X-Received: by 2002:a4a:9248:0:b0:57d:e76d:c206 with SMTP id g8-20020a4a9248000000b0057de76dc206mr16692489ooh.1.1700150978164;
        Thu, 16 Nov 2023 08:09:38 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d8-20020a4aaa88000000b0058a133c3641sm611522oon.6.2023.11.16.08.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:09:37 -0800 (PST)
Received: (nullmailer pid 2416819 invoked by uid 1000);
	Thu, 16 Nov 2023 16:09:36 -0000
Date: Thu, 16 Nov 2023 10:09:36 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH 7/8] of: replace command line handling
Message-ID: <20231116160936.GA2376455-robh@kernel.org>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-8-danielwa@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110013817.2378507-8-danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, Tomas Mudrunka <tomas.mudrunka@gmail.com>, Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, Frank Rowand <frowand.list@gmail.com>, Sean Anderson <sean.anderson@seco.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, Pratyush Brahma <quic_pbrahma@quicinc.com>, linux-mips@vger.kernel.org, xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 09, 2023 at 05:38:11PM -0800, Daniel Walker wrote:
> Rob Herring has complained about this section of code. I removed the
> command line handling code to the cmdline.h header. This hopefully makes
> it easier for Rob to maintain it (at least he doesn't have to look at it
> directly anymore).

Well, my goal is to eliminate drivers/of/, but no.

> I would like to add a Kconfig option called
> OF_DEPRECATED_CMDLINE which an architecture would set if it uses this code.

Which architecture needs this code? Do we wait and see who complains 
their platform broke and then go set this option? In the meantime, new 
platforms started depending on the new behavior and setting the option 
may break them. So we can't have a kconfig option.

> This would allow a platform to use the cmdline.h and the added function
> directly and remove the Kconfig option. This change would be in a subsequent
> patch.

Per platform code handling the cmdline is completely the wrong 
direction. Per arch behavior is bad enough.

Rob
