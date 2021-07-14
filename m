Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3181C3C8B5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jul 2021 21:02:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQ6M1111Zz3bc2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 05:02:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s4y3jQYL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s4y3jQYL; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQ6LW04Ynz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 05:01:53 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id j3so1930919plx.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=t+S5VMEjBgR7YbUh7lHZQebY6xrdUNsIJ8awUiWwlAo=;
 b=s4y3jQYLJ3sWce/75FApnRQPB73sXl9G83vK6s1c3/cYg4zsK/eOd4BIVm9NHfkh/c
 HUudSQTcCvPv6/4j1vKsSYP0FkZi7B1Bw29diygdC57B7t5r0rZvdVBS5YPxeyB+LdwG
 NQi/RrxeQcRAV3jZBRVNqfxLZqj6mNvXlg6WmqB7pPJDdEE5BjJktdN93wwdXrV9YZAO
 PxFSLCuSasVoQQwxtkDKZdoGcqRIxEH/IrSQUZG/nxmhHwuS9xRiCUodyJNP6Bsi0ET5
 1N++egGRmNy0QtCxgDYUYEo5BruGVyO87SCANIQE8Z0eGSidZ7kkj064R0Osn6a8Ptjs
 3OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=t+S5VMEjBgR7YbUh7lHZQebY6xrdUNsIJ8awUiWwlAo=;
 b=fh1UzrAZJVRlL+B/QZm5gJrzt+QqOK1b3+MYQ2Jvf9+JkHiW8io6Y/LCayN5KCkb+q
 BSCheZBXeMDsFoZcdZz7BIhaYyw4i1Z+KCdYaZ5iIxEs4OQlifhnY6vg1Vx+bCsdwepx
 IAYUfff4Z47E8fOeMIRZ/Ka59mAnhLjNcI+5jsckOTWy0U0kiM7qixbW25+nnrm4K6Ze
 zLNlAbBCW4ZYo1MfedTXbzh9ERMj4F4mzoyLMsI1WyftYe3taH2mOXJQUsCfg4+9Knam
 bojVMC5/ytlX2rqgRnYmuflq13PuXG8Gbp2czOKKtS7nhCBqPyMMbTK2Cz+Z9miQVXGa
 8K1A==
X-Gm-Message-State: AOAM532K0UNjaI/6PO53hjSSENvJaria4JmOK9nhtbKOdgcrM0FulMgK
 Vp2gXAGMFzufPxRHoOvZ6Pw=
X-Google-Smtp-Source: ABdhPJxVlU2+daSLGaCkXrOL7wLe4hk/LWvR00dlwZxBrcTi8bJkpUrAdvm9YwNVQwCI6haaws2+Aw==
X-Received: by 2002:a17:90a:7546:: with SMTP id
 q64mr5225514pjk.174.1626289309111; 
 Wed, 14 Jul 2021 12:01:49 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id f19sm2981386pjj.22.2021.07.14.12.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 12:01:48 -0700 (PDT)
Message-ID: <ff03c08047e0cdc79471d7bc35e48fa70efc1215.camel@gmail.com>
Subject: Re: [PATCH v4 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Date: Wed, 14 Jul 2021 16:02:00 -0300
In-Reply-To: <88e3b97e-201d-0782-0e95-8e3d2d850a38@ozlabs.ru>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-8-leobras.c@gmail.com>
 <e4984fa0-2afe-a987-4fb8-61b878431b1f@ozlabs.ru>
 <97626d3883ed207b818760a8239babb08a6b5c59.camel@gmail.com>
 <b25dff0f130b9ab721b8b524e55a3cd4c244a8f3.camel@gmail.com>
 <88e3b97e-201d-0782-0e95-8e3d2d850a38@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-07-14 at 18:32 +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 13/07/2021 14:47, Leonardo Brás wrote:
> > Hello Alexey,
> > 
> > On Fri, 2021-06-18 at 19:26 -0300, Leonardo Brás wrote:
> > > > 
> > > > > +                                        unsigned long liobn,
> > > > > unsigned long win_addr,
> > > > > +                                        unsigned long
> > > > > window_size,
> > > > > unsigned long page_shift,
> > > > > +                                        unsigned long base,
> > > > > struct
> > > > > iommu_table_ops *table_ops)
> > > > 
> > > > 
> > > > iommu_table_setparms() rather than passing 0 around.
> > > > 
> > > > The same comment about "liobn" - set it in
> > > > iommu_table_setparms_lpar().
> > > > The reviewer will see what field atters in what situation imho.
> > > > 
> > > 
> > > The idea here was to keep all tbl parameters setting in
> > > _iommu_table_setparms (or iommu_table_setparms_common).
> > > 
> > > I understand the idea that each one of those is optional in the
> > > other
> > > case, but should we keep whatever value is present in the other
> > > variable (not zeroing the other variable), or do someting like:
> > > 
> > > tbl->it_index = 0;
> > > tbl->it_base = basep;
> > > (in iommu_table_setparms)
> > > 
> > > tbl->it_index = liobn;
> > > tbl->it_base = 0;
> > > (in iommu_table_setparms_lpar)
> > > 
> > 
> > This one is supposed to be a question, but I missed the question
> > mark.
> > Sorry about that.
> 
> Ah ok :)
> 
> > I would like to get your opinion in this :)
> 
> Besides making the "base" parameter a pointer, I really do not have 
> strong preference, just make it not hurting eyes of a reader, that's
> all :)

Ok, done :)

> imho in general, rather than answering 5 weeks later, it is more 
> productive to address whatever comments were made, add comments (in
> the 
> code or commit logs) why you are sticking to your initial approach, 
> rebase and repost the whole thing. Thanks,

Thanks for the tip, and for the reviewing :)

Best regards,
Leonardo Bras


