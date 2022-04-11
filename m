Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA184FB57E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 10:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcLrT4VwZz3bdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 18:00:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0s8B86pD;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Vx61I8In;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0s8B86pD; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Vx61I8In; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcLqr3rw8z2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 18:00:08 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE4FF210DB;
 Mon, 11 Apr 2022 08:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649664005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygOJS1UJ2EQgy4NRQLgltFuCHUi3pcvpVa8hltpSQ5g=;
 b=0s8B86pDevOpcgWdBDtFGs1UaV0lMlc6eLuiiJz5Wdl0cFZF5J7Ii4B0zKzNLnFcgy61H6
 tOEVmU2UXsU/PsgHiRUQDRoB315VbmBtGfBNhe/xtCiz2DyXF0TkzNxzc+ZLm3XmxyIoGf
 5cXASHouDL1HPYnNr1BCrrSOLvX5YOw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649664005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygOJS1UJ2EQgy4NRQLgltFuCHUi3pcvpVa8hltpSQ5g=;
 b=Vx61I8InXmEAoP0vJS/oQ6KW+pKJSSTldCeOviOsGrD/O1qNP/iW8Ij7pORts7Rzy66a5s
 h36R4uo7KEoF8BAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5156F13AB5;
 Mon, 11 Apr 2022 08:00:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lQp7DwXgU2JvIwAAMHmgww
 (envelope-from <osalvador@suse.de>); Mon, 11 Apr 2022 08:00:05 +0000
Date: Mon, 11 Apr 2022 10:00:03 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Message-ID: <YlPgAxqTR9EkIkXX@localhost.localdomain>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
 <Yk29dMa3H8bk0yST@localhost.localdomain>
 <20220408122537.GD568950@linux.vnet.ibm.com>
 <874k316uu1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874k316uu1.fsf@mpe.ellerman.id.au>
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Michal Hocko <mhocko@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 10, 2022 at 09:28:38PM +1000, Michael Ellerman wrote:
> Yeah agreed, thanks for getting to the root of the problem.
> 
> Can you resend as a standalone patch. Because you sent it as a reply it
> won't be recognised by patchwork[1] which means it risks getting lost.

Hi Michael,

It's done [1].

thanks!

[1] http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220411074934.4632-1-osalvador@suse.de/

 
-- 
Oscar Salvador
SUSE Labs
