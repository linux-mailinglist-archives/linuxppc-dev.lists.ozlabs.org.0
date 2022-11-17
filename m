Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D762EC54
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 04:26:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND2Hy2qVpz3cLh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 14:26:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fy4BdUGW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fy4BdUGW;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCwLp3Q6vz3bbb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 09:58:24 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id g62so3189263pfb.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gB4fu8WxG++brcac1xEx09Jo8IsSv6jaRuNq5hahL+I=;
        b=Fy4BdUGW9a1WNEtqYFLG188KBaVxCW7dlYHJCJYByhqbYzWtrREex26XefPtc0cld6
         YCRtECSkUML5k6sMmax4MrQy/8YHDQGVY6nBvl6IgyA0kq1FCwf8z9yqhcxsos46Zhwv
         H1rDgpoCNHoreRPMRNhXYMHZ9u7/T1h/SC+nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB4fu8WxG++brcac1xEx09Jo8IsSv6jaRuNq5hahL+I=;
        b=27VTN2DJKVTIEzyxe/JkFUksgz8cit9LDQFuXnt42xqYyGxgpEVJH8NNMGUhXi3ORx
         Z9O1ZL2xRGsite+4beqaNM7/Azj5RoK3Yt6j5NfxMD9GF+AamrEFqPXJktm7XuJBwWoe
         5RQiOjFBYoYGySDXHx+NjyZiKgOfWWzgW68MFVaABTZpvO8oamNg6izo9J5fOIGSI/y0
         jrl6ptnt/mSGuE7LzXrkKBU5yqW3wEUlqITwFk7FRCOzfXAU6PBBgtTxEmTrZ0kZspM0
         HvOGdX4srP65LYX0+d2EWN/62H4YSkC76z41MWFTxOvyLjs0kXRk0rpE5zFM3BrvMTQZ
         4XGA==
X-Gm-Message-State: ANoB5pkzHb37360WKDw5ZdgklnbGw4tW2czMAypBm50afZFKXh1qJDJu
	fiFsHsEYAgf0Lka6699NtAwhgA==
X-Google-Smtp-Source: AA0mqf6WctuXnFpA5+6mUDbrkWFd9cOPvCXdH+vpFiVVPZ82O749B2W9Fe6xlTKz0BNICgCat8tmyw==
X-Received: by 2002:aa7:80d0:0:b0:565:c4e2:2634 with SMTP id a16-20020aa780d0000000b00565c4e22634mr5143922pfn.0.1668725901160;
        Thu, 17 Nov 2022 14:58:21 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u139-20020a627991000000b00561cf757749sm1677934pfc.183.2022.11.17.14.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:58:20 -0800 (PST)
Date: Thu, 17 Nov 2022 14:58:19 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
Message-ID: <202211171439.CDE720EAD@keescook>
References: <20221116102659.70287-1-david@redhat.com>
 <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com>
X-Mailman-Approved-At: Fri, 18 Nov 2022 14:25:36 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, Will Deacon <will@kernel.org>, Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org, Paul Moore <paul@paul-moore.com>, linux-rdma@vger.kernel.org, David Airlie <airlied@gmail.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Vla
 stimil Babka <vbabka@suse.cz>, Matt Turner <mattst88@gmail.com>, Kentaro Takeda <takedakn@nttdata.co.jp>, linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, etnaviv@lists.freedesktop.org, Nicholas Piggin <npiggin@gmail.com>, Richard Weinberger <richard@nod.at>, Alex Williamson <alex.williamson@redhat.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <richard.henderson@linaro.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Oleg Nesterov <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org, "Serge E. Hallyn" <serge@hallyn.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alex
 ander Viro <viro@zeniv.linux.org.uk>, linux-perf-users@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-security-module@vger.kernel.org, Eric Biederman <ebiederm@xmission.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <l.stach@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 10:16:34AM -0800, Linus Torvalds wrote:
> There _are_ also small random cases too, like get_cmdline(). Maybe
> that counts as ptrace, but the execve() case most definitely does not.

Oh, er, why does get_arg_page() even need FOLL_FORCE? This is writing the
new stack contents to the nascent brpm->vma, which was newly allocated
with VM_STACK_FLAGS, which an arch can override, but they all appear to include
VM_WRITE | VM_MAYWRITE.

-- 
Kees Cook
