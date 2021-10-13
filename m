Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EA42B83C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk1z4Kwnz2yZt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:00:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FiIeotai;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FiIeotai; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk1140s5z2yxB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 17:59:33 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id f21so1169684plb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vbWxJyRJEHl/HPjM18MBc4UW86o71YsmCHifvlg0XFw=;
 b=FiIeotaiLZjM5LcunU4X/qzxsxhiMl3Xdcp8Hagae/2B4EU8WMw4MmFESoq+m4xoy5
 1RtT3T/31PEKI2vY2Tuy0ECZWJm2gtlT1dFb4pu97SBjhfoTxL8ILyqBgYnzle8RjvnL
 v8B1ZGhYla9IZDDHAcvan/WtrWuHJjHO0ZOYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vbWxJyRJEHl/HPjM18MBc4UW86o71YsmCHifvlg0XFw=;
 b=lZAVFt724Vzu6A8cYFO/416pXOHkey7PT0yN8GL7AkD5X9VX2szmceuHUpWsc2lc0j
 qNfH+qB7AsPb9E0fNOSGzPvZ/rrug7jFXMVM9z0wAhqg0DXfmfRddnCTr+Y89YH1IrwQ
 Hr5tQYhe7sFtoGnfVf51bcAMGVzbW0OqG3NF4FNn7MfH1RFyiKmplzll6lZ/2X3f0wOn
 reeBf3zbhkcArP4OjlmxufxFXUfzJB5Yl7Kr8AuvHr+Wn3akBeu9Sr5805+XpDDvMv9B
 s+28jpFUEFbhj11c4hriCifl7PNzyePSzWg1YZv7CJ1Jgu3Q+O8v1kV23d8HFjk/+wtN
 b3uw==
X-Gm-Message-State: AOAM530qQx/2DZQp/Wig2b8CqOt8KAzILsfyP0NyQ8i5sPqfz0ij+nQl
 FQ7j5DNli8/NaL78CBu92jbwWA==
X-Google-Smtp-Source: ABdhPJxg04sat7HJ6MeMqkBhaVP4fUMmZ0z8e5MnK+cAmqQm529EHMPH7/ru9Ly6sAXLV57TWcF7BA==
X-Received: by 2002:a17:90a:680c:: with SMTP id
 p12mr11265943pjj.33.1634108371296; 
 Tue, 12 Oct 2021 23:59:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id nl18sm5422324pjb.3.2021.10.12.23.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:59:31 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:59:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 02/10] powerpc: Rename 'funcaddr' to 'addr' in 'struct
 ppc64_opd_entry'
Message-ID: <202110122359.6A69C54DB@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <892715d6f05fdf6ca80cf88a51a9e55298b68c4a.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892715d6f05fdf6ca80cf88a51a9e55298b68c4a.1633964380.git.christophe.leroy@csgroup.eu>
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

On Mon, Oct 11, 2021 at 05:25:29PM +0200, Christophe Leroy wrote:
> There are three architectures with function descriptors, try to
> have common names for the address they contain in order to
> refactor some functions into generic functions later.
> 
> powerpc has 'funcaddr'
> ia64 has 'ip'
> parisc has 'addr'
> 
> Vote for 'addr' and update 'struct ppc64_opd_entry' accordingly.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reasonable. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
