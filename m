Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE216DB7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 01:09:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zFfR2BwwzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 09:09:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AGx8NaFc"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zFd32PtHzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 09:07:51 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id j11so9399332pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ksCK6MwbJy5hkcrjGKRfLybVWED7pfrtN2x342eMfl8=;
 b=AGx8NaFcW0nNXm6FRSDK6XWn3BprVlDb7i1+/3oeRJ/rTpK2ryo/87zzPV5opLP7xf
 39wPiWYVVrh822ck/V2weclYk6f7buLBNfCsV7AaAs/jVezQ9fX6c5+Ib/Cs+xAWW9yu
 OwaApcdTNA+9aDNHpR+2WuMuAs0x4ZCBsFrnyKuD98zkTsrYOhwzMAfhS7onbHITyBti
 EP2BdBCb2EFWw3NHM3JT4nY0Lew6PhPWbwiXnW49AkZmhZApjQVIyVeE5frTrY2Kgxj1
 37Z3lmZG0Xjhzz/PtQ7BjhTj8SXaXK8I6AUi5D9lSE7zPFhoYSel/z4ojks6JAIv5F8n
 fyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ksCK6MwbJy5hkcrjGKRfLybVWED7pfrtN2x342eMfl8=;
 b=Dip0luh7SwzJJygl3f7c/bpeN0dcy/0hnRkmQXBTJ831OcWsidaWGnmEjCeNIh3uA+
 KyQTyLJ38ecXs+INm3EcK3Gx9bNQExZ2oDQjNqdm7WEXPF0w0N88jkR68gwZwtswA4da
 Q1LP+lpQwr1I/A675zu/m0PykEJ19Ie2e8pgPLTTKUexvzMLGDuNI9YXqa8XJ7uhs425
 JlN067DGqhBSJ2ZDE93W1U9kDCzDFUXySAAFhaEoMwRcdqZ/cc4vnhgkeDs9y6g0GUoM
 FJckZWpsNz8uHZvQ9Amdn4AGvWe13hDK2MbcoJ813gNziKXSqIpn/cLoryjyBpfvoRqS
 DrLw==
X-Gm-Message-State: APjAAAXkfq+IGonydovUmbrO2a0tjBlV1cGKlrTGKf7SqI+rpKVsFBt0
 FhQoRjh7XN/VIGn3KOCMt2U=
X-Google-Smtp-Source: APXvYqwl7+tg2Ewiz/jP4v1lUDMe2zgpvST8mIlQ/beigoour/174+exi07SmbvBzd/rqbmEpqcJJg==
X-Received: by 2002:a63:ed16:: with SMTP id d22mr9290179pgi.35.1557270468115; 
 Tue, 07 May 2019 16:07:48 -0700 (PDT)
Received: from localhost ([2601:640:2:82fb:19d3:11c4:475e:3daa])
 by smtp.gmail.com with ESMTPSA id l68sm19547511pfb.20.2019.05.07.16.07.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 May 2019 16:07:47 -0700 (PDT)
Date: Tue, 7 May 2019 16:07:46 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] powerpc: restore current_thread_info()
Message-ID: <20190507230746.GA19259@yury-thinkpad>
References: <20190507225121.18676-1-ynorov@marvell.com>
 <20190507225856.GP23075@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507225856.GP23075@ZenIV.linux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Yury Norov <ynorov@marvell.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07, 2019 at 11:58:56PM +0100, Al Viro wrote:
> On Tue, May 07, 2019 at 03:51:21PM -0700, Yury Norov wrote:
> > Commit ed1cd6deb013 ("powerpc: Activate CONFIG_THREAD_INFO_IN_TASK")
> > removes the function current_thread_info(). It's wrong because the
> > function is used in non-arch code and is part of API.
> 
> In include/linux/thread_info.h:
> 
> #ifdef CONFIG_THREAD_INFO_IN_TASK
> /*
>  * For CONFIG_THREAD_INFO_IN_TASK kernels we need <asm/current.h> for the
>  * definition of current, but for !CONFIG_THREAD_INFO_IN_TASK kernels,
>  * including <asm/current.h> can cause a circular dependency on some platforms.
>  */
> #include <asm/current.h>
> #define current_thread_info() ((struct thread_info *)current)
> #endif

Ah, sorry. Then it might be my rebase issue. I was confused because Christophe
didn't remove the comment to current_thread_info(), so I decided he
removed it erroneously.
