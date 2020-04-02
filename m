Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6619C834
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:40:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tVhY378CzDqj4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 04:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=nZ1tW5cd; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tVfT3ykWzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 04:38:39 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id a23so1614722plm.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RFmh29f6b4RBzzdEqK+shU1sG1CQYZR2pnjNQ4GHtz4=;
 b=nZ1tW5cdLTnrJHaCLa8YsIRPpPlRPFpL0uEDPZq5C6IXi8B6PIPo0V44IWP7UdveOK
 n8a3uVYEAnP6svRPOtPbYL0aA5JwtdXCSFnOxGztaGHqGpIZK4nPVqLn4Y8SLax0u0Vu
 OIiaVcpyAYJwCEhpCFe9d5+dT+2UWC9a1H+y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RFmh29f6b4RBzzdEqK+shU1sG1CQYZR2pnjNQ4GHtz4=;
 b=foTq7WEFci7J/qj7JKsP826H4JpjLTDavqguSLRTSPkb5u562QUbdmhSiY/oF9DUZK
 p0Q/RHQz+poYCvW0DS1pk/HNjpON+yvHBz4LOv5IlNDeGEltRqtCP8DeccMx1QYxf3Tz
 RJ5DqC1+HRGaoZJj2LhJDqHwlXaLYStzxymkCE3vuBQhCdI0XfOtAgtmfcrdOo4+fdJb
 NlxkoIn11hLRHIGQWVtM2oQtg2L+//EdMTLYsEsyG74Txnz8ZSbKgsVtRWTLPkisTOap
 Oj+rdE3mXd69NNkCQK2g79G47WsAoCqaBQkbS2trV7D1jxljxfRda+hzYMZBfxIpWUE8
 /+Mw==
X-Gm-Message-State: AGi0PuZ84w1tArgNRsX2wroMWgrlBrw4730AU2QOIk+jQoazeoJOiHaN
 PllwJ/RZcZsNH5G1OIGXo7UuEw==
X-Google-Smtp-Source: APiQypLF9RC8sBLfTXy7MiRa5PFnHgJKJWkxNSBkHJjYskdTsqaZauwH5Q8uNxCHLFh5f+ETA6Q6wg==
X-Received: by 2002:a17:90b:3653:: with SMTP id
 nh19mr5043955pjb.154.1585849115305; 
 Thu, 02 Apr 2020 10:38:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id h71sm3711857pge.32.2020.04.02.10.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 10:38:33 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:38:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH RESEND 1/4] uaccess: Add user_read_access_begin/end and
 user_write_access_begin/end
Message-ID: <202004021035.573BBBE9AA@keescook>
References: <27106d62fdbd4ffb47796236050e418131cb837f.1585811416.git.christophe.leroy@c-s.fr>
 <20200402162942.GG23230@ZenIV.linux.org.uk>
 <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e21b65-0e2d-7ca5-7518-cec1b7abc46c@c-s.fr>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, airlied@linux.ie,
 hpa@zytor.com, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 daniel@ffwll.ch, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 07:03:28PM +0200, Christophe Leroy wrote:
> > What should we do about arm and s390?  There we want a cookie passed
> > from beginning of block to its end; should that be a return value?
> 
> That was the way I implemented it in January, see
> https://patchwork.ozlabs.org/patch/1227926/
> 
> There was some discussion around that and most noticeable was:
> 
> H. Peter (hpa) said about it: "I have *deep* concern with carrying state in
> a "key" variable: it's a direct attack vector for a crowbar attack,
> especially since it is by definition live inside a user access region."

I share this concern -- we want to keep user/kernel access as static as
possible. It should be provable with static analysis, etc (e.g. objtool
does this already for x86).

Since this doesn't disrupt existing R+W access, I'd prefer the design of
this series as-is.

-- 
Kees Cook
