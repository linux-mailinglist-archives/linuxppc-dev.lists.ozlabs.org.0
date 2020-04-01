Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D119B6FA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 22:31:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48syWz4y8qzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 07:31:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::544;
 helo=mail-ed1-x544.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sQuNauko; dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48syRv07tHzDr8V
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 07:27:38 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id z65so1527626ede.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ox3otBw8CzCvAty3EpckqUjW2/oZzIrj4z0gJgITkh8=;
 b=sQuNaukoLTYPKuSCOZWDal0NVhFHo2FQ1CmrMenvvhrri0xPkNrgQjkJcS1+O304jX
 G1LL/dvPZIIr5S9WQMK/YzWuBdT05hnu8M2sVpzIve49oA8uvXfH3d99ZokG/NhXws72
 wmFZ2tu2j2+0e7hD39WL0MxFiP1l0JGtXpUDxN8szy2nhjCLK2S7TgZrjq4FfFPh1Yvx
 +MdXV7ahHwxBQTe7fjTbXXXHhUTv0/xGRNa8wzR7wn7HAVNFCmWFhr2x85j8eb8qnyz6
 WXKxqKPC0Ebv8XtBB+cwMF+QyoYWOsaxqiAQsei59ulMxlQvzjoT+Riz/P477b/2B2k7
 YmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ox3otBw8CzCvAty3EpckqUjW2/oZzIrj4z0gJgITkh8=;
 b=sKilIzmMZCgDNKU889XKoCndiphdfm7BDBTiBGnKGp20Q0vmU9OSCTMOMac/A8eoqQ
 VF+UuHc0yAlSayn55Ch1sIxDkRKHgvyCd6gYMKIf/yWHrze1wMqMPy72i2Qu4nJXrN8A
 3IjpJVNN9f2RMK7RLM6DEsFoq/p8Q+ZO97LKjkCavUyn6KwZ3FMwDvHFwROqfmw7cSFD
 EkI/RY3K2QPEG4M8VuAD6d+9vNNEI10rtyPnQJDRjMXVfF4gN1tJg8SH77y8B6CJjcan
 un6T6mBgGsLvV5FQTN8LDMAMCI6OcnxdHPYd7zt7RXExJvohkYIuvd5iWLkwh2SN6aAA
 9PaA==
X-Gm-Message-State: ANhLgQ13uKsQ/uajiKHvjst7X4oQG4T2uuKyxP1MpPKFBa180V8eaLrz
 JxXtP1f7uyJXF+/JFtFRKIp5KDOz6tkx8VxwZ43lqA==
X-Google-Smtp-Source: ADFU+vuuCiWk8AFivXDQPqBgDNLDGhDO6sjqg2/h0Q5ehu4Z/Qb1gPEAD/3R4NV/CE3+xOjAXK/2PN8nmS9Qu76SchY=
X-Received: by 2002:a17:906:dbd4:: with SMTP id
 yc20mr21851655ejb.335.1585772854886; 
 Wed, 01 Apr 2020 13:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-13-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-13-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 13:27:22 -0700
Message-ID: <CAPcyv4hBSa_62siaaOR+PG7cEohTp-xnxZ576aJO0BDofJEN=A@mail.gmail.com>
Subject: Re: [PATCH v4 12/25] nvdimm/ocxl: Add register addresses & status
 values to the header
To: "Alastair D'Silva" <alastair@d-silva.org>
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
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:53 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> These values have been taken from the device specifications.

Link to specification?
