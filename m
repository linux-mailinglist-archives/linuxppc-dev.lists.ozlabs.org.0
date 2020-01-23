Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACEC14735E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 22:51:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483bZf5tVrzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 08:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AKigSPzM; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483bXZ4xY8zDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 08:49:50 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id l7so570079oil.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 13:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S935iTNsR30a4CSNLom2KZfe2GAU9enVCcRjMbR4lpE=;
 b=AKigSPzM1pExN/0OUORy7NpgODYyQ4J3t8r/+dJLxrjRj6ZgcGmzkknMRn5g54jugV
 PuPjFHoT8J762NdoRQVHcHl9aReYnbqomBumabhWbyCGFZ3akBYIa+Oo2ZAyxeNPEUG6
 slSOLUOGXe0plcCeEtyTizIlDOrUNqXRHiyll5b912xeRne4Brkv3g2Yj5DnnnWMx9xf
 nOQ+q3+Roi/lwXJJNqrhQmJ7M+daSkVy5CUvw9WY97DQv/1645/V+S819BZ4sC9JHHJB
 FhR+LdjY2IZ9E5Xk/eA4jTuxHrwwKXTVcvl+QK/5vMd9aUzZIaBey7OBVe4+f9tunZmO
 QNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S935iTNsR30a4CSNLom2KZfe2GAU9enVCcRjMbR4lpE=;
 b=e8e/psevJs60q+InNh2RYuaxRiGL1xAC3kkbytbjhrO1aeawwaOcenamb3+Oed1gX/
 3I7EsdlrAyK2FqyhLn66olP5DENHL3D7Z9EzhAb7FGwyAflUzdTQnl9ADfqWCKSEsKid
 avla6QO23w5H9NqQ/2KVFGMIgE13qTYhgnMcIVZVOnGEugzws0GTgw6GwzFKbZp28Czu
 XXDZk+56ER01vWPSJ4/piKaGxgsAR5/ij6twc0xzUW/tc8FjCcvDF5BgEvrYixudARp1
 hMBdTiKhILT/Ufusmo1OtU1jAwkgp32PjBxt+d3a1n5sPKFr/U1dQh/mRNN7iUdwbVWn
 i/eQ==
X-Gm-Message-State: APjAAAWB/zuQ4YePuk9eePY4tTV1ORG6cGJxes4zvstlLnCI6gHd/zWa
 RAbhb9dCqy66XIbx3ZdQu7u7E8DdsJF2++vmOST2Wg==
X-Google-Smtp-Source: APXvYqx4QUtx9s2lROgpkdUqlxbaltm1ZPSPZIGO6zsZcw5gUbC6uA34HmB9vJLOfKcAsmsAfZMR+8aobM49R/8fTys=
X-Received: by 2002:aca:1103:: with SMTP id 3mr32140oir.70.1579816187113; Thu,
 23 Jan 2020 13:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-3-alastair@au1.ibm.com>
 <CAPcyv4hhK1dyqqe=CwnGfd=hRdUJn0pL6scCUgCz2R+bijZvYg@mail.gmail.com>
In-Reply-To: <CAPcyv4hhK1dyqqe=CwnGfd=hRdUJn0pL6scCUgCz2R+bijZvYg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 23 Jan 2020 13:49:36 -0800
Message-ID: <CAPcyv4in5yHD3i2nYgaJsNKkVAJf4h4N+HUbhkmWjXzVK2jN=w@mail.gmail.com>
Subject: Re: [PATCH v2 02/27] nvdimm: remove prototypes for nonexistent
 functions
To: "Alastair D'Silva" <alastair@au1.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ add Aneesh ]


On Tue, Dec 3, 2019 at 4:10 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Mon, Dec 2, 2019 at 7:48 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
> >
> > From: Alastair D'Silva <alastair@d-silva.org>
> >
> > These functions don't exist, so remove the prototypes for them.
> >
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> > ---
>
> This was already merged as commit:
>
>     cda93d6965a1 libnvdimm: Remove prototypes for nonexistent functions
>
> You should have received a notification from the patchwork bot that it
> was already accepted.
>
> What baseline did you use for this submission?

I never got an answer to this, and I have not seen any updates. Can I
ask you to get an initial review from Aneesh who has been doing good
work in the nvdimm core, and then we can look to get this in the
pipeline for the v5.7 kernel?
