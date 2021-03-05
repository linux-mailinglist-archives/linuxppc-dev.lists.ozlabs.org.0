Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D590632E335
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 08:50:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsKfW62Xcz3dD1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 18:50:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=UCpKUlDd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::330;
 helo=mail-wm1-x330.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UCpKUlDd; dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsKf266Ssz30LX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 18:50:15 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id l22so570649wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 23:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=34MO9BuNF7F2D8p7lT8uAN48AKZC5qU22L/kUK0Cseg=;
 b=UCpKUlDdbkld20jWtwrwVCl7fvEY6WPGRRsN1CB24w6SrACDyLQeF+0KpUwSufp3YT
 9WoPwpgISjPcPWvxBrM/6ytz9usiqT9m9TNExzwzd6nr1L8djRj9A7nx/xwhgRxHUru8
 331l6SF/BAAoZipJvjb+HiJvAmf8BUOFFu8FdLH9S4vq75xt3FJh1LvDvMgj+bceMpgA
 gZLSQwAgLZxUkwNupmgyOLrkiLglh9Mb+8Ldgtu2hHlagbXcSUfZ4gPam78CQmA5ew33
 LiUS8oIvQkdFjSBhOGONOwzlROvD6aHu0UPCI9Oe1EgN9t7irTEu7mzMmB4xrVjNqFbK
 H9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=34MO9BuNF7F2D8p7lT8uAN48AKZC5qU22L/kUK0Cseg=;
 b=R90S0UgkEB/erVrThPFEt1ERgCpM+e8tvjeCSxO8J5DTZGvIGMYbsTVGE1nUW3Mp57
 gL+w+ECRIQsvp6sL8jPK1+uEEAu8tqAMhwsaT8CvQXRAbEBuD+3BX3UNqlamHSLJiFFg
 8V2hivqfaU4YzbSRT80EZFQLhEqK7ixPySVohDMIjhlGrYLMvdpE2dPoYDuGXwKG3LrA
 rftP9ovn4ejYRKAKxdGXwQXj0l6lYkjU4ba+TJCFp0omDsnUtBpg1tRK8ngD9XbOnzgt
 tB1MsiOjOjRAbwxsjNRUndeUzp1+D3mcfUjfgeCWLIIyPBR/jQBkbGL+NISyEnTeR0fm
 kssA==
X-Gm-Message-State: AOAM532A8EViI1ziTcOuUxg2ThSnxRvI+wriPBfj4NKeRdx2FRVqDJZJ
 lL3PHgN0LIcE/H3NfoQ2R7aNPg==
X-Google-Smtp-Source: ABdhPJyPb8+35mv6yBH4gRG7/7g7KebfRs2DVmGhcMB86J4Quui2MrYV40cVB5G7wkw/KCGpk5iRFA==
X-Received: by 2002:a1c:195:: with SMTP id 143mr7514538wmb.147.1614930609184; 
 Thu, 04 Mar 2021 23:50:09 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:15:13:adef:40fb:49ed:5ab6])
 by smtp.gmail.com with ESMTPSA id j26sm3009633wrh.57.2021.03.04.23.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 23:50:08 -0800 (PST)
Date: Fri, 5 Mar 2021 08:50:03 +0100
From: Marco Elver <elver@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
Message-ID: <YEHiq1ALdPn2crvP@elver.google.com>
References: <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com>
 <874khqry78.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874khqry78.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, linuxppc-dev@lists.ozlabs.org,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 05, 2021 at 04:01PM +1100, Michael Ellerman wrote:
