Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715A3610FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLmMJ2tgSz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 03:20:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sZMHlhHO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sZMHlhHO; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLmKX22Yfz3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 03:19:11 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id p16so8494494plf.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8a04NZRtQScmgjBHOwbl/yFtfKtVthaZ/Hnily7UrCw=;
 b=sZMHlhHOU+xc4n8FPvxaAa+E0NTQTmyghhvxpESoKgjXzKi1k+qc9uquNBtg9hVddS
 z3M/fCvYprkqPl2LRyAECaO3XSv85TRvN4A/BFM6YjIC+xIlKa78AOMGuBMmW5axXmS9
 M9/AaXZBOFjIDDxQ0a1PdpygCWQpxryatlidL25bEAZQRjEgrVHCO6go+UFbYcco62H5
 a4I71OFriBDb8dGwAHhEhMrWaKxK4AZR5wCCN3jEVytsMXYm0KLQzqC0XqsC4Yz9rLHx
 xjtH8lPEwOsnC3VEogoNaUvnI6FktMv1krkMdxY07Q6aMr0X8Y/OOJKviqsZLO/mqZH2
 d1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8a04NZRtQScmgjBHOwbl/yFtfKtVthaZ/Hnily7UrCw=;
 b=eiw3gjPdhKoEiF82j1HBduEK160pHhprcsteCIcNSQARETSYwwFuE/QMXLy39X4yvK
 lVijZIjsen9cJGdSAEj9B70U7cc3te+aUS+oGzfKvWNIYPRYDhBmAsb3ZL/5lGop2rz6
 Qb/4+aB94GDBx71lQ3dpaQETYoE69c1IeiBgcSQYxxLO1xDgM9g5vQJtFilNyjcmUj1R
 aM7sVgseCQ471mvYE0yo6jVZURw0NCTg3BDwW9PI5V7hCtwDnHXjisX+KGe35pKh9OyV
 smvfVlWp7m1hwoOYAGTzhUXf/78WGhHKLdtpPq6ZEya4x/DHQdnkp2w0tvU5Zi5f9F4e
 6+ag==
X-Gm-Message-State: AOAM531s+edb5n/TtN9jsZQxqkI7fNXOmh1Xl+mBQtqoOZtTFoVzj73g
 HbZVuq6bD8aimWxeLjVOkgGWnAvuWo0i/am+/rs=
X-Google-Smtp-Source: ABdhPJzCwBCGWG/Tzyck7Lf3AD0CL7doHhTFOrbl/SO6fEKkdBuHsyBziigBUUwlbTl8K/Sogznec33DsY81TRdW8B4=
X-Received: by 2002:a17:90a:156:: with SMTP id
 z22mr5256977pje.181.1618507145950; 
 Thu, 15 Apr 2021 10:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
 <87eefblbji.fsf@vajain21.in.ibm.com>
In-Reply-To: <87eefblbji.fsf@vajain21.in.ibm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 15 Apr 2021 20:18:49 +0300
Message-ID: <CAHp75VcPANL+LBTxy2V8f2Ksy=FJmdbU1=r60KKO7YSUf9BCLg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
To: Vaibhav Jain <vaibhav@linux.ibm.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 15, 2021 at 8:10 PM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
>
> Thanks for the patch Andy,
>
> Unfortunately ran into a compilation issue due to missing "#include
> <asm/unaligned.h>" that provides definition for
> get_unaligned_le64(). Gcc reported following error:
>
> error: implicit declaration of function =E2=80=98get_unaligned_le64=E2=80=
=99

Right, I have not tested it (as mentioned in the comments to the patch)

> After including the necessary header file, kernel compiled fine and I
> was able to test & verify the patch.

Thank you very much for the testing.

I'm not sure what the coverage of your test is. That's why I have an
additional question below. Is the byte ordering kept the same in BE
(32- and 64-bit) cases? Because I'm worrying that I might have missed
something.


--=20
With Best Regards,
Andy Shevchenko
