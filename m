Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D23142B909
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTkdr5Gwlz2yw0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:28:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GbpddXjN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=GbpddXjN; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTkd75ZXRz2yMg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:27:23 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id g5so1221666plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=x1Ebcu4q4sojvBysK6NeK0lyMBpBy7CX3GptiOMMz40=;
 b=GbpddXjN019bQRXDXQj4kZZgfvpNA9cDk7qQs6S3vPQNLW6lsorFYr9g4BlfG8r+MH
 umScAii8wL7g7/Mjovb3dW34qcZ1nUli4UtJdgQXZQOIkLCSHGM6H+Tkjgjdjt6bH5od
 a+gBBBgtnRHNxhWlxeaphPwHSjnFpwXmEJLl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=x1Ebcu4q4sojvBysK6NeK0lyMBpBy7CX3GptiOMMz40=;
 b=jJjTiXpHR3pPh3DKlrrEKy4iwffhmkYdjkZWHFrbWLVpFoH5nswTipIudq1+tLnDig
 fsAvqB7RZvuEozPWKaxjMBPw8E6wni4LHs3tg3tmbHknxvesEmVyBt8PmfA72i0tV+EE
 rRij9WZ/62T+Nlg1ZNnFXV62D6Dy6ugQ9ThxlrT2Y0oGfEOWS/rszmzoj79WNVcTGPwX
 ohinjX/6LsSeBdW1jw/I2Py3dKdVeGAYZ+cGuUwx2VceEdgGxA72JpTyNxgs2rqsUn+U
 ClWUhrG0Nun8IJP9yFbpRHXKEsycoObCeOxOsbKWxoEBhpesAfUNu5O1WeE8kEfm1mGZ
 fBWQ==
X-Gm-Message-State: AOAM533vnwtRmQ42MM+10IdDl+PdoBMq3b/tlIWyrOa2MRtHfqUQl6s9
 KlndJ1C+Qp/9VCZJxBrG0DSp1lJlKHdlrQ==
X-Google-Smtp-Source: ABdhPJy6bp8C1wfggIt0cRU76okfX2vFeGYaLqCkxWcLL3pwaky7370uXkBgC65bEOt7+KLhBK5Nag==
X-Received: by 2002:a17:90a:bb82:: with SMTP id
 v2mr11607404pjr.57.1634110040417; 
 Wed, 13 Oct 2021 00:27:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id fh3sm4933022pjb.8.2021.10.13.00.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:27:20 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:27:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 05/10] asm-generic: Define 'funct_descr_t' to commonly
 describe function descriptors
Message-ID: <202110130026.0AB963F82@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <02224551451ab9c37055499fc621c41246c81125.1633964380.git.christophe.leroy@csgroup.eu>
 <202110130001.11A50456@keescook>
 <cf0e465e-e678-692c-3ca5-fde70ba4fc97@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf0e465e-e678-692c-3ca5-fde70ba4fc97@csgroup.eu>
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

On Wed, Oct 13, 2021 at 09:23:56AM +0200, Christophe Leroy wrote:
> 
> 
> Le 13/10/2021 à 09:01, Kees Cook a écrit :
> > On Mon, Oct 11, 2021 at 05:25:32PM +0200, Christophe Leroy wrote:
> > > We have three architectures using function descriptors, each with its
> > > own name.
> > > 
> > > Add a common typedef that can be used in generic code.
> > > 
> > > Also add a stub typedef for architecture without function descriptors,
> > 
> > nit: funct_descr_t reads weird to me. why not func_desc_t ? Either way:
> 
> func_desc_t already exists in powerpc. I have a patch to remove it as it is
> redundant with struct ppc64_opd_entry, but I didnt' want to include it in
> this series.
> 
> But after all I can add it in this series, I'll add it in v2.

Ah-ha! That works for me. :) Thanks!

-Kees

-- 
Kees Cook
