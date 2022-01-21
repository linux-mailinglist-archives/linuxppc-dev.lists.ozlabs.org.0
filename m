Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 076AB495C1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 09:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgCXk6SpTz3bcX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 19:41:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EreA4QQ0;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YfUX6gs/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EreA4QQ0; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YfUX6gs/; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgCWz1ql5z2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 19:41:02 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D8870218F2;
 Fri, 21 Jan 2022 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642754458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFDAH2kqqf9vser+LcfG9U/TSgFByQ36AWUzIn9MFhI=;
 b=EreA4QQ0dKQxNP2rvFRDM7BjNfZ6pFa7Vz6DswGZsU/goDdBulHUEibBY5hLfj+W15l2bO
 cUdS66FuTldq5KBSc6RNyApfKlw9sFG/IgwzX5NjOZ7ZoNPFaFuh9UEm0ImB9LC0qzqXlx
 DKAYSJUKdoFR87gvvxHPJCW6xtnbYn4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642754458;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFDAH2kqqf9vser+LcfG9U/TSgFByQ36AWUzIn9MFhI=;
 b=YfUX6gs/3LBwBHsRUmsJXgODAzlMur8lx6nwhKz4gJxccfoelJebocpQkhTCGZfLZ0yjBu
 YY0JdasMJp9gpYDg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6AB01A3B83;
 Fri, 21 Jan 2022 08:40:57 +0000 (UTC)
Date: Fri, 21 Jan 2022 09:40:56 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 1/7] powerpc/pmem: Restrict papr_scm to P8 and above.
Message-ID: <20220121084056.GD3113@kunlun.suse.cz>
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
 <20200701072235.223558-2-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701072235.223558-2-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jan Kara <jack@suse.cz>, linux-nvdimm@lists.01.org,
 Jeff Moyer <jmoyer@redhat.com>, oohall@gmail.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Jul 01, 2020 at 12:52:29PM +0530, Aneesh Kumar K.V wrote:
> The PAPR based virtualized persistent memory devices are only supported on
> POWER9 and above. In the followup patch, the kernel will switch the persistent
> memory cache flush functions to use a new `dcbf` variant instruction. The new
> instructions even though added in ISA 3.1 works even on P8 and P9 because these
> are implemented as a variant of existing `dcbf` and `hwsync` and on P8 and
> P9 behaves as such.
> 
> Considering these devices are only supported on P8 and above,  update the driver
> to prevent a P7-compat guest from using persistent memory devices.
> 
> We don't update of_pmem driver with the same condition, because, on bare-metal,
> the firmware enables pmem support only on P9 and above. There the kernel depends
> on OPAL firmware to restrict exposing persistent memory related device tree
> entries on older hardware. of_pmem.ko is written without any arch dependency and
> we don't want to add ppc64 specific cpu feature check in of_pmem driver.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/pmem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
> index f860a897a9e0..2347e1038f58 100644
> --- a/arch/powerpc/platforms/pseries/pmem.c
> +++ b/arch/powerpc/platforms/pseries/pmem.c
> @@ -147,6 +147,12 @@ const struct of_device_id drc_pmem_match[] = {
>  
>  static int pseries_pmem_init(void)
>  {
> +	/*
> +	 * Only supported on POWER8 and above.
> +	 */
> +	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
> +		return 0;
> +

This looks superfluous.

The hypervisor is responsible for publishing the pmem in devicetree when
present, kernel is responsible for using it when supported by the
kernel.

Or is there a problem that the flush instruction is not available in P7
compat mode?

Even then volatile regions should still work.

Thanks

Michal
