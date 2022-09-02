Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38165AB3F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 16:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK12T6Kbfz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 00:46:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e0bgvUNt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=e0bgvUNt;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK11r0B0Fz2xt6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 00:46:06 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id d189so742325ybh.12
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=LfUeyyDPya+VM647W1kMLyuQpfGce9UnDrfOM4ed8c4=;
        b=e0bgvUNt2OZOKlrz9Uhod/iPoeq/YHNuYYxXRXzkQZFnKZJPbP3w1MiVETfphi+oUY
         NnwADo8XUIa6iAJsnICK8/X5V0B2AIOUpZn+MxVC07Mg7fTnk+KN3Nxg2k89JrTfLEoS
         P/i4zedRfe8ZHQESbWl2MbNru29hysWZ55bDSzQd9ATfo5lCkmG7w/2WN+8quIl3Tc6+
         ufdw88gWTnF/DyhiJsMEssR4BHxjWxCuTR5kjhtXGyT2FS4PXA4k3J+wIOTZc1s/8KeS
         9CY0GPFl0aws7Gzo/0AfaSxU831snBW0fT23aqWB8RaAGN5QRaQdpwT3XXuFLQu2tIPI
         GT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LfUeyyDPya+VM647W1kMLyuQpfGce9UnDrfOM4ed8c4=;
        b=dLlL4yaUfVdLgiWJ32a1vRCOpZ0rcCEK4O324yFmRmdgRXnUBFrCsn6x0CpKK9QIDa
         x25n6aoP9UjsTYSpSMexFP5HwqsCDvbh9AZJYHH/FkDvALW969JKhclPujpwkPvQRnMy
         uZi8rHx4b4s1huZS3jy2GanP0mG+qml0lzuADPkG14QsP2cJMs4KwS1kTr9NS3qjkA3Z
         +NuJypBGF5nRnjUdqGe9FbDw/fY0HcFEfGZu0nGL7QDFzv8Mf9OxGkhbGCZruBLa0NWy
         FsYmeY7PrXfKbeWvtyoo00/fyWms/rfcbPEzftn311uXwKLCkbgwktlY/BQiguYaHYH3
         Rdkw==
X-Gm-Message-State: ACgBeo16iIs8/VbvupKlDQRnEhdQvSHu97qLy0jKejsW9ICsMgKdbpVI
	U3thKNHV8Fm9ohbL4fu5N2TjJaqeAzaV9AzrjsAtBg==
X-Google-Smtp-Source: AA6agR7KJcXL2ZM2hJ+QDUBNcu6ZcZ6a9jQ0klZLjGr7EyD+LEOt0dL9vcDGJDJQ8okQLslC70mEmo/w8e9mqpXnZ7s=
X-Received: by 2002:a05:6902:705:b0:695:b3b9:41bc with SMTP id
 k5-20020a056902070500b00695b3b941bcmr23371622ybt.426.1662129963987; Fri, 02
 Sep 2022 07:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <YxGz+3TT/J7u6H81@hirez.programming.kicks-ass.net>
In-Reply-To: <YxGz+3TT/J7u6H81@hirez.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 2 Sep 2022 07:45:53 -0700
Message-ID: <CAJuCfpEreo5vKwKU1Qs1nXe50daGN-yaPz5v4BS7Y08no7sjiA@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
To: Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, bigeasy@linutronix.de, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML <linux-kernel@vger.kernel.org>, Jo
 hannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 2, 2022 at 12:43 AM Peter Zijlstra <peterz@infradead.org> wrote=
:
>
> On Thu, Sep 01, 2022 at 10:34:48AM -0700, Suren Baghdasaryan wrote:
> > This is a proof of concept for per-vma locks idea that was discussed
> > during SPF [1] discussion at LSF/MM this year [2], which concluded with
> > suggestion that =E2=80=9Ca reader/writer semaphore could be put into th=
e VMA
> > itself; that would have the effect of using the VMA as a sort of range
> > lock. There would still be contention at the VMA level, but it would be=
 an
> > improvement.=E2=80=9D This patchset implements this suggested approach.
>
> The whole reason I started the SPF thing waay back when was because one
> of the primary reporters at the time had very large VMAs and a per-vma
> lock wouldn't actually help anything at all.
>
> IIRC it was either scientific code initializing a huge matrix or a
> database with a giant table; I'm sure the archives have better memory
> than me.

Regardless of the initial intent, SPF happens to be very useful for
cases when we have multiple threads establishing some mappings
concurrently with page faults (see details at [1]). Android vendors
independently from each other were backporting your and Laurent's
patchset for years. I found internal reports of similar mmap_lock
contention issues in Google Fibers [2] and I suspect there are more
places this happens if people looked closer.

[1] https://lore.kernel.org/all/CAJuCfpE10y78SNPQ+LRY5EonDFhOG=3D1XjZ9FUUDi=
yhfhjZ54NA@mail.gmail.com/
[2] https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DGoogle-Fibers-T=
oward-Open

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
