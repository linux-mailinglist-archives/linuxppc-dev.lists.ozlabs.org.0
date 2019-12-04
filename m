Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99605112094
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 01:17:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SKCw08nPzDqM3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 11:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="sjADaI35"; 
 dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SKB70DhhzDqG9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 11:15:22 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id v140so5066404oie.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2019 16:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j9JhZIkY5UYbY9sicT+H9HLXPSEjz22qXNqZGrcjpfw=;
 b=sjADaI35VirKvqsrqcyE6zHoNPjuN6G2m9ZEfOP0vAzlUcOZatDYa+fY1Lh7TSemxA
 E9z4+FLH81bsPE7jhKCCKN1DmErGGdIxeh39qCg4GwDB8ZsVx4r61KmTjQwCb/UuucdY
 MQzoUEuK07SBtKntXdJCpBk0kcT0omifR4aXFxcw7o3rx9lv7uA9aBUSsKzYL5hvmff7
 VBUsVf8LYZp9bvzGB9w4p+HLgV4aSriJTATl3XEvLqXfP38gMCA0YJngB18JE+aJyc3p
 AyoPpUAJe7VB1HdvyAHKuhO3bnO22MuhuJUDQ1jhzTpN+/z3jkA188FqW0RuyD6OHbD0
 B3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j9JhZIkY5UYbY9sicT+H9HLXPSEjz22qXNqZGrcjpfw=;
 b=TspbuHcTkvyMjqouAkXn14fsftteTcT85nY+6BHPqHW4nby+XFfKkDHrTKM3Z5Ey+0
 AX20B3kEQo5uswnM54gtDhyybrBQ1PVPX5W0cjCBsr37NbcqVDz1+0d4h+dTaqK9XEGy
 IZloRZpd/i+Xl78mpNhQU84uOEMhHQxilLnWYeqpI1W4GKwMcDGL+cwr1wcw2ySUNbHV
 3IwijuYF0accaFdTioaE3uVKFpEIRhGUq+7TZJ42TCBZFwqzNvUAfcgbERcMx+aPc/t8
 GpqiV/chNvb9MYE0WZjUfODWWrF5P6vMcOxY0cAxiCWHR1qCRSM/6q1Uy19z8hZeIsLJ
 tqMA==
X-Gm-Message-State: APjAAAXx1oFXl4a7+yhrU5h6Jspgvmmz6D2OYFTcoxBNO5qqiraZU6eb
 67jSrw+qWwziJwcKHwW6KSjnZ88bqzrUpSrnC6xS5w==
X-Google-Smtp-Source: APXvYqzZunLuEIN9d3ELG/cd3hfZU5berEzOo2/mUNAdgvjVy3WYCgxi0H9bamLriZ+TeAij+34DEI9woMPAH/4Z6q0=
X-Received: by 2002:aca:2405:: with SMTP id n5mr318915oic.73.1575418519668;
 Tue, 03 Dec 2019 16:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203035057.GR20752@bombadil.infradead.org>
 <1e3892815b9684e3fb4f84bd1935ea7e68cd07d8.camel@au1.ibm.com>
 <20191203124240.GT20752@bombadil.infradead.org>
In-Reply-To: <20191203124240.GT20752@bombadil.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 3 Dec 2019 16:15:08 -0800
Message-ID: <CAPcyv4hccpaw5fFdp7u3Z=C0zNZ1oTBtNfyLhJ16C2Dmq+Qp3Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] Add support for OpenCAPI SCM devices
To: Matthew Wilcox <willy@infradead.org>
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
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Alastair D'Silva <alastair@au1.ibm.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 3, 2019 at 4:43 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Dec 03, 2019 at 03:01:17PM +1100, Alastair D'Silva wrote:
> > On Mon, 2019-12-02 at 19:50 -0800, Matthew Wilcox wrote:
> > > On Tue, Dec 03, 2019 at 02:46:28PM +1100, Alastair D'Silva wrote:
> > > > This series adds support for OpenCAPI SCM devices, exposing
> > >
> > > Could we _not_ introduce yet another term for persistent memory?
> > >
> >
> > "Storage Class Memory" is an industry wide term, and is used repeatedly
> > in the device specifications. It's not something that has been pulled
> > out of thin air.
>
> "Somebody else also wrote down Storage Class Memory".  Don't care.
> Google gets 750k hits for Persistent Memory and 150k hits for
> Storage Class Memory.  This term lost.
>
> > The term is also already in use within the 'papr_scm' driver.
>
> The acronym "SCM" is already in use.  Socket Control Messages go back
> to early Unix (SCM_RIGHTS, SCM_CREDENTIALS, etc).  Really, you're just
> making the case that IBM already uses the term SCM.  You should stop.

I tend to agree. The naming of things under
arch/powerpc/platforms/pseries/ is not under my purview, but
drivers/nvdimm/ is. Since this driver is colocated with the "pmem"
driver let's not proliferate the "scm" vs "pmem" confusion.
