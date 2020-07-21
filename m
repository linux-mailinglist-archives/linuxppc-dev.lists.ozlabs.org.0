Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC52277B2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 06:43:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9mF85KGXzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 14:43:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=itQNcKcS; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9mCP3lN4zDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 14:41:51 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id s190so3663611ooa.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 21:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/5pmXlWsJseKxXD6BxsrJbesRRq6vXEEnjoC2olkcJo=;
 b=itQNcKcSj6tex9SlCrDZD4lhxnrGwDST2/8O+DVZaSQs564N9CMcNzyPpsTyA0jTkR
 afIFXIwqpZI5bjcg4sfVJBAwY2yAjfVKmRFgKCLAt34WyqneB1Hot7yMOMsBxV+rYw6T
 e9iFv+fiZGwd0/QhczASKtL2HyaZH78UZp3TjGV+STJBatTKCPwfbgNs2fhut8SeBqAF
 7GSDw1noOaTnB1sdxtbYV7AJLlCvegEGMR5hCiuFBWUGTZb6rnFu+rhXaxsGmgpJtyqk
 +eoikz7+lpaWVYk52prZ6CBH9tSnNvCqW58bBsooGfMrv17155Drm5X5Ay3pXZd7NiEw
 nWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/5pmXlWsJseKxXD6BxsrJbesRRq6vXEEnjoC2olkcJo=;
 b=bKL7I+laXNXHt0EYb3noU/nDXUy8d/rLzjaSLYWVDjwl98QHg7mftQ2OHcn3lnH6XX
 pBJV1eiTHlc726UwiAs1pmcMVf9knj8h7PPJnCAduzFyTrF1GUUB45lNMIuBbPULr1SF
 Nua+KPiJXEKvniPFPvy3RLaxPes7cfCCzC5HPCr+NJMUimYUqUP928Z+XB09pZuxAluY
 U/8Glbou5c4rXwd3rchZmoG0eIqciJzb6h+Pz4IOMOKQf/OJldv1xJDULn5UJvGc7vee
 2vynjcDWxZYRyWNDe/v2QO/I66ifCC0VHpmzUCXC83ugabmnS6n6P6uMO3TZw4N/qxSt
 T8tA==
X-Gm-Message-State: AOAM531dds3xadT4r+JF/Ycbv/O8Qf4J1MhJLtzynY7+P9Zy8mwW4AzZ
 tzNf4t1jIhLeGPweWULZS0HjjS1l7sWrXe3q/xQ=
X-Google-Smtp-Source: ABdhPJy8DDGlOWOc/9xhy6NZJHEyUsA6TY6rafZcdpXx0vcoakbBYRsfzyFHj+7MFSlWso0YwQPNqm6fpec3KGGmibI=
X-Received: by 2002:a4a:ba8b:: with SMTP id d11mr22545884oop.80.1595306508490; 
 Mon, 20 Jul 2020 21:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-10-ravi.bangoria@linux.ibm.com>
 <CACzsE9r0acLUkV35mVxy1AEK_xObs0yz+fD6UdbNdc6uz=Buqw@mail.gmail.com>
 <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
In-Reply-To: <ccfcf488-0ec9-1737-8368-a848de1d72d1@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 21 Jul 2020 14:41:37 +1000
Message-ID: <CACzsE9q5YtT_bXOpw9cri_UCxziW_FRbCpcViANaZwui0hjDqw@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] powerpc/watchpoint: Return available watchpoints
 dynamically
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, miltonm@us.ibm.com,
 mikey@neuling.org, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 1:57 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
>
>
> On 7/20/20 9:12 AM, Jordan Niethe wrote:
> > On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
> > <ravi.bangoria@linux.ibm.com> wrote:
> >>
> >> So far Book3S Powerpc supported only one watchpoint. Power10 is
> >> introducing 2nd DAWR. Enable 2nd DAWR support for Power10.
> >> Availability of 2nd DAWR will depend on CPU_FTR_DAWR1.
> >>
> >> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> >> ---
> >>   arch/powerpc/include/asm/cputable.h      | 4 +++-
> >>   arch/powerpc/include/asm/hw_breakpoint.h | 5 +++--
> >>   2 files changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
> >> index 3445c86e1f6f..36a0851a7a9b 100644
> >> --- a/arch/powerpc/include/asm/cputable.h
> >> +++ b/arch/powerpc/include/asm/cputable.h
> >> @@ -633,7 +633,9 @@ enum {
> >>    * Maximum number of hw breakpoint supported on powerpc. Number of
> >>    * breakpoints supported by actual hw might be less than this.
> >>    */
> >> -#define HBP_NUM_MAX    1
> >> +#define HBP_NUM_MAX    2
> >> +#define HBP_NUM_ONE    1
> >> +#define HBP_NUM_TWO    2
> > I wonder if these defines are necessary - has it any advantage over
> > just using the literal?
>
> No, not really. Initially I had something like:
>
> #define HBP_NUM_MAX    2
> #define HBP_NUM_P8_P9  1
> #define HBP_NUM_P10    2
>
> But then I thought it's also not right. So I made it _ONE and _TWO.
> Now the function that decides nr watchpoints dynamically (nr_wp_slots)
> is in different file, I thought to keep it like this so it would be
> easier to figure out why _MAX is 2.
>
> >>
> >>   #endif /* !__ASSEMBLY__ */
> >>
> >> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> >> index cb424799da0d..d4eab1694bcd 100644
> >> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> >> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> >> @@ -5,10 +5,11 @@
> >>    * Copyright 2010, IBM Corporation.
> >>    * Author: K.Prasad <prasad@linux.vnet.ibm.com>
> >>    */
> >> -
> > Was removing this line deliberate?
>
> Nah. Will remove that hunk.
>
> >>   #ifndef _PPC_BOOK3S_64_HW_BREAKPOINT_H
> >>   #define _PPC_BOOK3S_64_HW_BREAKPOINT_H
> >>
> >> +#include <asm/cpu_has_feature.h>
> >> +
> >>   #ifdef __KERNEL__
> >>   struct arch_hw_breakpoint {
> >>          unsigned long   address;
> >> @@ -46,7 +47,7 @@ struct arch_hw_breakpoint {
> >>
> >>   static inline int nr_wp_slots(void)
> >>   {
> >> -       return HBP_NUM_MAX;
> >> +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_TWO : HBP_NUM_ONE;
> > So it'd be something like:
> > +       return cpu_has_feature(CPU_FTR_DAWR1) ? HBP_NUM_MAX : 1;
> > But thinking that there might be more slots added in the future, it
> > may be better to make the number of slots a variable that is set
> > during the init and then have this function return that.
>
> Not sure I follow. What do you mean by setting number of slots a
> variable that is set during the init?
Sorry I was unclear there.
I was just looking and saw arm also has a variable number of hw breakpoints.
If we did something like how they handle it, it might look something like:

static int num_wp_slots __ro_after_init;

int nr_wp_slots(void) {
    return num_wp_slots;
}

static int __init arch_hw_breakpoint_init(void) {
    num_wp_slots = work out how many wp_slots
}
arch_initcall(arch_hw_breakpoint_init);

Then we wouldn't have to calculate everytime nr_wp_slots() is called.
In the future if more wp's are added nr_wp_slots() will get more complicated.
But just an idea, feel free to ignore.

>
> Thanks,
> Ravi
