Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E1A4B5257
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:57:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy5QD3QGpz3cRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 00:57:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XT7NdFXR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zN0OWig6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XT7NdFXR; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zN0OWig6; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy5PW2KZ4z3bTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 00:57:02 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2093B1F38A;
 Mon, 14 Feb 2022 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644847019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hr2+tPkw3BaXqVnNFkxHoaVztAbRXIq5g2+f89vFbE=;
 b=XT7NdFXRqhhxLIMS2RPQKa0xfl7BGEW4fpUy/Cek5QPvi7q6gOitom1nrFAs4oYzj2u2ZE
 row6pOeMppP0XDE4seI04pwcJiP6V0Pr326b43OY0ZnlzLIC0yn8hLS8CkrRrnbEJwpxMG
 htV915254GWsNA3LNEx7se02LCOnCgs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644847019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hr2+tPkw3BaXqVnNFkxHoaVztAbRXIq5g2+f89vFbE=;
 b=zN0OWig6TC4diDtgKRRaFYcVednIxeNZo4G5w1FTHAHrgFgPMc+r3D4IVUzJxfu8IlVGio
 8nfxbXC407AJJBBg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 11E25A3B81;
 Mon, 14 Feb 2022 13:56:59 +0000 (UTC)
Date: Mon, 14 Feb 2022 14:56:57 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: No Linux logs when doing `ppc64_cpu --smt=off/8`
Message-ID: <20220214135657.GM3113@kunlun.suse.cz>
References: <d141d8c3-5c72-02ab-6b31-c32cd02f8291@molgen.mpg.de>
 <20220214094327.GL3113@kunlun.suse.cz>
 <e6701fa9-a51b-3706-5aa5-bb6c7ae76cf0@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6701fa9-a51b-3706-5aa5-bb6c7ae76cf0@molgen.mpg.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 14, 2022 at 01:33:24PM +0100, Paul Menzel wrote:
> Dear Michal,
> 
> 
> Thank you for your reply.
> 
> Am 14.02.22 um 10:43 schrieb Michal Suchánek:
> 
> > On Mon, Feb 14, 2022 at 07:08:07AM +0100, Paul Menzel wrote:
> > > Dear PPC folks,
> > > 
> > > 
> > > On the POWER8 server IBM S822LC running `ppc64_cpu --smt=off` or `ppc64_cpu
> > > --smt=8`, Linux 5.17-rc4 does not log anything. I would have expected a
> > > message about the change in number of processing units.
> > 
> > IIRC it was considered too noisy for systems with many CPUs and the
> > message was dropped. You can always check the resulting state with
> > ppc64_cpu or examining sysfs.
> 
> Yes, simple `nproc` suffice, but I was more thinking about, that the Linux
> log is often used for debugging and the changes of amount of processing
> units might be good to have. `ppc64_cpu --smt=off` or `=8` seems to block
> for quite some time, and each thread/processing unit seems to powered
> down/on sequentially, so it takes quite some time and it blocks. So 140
> messages would indeed be quite noise. No idea how `ppc64_cpu` works, and if
> it could log a message at the beginning and end.

Yes, it enables/disables threads one by one. AFAICT the kernel cannot know that
ppc64_cpu will enable/disable more threads later, it can either log each
or none. Rate limiting would not show the whole picture so it's not
great solution either.

Thanks

Michal
