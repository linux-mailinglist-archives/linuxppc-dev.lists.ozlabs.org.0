Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E761863A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 18:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N39nC7537z3cJt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 04:32:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iPqtLSq3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iPqtLSq3;
	dkim-atps=neutral
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N39mG03Vyz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 04:31:39 +1100 (AEDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-12c8312131fso2966009fac.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvZ5+E5qu4GOYga/FqvgfxEG1c0dU8d73zf2fP+htGs=;
        b=iPqtLSq3l2qHplG860uNDrfYq9b0lZFbxHP6kSO5WcDFeNj74LgawQ3XHbriQnJzId
         91YDCFJ926vJ7L1jeQcvLnKN5IicgY26QvhLOUAx6NfuqsczuDo2+p95tiUE3Y3d3p8R
         Wb3AVYnqzTL0X7haZY7BTZ+oilwvxbeF6lVkgFNf8aMcvJgkuEefwy01BOsLK5VvAvzw
         YLeXvyd9tsE28Dp154l4LlczkE6gYboihsErhJGgG+F9jOSH92X0IzDV0rfpYNgoQqIc
         gaqjq4mqtFEpLgO3pJNfAld17zV9i0u6xe8AK0ilXIHLGax8f5r/eP0/Q0saTHwnR/aB
         J0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvZ5+E5qu4GOYga/FqvgfxEG1c0dU8d73zf2fP+htGs=;
        b=TmXZVUFc9s3yTJPqEkDwBY01aO2N7s0V1slaeaLZqUX44sSQ3iePw4ZKQbDCn2pMSP
         1lv5sCgfHyHtzc3WFvlZ6UZWvdLLRwtNvXpuG4w3NQ+Nqf7V7gtQgNnGCRlItbNU6iFE
         bfh7c0yqYRbNgbdDTIzuljVUVFvD8gyq1iHejDC3p1L+FQ++c3/qoJ8S+0aTC2otRLqJ
         +iwaysmEjMWOr6mtL6K8pDzU+/GTUI+nOYcAiHi3pDlzxIHmoRqDytHEwL73pP2PmVM6
         1PKO2x6Z3PS1Jxdmcf0DCEYBs/NWs3PqNmgeTRPyTVbOuNTm5CEzsrfBnkQkJUyfFiYf
         Fglg==
X-Gm-Message-State: ACrzQf1U4mwLDxwj5RdP8C5SoJxMShWm6i4XCUKT30Yxo8v6IdDlrMdl
	PhQS5iM87vucjsRCvunfNMc=
X-Google-Smtp-Source: AMsMyM6fJYEOKNxJ1D+xB246uqRaGV2DX2E0qNo3z76RYRYleK2EIFTcmwXSUrFyVWM6R7buKJ49fQ==
X-Received: by 2002:a05:6870:31c5:b0:13d:a04a:6ecf with SMTP id x5-20020a05687031c500b0013da04a6ecfmr1655565oac.101.1667496692226;
        Thu, 03 Nov 2022 10:31:32 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id r13-20020a4a964d000000b00425806a20f5sm430333ooi.3.2022.11.03.10.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:31:31 -0700 (PDT)
Date: Thu, 3 Nov 2022 10:31:30 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2P68sfCJMvhKmhj@yury-laptop>
References: <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
 <Y2PsvvOWVs9ZLBsp@yury-laptop>
 <Y2PxAiJ1yNzcUSgs@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2PxAiJ1yNzcUSgs@zn.tnic>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, x86@kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 05:49:06PM +0100, Borislav Petkov wrote:
> On Thu, Nov 03, 2022 at 09:30:54AM -0700, yury.norov@gmail.com wrote:a
> > Callers should pass sane arguments into internal functions if they
> > expect sane output.
> 
> What internal function? It's in a global header.
> 
> > The API not exported to userspace shouldn't sanity-check all inputs
> > arguments.
> 
> That doesn't have anything to do with userspace at all.
> 
> APIs exported to the rest of the kernel should very well check their
> inputs. Otherwise they're not APIs - just some random functions which
> are visible to the compiler.

Let's take for example cpu_llc_shared_mask() added by you in
arch/x86/include/asm/smp.h recently:

  static inline struct cpumask *cpu_llc_shared_mask(int cpu)
  {
         return per_cpu(cpu_llc_shared_map, cpu);
  }

It's in a global header and available to the rest of the kernel, just as
well. How does it check its input? Maybe I lost something important in
per_cpu() internals, but at the first glance, there's no any protection
against -1, nr_cpu_ids, and other out-of-range arguments.
