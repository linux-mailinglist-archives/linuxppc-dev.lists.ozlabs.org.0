Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4AA1762F9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 19:44:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WTZM2V37zDqdS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 05:44:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=CPm8ZJw3; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WTXK4yb5zDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 05:42:20 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id d62so219471oia.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 10:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+8nfoKR15NmxwB0eviFINMK7mfZ/bWjSvXOrhjIWgPw=;
 b=CPm8ZJw3+TWEjm2lgHBD+rU3/76tOPOt/12fFrgnw2C+/jUxelaXCBy/mledMuM2H4
 UlAIyFz070RaCXY/KEZln/OokcFWj7YxyxPjwaN35ZO3D/q/BDSWAYwsvNEO+nt31v7D
 49Fax9alh1vhw1rCVJrTQYmQBkemdlKDDBgXcDmdS4MqnUEeqaaULI1Dog21/vZ9Quzl
 U6ZoxWzBEw6oxC63miSYvzacQ3XQyRUEWCwa16y36z1EtbdkjlHFU/DB78WUlcsAgTQj
 X4vnNZR9pmMEaoIOyifJCVVs0MyiH0ZaOQ7V6UDcVmgE5ZGcbH8uFVpH1Adv5G/V1hVJ
 M83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+8nfoKR15NmxwB0eviFINMK7mfZ/bWjSvXOrhjIWgPw=;
 b=VkORWSeMy8JbSkJ6/3CWQ/SXEl3RWBAaZkjdSkiWXINPnAdXx7iL4gHNk+SBCbeD3u
 ACdDY0X3jZx2+9gg0U+ccUwruskF0OWB5RybDsbhwbs4NpSE1u9vHN5HLxNotL0JAukt
 vZbW6TkJSwli8O5Yrfrktmf6IaAf+2vIl1RZF+TXcNhu/iJLlKG+qAnljeIDjv3O2QoD
 onWoRLTytyAE/zz+i4T157w/oOp22X1MrGYEgIkUI1VnUyEupQepNY3zhXF5W8SGz7ps
 q8HBqD2tsr/x4tEjzGH8Xa8dnAvhM/oxJWIzLJtagkRgeKHVG0UG1xTj/47k1pXXbUpW
 E8AQ==
X-Gm-Message-State: ANhLgQ1Baq9XNd6zbXXib4cIWdlh8AW7Wege9DTGhdy0vsQpzrfmx9sf
 /iKxy2LRiXQclMrmuApcCjDQz0PrheOmYHCBQBRyCw==
X-Google-Smtp-Source: ADFU+vvxBj3MBEqz5EKGoBOP9Q8Qnffyo4RLmccwHWhZAvKECUrDC084nmiZgFmtaJWkabRCBnu8WgzsenpBXgnwu2k=
X-Received: by 2002:a54:4098:: with SMTP id i24mr9465oii.149.1583174537330;
 Mon, 02 Mar 2020 10:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <20200221032720.33893-16-alastair@au1.ibm.com>
 <9e40ad40-6fa8-0fd2-a53a-8a3029a3639c@linux.ibm.com>
In-Reply-To: <9e40ad40-6fa8-0fd2-a53a-8a3029a3639c@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 2 Mar 2020 10:42:06 -0800
Message-ID: <CAPcyv4gCCjQFnLaSpRPEuKoDq3gOHSxjxLT_=X3N_nr=2ZOcSA@mail.gmail.com>
Subject: Re: [PATCH v3 15/27] powerpc/powernv/pmem: Add support for near
 storage commands
To: Frederic Barrat <fbarrat@linux.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>, alastair@d-silva.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Alastair D'Silva <alastair@au1.ibm.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 2, 2020 at 9:59 AM Frederic Barrat <fbarrat@linux.ibm.com> wrot=
e:
>
>
>
> Le 21/02/2020 =C3=A0 04:27, Alastair D'Silva a =C3=A9crit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> >
> > Similar to the previous patch, this adds support for near storage comma=
nds.
> >
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
>
>
> Is any of these new functions ever called?

This is my concern as well. The libnvdimm command support is limited
to the commands that Linux will use. Other passthrough commands are
supported through a passthrough interface. However, that passthrough
interface is explicitly limited to publicly documented command sets so
that the kernel has an opportunity to constrain and consolidate
command implementations across vendors.
