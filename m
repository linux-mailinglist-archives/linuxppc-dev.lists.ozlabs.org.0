Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DE41ED788
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 22:41:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cgmY5xPdzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 06:41:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ClW35iDe; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ClW35iDe; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cgkM3lrjzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 06:39:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591216758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qXutEZtbDBMnxHPxNkfv1ht6U8C9RNtapAPHQL9k7E=;
 b=ClW35iDe4HteCn1XIajwHExdxwHMg4xQiuJr8hKa3ZbnxLgcWV3fDABAeiciP14/SzCesO
 3/46OSDwjYmgjG2S1JlaXkbGd92s4/E3NX7FsceNXJEDvcxfy06wt79qFozs2+McZCRmo9
 lEH06szcSuDXq8v7gcKjDktcgoIuShI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591216758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qXutEZtbDBMnxHPxNkfv1ht6U8C9RNtapAPHQL9k7E=;
 b=ClW35iDe4HteCn1XIajwHExdxwHMg4xQiuJr8hKa3ZbnxLgcWV3fDABAeiciP14/SzCesO
 3/46OSDwjYmgjG2S1JlaXkbGd92s4/E3NX7FsceNXJEDvcxfy06wt79qFozs2+McZCRmo9
 lEH06szcSuDXq8v7gcKjDktcgoIuShI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-E2NTxKSxNMCluqBKsHnqEw-1; Wed, 03 Jun 2020 16:39:12 -0400
X-MC-Unique: E2NTxKSxNMCluqBKsHnqEw-1
Received: by mail-qk1-f198.google.com with SMTP id 205so2680955qkh.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jun 2020 13:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7qXutEZtbDBMnxHPxNkfv1ht6U8C9RNtapAPHQL9k7E=;
 b=hLfR5SDG74PruzsgCzUro/ART+mt9eg/nVVQQ62wH1RvQVwIHOla6Ry4p+3I1VV13W
 XXlNzPtAGDUt7YtyKqXcSBlFRZkfHpvX5ZKG4FeqvYrn28dl4LNhQbdJFFgjKv+zNv8J
 yGAycqJpsuQ6hZ/QFDWbs7Orp+BdxwXBiMPIvkSa8AJH21nwr2faUcprFsQ8sNtH2MUT
 2u8dKpYOgVQloeAV+adgi1L24CDxesUFVUDbi5GAsOO5CTuQFOBURNF0a9s26wTPjKp5
 tAb6dI66uKYXqiwi1LXtKC730jLLLsQEdLAuv3jx0EieTQQHQfy0jA8bIenFqO5Nf0QC
 lOEw==
X-Gm-Message-State: AOAM5305A/TL9ngwHrLKfZZuTd83x2NQe9Ja0SvGWpMgcKKB6gi1XSVN
 /Z/elrNUXlRMLt/P4AqB1+r/EB9vTNL9h4R8bR6OHXQ4L3jcG25VREfZ+ZUd6Y9x8AT9U4zKjHM
 5wsoiPqinoNm8Pk4RTEMQEjYWoX03RPoXRoM2677RTw==
X-Received: by 2002:ac8:4d03:: with SMTP id w3mr1222333qtv.200.1591216752267; 
 Wed, 03 Jun 2020 13:39:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX+YaZBQVbV2mhorUVRsDMl0Wf97S2ntVZndHXWse1f45tLhDNwlcPqJjxs9yW7dXPLwuee+I38exKcoMgNnI=
X-Received: by 2002:ac8:4d03:: with SMTP id w3mr1222300qtv.200.1591216751906; 
 Wed, 03 Jun 2020 13:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <1575057559-25496-1-git-send-email-bhsharma@redhat.com>
 <1575057559-25496-6-git-send-email-bhsharma@redhat.com>
 <8a982138-f1fa-34e8-18fd-49a79cea3652@arm.com>
 <b7d8d603-d9fe-3e18-c754-baf2015acd16@redhat.com>
 <51606585-77a3-265f-1d4e-19f25a90697d@broadcom.com>
In-Reply-To: <51606585-77a3-265f-1d4e-19f25a90697d@broadcom.com>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Thu, 4 Jun 2020 02:08:59 +0530
Message-ID: <CACi5LpPXdcJ7AmFWiSyM8rG_+7C=wTqiP0oCa9QAPe0Y0_wH=Q@mail.gmail.com>
Subject: Re: Re: [RESEND PATCH v5 5/5] Documentation/vmcoreinfo: Add
 documentation for 'TCR_EL1.T1SZ'
To: Scott Branden <scott.branden@broadcom.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 James Morse <james.morse@arm.com>, Dave Anderson <anderson@redhat.com>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Scott,

On Thu, Jun 4, 2020 at 12:17 AM Scott Branden
<scott.branden@broadcom.com> wrote:
>
> Hi Bhupesh,
>
> Would be great to get this patch series upstreamed?
>
> On 2019-12-25 10:49 a.m., Bhupesh Sharma wrote:
> > Hi James,
> >
> > On 12/12/2019 04:02 PM, James Morse wrote:
> >> Hi Bhupesh,
> >
> > I am sorry this review mail skipped my attention due to holidays and
> > focus on other urgent issues.
> >
> >> On 29/11/2019 19:59, Bhupesh Sharma wrote:
> >>> Add documentation for TCR_EL1.T1SZ variable being added to
> >>> vmcoreinfo.
> >>>
> >>> It indicates the size offset of the memory region addressed by
> >>> TTBR1_EL1
> >>
> >>> and hence can be used for determining the vabits_actual value.
> >>
> >> used for determining random-internal-kernel-variable, that might not
> >> exist tomorrow.
> >>
> >> Could you describe how this is useful/necessary if a debugger wants
> >> to walk the page
> >> tables from the core file? I think this is a better argument.
> >>
> >> Wouldn't the documentation be better as part of the patch that adds
> >> the export?
> >> (... unless these have to go via different trees? ..)
> >
> > Ok, will fix the same in v6 version.
> >
> >>> diff --git a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> index 447b64314f56..f9349f9d3345 100644
> >>> --- a/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> +++ b/Documentation/admin-guide/kdump/vmcoreinfo.rst
> >>> @@ -398,6 +398,12 @@ KERNELOFFSET
> >>>   The kernel randomization offset. Used to compute the page offset. If
> >>>   KASLR is disabled, this value is zero.
> >>>   +TCR_EL1.T1SZ
> >>> +------------
> >>> +
> >>> +Indicates the size offset of the memory region addressed by TTBR1_EL1
> >>
> >>> +and hence can be used for determining the vabits_actual value.
> >>
> >> 'vabits_actual' may not exist when the next person comes to read this
> >> documentation (its
> >> going to rot really quickly).
> >>
> >> I think the first half of this text is enough to say what this is
> >> for. You should include
> >> words to the effect that its the hardware value that goes with
> >> swapper_pg_dir. You may
> >> want to point readers to the arm-arm for more details on what the
> >> value means.
> >
> > Ok, got it. Fixed this in v6, which should be on its way shortly.
> I can't seem to find v6?

Oops. I remember Cc'ing you to the v6 patchset (may be my email client
messed up), anyways here is the v6 patchset for your reference:
<http://lists.infradead.org/pipermail/kexec/2020-May/025095.html>

Do share your review/test comments on the same.

Thanks,
Bhupesh

