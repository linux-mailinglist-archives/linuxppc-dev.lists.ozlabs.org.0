Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D545D41D371
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 08:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKk1m5XGfz3bTR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 16:32:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=f7IsQBX9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=f7IsQBX9; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKk153YsWz2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 16:31:51 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so207279pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 23:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gyrLKv0De6yyODRa16jnm+SfxHUmqz6ZDHmNG+6Xi1g=;
 b=f7IsQBX97Is3sCYEG6NfEKFwqngoDf7mR6pgldjBnukgc10D6B6oFJBPxV1TFk3gvJ
 kuwWL+hxm0jFDp6oSHpEG7Ky5d1LVH0UnKJdM70Xdp6l4JaHz6l8PExmHzX8EWnuqWul
 NKE1ZLrXGLcKbDxR1QC+dYXUXD9hZ72YiqvZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gyrLKv0De6yyODRa16jnm+SfxHUmqz6ZDHmNG+6Xi1g=;
 b=U7HvsCk5BUb4ELf2yY4GVanoTvfbpIhTaoop9eRDZRmx8aOWaYj1tC8WJ4KCNF6VS2
 OuEI/BfwsK3L7wFrR8SjJihBpg967K9B14GmX2g3e2/AfRqg+9S1peN3lG1brxZntPpL
 1h6BfFSguwcgyuFIQaPNsFUeQt/rXmF/WMB4wNIxxkC9kbOSkappuzO02T9vjMMEDoFL
 5BE+1jaaCjHRQbAy6uJUw5KehhYO5qfeH2PCYFwG8FVnBQbmhpkaaoR9DEgOXsaW4Zeb
 ysZUaAbvenAq5xHdc/Ibx86iKi/KmMF5OmJdhDj1AdJG4gfdH6tsFj7bt/2RMsPN6BO1
 aCnA==
X-Gm-Message-State: AOAM5306SeomzhRax3KPFkyLO6K5SiC2d45vcJqpJ7WsG0psy++ZFR/Z
 rGyK1bFI4EvrI+63VNLlEqhosw==
X-Google-Smtp-Source: ABdhPJxj+BqBDKVAcE0XKUIsqsj9Cvta0er2MBa+BXV44ddtnpR2lYR2YnDfU8srW3rHSV9wrV4tqw==
X-Received: by 2002:a17:902:db02:b0:13e:683c:7523 with SMTP id
 m2-20020a170902db0200b0013e683c7523mr2706267plx.43.1632983508394; 
 Wed, 29 Sep 2021 23:31:48 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:7dea:cb77:bac7:65dc])
 by smtp.gmail.com with ESMTPSA id c8sm1633541pfj.204.2021.09.29.23.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 23:31:48 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Kai Song <songkai01@inspur.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/eeh:Fix some mistakes in comments
In-Reply-To: <20210927023507.32564-1-songkai01@inspur.com>
References: <20210927023507.32564-1-songkai01@inspur.com>
Date: Thu, 30 Sep 2021 16:31:45 +1000
Message-ID: <878rze60by.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: paulus@samba.org, Kai Song <songkai01@inspur.com>, oohall@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kai,

Thank you for your contribution to the powerpc kernel!

> Get rid of warning:
> arch/powerpc/kernel/eeh.c:774: warning: expecting prototype for eeh_set_pe_freset(). Prototype was for eeh_set_dev_freset() instead

You haven't said where this warning is from. I thought it might be from
sparse but I couldn't seem to reproduce it - is my version of sparse too
old or are you using a different tool?

>  /**
> - * eeh_set_pe_freset - Check the required reset for the indicated device
> - * @data: EEH device
> + * eeh_set_dev_freset - Check the required reset for the indicated device
> + * @edev: EEH device
>   * @flag: return value
>   *
>   * Each device might have its preferred reset type: fundamental or

This looks like a good and correct change.

I checked through git history with git blame to see when the function
was renamed. There are 2 commits that should have updated the comment:
one renamed the function and one renamed an argument. So, I think this
commit could have:

Fixes: d6c4932fbf24 ("powerpc/eeh: Strengthen types of eeh traversal functions")
Fixes: c270a24c59bd ("powerpc/eeh: Do reset based on PE")

But I don't know if an out of date comment is enough of a 'bug' to
justify a Fixes: tag? (mpe, I'm sure I've asked this before, sorry!)

All up, this is a good correction to the comment.

There are a few other functions in the file that have incorrect
docstrings:

 - eeh_pci_enable - missing parameter

 - eeh_pe_reset and eeh_pe_reset_full - missing parameter

 - eeh_init - missing parameter

 - eeh_pe_inject_err - wrong name for a parameter

Could you fix all of the docstrings in the file at once?

Kind regards,
Daniel

