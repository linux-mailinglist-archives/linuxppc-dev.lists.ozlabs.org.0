Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B92137F6E48
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 09:35:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sc7bX6MGFz3vh9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 19:35:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 586 seconds by postgrey-1.37 at boromir; Fri, 24 Nov 2023 19:35:09 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sc7b12dGzz3dJq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 19:35:08 +1100 (AEDT)
Received: from relay2.suse.de (unknown [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A666221BFA;
	Fri, 24 Nov 2023 08:25:17 +0000 (UTC)
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id B16FD2C142;
	Fri, 24 Nov 2023 08:25:13 +0000 (UTC)
Date: Fri, 24 Nov 2023 09:25:12 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC] UBUNTU: [Config] y2038: Disable COMPAT and
 COMPAT_32BIT_TIME on ppc64le
Message-ID: <20231124082512.GW9696@kitsune.suse.cz>
References: <20231124002042.1741578-1-dimitri.ledkov@canonical.com>
 <87sf4vrbl3.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sf4vrbl3.fsf@mail.lhotse>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: A666221BFA
X-Spam-Flag: NO
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
Cc: linuxppc-dev@lists.ozlabs.org, Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 24, 2023 at 03:59:04PM +1100, Michael Ellerman wrote:
> Dimitri John Ledkov <dimitri.ledkov@canonical.com> writes:
> > BugLink: https://bugs.launchpad.net/bugs/2038587
> >
> > ppc64le is exclusively little endian and 64-bit, thus there is no need
> > for COMPAT_32BIT_TIME, nor COMPAT.
> 
> To be pedantic, the ppc64le kernel does support running 32-bit little
> endian userspace in compat mode (CONFIG_COMPAT=y). It's a distro choice
> as to whether you support COMPAT. Notably there are two other major
> distros that don't support COMPAT for ppc64le, and the set of 32-bit LE
> software is effectively empty.

I have seen software that does not work when compiled 64bit so it would
build 32bit binary even on ppc64le and abuse the compat layer to run.

It quite rare, though.

Thanks

Michal
