Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229C495FBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 14:28:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgKvD3RkSz3bXd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 00:28:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y4teg4Bn;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/FXnikPB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Y4teg4Bn; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/FXnikPB; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgKtR5fLCz30Mr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 00:27:27 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B8DC11F3AF;
 Fri, 21 Jan 2022 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642771643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkYaaNotmAtnnGiyVI/o16QaAoHRtZ3nG3WLLjWev4s=;
 b=Y4teg4BnF/gKtyvHaX80FxDMkxmaHDSXEc9jJujpMHaLJWKmJ3Dnzjpg6aYyPwyNgHKYM+
 /OWHzRAgmB7K5vfJ57TIMvrk8XfYbD8tNLHtvmnJGGg/WE0B3IY4tGp9miiRdeT8FInyOt
 LjtSNwqwfSAu4BhHgnqP9vrAzwdyR7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642771643;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkYaaNotmAtnnGiyVI/o16QaAoHRtZ3nG3WLLjWev4s=;
 b=/FXnikPBjvI6RKIiOG7SStMicZWJDSfYWkPKNyLIbjd7NmWzymc9VJqi0xuPS2cIKevRnH
 jWMrVf6D4qHv1LBg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 70099A3B8A;
 Fri, 21 Jan 2022 13:27:23 +0000 (UTC)
Date: Fri, 21 Jan 2022 14:27:22 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 1/7] powerpc/pmem: Restrict papr_scm to P8 and above.
Message-ID: <20220121132722.GE3113@kunlun.suse.cz>
References: <20200701072235.223558-1-aneesh.kumar@linux.ibm.com>
 <20200701072235.223558-2-aneesh.kumar@linux.ibm.com>
 <20220121084056.GD3113@kunlun.suse.cz>
 <87pmolo39z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmolo39z.fsf@linux.ibm.com>
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

On Fri, Jan 21, 2022 at 02:48:32PM +0530, Aneesh Kumar K.V wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> 
> > Hello,
> >
> > On Wed, Jul 01, 2020 at 12:52:29PM +0530, Aneesh Kumar K.V wrote:
> >> The PAPR based virtualized persistent memory devices are only supported on
> >> POWER9 and above. In the followup patch, the kernel will switch the persistent
> >> memory cache flush functions to use a new `dcbf` variant instruction. The new
> >> instructions even though added in ISA 3.1 works even on P8 and P9 because these
> >> are implemented as a variant of existing `dcbf` and `hwsync` and on P8 and
> >> P9 behaves as such.
> >> 
> >> Considering these devices are only supported on P8 and above,  update the driver
> >> to prevent a P7-compat guest from using persistent memory devices.
> >> 
> >> We don't update of_pmem driver with the same condition, because, on bare-metal,
> >> the firmware enables pmem support only on P9 and above. There the kernel depends
> >> on OPAL firmware to restrict exposing persistent memory related device tree
> >> entries on older hardware. of_pmem.ko is written without any arch dependency and
> >> we don't want to add ppc64 specific cpu feature check in of_pmem driver.
> >> 
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >>  arch/powerpc/platforms/pseries/pmem.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >> 
> >> diff --git a/arch/powerpc/platforms/pseries/pmem.c b/arch/powerpc/platforms/pseries/pmem.c
> >> index f860a897a9e0..2347e1038f58 100644
> >> --- a/arch/powerpc/platforms/pseries/pmem.c
> >> +++ b/arch/powerpc/platforms/pseries/pmem.c
> >> @@ -147,6 +147,12 @@ const struct of_device_id drc_pmem_match[] = {
> >>  
> >>  static int pseries_pmem_init(void)
> >>  {
> >> +	/*
> >> +	 * Only supported on POWER8 and above.
> >> +	 */
> >> +	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
> >> +		return 0;
> >> +
> >
> > This looks superfluous.
> >
> > The hypervisor is responsible for publishing the pmem in devicetree when
> > present, kernel is responsible for using it when supported by the
> > kernel.
> >
> > Or is there a problem that the flush instruction is not available in P7
> > compat mode?
> 
> We want to avoid the usage of persistent memory on p7 compat mode
> because such a guest can LPM migrate to p7 systems. Now ideally I would
> expect hypervisor to avoid such migration, that is a p7 compat mode
> guest running on p10 using persistence memory migrating to p7
> (considering p7 never really had support for persistent memory).

Yes, I would expect the hypervisor to prevent migration to host that
does not have all the hardawre that the guest uses. It could still
migrate to P8 or whatever in compat mode.

> 
> There was also the complexity w.r.t what instructions the userspace will
> use. So it was discussed at that point that we could comfortably state
> and prevent the usage of persistent memory on p7 and below. 

But is that arbitrary or does POWER7 not support the pmem sync instructions?

If that is true then how is POWER7 compat mode behaving WRT those
instructions?

Thanks

Michal
