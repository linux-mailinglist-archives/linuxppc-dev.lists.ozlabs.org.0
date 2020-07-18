Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C51A224D92
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jul 2020 21:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B8Hjs2bFbzDrBd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Jul 2020 05:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--gthelen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3vektxwckdjsboc9g9ibjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--gthelen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VLkScLOa; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B8Hh85sX8zDr96
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 05:13:04 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id j9so10497452pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jul 2020 12:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=AF6WzDREys7pX44hC1bnRv06arMUHM4xLeS+gr1uXIw=;
 b=VLkScLOaoK0Ukpw/Jn1jBHjHkQPxv/NzGahgmzX8U0JLGmdRxN0Z5glvG35Ea0KlV7
 ccFW0AMVog87wJnx3QDFvbdWRS0xpiBN08aN8hkGBDjLElpckhcF+BzFhrA9RLinRlTn
 JoSfoaKHdvQd+4YPF+ARFjvAg3itMssIOypqgKovoyzyLzpFwKh0P9bYtktiYQQtHZ8h
 hbyFmZ7P7/6XZPpIZfBUXfGwQCvF9WTKWroTOUKeZpN0AZcCD7IKBonS4zuRJ5VlI421
 GBEH7UGDNbj4YOBi5woahrem9VtRZPXYggSIkdJIh+2+Uf0ypGfEAzyr2CV9hiTq3Nc8
 lzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=AF6WzDREys7pX44hC1bnRv06arMUHM4xLeS+gr1uXIw=;
 b=TUf+q/j8iK45m/HFf8NFyCeQQqwKkZIdnOIOSXttLjMNRWhbX0C5HYnzpauNcv7Uma
 I5qKCACP4roNaXPj0gIrSRLndLcQhZ9R2lpjmyiCIsePL8gw26+6c4t8JtLE9qJpynFH
 nZhFASLyj2cdPFrbdZVDszMQXsMGK+bJmL9fdt1IRuBJb17Ue1ao2mk+y056LJBCC8D0
 0g0T70r5Cviimx0L9zdA7gIt3ebvUTTI7lLIaZ7b25pOSD6BjRrQXwC5K0nTiFqlYdtc
 9a7HILBwyxFjIOw+kSXd0jPBonVE0Y5W3xmScr6qPTygAwi3T1190d6vTc+jE3q7mIYw
 75Dw==
X-Gm-Message-State: AOAM532FrBDXW43cWyDwl4NrYaBcVxOJ+WI43gLChE2hQ7y5JmJOQxl7
 pA3lLiORG0zAdVozynOkxREZ+ghYWolb
X-Google-Smtp-Source: ABdhPJx2fo6BNpvN/HcJneXKAp7Vtblyq6Xzc8545k3Dnwng76UGrnDP2f88KKuHDeAbqncqBVpbu0nztdy9
X-Received: by 2002:a62:be02:: with SMTP id l2mr12704136pff.163.1595099580890; 
 Sat, 18 Jul 2020 12:13:00 -0700 (PDT)
Date: Sat, 18 Jul 2020 12:12:58 -0700
In-Reply-To: <CAOSf1CHjrFb3J6t0HQXQVVM-PEgAcaCADA8mcwYVi4mpq+f3Yw@mail.gmail.com>
Message-Id: <xr93sgdo7i2t.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <37af499e-2b8b-7e78-ed4b-0aaf711fcb38@csgroup.eu>
 <20200614233235.121432-1-gthelen@google.com>
 <CAOSf1CHjrFb3J6t0HQXQVVM-PEgAcaCADA8mcwYVi4mpq+f3Yw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/powernv/pci: use ifdef to avoid dead code
From: Greg Thelen <gthelen@google.com>
To: "Oliver O'Halloran" <oohall@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oliver O'Halloran <oohall@gmail.com> wrote:

> On Mon, Jun 15, 2020 at 9:33 AM Greg Thelen <gthelen@google.com> wrote:
>>
>> Commit dc3d8f85bb57 ("powerpc/powernv/pci: Re-work bus PE
>> configuration") removed a couple pnv_ioda_setup_bus_dma() calls.  The
>> only remaining calls are behind CONFIG_IOMMU_API.  Thus builds without
>> CONFIG_IOMMU_API see:
>>   arch/powerpc/platforms/powernv/pci-ioda.c:1888:13: error: 'pnv_ioda_setup_bus_dma' defined but not used
>>
>> Move pnv_ioda_setup_bus_dma() under CONFIG_IOMMU_API to avoid dead code.
>
> Doh! Thanks for the fix.
>
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

Is there anything else needed from me on this patch?
Given that it fixes a 5.8 commit I figured it'd be 5.8 material.
