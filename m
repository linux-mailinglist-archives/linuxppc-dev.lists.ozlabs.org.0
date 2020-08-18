Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4FF248F10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 21:50:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWM305Q7bzDqN8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 05:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=TRDwzjpv; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWLyb0sqbzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 05:46:46 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id f10so9693721plj.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 12:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ylBQHIGj+jC+wMGAW+WiPoCXXWUQK9WgH6fcVkJtSBg=;
 b=TRDwzjpv9nxBnOSNPospJ+g2+lM26x7LrfAWZDm2gvCsnlrIhyGQMvVZ+nN+hu7WkX
 O/oo+OEjbZ2O9PmpH/HltGohEtaT4mQAuhz2mTIFpqD9eXrS0bAzADnlvGV+CZhjlU6D
 56u72kcTdOBo0I+2qXN79Jwyll3yLdhk3jnEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ylBQHIGj+jC+wMGAW+WiPoCXXWUQK9WgH6fcVkJtSBg=;
 b=JWNdVbNhLiC7Hreq4/RCVcqSLGZwJayiBug06ZwbSjfcXoVpn8pCY1d50guufAC5Qs
 p4vJIDhIfFOC91I+YUvOxvjf7pf3uXC1bVhbwc75Q9Vc8lfFUOHrNLH0jV5eSUmtWNeY
 oyVcZAibaOLblG7Qaie8IzYqY7i7DUBcX+A55am9Wn6Z0sKL64BwReLBbBAlIyQIyxBT
 Tu7wkFHPxq7AZz1aBcWluQ1D2P4ePrMiX3VKbxEyZ5ba4rVQcJzZ3ezswPivzcAKHwPh
 hwt1MgHnRVRAuz1U5XW7lRYf8TVSepOBnUNu9FXMpxsOFRn5nhtQ1GvF+VucJY7sroLy
 EjOw==
X-Gm-Message-State: AOAM532fLJdY8Q0UZtUh1wHrwaK2BoerRIoF9VlCM9utUTiS4bd4Rbh/
 8yxMJ1oJJn7zSwl9QVvwjL4mhA==
X-Google-Smtp-Source: ABdhPJxQpoCNUK9oxMIJWJCcBhsLXV3qhwZ1vk6NlnSPUfnJzoewH/BG+Ra1OO11qvGzKQ2Um0GcDw==
X-Received: by 2002:a17:90b:148b:: with SMTP id
 js11mr1261981pjb.234.1597780003259; 
 Tue, 18 Aug 2020 12:46:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j5sm25754806pfg.80.2020.08.18.12.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 12:46:42 -0700 (PDT)
Date: Tue, 18 Aug 2020 12:46:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/11] x86: remove address space overrides using set_fs()
Message-ID: <202008181246.A03BB9CEA@keescook>
References: <20200817073212.830069-1-hch@lst.de>
 <20200817073212.830069-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817073212.830069-10-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 17, 2020 at 09:32:10AM +0200, Christoph Hellwig wrote:
> Stop providing the possibility to override the address space using
> set_fs() now that there is no need for that any more.  To properly
> handle the TASK_SIZE_MAX checking for 4 vs 5-level page tables on
> x86 a new alternative is introduced, which just like the one in
> entry_64.S has to use the hardcoded virtual address bits to escape
> the fact that TASK_SIZE_MAX isn't actually a constant when 5-level
> page tables are enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Awesome. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
