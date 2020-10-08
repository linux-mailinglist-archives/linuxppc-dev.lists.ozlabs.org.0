Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24926287AAC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 19:11:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6d5h62FszDqXN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 04:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=cZHvUXj5; 
 dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6d3Z1bgyzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 04:09:29 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id 184so7350350lfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z5wcuDA1gh/3Ps6l+NWlPcHbmyW5YaIQwLSEAvKTv+g=;
 b=cZHvUXj5G6+H19Nj4m528LVZtsoSSR8DXg8s8jyXKZNl8yYlcGAb2i3EBmVhdsS3AF
 W3RfTehbw6eYlGzzLmiYFkaUZwBpmdmMlDJneXc80kfm7LkKDSW9OkSK0jUhE0zjXx/x
 +Nat7/Qr8ncJLNBYgRySy7Jc9Y8kWw+L70eL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z5wcuDA1gh/3Ps6l+NWlPcHbmyW5YaIQwLSEAvKTv+g=;
 b=J6HLxug5B0EuvNybxBKD0J5L2CB2AhpaTgCOhmps07OT9dxMXfIAznfQSRyOFgNmZL
 TkCIRMn5mHkLlGRbCNnotrUufj2S/lPlkR8cVR+hJ1aPVfNfSxhwXhOl1JV84RJv4wrj
 jxBfktR8TZU49DFIvDNdzwbeYDXSp7Xd9kvRTSe6VP/LIJ8e7vpyu5xAhIzbqb5ga6SI
 rKDwGgsN8ym1WkIl/LTQlIWUIGds7aL3PVIZabGFY4BJs4wToVrqAaP/OZs5yR9WAFf4
 O+EAuD4haUd2VI6XY5bf3ANp0JDpqhBR5HfGbvrz42vuH3i2SIa0ePQKjjhejSVveMwE
 0g2Q==
X-Gm-Message-State: AOAM5312wFtKzA2VQwkOsgL6gRBZ15LKegqQw2nysQDskehA2ojzWFm1
 +RM0is1EzrFqc41EaZW7arXbPN07yX4xBw==
X-Google-Smtp-Source: ABdhPJyOoS1sI/6w4YbMfkRPC45/EZyVhhqRqUL4A4RjpXtrDNU3mtRt73QqTthliw20BpmPv/UlGQ==
X-Received: by 2002:a19:c154:: with SMTP id r81mr153614lff.154.1602176964139; 
 Thu, 08 Oct 2020 10:09:24 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id 203sm962663lfc.112.2020.10.08.10.09.22
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 10:09:23 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id r24so6561582ljm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:09:22 -0700 (PDT)
X-Received: by 2002:a2e:2202:: with SMTP id i2mr3411487lji.70.1602176962536;
 Thu, 08 Oct 2020 10:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201008092541.398079-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20201008092541.398079-1-aneesh.kumar@linux.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Oct 2020 10:09:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiRmi=uie1xV=p72CG8rhG8md_MWKtvPguxUtjbSPtVYA@mail.gmail.com>
Message-ID: <CAHk-=wiRmi=uie1xV=p72CG8rhG8md_MWKtvPguxUtjbSPtVYA@mail.gmail.com>
Subject: Re: [PATCH] mm: Avoid using set_pte_at when updating a present pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Linux-MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nick Piggin <npiggin@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Kirill Shutemov <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ahh, and I should learn to read all my emails before replying to some of them..

On Thu, Oct 8, 2020 at 2:26 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> This avoids the below warning
> [..]
 > WARNING: CPU: 0 PID: 30613 at arch/powerpc/mm/pgtable.c:185
set_pte_at+0x2a8/0x3a0 arch/powerpc/mm/pgtable.c:185

.. and I assume this is what triggered the other patch too.

Yes, with the ppc warning, we need to do _something_ about this, and
at that point I think the "something" is to just avoid the pte
wrpritect trick.

               Linus
