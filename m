Return-Path: <linuxppc-dev+bounces-9288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A201AD5384
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 13:16:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHNQC5cWsz2yMt;
	Wed, 11 Jun 2025 21:16:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749640579;
	cv=none; b=bdOZwT/2gFukJBZO0yC071JRo77Y+EVAvKvtVPy/RSeAwbQQiePfR8picGEXZNBtwlyjSilbLFeu2VXK8qWin0qTDY45qI0Yddn21n/zTGe32d3wPtFQAPpKZ4v1cjyZqBeRI0oF7lyT+PgWlG0lDUvrDwS0m9WFM3uUOLDUcRspLmMx6Rw6hPT10d+cR6lyYwsISr/u9No0fv8wwDRF0nhEipdhy+AMAodfKHlZlOMDbJKtp4VnHNxjnQKVMfyAGATrOC4Slz0OeUw8v2RUEUVtHCYfKBZofgc14YbXkSN2sPgd7UXpsBJzD+A4e6afqgsbJ1fgVUV7S8a1BiFOKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749640579; c=relaxed/relaxed;
	bh=PvfT2MUjHTkTjlcDEYkZIvfxnOEDDfCxfbMGf2Kf9/c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZzWQ2hHsHZ+j5EPYNnhhfo1hQv4iPXQn39LjLZIldWs+16DTeFpp6X5MW3jH45Rf2LDIemu0p9EIEK771vdt/NFH8o+qv1BnsjEnmYpPpdwMRBHSjeAiv/BhMrbLJhkUJNI35Taa+zIVUZgkmFunKTNrn6qbCWItMFmFe76d0krzcSokwyzD80UgxkkkKBr1oawfyO6KGZ7lGu08ndKLpeMiTE6WfCmukVjWj8oEoVhaaEzhlEhZzLtzLyWMGuvAA8Stz72HVQXANDBlV9jwfKCyW/f+mo+c7GagYJIB7nOitX/h4sz4edG5HzNHrlHGywZsFjKBrmslVi0RCrQpEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WdS8okEu; dkim-atps=neutral; spf=none (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WdS8okEu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHNQ72pcgz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 21:16:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749640576; x=1781176576;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eEuprULSjDVVLT+zB/HbzjMEOf6OXIWRVXtO+cApelo=;
  b=WdS8okEulaW5Ok3H37aTOWWOzdfE/J7e6WzJ0apJskzc/QWYa9+T2/7Q
   KpWs4vBYyTCFy9T8tqf8+tg6gxZmRccF/0znk7Fo4E00zAshopFZv/SdC
   ocqWYcKFKoc8E18OhAnitWOyfOXnL+r8ky7q09H6iJRH9s2oesFSXF2x8
   snDUte7kpfGjDmEcJAMSZEO8JShdK370RlshtZA/3YZ95Lm66IMLFyOBf
   BZ8eiNOIVGOfVMYdTXn2H38XL0nm+5cnE/FINeDYHQW6bN2w23ZmEL63F
   df/AOFK5y8D7kI/Ws1bEjirvmcaRTjqljcM8OdWmlINqps2ZbZBk+YdbW
   g==;
X-CSE-ConnectionGUID: ABeSACoyQNyBMZCn9wMugQ==
X-CSE-MsgGUID: dSqd8yGaToCFz1Kh/vNdxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51771627"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51771627"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:16:07 -0700
X-CSE-ConnectionGUID: Oio9/DKCSBqXcbPQylrduw==
X-CSE-MsgGUID: 8dq+FMXgTL+6hzXPi2hQyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147044556"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.183])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 04:16:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Jun 2025 14:15:59 +0300 (EEST)
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 02/33] powerpc/legacy_serial: cache serial port and info
 in add_legacy_port()
In-Reply-To: <20250611100319.186924-3-jirislaby@kernel.org>
Message-ID: <17b17aa3-dfd9-0e8d-b2a1-010637db29d7@linux.intel.com>
References: <20250611100319.186924-1-jirislaby@kernel.org> <20250611100319.186924-3-jirislaby@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1944227453-1749640559=:957"
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1944227453-1749640559=:957
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Jun 2025, Jiri Slaby (SUSE) wrote:

