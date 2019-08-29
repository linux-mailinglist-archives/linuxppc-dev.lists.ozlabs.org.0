Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E43A1466
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:09:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jxd435NXzDr5k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6bI7Ffc"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JxJR3DqwzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:55:03 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id z3so5482119iog.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OjWLoL0Sytp716R0t7m77BSmrg6hly7xS9TtDDFlQW0=;
 b=e6bI7FfcuzokBO7bf+PPxbq9uh6UddvVAUKKcmnYm7I7jdNpv2KOJTjamShhsl0F7c
 TIrMvA2TKjkQxG7PrXIlQoGFb0ia0nWbOtL+JRkJSZEwi+SxxhwuZSK++6YBsOnZwWRf
 v23NpMf84gPCO5gW99XN9057VPN6Q8JYTkIpgLu6ie9N7p3AFCo52DsmdsLEkT4q70Og
 rr6bsGPdP1ctItbMcayqNng5aE1TjYyesfHwatZLfjY/Erp/Zvle/6h1gg1sWHsQThlN
 VCaLfnLboHf+fjucVmGs/TJgmqzJ/ewq7wwuE5a4bElQmK2WGYeHtdZ/+L0ZKUhAUQoY
 /UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OjWLoL0Sytp716R0t7m77BSmrg6hly7xS9TtDDFlQW0=;
 b=rcMnEYo/LKBR7fbrgHlGrmysuYfzqlX4s2knQzsLlUTqIdtw/q0hKDOoksNUKei/OB
 qoSvt42/OEIRXrIbLr3S9p2QG+iexfJh+JdsOPqx6fpZ2zrb77Xo+yAoLs8G3PuWi5i+
 SQ/ZBFVCJ65K8Ikzion4atAuLkygPqrnIbdFddvmilggXosG4PF3U3OYDXSaglcH6k85
 HBwkoUwD0YfVlWq61FmcChj3D+e9ItN5YtSckA0jRYZ07E+IirihxQTlIgi/6S8Xgq9k
 +VIAHv0l3N9jt44qq1SiENrYjpouVWVDrI5YBenEcq9n99bQAA+QmwDVSnWYLCyuyYSs
 Bo6w==
X-Gm-Message-State: APjAAAXtg03B0GflbruQYvdzt3j4cPEzc9672Q0kr6Bw97O7VYoT4bmn
 NHyp+guuOBzabcRNsS/QmIvrwEJr5fge8AhTq2M=
X-Google-Smtp-Source: APXvYqyLLqVvLAQXPV3n+6MqExnVFy6MeU140oq3mKXjoQ+Fp5kDk7+yAlDnGOoveXPfVMt+QbPpDiOxyZ2PLG0wQjI=
X-Received: by 2002:a5d:9b02:: with SMTP id y2mr2810596ion.146.1567068899708; 
 Thu, 29 Aug 2019 01:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190829063347.13966-1-aneesh.kumar@linux.ibm.com>
 <20190829063347.13966-2-aneesh.kumar@linux.ibm.com>
 <CAOSf1CFuU7tCzKfYNDTe5Tut=Mz+2gL+nnvQ74y75PyrhTP7AA@mail.gmail.com>
 <93c5f8b0-36c9-d9e7-ac4d-5fb625cab89c@linux.ibm.com>
In-Reply-To: <93c5f8b0-36c9-d9e7-ac4d-5fb625cab89c@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 29 Aug 2019 18:54:47 +1000
Message-ID: <CAOSf1CE+uhJ3gVbVKTXY2c1qLkwr+x1fAthqgztQOc73ibgxKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP
 error
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 6:21 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> On 8/29/19 1:29 PM, Oliver O'Halloran wrote:
> > On Thu, Aug 29, 2019 at 4:34 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> Right now we force an unbind of SCM memory at drcindex on H_OVERLAP error.
> >> This really slows down operations like kexec where we get the H_OVERLAP
> >> error because we don't go through a full hypervisor re init.
> >
> > Maybe we should be unbinding it on a kexec().
> >
>
> shouldn't ?

I mean in the previous kernel. We don't have a shutdown() method
defined for the driver so I figured it was leaving the bind intact
across kexec, hence the patch. I was thinking that we should have the
previous kernel unbind it rather than letting the kernel deal with the
H_OVERLAP error. I suppose we'll have to do that in kdump case anyway.

> >> H_OVERLAP error for a H_SCM_BIND_MEM hcall indicates that SCM memory at
> >> drc index is already bound. Since we don't specify a logical memory
> >> address for bind hcall, we can use the H_SCM_QUERY hcall to query
> >> the already bound logical address.
> >
> > This is a little sketchy since we might have crashed during the
> > initial bind. Checking if the last block is bound to where we expect
> > it to be might be a good idea. If it's not where we expect it to be,
> > then an unbind->bind cycle is the only sane thing to do.
> >
>
> I would not have expected hypervisor to not mark the drc index bound if
> we failed the previous BIND request.

I was thinking of the partial-bind case where the driver started
binding, but never exits the loop in drc_pmem_bind() due to a kernel
panic or whatever.

> I can query start block and last block logical address and check whether
> the full blocks is indeed mapped.
>
>
> >> Boot time difference with and without patch is:
> >>
> >> [    5.583617] IOMMU table initialized, virtual merging enabled
> >> [    5.603041] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Retrying bind after unbinding
> >> [  301.514221] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Retrying bind after unbinding
> >> [  340.057238] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs
> >
> > Is the unbind significantly slower than a bind? Or is the region here
> > just massive?
> >
>
> on unbind. We go two regions one of 60G and other of 10G

Assuming you mean "it's slow on unbind" then that sounds like a
hypervisor bug tbh.

Oliver
