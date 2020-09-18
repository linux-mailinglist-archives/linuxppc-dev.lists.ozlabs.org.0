Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8D2708B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 00:02:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BtSVp0vtgzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 08:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=dloeuJ4R; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BtSS94z69zDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 08:00:06 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k14so4236943pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pJBH8ZPv0AF6T9qJPivtnFQaJz8js4rTDIDjnmZyXeI=;
 b=dloeuJ4RhaMSkvzvysZ/KZ60uKiixW7yqpP4zHkEBZEOj0pCe6aPREHiRMfjC9a2sT
 NDRDXB+ZvN5NCDfLObc3yaHXCoMy1bgChNi0/bDSzXyKsXtqJdhEsyrk6Y1YRocaD3Wu
 iLl7HHFzt9nFe0Yx0aT6Ga95BI79loU3yy9TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pJBH8ZPv0AF6T9qJPivtnFQaJz8js4rTDIDjnmZyXeI=;
 b=GVk11oJXSa8s5xl65Gf1ZnOoEwUbZIKiKQJdm7Bm4V5G/p8Xppum3ovTAMwaL+q9jW
 gJLKsDULsmOVBJN3ei5Pbfu/U4c1Eu+e01Se7gTxtFV7up78B1tv1QLMsx3vI9cuIMyd
 A0KsWT1PTRcM/wLUWkN/ON781WIv6c3UfWZ7uCT1kj1ZL69EvQ6EOyNxACdxkDt8kVQ5
 QJh8WCGiHsxL8jG6uLYZyvBHXq81lWN1fWdDOqBhowXxNNqDWSHuAeGVNVStCVoYOYx0
 +LZu+jDHELakL+8B1bTxm5Q1knPJMPj+tEz4bcSulF15dyaYn5mlmKLIWe0AAZWhSjgb
 BBmA==
X-Gm-Message-State: AOAM533ZSpQEHfq9UP62Blr/dhu5gtXgYgArd+pwaPY+hD8wfwuUCJJf
 RNg42hfBZO22BsnjxsvBoXxVcg==
X-Google-Smtp-Source: ABdhPJxQ2z9WWrqYHnkpapKDChSxrmWeesm9BvocAEdZLydIidTw4TJZtfj98NCNFgmR+CrH9w3MBw==
X-Received: by 2002:a63:4d48:: with SMTP id n8mr29596199pgl.70.1600466402906; 
 Fri, 18 Sep 2020 15:00:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l14sm3727747pjy.1.2020.09.18.15.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 15:00:02 -0700 (PDT)
Date: Fri, 18 Sep 2020 15:00:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian Brauner <christian.brauner@ubuntu.com>
Subject: Re: [PATCH 03/15] selftests/seccomp: mips: Define SYSCALL_NUM_SET
 macro
Message-ID: <202009181459.C22A1EC7@keescook>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-4-keescook@chromium.org>
 <20200915155546.ht4vo7nqswxrgymb@wittgenstein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155546.ht4vo7nqswxrgymb@wittgenstein>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 15, 2020 at 05:55:46PM +0200, Christian Brauner wrote:
> On Sat, Sep 12, 2020 at 04:08:08AM -0700, Kees Cook wrote:
> > Remove the mips special-case in change_syscall().
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  tools/testing/selftests/seccomp/seccomp_bpf.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > index 1c83e743bfb1..02a9a6599746 100644
> > --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> > +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> > @@ -1742,6 +1742,13 @@ TEST_F(TRACE_poke, getpid_runs_normally)
> >  # define ARCH_REGS		struct pt_regs
> >  # define SYSCALL_NUM(_regs)	(_regs).regs[2]
> >  # define SYSCALL_SYSCALL_NUM	regs[4]
> > +# define SYSCALL_NUM_SET(_regs, _nr)			\
> > +	do {						\
> > +		if ((_regs).regs[2] == __NR_O32_Linux)	\
> > +			(_regs).regs[4] = _nr;		\
> > +		else					\
> > +			(_regs).regs[2] = _nr;		\
> > +	} while (0)
> 
> I think that
> 
> # define SYSCALL_NUM_SET(_regs, _nr)				\
> 	do {							\
> 		if (SYSCALL_NUM(_regs) == __NR_O32_Linux)	\
> 			(_regs).regs[4] = _nr;			\
> 		else						\
> 			(_regs).regs[2] = _nr;			\
> 	} while (0)
> 
> would read better but that's just a matter of taste. :)

That's how I started originally, but when I realized that I'd have to
reorganize SYSCALL_NUM() too, it seem best to have minimal churn, so I
left it open coded here, since that's how it needs to be in the end.

> Looks good!
> Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Thanks for the reviews!

-- 
Kees Cook
