Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F8A5F7F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 04:57:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ms714B1NzDqjL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:57:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jmtrxAhZ"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ms501bWJzDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 12:55:13 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id b24so9884162pfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=/L2CeGiaJZXxa6TbO6ummO/GTstkgmCj8XxqdSlmdxQ=;
 b=jmtrxAhZ8goBT0ocQqivpzezr4kLgKX5lEh7j/npj6iow42Wuca2dwn/wek1vb7zFD
 dEYEnCB7rgVc1Yk+SxK33F/EGbAl14X57RD04S2na7Xw1ar2mJj9+IEab15Tl7gVdVeR
 +BClnCp73qC6QGCcnU1HArmC9wQmPL6cjo5/l14iaCE39ej8ktaVyEbi7HGKXOqY2MxE
 s/CeQYLlp9G+3i0sg4iRhTuzGH4AQJnWnFvJsFGDdreJOye2a0THrAKO52qyOzzMgOli
 s7yBJFlzyAjBjdsTM9dTLz4+vFKwHGUOAVDUUX7C8nZSHMdrB/eq9oGs7gz4WvGzjHeG
 z5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=/L2CeGiaJZXxa6TbO6ummO/GTstkgmCj8XxqdSlmdxQ=;
 b=bcibR1IWpn7L6Ddku2OKQarOPb4dYdu4lhYu1kFvUjeTRJajaAi0B0ZDNIdwCFplbW
 rbhnfOJNPbBbx2O8eoh32lkiI0c6F5FckFOBSOxTugDl0G7J/iR8nMU4TdCHXXhN78QO
 UAeXgVCvDqu801M7bqnDIOLzz4eHQHZ4FAiejW47pzFd8vbymPA8wSzAZrsC2NVKeEHs
 jaIrLFhDTV3vogxAOnEhsp0wbhxZrYkhDjroNxT38CysTbjBOaJ0TXYhn1ARJMhD3UU5
 sFHsm2xZBuqb4vwGAEWOvzMI8H4EzFjjEvsSmVoAg3PulnMX6xe95NiZd9Tao2eDNMQ1
 oLUQ==
X-Gm-Message-State: APjAAAW+d5biUb9J4LboxLbHXZIzOidPS7goMmyPr/pc4snZeNqE6M32
 2WmzEdRSdIvlQK/dlad0BZw=
X-Google-Smtp-Source: APXvYqxFZrirTe/70I+bx8oAOtUuGL47WkQn+hHaw50pDHt2mqWfa891y0C6KG9qbiXFNccVHwvHZw==
X-Received: by 2002:a63:6f81:: with SMTP id k123mr28483344pgc.12.1567479310360; 
 Mon, 02 Sep 2019 19:55:10 -0700 (PDT)
Received: from localhost ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id y6sm9176866pfp.82.2019.09.02.19.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 19:55:09 -0700 (PDT)
Date: Tue, 03 Sep 2019 12:52:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 6/6] powerpc/64s/radix: introduce options to disable use
 of the tlbie instruction
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20190902152931.17840-1-npiggin@gmail.com>
 <20190902152931.17840-7-npiggin@gmail.com> <2435845.pBas4ZpoTR@townsend>
In-Reply-To: <2435845.pBas4ZpoTR@townsend>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567478506.0gvsad1z4m.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alistair Popple's on September 3, 2019 10:32 am:
> Nick,
>=20
> On Tuesday, 3 September 2019 1:29:31 AM AEST Nicholas Piggin wrote:
>> Introduce two options to control the use of the tlbie instruction. A
>> boot time option which completely disables the kernel using the
>> instruction, this is currently incompatible with HASH MMU, KVM, and
>> coherent accelerators.
>=20
> Some accelerators (eg. cxl, ocxl, npu) call mm_context_add_copro() to for=
ce=20
> global TLB invalidations:
>=20
> static inline void mm_context_add_copro(struct mm_struct *mm)
> {
>         /*
>          * If any copro is in use, increment the active CPU count
>          * in order to force TLB invalidations to be global as to
>          * propagate to the Nest MMU.
>          */
>         if (atomic_inc_return(&mm->context.copros) =3D=3D 1)
>                 inc_mm_active_cpus(mm);
> }
>=20
> Admittedly I haven't dug into all the details of this patch but it sounds=
 like=20
> it might break the above if TLBIE is disabled. Do you think we should add=
 a=20
> WARN_ON if mm_context_add_copro() is called with TLBIE disabled? Or perha=
ps=20
> even force TLBIE to be re-enabled if it is called with it disabled?

The patch has two flags, "enabled" and "capable". If capable is false
then it prevents cxl, oxcl, and KVM from loading. I think NPU is gone
from the tree now. Hash MMU won't work either, but for now you can't
mark !capable with hash.

If enabled is false but capable is true, then it avoids tlbie for
flushing the CPU translations, but will also use it to flush nMMU
coprocessors (and KVM for partition scope, but hopefully that can
be made to work with tlbiel as well).

So this should be fine. Could put a BUG in there if !tlbie_capable,
because we can't continue -- idea is that tlbie could be broken or
not implemented or we want to test without ever using it.

Thanks,
Nick

=
