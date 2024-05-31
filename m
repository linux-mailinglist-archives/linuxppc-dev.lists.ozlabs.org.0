Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0BA8D6352
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 15:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrPXG3yzpz3dCy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 23:45:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.41; helo=mail-ej1-f41.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrPWp1pGcz3cXW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 23:45:24 +1000 (AEST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a635a74e031so267534366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 06:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163120; x=1717767920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3LqnX8YkUUtB1kD1Ll7Jmk8MItxME9oifH6QIK/CfU=;
        b=jPq4VnD/vWyvxjmM9Zfy7UNcDBWLSCa2W8PvLwWRv015JeU5YXOWebULfmfDrjluM2
         /vRpevo0mcCsFbZfL+57t8AWSnqOPvcx05p033U0w3XclS0FxziAU2X+Np6KkIkATCYF
         EO7oUa6iS4zJwDBi0SaD7LK1j5M9b40eR+w7NP9mYv0+GmTJ3F6eq5PKdi5qTDiQlL1b
         M9MWU6kccIy51ZlKKGcNb9RsZGBKJ2THZHTVPdJ1Rt1DodOudL/SczFIJZifpEc41Qh3
         rJQMbrdsJjOQ6riiBKjHTTKzpTiRESjqY0PsMy4EFn8sw0sxYA0W3+V0ckD4aicHNHKP
         0Bpg==
X-Forwarded-Encrypted: i=1; AJvYcCXykaHnNq+j+CR2dAFglXftOTzxetSizAHzzOU1xwQOpu0HETgGfFVIGs0xhGHKtH1kjprXRNwoeF7z6NfPcc6Z+4/pklxWIyBROjNxQw==
X-Gm-Message-State: AOJu0Yxccm6l9EkVxJOJ9v72L8eOCR50tfGNxSkdiH7Arsdp19DFAa/P
	dr3ZQ58iUiL/3lnIAvZPCqHmFgBQIOzah7yH5eu23JNPHE5AkF4K
X-Google-Smtp-Source: AGHT+IElFyBSAI6S/E826dIh6VDjLFRW6Tmzj3OQ1JCSAsG3973P4vXIE/IDXXHeUbVfQGLKlDwd7A==
X-Received: by 2002:a17:907:595:b0:a63:598:88fd with SMTP id a640c23a62f3a-a6821d62fdcmr142570366b.62.1717163120085;
        Fri, 31 May 2024 06:45:20 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-003.fbsv.net. [2a03:2880:30ff:3::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a685e3cccd4sm60312166b.179.2024.05.31.06.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:45:19 -0700 (PDT)
Date: Fri, 31 May 2024 06:45:13 -0700
From: Breno Leitao <leitao@debian.org>
To: nathanl@linux.ibm.com
Subject: Re: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in
 sys_rtas()
Message-ID: <ZlnUaZiXM3Fuy+0g@gmail.com>
References: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2024 at 07:44:12PM -0500, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
> 
> Smatch warns:
> 
>   arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
>   spectre issue 'args.args' [r] (local cap)
> 
> The 'nargs' and 'nret' locals come directly from a user-supplied
> buffer and are used as indexes into a small stack-based array and as
> inputs to copy_to_user() after they are subject to bounds checks.
> 
> Use array_index_nospec() after the bounds checks to clamp these values
> for speculative execution.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Reported-by: Breno Leitao <leitao@debian.org>

Thanks for working on it. 

Reviewed-by: Breno Leitao <leitao@debian.org>

> +	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
> +	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);

On an unrelated note, can nargs and nret are integers and could be
eventually negative. Is this a valid use case?

Thanks!