> Marco Elver <elver@google.com> writes:
> > On Thu, Mar 04, 2021 at 12:48PM +0100, Christophe Leroy wrote:
> >> Le 04/03/2021 à 12:31, Marco Elver a écrit :
> >> > On Thu, 4 Mar 2021 at 12:23, Christophe Leroy
> >> > <christophe.leroy@csgroup.eu> wrote:
> >> > > Le 03/03/2021 à 11:56, Marco Elver a écrit :
> >> > > > 
> >> > > > Somewhat tangentially, I also note that e.g. show_regs(regs) (which
> >> > > > was printed along the KFENCE report above) didn't include the top
> >> > > > frame in the "Call Trace", so this assumption is definitely not
> >> > > > isolated to KFENCE.
> >> > > > 
> >> > > 
> >> > > Now, I have tested PPC64 (with the patch I sent yesterday to modify save_stack_trace_regs()
> >> > > applied), and I get many failures. Any idea ?
> >> > > 
> >> > > [   17.653751][   T58] ==================================================================
> >> > > [   17.654379][   T58] BUG: KFENCE: invalid free in .kfence_guarded_free+0x2e4/0x530
> >> > > [   17.654379][   T58]
> >> > > [   17.654831][   T58] Invalid free of 0xc00000003c9c0000 (in kfence-#77):
> >> > > [   17.655358][   T58]  .kfence_guarded_free+0x2e4/0x530
> >> > > [   17.655775][   T58]  .__slab_free+0x320/0x5a0
> >> > > [   17.656039][   T58]  .test_double_free+0xe0/0x198
> >> > > [   17.656308][   T58]  .kunit_try_run_case+0x80/0x110
> >> > > [   17.656523][   T58]  .kunit_generic_run_threadfn_adapter+0x38/0x50
> >> > > [   17.657161][   T58]  .kthread+0x18c/0x1a0
> >> > > [   17.659148][   T58]  .ret_from_kernel_thread+0x58/0x70
> >> > > [   17.659869][   T58]
> > [...]
> >> > 
> >> > Looks like something is prepending '.' to function names. We expect
> >> > the function name to appear as-is, e.g. "kfence_guarded_free",
> >> > "test_double_free", etc.
> >> > 
> >> > Is there something special on ppc64, where the '.' is some convention?
> >> > 
> >> 
> >> I think so, see https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DES
> >> 
> >> Also see commit https://github.com/linuxppc/linux/commit/02424d896
> >
> > Thanks -- could you try the below patch? You'll need to define
> > ARCH_FUNC_PREFIX accordingly.
> >
> > We think, since there are only very few architectures that add a prefix,
> > requiring <asm/kfence.h> to define something like ARCH_FUNC_PREFIX is
> > the simplest option. Let me know if this works for you.
> >
> > There an alternative option, which is to dynamically figure out the
> > prefix, but if this simpler option is fine with you, we'd prefer it.
> 
> We have rediscovered this problem in basically every tracing / debugging
> feature added in the last 20 years :)
> 
> I think the simplest solution is the one tools/perf/util/symbol.c uses,
> which is to just skip a leading '.'.
> 
> Does that work?
> 
> diff --git a/mm/kfence/report.c b/mm/kfence/report.c
> index ab83d5a59bb1..67b49dc54b38 100644
> --- a/mm/kfence/report.c
> +++ b/mm/kfence/report.c
> @@ -67,6 +67,9 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
>  	for (skipnr = 0; skipnr < num_entries; skipnr++) {
>  		int len = scnprintf(buf, sizeof(buf), "%ps", (void *)stack_entries[skipnr]);
>  
> +		if (buf[0] == '.')
> +			buf++;
> +

Unfortunately this does not work, since buf is an array. We'd need an
offset, and it should be determined outside the loop. I had a solution
like this, but it turned out quite complex (see below). And since most
architectures do not require this, decided that the safest option is to
use the macro approach with ARCH_FUNC_PREFIX, for which Christophe
already prepared a patch and tested:
https://lore.kernel.org/linux-mm/20210304144000.1148590-1-elver@google.com/
https://lkml.kernel.org/r/afaec81a551ef15345cb7d7563b3fac3d7041c3a.1614868445.git.christophe.leroy@csgroup.eu

Since KFENCE requires <asm/kfence.h> anyway, we'd prefer this approach
(vs.  dynamically detecting).

Thanks,
-- Marco

------ >8 ------

diff --git a/mm/kfence/report.c b/mm/kfence/report.c
index 519f037720f5..b0590199b039 100644
--- a/mm/kfence/report.c
+++ b/mm/kfence/report.c
@@ -43,8 +43,8 @@ static void seq_con_printf(struct seq_file *seq, const char *fmt, ...)
 static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries,
 			    const enum kfence_error_type *type)
 {
+	int skipnr, fallback = 0, fprefix_chars = 0;
 	char buf[64];
-	int skipnr, fallback = 0;
 
 	if (type) {
 		/* Depending on error type, find different stack entries. */
@@ -64,11 +64,24 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
 		}
 	}
 
+	if (scnprintf(buf, sizeof(buf), "%ps", (void *)kfree)) {
+		/*
+		 * Some architectures (e.g. ppc64) add a constant prefix to
+		 * function names. Determine if such a prefix exists.
+		 */
+		const char *str = strstr(buf, "kfree");
+
+		if (str)
+			fprefix_chars = str - buf;
+	}
+
 	for (skipnr = 0; skipnr < num_entries; skipnr++) {
-		int len = scnprintf(buf, sizeof(buf), "%ps", (void *)stack_entries[skipnr]);
+		int len = scnprintf(buf, sizeof(buf), "%ps", (void *)stack_entries[skipnr]) -
+			  fprefix_chars;
 
-		if (str_has_prefix(buf, "kfence_") || str_has_prefix(buf, "__kfence_") ||
-		    !strncmp(buf, "__slab_free", len)) {
+		if (str_has_prefix(buf + fprefix_chars, "kfence_") ||
+		    str_has_prefix(buf + fprefix_chars, "__kfence_") ||
+		    !strncmp(buf + fprefix_chars, "__slab_free", len)) {
 			/*
 			 * In case of tail calls from any of the below
 			 * to any of the above.
@@ -77,10 +90,10 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
 		}
 
 		/* Also the *_bulk() variants by only checking prefixes. */
-		if (str_has_prefix(buf, "kfree") ||
-		    str_has_prefix(buf, "kmem_cache_free") ||
-		    str_has_prefix(buf, "__kmalloc") ||
-		    str_has_prefix(buf, "kmem_cache_alloc"))
+		if (str_has_prefix(buf + fprefix_chars, "kfree") ||
+		    str_has_prefix(buf + fprefix_chars, "kmem_cache_free") ||
+		    str_has_prefix(buf + fprefix_chars, "__kmalloc") ||
+		    str_has_prefix(buf + fprefix_chars, "kmem_cache_alloc"))
 			goto found;
 	}
 	if (fallback < num_entries)
