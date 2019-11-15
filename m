Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D9FD3AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 05:32:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Dlnw24XYzF48D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 15:32:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="guB1CbXX"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Dllg1wpTzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 15:30:53 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id n14so7475694oie.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRWArS8EY6M5DOjOjqwZ6+pvf8YoFwoc/oPe6h/50XU=;
 b=guB1CbXX81G22dmWZBHxcVVxa54wwF5isiRP8DfyGl6WLw5qsD8/1yYkL94xe1bvja
 YWrfIftutXLXDL0eJK6ZS/da065bfHQYvNr79ght47XY6Zo0Ik8kf5tpJXSMFAAFQnCw
 ubcAHiqDy1ycfTVOPB41eht7V6f8fV65ZKDZ0inrspQuNJKy3jkEwKSowxth/UevHA+Z
 fTEAoFQL0v3zpTHMc57OpaWN8U0odan50b9dK7PBSP1E9f0eElQWxG9JTLJNXx33+/fU
 uN/a1NVNCswzKJSR8+RQj5yu/EViETOWFER8emzdphHbCRqRIAw57SwazMYWno23m3Pf
 w2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRWArS8EY6M5DOjOjqwZ6+pvf8YoFwoc/oPe6h/50XU=;
 b=ns5hE9Vr2vk2Y2dnME7TzXh8oEgStC89KjD2FNfKYqPj1g8Ckn5S0hOXcOe8Zx0dUv
 yl+JYCiFWR0bJlI/jqCO29VzLY4ai5zk31GFWdRB8Wwnl6MSyoYkb9Khr+W+Srx1juqL
 2q0eEwrimgoAI850TioqFkMt6N2nFzRTIi7IqdPBC/0OLnu2Wi+emUwODoouvhV/6Dfg
 3AH0CuHmMAGgtYcsyPdwwytNFScd9W1lyQRDKwWkdEOnO7oHNG1LSnZamZZR4fE9QvI7
 MHYqG0atVOZ9Pwmg16zGYa4DZs0cL+vl3xApDU73NFmHioDOzGWeWaKITYh2rHuYXHvT
 edXQ==
X-Gm-Message-State: APjAAAVp/RrQgpdlQA4+YPKkvKMmenj6vTJyEJwIKh4RbNIUNxVfEGek
 XWA+Yq4uOyUVGkXYwAc9a0uEr62/d11heEsQwsebZw==
X-Google-Smtp-Source: APXvYqxglauMMGlyWf/TClpfIHTmgAmcgrRFm8og4eYzgO7jYK3rFnEyN8B0fbbAiBI0hQLPzfZ1wmS7ammk00zCWVA=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr6863559oih.0.1573792250134; 
 Thu, 14 Nov 2019 20:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-3-alastair@au1.ibm.com>
In-Reply-To: <20191025044721.16617-3-alastair@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 14 Nov 2019 20:30:38 -0800
Message-ID: <CAPcyv4gb7xZpY+F9qupJbLznqHbyCOuOee8R6aLby72UkyjtZg@mail.gmail.com>
Subject: Re: [PATCH 02/10] nvdimm: remove prototypes for nonexistent functions
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
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Keith Busch <keith.busch@intel.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 9:49 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
>
> From: Alastair D'Silva <alastair@d-silva.org>
>
> These functions don't exist, so remove the prototypes for them.
>
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>

Looks good, applied.
