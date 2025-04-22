Return-Path: <linuxppc-dev+bounces-7891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03904A964CC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 11:45:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhcm34BPrz30dt;
	Tue, 22 Apr 2025 19:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=37.157.195.192
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745315107;
	cv=none; b=NKlhem8tQ/rqAQ+RrwgUmUgA9nBRS5Py0e83UsYCAXZ4OZvDnXoGAhQZFiG8M8DvHfalCee5fRBwsTrTfF0IJp72Urcfaqyh+BANQ0KPpbWHlCravDF/RmvefIred8sbT1PKMGGjAyaLKYoSsm4Q7hOTY8k7Tu7Wuf78uo+oM/Qi7pAVfkgDp2aqQX32Gtkq9LnIcUm/QLkXhpjWzSBrNOyBwHeWLazrj710TIqHatP2Mimg5YzhDCD4iCzcj65SQEtMTdm9fLCGhl0VkIjvankUuT7yQDbf2ePcUNWU5kdgSI8P060bBHeUM01iIy57zeRDDPowpGnxMs/7+CImtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745315107; c=relaxed/relaxed;
	bh=Uqj0wYkgYZSApP9Itot822yeUPxKopnn9yM4s5SZbC8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Q0sNC/WqWr3PCJwMe1hCUIaWcYGhBh/DjQ4Aamj7R8mysgW1f/7QGlP2fJFpBa7XCiRojOyJwTsAaGZOEvxXPjnDufn45QRftVzbloR6JMS0g2FXurLafVU+Ccz47NxGe3q+rGYOClO6YGaYblU+iGEu8fmN9evt64qRNauJLv1chy55WsHHiakwaq2K6npc413Syj5/GOg1B2zzh0WJBaDeSpCDL7EhAoFQMF3Lq2XCrloq//bghNZ5Rmgz2BNTs8CrI28xn73KUZVEojdm1TVFXtKl56GZ+uLKC/Uvre7Oad7KDoUpoU/Yh6oFnOL5HiUkrJ5Iifijvt8BmdMX1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz; spf=pass (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org) smtp.mailfrom=danny.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=danny.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=lists.ozlabs.org)
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhcm15DkRz2yqT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 19:45:04 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id EF1ADE8;
	Tue, 22 Apr 2025 11:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 redcrew.org EF1ADE8
Received: from talos.danny.cz (talos [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id B061315E001;
	Tue, 22 Apr 2025 11:44:59 +0200 (CEST)
Date: Tue, 22 Apr 2025 11:44:59 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Hannes Reinecke <hare@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-nvme@lists.infradead.org
Subject: Re: frozen PHB on IBM Power9 system in 6.15-rc2 (bisected)
Message-Id: <20250422114459.898a2d196abf19aff43dc1ae@danny.cz>
In-Reply-To: <a13592e6-0259-4c12-ab6f-0e014bd62b3b@suse.de>
References: <20250417171026.b4474b4e2d0b528411c0e508@danny.cz>
	<a13592e6-0259-4c12-ab6f-0e014bd62b3b@suse.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=3.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Hannes,

On Tue, 22 Apr 2025 08:37:32 +0200
Hannes Reinecke <hare@suse.de> wrote:

> On 4/17/25 17:10, Dan Horák wrote:
> > Hi,
> > 
> > I am seeing "frozen PHB" on Power9 bare-metal (PowerNV ppc64le) system
> > leading to non-accessible nvme drives (they are behind a switch) in the
> > 6.15-rc2 kernel (originally with kernel-6.15.0-0.rc2.22.fc43). I was
> > able to bisect the issue to commit
> > 62baf70c327444338c34703c71aa8cc8e4189bd6 [1].
> > 
> > Please see [2] for full console log and other details. Please ignore
> > the "soft-lockup" messages, they are unrelated and going to be resolved
> > with [3]. We are building the kernel with CONFIG_NVME_MULTIPATH=y
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=62baf70c327444338c34703c71aa8cc8e4189bd6
> > [2] https://fedora.danny.cz/ppc/rdsosreport.txt
> > [3] https://lore.kernel.org/all/20250410125110.1232329-1-gshan@redhat.com/
> > 
> Already fixed with 'nvme: fixup scan failure for non-ANA multipath
> controllers', included in the latest pull request to Jens.

thanks for the pointer, will give it a try soon


		Dan

> 
> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich

