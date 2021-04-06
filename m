Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A943556A7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 16:30:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF91258dWz30GV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:30:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r0xxTuGt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=bjorn.andersson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r0xxTuGt; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF90W0xm8z2yxn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 00:29:59 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so14778512otq.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Apr 2021 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hQuAvIyYNagg9JyQzFat1nJUGgDzxw1aFC3YiFQyaP8=;
 b=r0xxTuGtRNzYKu8nqiDI+DB5zSPkGLUpbLgQNQaGLGkgiwpw5MLANjpcq8MYaU0Hq2
 X8hOUDV1/oX/57fSmkTii8Bi2YNGL51y3lk4KSq6YfYCl9xD99P2sRCmzVmEG58kiwA4
 O05ho4ncMEJoZb938OZlbjiRKlK/EjE9hdYwjEFKVhW8aa5VjYe3kTtXHut1plKroA5I
 LK8jHR4u1E1zwzgU3jfR/e97UySNVfA6xtYPZDw8iliqxhEF4hMoTSEYpSrDe0cNmIoT
 5uGPRIzoOUAtKfyfQyD6S4s1F14OHjawgvJvGlkrf0GyIfoE+3kDp/xK61HSyY5bjF7+
 zvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQuAvIyYNagg9JyQzFat1nJUGgDzxw1aFC3YiFQyaP8=;
 b=s+Ld7ZanHI6yvW2qSAz56VMRiw9xpeSfVtAh4m8m9kqeW+BmNzEyrO/Ho4HkJ9X5jS
 2z6/P+cOtjUugVAeadBcB705PHj8EWWFzM9/cL1XJ52n6RbDKSGD0ua6FMB15CUbmwPZ
 g5ra1WRIKI0Qwjd4jxHN+DbgC9sta2+uDYEEvz85+rol5T9kTys+ooQjkafQuioY7SYj
 EGoet+s8gw4E/oqdCvnbzvd9Fam1ZcZSBbTEGJHk3Oe4MfUBXcQY87X4Nj/Mq7Rsj/zB
 8XGKv1GgedFIZPquve+msXbj17PiAk7HdaF23KTRn8W/zPR500nxByiUYrVvJwZcNEIm
 BKYA==
X-Gm-Message-State: AOAM530Oxj5ZyBqAmrHrLfK/DeKOce1PbAPWZ9LwMve7eJfxPL4gO98M
 oqcKdplgU8BL7cJxBajWQSPpiQ==
X-Google-Smtp-Source: ABdhPJwoj/Chr5jtxoWPmUxeZgdomq36W/mf+NaHAUUL9Ola9ZGgZLXjYEl5wLxRYiH8O3M4xb6gkw==
X-Received: by 2002:a05:6830:309d:: with SMTP id
 f29mr26342263ots.225.1617719396349; 
 Tue, 06 Apr 2021 07:29:56 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id d13sm4689185otk.74.2021.04.06.07.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 07:29:55 -0700 (PDT)
Date: Tue, 6 Apr 2021 09:29:52 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] kernel.h: Split out panic and oops helpers
Message-ID: <20210406142952.GG904837@yoga>
References: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406133158.73700-1-andriy.shevchenko@linux.intel.com>
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
Cc: Corey Minyard <cminyard@mvista.com>, linux-hyperv@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-remoteproc@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Corey Minyard <minyard@acm.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Iurii Zaikin <yzaikin@google.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Joerg Roedel <jroedel@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Josh Triplett <josh@joshtriplett.org>,
 "Steven Rostedt \(VMware\)" <rostedt@goodmis.org>, rcu@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, openipmi-developer@lists.sourceforge.net,
 Vlastimil Babka <vbabka@suse.cz>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Eric Biederman <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 06 Apr 08:31 CDT 2021, Andy Shevchenko wrote:

> kernel.h is being used as a dump for all kinds of stuff for a long time.
> Here is the attempt to start cleaning it up by splitting out panic and
> oops helpers.
> 
> At the same time convert users in header and lib folder to use new header.
> Though for time being include new header back to kernel.h to avoid twisted
> indirected includes for existing users.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
