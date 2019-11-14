Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FFFCAD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 17:37:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DRwL5l85zF4lG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 03:37:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="wzDdYVXq"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DRt60SR3zF7sb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 03:35:19 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id r24so5367683otk.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 08:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UNGw4TfqpfUCJ1fFVpttb7yfMciDUeoomP1skmq9jqo=;
 b=wzDdYVXqT4Ey6M67cJpE2V9RW05xslTchPTS/hgQLgzS1Adyn/SSVZe8h+/FV3+OEr
 52aw9+G2ykaRfJ+mRf/qS93DqP/b1+Z7BIrrOLGGb96L9dS13FR/cQ5cJs76bWWlrK6W
 fqNBszqmuQdRuM/2GYczu5lSzGyKaI9xXrl4V/ZNMXYZfWwpYAi0lOB/oV28HZ7TjStS
 Zqfj2Avr6iBAu3jFnq7z/TQ870HCPlT3y93YEl4aHjCjK+JNpENeUdIZtSkOrBX6im9e
 w+lAIM11QP6vdr3x7EMoEeyf6fIy5ZiIpMHQUXkqsZwsodfqmPUjwrQgkGmNxSc/hft5
 YFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UNGw4TfqpfUCJ1fFVpttb7yfMciDUeoomP1skmq9jqo=;
 b=CCev5X7xiI92Xw1F9+xw9P6x4YHmhCaVqqM8BnYzXWr9kuOitBkEIChY6dUn7DKfxj
 uoZ9gHEH/MTrzMBYmiVO64qIW6H1HIIx8BynpAebdIMClkraYEl4eoheb3rvwf3wFUS0
 3aARGGNNUAPWzYVEtm8mR18KQXMCglqkGYBJhn+IiAJeTIb0QF6wTZGYRveoD/4lS3ye
 U0D7H22fXbwHdJNeaLXJjLTaXySHzPwGs9XrAHtbV7WzYf1D/Ifl6uXErxzxj/YAaFp+
 qQErPD6IedR/GuKh0zAoJ7WXab9ssBsvPWo+rm0dId7LfCBJL7tBYBL0PghsYtGcQ4hv
 ivEA==
X-Gm-Message-State: APjAAAW0B1y0T3bf7pEdmptaB6YUiHoYLUE0KOvgiLZPJq9C72x2WxMG
 PKOTsFRfA7cST/TESjZ46DydUUyqqFHiVF22kJBDAQ==
X-Google-Smtp-Source: APXvYqwhlbMIqVoDMtemn28FjHxtHG8v5mkLAQT8X9GpCHUizz0JFqeybR7UBBP0zJO9mCY12klfr97VHx+i97m3uhU=
X-Received: by 2002:a9d:2d89:: with SMTP id g9mr7713217otb.126.1573749316381; 
 Thu, 14 Nov 2019 08:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-9-alastair@au1.ibm.com>
 <8232c1a6-d52a-6c32-6178-de082174a92a@linux.ibm.com>
In-Reply-To: <8232c1a6-d52a-6c32-6178-de082174a92a@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 14 Nov 2019 08:35:04 -0800
Message-ID: <CAPcyv4g9b6PyREurH9NcQf4BO2YcRGJPBZDqGKy-Vz91mBKjew@mail.gmail.com>
Subject: Re: [PATCH 08/10] nvdimm: Add driver for OpenCAPI Storage Class Memory
To: Frederic Barrat <fbarrat@linux.ibm.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 alastair@d-silva.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alastair D'Silva <alastair@au1.ibm.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some quick feedback on your intro concerns...

On Thu, Nov 14, 2019 at 5:41 AM Frederic Barrat <fbarrat@linux.ibm.com> wrote:
>
> Hi Alastair,
>
> The patch is huge and could/should probably be split in smaller pieces

Yeah, it's a must. Split the minimum viable infrastructure by topic
and then follow on with per-feature topic patches.

> to ease the review. However, having sinned on that same topic in the
> past, I made a first pass anyway. I haven't covered everything but tried
> to focus on the general setup of the driver for now.
> Since the patch is very long, I'm writing all the comments in one chunk
> here instead of spreading them over a few thousand lines, where some
> would be easy to miss.
>
>
> Update MAINTAINERS for the new files
>
> Have you discussed with the directory owner if it's ok to split the
> driver over several files?

My thought is to establish drivers/opencapi/ and move this and the
existing drivers/misc/ocxl/ bits there.
