Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E467C219
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 01:57:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2Mk56lyRz3fD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 11:57:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VPV23bB/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VPV23bB/;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2MjD2vSCz3bZk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 11:56:31 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 129so368197ybb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 16:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j6PJ67oAnfzV9PxkuyEMm7X3urH+VAUx7uNIfBIgK8A=;
        b=VPV23bB/NTAePn3ETVAx/0rZ5RYy1tyqMgRlKO0QViQnGhUmX7jyE5mB35Xi9APjlY
         DL1Dqno6sd1kt+SACNdRv9yNuwSO4WLY5aSWK1Lo6e1Z5K7hVz05KgRAL08GGJeN8i95
         VoJ8IJ8WCXFymcNzjmnd6pEwTWFDmHZiuixuMrEkedvabWF0sGRFPCEruskVOmNZ2z9v
         4MQJZB50jLKj5Qtx9ezhphFW1ZgV+grFYvY4bw1CA898+aH9wE7fT07rW0gZUvs+zBC7
         /0EjzxiaogGu8EDN1Au38zJws9yGvLda8TtNbSovZLrAXep+lJAoyouy9SaVV9e3LqLB
         ssUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6PJ67oAnfzV9PxkuyEMm7X3urH+VAUx7uNIfBIgK8A=;
        b=xLOsWtvzK2qedRkH8vPPSOMWme3dbAMxG/9EmiFelZGALb5p2RlmYvmLAv3opUkdk6
         xT2+nXGDL/ArKWOE5x02guD3xma97W4/EFScUHcTeMeVV68YxB0O3ivO0+8R8PHIzmTM
         o1je95uA4mEuiWjgsJV7zMiJFN9LbB2/8Yfpi8ivp3GzuF3i3siDkqqC6tu1wHStccyQ
         RdE6C2ma0uuSIRobVKWiTdQ0de7WvbXvRridprz34oZ6Zr6PFb/CjJybHD4vzRNWAKwB
         4GcIMaTHVP7e3RsCFANxIEQeomvp1gUtI1ix8jp2VWjjYhFDC8CslBehvcRe43U9wyGR
         HXIw==
X-Gm-Message-State: AO0yUKVuyzeYY9fsawLZlORSbrXdEoExDsj0shbFiQe+XhVo11xXNUYY
	nwSCpGhxYV4JPTul7O0zGLiA0W2fUzBluFnMvdNGrA==
X-Google-Smtp-Source: AK7set8NIfHhdPuyL1RvDuayyrK39JHTj20Y7CDEMECMUkWmAbcHmsIgGk35BlpCcNAq5/QsmCjbLZ6FgKApKS2x2KE=
X-Received: by 2002:a25:c247:0:b0:80b:6201:bee7 with SMTP id
 s68-20020a25c247000000b0080b6201bee7mr1062130ybf.340.1674694588781; Wed, 25
 Jan 2023 16:56:28 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-3-surenb@google.com>
 <20230125162810.ec222773d13cd26c55991fde@linux-foundation.org>
In-Reply-To: <20230125162810.ec222773d13cd26c55991fde@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jan 2023 16:56:17 -0800
Message-ID: <CAJuCfpFWTNpz7LB+931Gc+yYwBq3-y+_doH2WdtjhTGnxLxvig@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mm: introduce vma->vm_flags wrapper functions
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 25, 2023 at 4:28 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 25 Jan 2023 15:35:49 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -491,7 +491,15 @@ struct vm_area_struct {
> >        * See vmf_insert_mixed_prot() for discussion.
> >        */
> >       pgprot_t vm_page_prot;
> > -     unsigned long vm_flags;         /* Flags, see mm.h. */
> > +
> > +     /*
> > +      * Flags, see mm.h.
> > +      * To modify use {init|reset|set|clear|mod}_vm_flags() functions.
> > +      */
> > +     union {
> > +             const vm_flags_t vm_flags;
> > +             vm_flags_t __private __vm_flags;
> > +     };
>
> Typically when making a change like this we'll rename the affected
> field/variable/function/etc.  This will reliably and deliberately break
> unconverted usage sites.
>
> This const trick will get us partway there, by breaking setters.  But
> renaming it will break both setters and getters.

My intent here is to break setters but to allow getters to keep
reading vma->vm_flags directly. We could provide get_vm_flags() and
convert all getters as well but it would introduce a huge additional
churn (800+ hits) with no obvious benefits, I think. Does that clarify
the intent of this trick?

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