> Caching the port and info in local variables makes the code more compact
> and easier to understand.
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> ---
>  arch/powerpc/kernel/legacy_serial.c | 52 ++++++++++++++---------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/le=
gacy_serial.c
> index 1da2f6e7d2a1..d9080189c28c 100644
> --- a/arch/powerpc/kernel/legacy_serial.c
> +++ b/arch/powerpc/kernel/legacy_serial.c
> @@ -77,6 +77,8 @@ static int __init add_legacy_port(struct device_node *n=
p, int want_index,
>  =09=09=09=09  phys_addr_t taddr, unsigned long irq,
>  =09=09=09=09  upf_t flags, int irq_check_parent)
>  {
> +=09struct plat_serial8250_port *legacy_port;
> +=09struct legacy_serial_info *legacy_info;
>  =09const __be32 *clk, *spd, *rs;
>  =09u32 clock =3D BASE_BAUD * 16;
>  =09u32 shift =3D 0;
> @@ -110,16 +112,17 @@ static int __init add_legacy_port(struct device_nod=
e *np, int want_index,
>  =09if (index >=3D legacy_serial_count)
>  =09=09legacy_serial_count =3D index + 1;
> =20
> +=09legacy_port =3D &legacy_serial_ports[index];
> +=09legacy_info =3D &legacy_serial_infos[index];
> +
>  =09/* Check if there is a port who already claimed our slot */
> -=09if (legacy_serial_infos[index].np !=3D NULL) {
> +=09if (legacy_info->np !=3D NULL) {
>  =09=09/* if we still have some room, move it, else override */
>  =09=09if (legacy_serial_count < MAX_LEGACY_SERIAL_PORTS) {
>  =09=09=09printk(KERN_DEBUG "Moved legacy port %d -> %d\n",
>  =09=09=09       index, legacy_serial_count);
> -=09=09=09legacy_serial_ports[legacy_serial_count] =3D
> -=09=09=09=09legacy_serial_ports[index];
> -=09=09=09legacy_serial_infos[legacy_serial_count] =3D
> -=09=09=09=09legacy_serial_infos[index];
> +=09=09=09legacy_serial_ports[legacy_serial_count] =3D *legacy_port;
> +=09=09=09legacy_serial_infos[legacy_serial_count] =3D *legacy_info;
>  =09=09=09legacy_serial_count++;
>  =09=09} else {
>  =09=09=09printk(KERN_DEBUG "Replacing legacy port %d\n", index);
> @@ -127,36 +130,33 @@ static int __init add_legacy_port(struct device_nod=
e *np, int want_index,
>  =09}
> =20
>  =09/* Now fill the entry */
> -=09memset(&legacy_serial_ports[index], 0,
> -=09       sizeof(struct plat_serial8250_port));
> +=09memset(legacy_port, 0, sizeof(*legacy_port));
>  =09if (iotype =3D=3D UPIO_PORT)
> -=09=09legacy_serial_ports[index].iobase =3D base;
> +=09=09legacy_port->iobase =3D base;
>  =09else
> -=09=09legacy_serial_ports[index].mapbase =3D base;
> -
> -=09legacy_serial_ports[index].iotype =3D iotype;
> -=09legacy_serial_ports[index].uartclk =3D clock;
> -=09legacy_serial_ports[index].irq =3D irq;
> -=09legacy_serial_ports[index].flags =3D flags;
> -=09legacy_serial_ports[index].regshift =3D shift;
> -=09legacy_serial_infos[index].taddr =3D taddr;
> -=09legacy_serial_infos[index].np =3D of_node_get(np);
> -=09legacy_serial_infos[index].clock =3D clock;
> -=09legacy_serial_infos[index].speed =3D spd ? be32_to_cpup(spd) : 0;
> -=09legacy_serial_infos[index].irq_check_parent =3D irq_check_parent;
> +=09=09legacy_port->mapbase =3D base;
> +
> +=09legacy_port->iotype =3D iotype;
> +=09legacy_port->uartclk =3D clock;
> +=09legacy_port->irq =3D irq;
> +=09legacy_port->flags =3D flags;
> +=09legacy_port->regshift =3D shift;
> +=09legacy_info->taddr =3D taddr;
> +=09legacy_info->np =3D of_node_get(np);
> +=09legacy_info->clock =3D clock;
> +=09legacy_info->speed =3D spd ? be32_to_cpup(spd) : 0;
> +=09legacy_info->irq_check_parent =3D irq_check_parent;
> =20
>  =09if (iotype =3D=3D UPIO_TSI) {
> -=09=09legacy_serial_ports[index].serial_in =3D tsi_serial_in;
> -=09=09legacy_serial_ports[index].serial_out =3D tsi_serial_out;
> +=09=09legacy_port->serial_in =3D tsi_serial_in;
> +=09=09legacy_port->serial_out =3D tsi_serial_out;
>  =09}
> =20
> -=09printk(KERN_DEBUG "Found legacy serial port %d for %pOF\n",
> -=09       index, np);
> +=09printk(KERN_DEBUG "Found legacy serial port %d for %pOF\n", index, np=
);
>  =09printk(KERN_DEBUG "  %s=3D%llx, taddr=3D%llx, irq=3D%lx, clk=3D%d, sp=
eed=3D%d\n",
>  =09       (iotype =3D=3D UPIO_PORT) ? "port" : "mem",
>  =09       (unsigned long long)base, (unsigned long long)taddr, irq,
> -=09       legacy_serial_ports[index].uartclk,
> -=09       legacy_serial_infos[index].speed);
> +=09       legacy_port->uartclk, legacy_info->speed);
> =20
>  =09return index;
>  }
>=20
--8323328-1944227453-1749640559=:957--

