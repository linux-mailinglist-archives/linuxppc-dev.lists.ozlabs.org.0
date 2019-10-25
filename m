Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51BE4506
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 09:59:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zxN64VznzDqjb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 18:59:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zxL45n6szDqf2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 18:57:48 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id v186so953597oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 00:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4Obnzy7VbllcsBWAG1yWv4o6m8aHs6PeND33uMddFQ=;
 b=WRBRf70443e8wcYbeSce9YwXFZDx+jwncnWt4qxUVPpoLqI4wwOb5DC6ByMYKQ+4GX
 3r7p8czWC9Vfs634279M/Qph7tC/ILfT5ws1cbLlR9JXkC2c2bnjppsgzFuZlJNN2Paf
 hVdYEtdeOaj27dO6COMRlE4j4igwcx3//7wiT+o6FXw0FBFGPRvOTukwy41sKE/2N4mK
 es94YLQZ7Nc2PWDLyYBbHysZIW44TlaBcWdVUYJj3dslD5K7BJ/j4ve+hFzZZ+l4t1x8
 TFmn2M0j/njxwHhdqVb2Eg8PqJW0VvL6WGVQGy3kioXhro/1btue0iqD5irqBxhOAE7h
 46dw==
X-Gm-Message-State: APjAAAWJNmLk/XdbabBu86FlAsPSN3MWHvCjBQipGSLtnAykR+XXs4do
 ioWNEMAgKN6GhQIbHfbU4g734dw+/i6oBHBbdqs=
X-Google-Smtp-Source: APXvYqyfnJ+dy4wBkvd4/tg8hxR0xQoQa82GCOzKvlEF+4HiTRrSEXgg68lJoNd3q+IHUF3QAJjVi6QqyPRctI5LUaA=
X-Received: by 2002:a05:6808:3b4:: with SMTP id
 n20mr1723311oie.131.1571990265293; 
 Fri, 25 Oct 2019 00:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
In-Reply-To: <20191025044721.16617-1-alastair@au1.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Oct 2019 09:57:34 +0200
Message-ID: <CAMuHMdUXVy1AYcqquJ2UHdG=2Own=HA3sAGzL_4M+nYd-xh+Dg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add support for OpenCAPI SCM devices
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Wei Yang <richard.weiyang@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Allison Randal <allison@lohutok.net>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Qian Cai <cai@lca.pw>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Keith Busch <keith.busch@intel.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alastair,

On Fri, Oct 25, 2019 at 6:48 AM Alastair D'Silva <alastair@au1.ibm.com> wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
>
> This series adds support for OpenCAPI SCM devices, exposing
> them as nvdimms so that we can make use of the existing
> infrastructure.

Thanks for your series!

The long CC list is a sign of get_maintainter.pl-considered-harmful.
Please trim it (by removing me, a.o. ;-) for next submission.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
