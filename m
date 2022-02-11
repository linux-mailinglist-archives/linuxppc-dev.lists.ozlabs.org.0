Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1394B1AB8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:52:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvw7p28Qnz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:52:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mYDb9T7V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=mYDb9T7V; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvw780rt0z3cQM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 11:52:03 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 h7-20020a17090a648700b001b927560c2bso6094043pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D3EjEoLgjS5BYa16RZ5JcaZGfnj2NCy9e6R/DsxWvD0=;
 b=mYDb9T7V8vVpb4vvbK6zkA0h1yevImaISwFUxjrIIoz62k/wF/zDHu5zFn6qzE7kUp
 87hdaz0kZHUo4I24hP9Ypim/bw0UCqkm9B/sqsnXEiXBwa22hYfKiyLvWUhlNNdLK62v
 jkpZSMR3Qi6h9sWFPRK7ScuIfziA7yI6AE748=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D3EjEoLgjS5BYa16RZ5JcaZGfnj2NCy9e6R/DsxWvD0=;
 b=D6HJuFKvlsbyvnXVsX2B5kjgBpTBgBbY7XTJbXZrXOnpF2+uh5IgdFB6s3P7yXmBSu
 +8Cxxg2Yqir3NlObHbJkQvEQSpLP+2Rn60uXAEpOPxZEnkgdBQuvDyiJNs1/3WuOj6yc
 Kvi35v1ZQ8sQHuXrJiCU7gKul5C8Ddvl11yCysPRqLnZhJW4Aa2038t+yPZsmgpHNqbs
 hKLp9d/cnUeHGRsR46aEMfrF8jcQnMlgf4hQOo6+DbaxlBS97bLoiiLvWQqsSYPekwW6
 R0N2tAQUE/gUFoVxkIgWzEduxEhlNG4nMpGZ0zIHIVjWC0kksmiezPEkptKS/5xJETvP
 LS8w==
X-Gm-Message-State: AOAM532TL1oUBlnaSyCFBNx1cEv0l2ytGu6YM7ALwjzWrF2pRYyFBYNK
 dXJEKd5oZMTZejIn5nc1ba4QNA==
X-Google-Smtp-Source: ABdhPJw/vLSGOWe5ccZEegSZ0CyTgYC43nd3Y1R3YkYl+lBMWAImTOS4id0LQup7bw2RNv5XlqIpWQ==
X-Received: by 2002:a17:90a:5206:: with SMTP id v6mr71812pjh.220.1644540721159; 
 Thu, 10 Feb 2022 16:52:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z22sm24478493pfe.42.2022.02.10.16.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:52:00 -0800 (PST)
Date: Thu, 10 Feb 2022 16:51:59 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 01/12] powerpc: Move and rename func_descr_t
Message-ID: <202202101651.E6AACB3D4F@keescook>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <637a9a11263afa216fdfa7fb470a54479c67c61c.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <637a9a11263afa216fdfa7fb470a54479c67c61c.1634457599.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 17, 2021 at 02:38:14PM +0200, Christophe Leroy wrote:
> There are three architectures with function descriptors, try to
> have common names for the address they contain in order to
> refactor some functions into generic functions later.
> 
> powerpc has 'entry'
> ia64 has 'ip'
> parisc has 'addr'
> 
> Vote for 'addr' and update 'func_descr_t' accordingly.
> 
> Move it in asm/elf.h to have it at the same place on all
> three architectures, remove the typedef which hides its real
> type, and change it to a smoother name 'struct func_desc'.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I like the name. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
