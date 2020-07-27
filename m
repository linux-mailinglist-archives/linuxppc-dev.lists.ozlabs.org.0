Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A059622F017
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 16:21:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFhnt4f0rzF1Q6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 00:21:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFhdH3s8NzDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 00:14:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFhdG3gJvz8t9F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 00:14:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFhdG1wNcz9t0P; Tue, 28 Jul 2020 00:14:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BFhdG05Bdz9syB;
 Tue, 28 Jul 2020 00:14:25 +1000 (AEST)
Received: by mail-ot1-f65.google.com with SMTP id w17so12414542otl.4;
 Mon, 27 Jul 2020 07:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwV/fYC6R5PVghDc7Xcfm5xADtIIp1K2tl3Z3YbTId0=;
 b=nsJGhLPe7c+CHcj8bHfR1yEtNNRuzcHpWBUwCq1h7uP5pP/AsuvXermHi4dtZQ79oZ
 1q6oKFMSqUYoD0RymBDQihEbKGWx2THeaEzjqPsxE7MrZ/pPpqQr1eYQtsxBsw9Kv7gy
 aNjFoIJbTxM1RLPm7SFE1YETvAef2EI2CUgXT3hGI1D53eapZNYnFw+XC6RaAjfUYmRD
 Z5CSXFdCx3atOQrAdOhGppzKdPxVIaJwNa9onQHc7jkBbm0e9Tt3N2eib2fI212dR5qB
 HkwQf01/H35jFIZQiMBOpMMC9WlTu3AeiskGutNP/em9dXMwlWeFJ7/jj+J1TgpIlzTi
 NJHQ==
X-Gm-Message-State: AOAM531Cx9cc1VmZtrOnH096LGyKE7Gig279C+7I93aIF+3x/r/Yli0h
 S/0Ubr8UoRhdNf4rL8nN0Bksf+LBGidkmx1Acfc=
X-Google-Smtp-Source: ABdhPJy3IQ4gWoo3GVjFr2jd6qToC3wtimm7RFwI0aGYMQzT7H7gS+icm3pzzCk7LtxkYZm+IgVNdSPw5XxX9M393tU=
X-Received: by 2002:a9d:590a:: with SMTP id t10mr20554597oth.262.1595859262962; 
 Mon, 27 Jul 2020 07:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
 <20200707113235.GM14120@in.ibm.com>
In-Reply-To: <20200707113235.GM14120@in.ibm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Jul 2020 16:14:12 +0200
Message-ID: <CAJZ5v0jA20TJyxRwtBu31zF5otkqbTW9R03Na3LgJsWB3nDmoQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] cpuidle-pseries: Parse extended CEDE information for
 idle.
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Linux PM <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 7, 2020 at 1:32 PM Gautham R Shenoy <ego@linux.vnet.ibm.com> wrote:
>
> Hi,
>
> On Tue, Jul 07, 2020 at 04:41:34PM +0530, Gautham R. Shenoy wrote:
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> >
> > Hi,
> >
> >
> >
> >
> > Gautham R. Shenoy (5):
> >   cpuidle-pseries: Set the latency-hint before entering CEDE
> >   cpuidle-pseries: Add function to parse extended CEDE records
> >   cpuidle-pseries : Fixup exit latency for CEDE(0)
> >   cpuidle-pseries : Include extended CEDE states in cpuidle framework
> >   cpuidle-pseries: Block Extended CEDE(1) which adds no additional
> >     value.
>
> Forgot to mention that these patches are on top of Nathan's series to
> remove extended CEDE offline and bogus topology update code :
> https://lore.kernel.org/linuxppc-dev/20200612051238.1007764-1-nathanl@linux.ibm.com/

OK, so this is targeted at the powerpc maintainers, isn't it?
