Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F762EC55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 04:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ND2Jy4Xdsz3dv8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 14:27:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=McHst7l/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=McHst7l/;
	dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCwrM5hxcz3bk8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 10:20:35 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id jr19so2161221qtb.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 15:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
        b=McHst7l/f7KmgETncU4ax8Cz1+X0pDSSDz+NpOo85KKRbSTGF3eq2IAlrIRy/FELSJ
         Y7C0SIlyu5mGQyhzPLIjsCXMOXUrzD5TZH+dJcbaF2LHrVuVcof8hyWOL3D9pZZx4wAD
         8LINQRolzJh6QXumNwKV51jsDIdF9sMEo4+5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0Zl62KafxDJ8AwrDahi1bqb4Xk/32bDlmDdXpQC/2I=;
        b=nT0RhmTYgxiNgs9uzLHygOXbwvCGXwtydQmRyY6askTvJ3m5abl4eXJ3+/bbnotjJ4
         /T53bKIlUySHrc4fDdouagjb+ljNCVB9kk+68YpVOGzqos9/TUTVEcTMe5D1XZQxpVR1
         9D/61rxviS9jBlGDTSnR1D9/fI4FqlIw2p1zMq1asoBDJ8NXqgD5uPJjNaW7hBRKyRLx
         8wYeHXSa4lIEn2KBypfzEqsS0iApYJ3/vy5MOz75tA/PLs/KvRQMmWDRrDWOSPCdD7Nf
         qxUVsVUrKxpaybaRpMgan5+fofw+LcpsQ9/D/tBWUbtKFh7QLIKt2qK7fgc03RBxwuEh
         1sdg==
X-Gm-Message-State: ANoB5pnq1cXp1ZawSdgtIXeTvlQWNLy11laU3T6P9vUpJMoAH1D01F0P
	veas2Zgjd4x2bv2LChYD/0cf30TZOwHcCA==
X-Google-Smtp-Source: AA0mqf6/5cUSyW/yMIjHbdwnI/YPQgnRKKsCpNX7jtypQRXuyhxQJthKAa3hwK+EZvp1K2+dZGcHQQ==
X-Received: by 2002:ac8:7fc3:0:b0:35d:42d0:25f with SMTP id b3-20020ac87fc3000000b0035d42d0025fmr4576204qtk.18.1668727220162;
        Thu, 17 Nov 2022 15:20:20 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id fg22-20020a05622a581600b003a580cd979asm1133722qtb.58.2022.11.17.15.20.17
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 15:20:17 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id s18so686568qvo.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 15:20:17 -0800 (PST)
X-Received: by 2002:ad4:4101:0:b0:4b1:856b:4277 with SMTP id
 i1-20020ad44101000000b004b1856b4277mr4665856qvp.129.1668727216978; Thu, 17
 Nov 2022 15:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20221116102659.70287-1-david@redhat.com> <20221116102659.70287-21-david@redhat.com>
 <CAHk-=wgtEwpR-rE_=cXzecHMZ+zgrx5zf9UfvH0w-mKgckn4=Q@mail.gmail.com> <202211171439.CDE720EAD@keescook>
In-Reply-To: <202211171439.CDE720EAD@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Nov 2022 15:20:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Message-ID: <CAHk-=wjykbz-4xVTWF7vkvGJnFoTSXNVeMzfsXaLnGm3CRd8rQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 20/20] mm: rename FOLL_FORCE to FOLL_PTRACE
To: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Nov 17, 2022 at 2:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> Oh, er, why does get_arg_page() even need FOLL_FORCE? This is writing the
> new stack contents to the nascent brpm->vma, which was newly allocated
> with VM_STACK_FLAGS, which an arch can override, but they all appear to include
> VM_WRITE | VM_MAYWRITE.

Yeah, it does seem entirely superfluous.

It's been there since the very beginning (although in that original
commit b6a2fea39318 it was there as a '1' to the 'force' argument to
get_user_pages()).

I *think* it can be just removed. But as long as it exists, it should
most definitely not be renamed to FOLL_PTRACE.

There's a slight worry that it currently hides some other setup issue
that makes it matter, since it's been that way so long, but I can't
see what it is.

             Linus
