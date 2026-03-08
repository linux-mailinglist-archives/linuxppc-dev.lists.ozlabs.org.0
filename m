Return-Path: <linuxppc-dev+bounces-17870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECEpI6j5rWl2+QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17870-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Mar 2026 23:35:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3460723275D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Mar 2026 23:35:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTZhw6R9Hz3bf8;
	Mon, 09 Mar 2026 09:35:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773008234;
	cv=none; b=bWKiCZSVaRy0nDjjZw4La9FkoR1GQdw5haIdkaL65eqq1YQXxfkADSfdx+qVsCh6pwlLiIhexeMWcfOZN9+9D2RbTwC4BvP8LxKiDVBibx1VQ3eAFaJrNAT+2S6ZqyGGjE9aY273BSjbkyAZIir/GGiDF0nAM+J8OkgvteL9BnNxEvCYEgQ1pTka7/j0NM4AG4c/WioK5vzTVG+pUsjLe7VLchHlcebtSg+7rU/G7DTjJLK6wxLc9ichdQRy7dADfpIXUXy0UZgK+swvq3dcoSqdlBodjd3hdVBCDENANymUGwGhFAqIy4tWmoI48zGk0noo3WHvH8+METOeoFCnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773008234; c=relaxed/relaxed;
	bh=hcBT5b2anZMKuczdBS4bAfgalESQrUwLKiTOvvkw+y8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RqzeuLOCXaoTHeuoTlWOJUq9gal4QWwK0iBoNDFv75RxLsRzcVuyu6nilmDgoWhwwA4O8MzYocK+Gulcz5ZoaeDvZa94WgPCnpAsGZ1wxGeug0qV+sKahMQySv7PFBx5iBFbV+dXXZGgakKkM+egpqhRE1ScTs/0bBg/S1JITZ4EONflYX5sSAjsDWbTlwW6PgCVFkBDUhaNDOSDQbL7KA5hEyc5zATAG+KG/WLRZhiKVa6wndWyPCvbOTx3lIfKBqSgOtpvQ7slpIRgAgE5DJekD85Im7Ys02Tfkhxtndz/R4gxEHweyEM3gUGiZxONwD6vArOnola9ONOkRPkXUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Oiq6AqiG; dkim-atps=neutral; spf=pass (client-ip=195.121.94.185; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org) smtp.mailfrom=xs4all.nl
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Oiq6AqiG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xs4all.nl (client-ip=195.121.94.185; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTZJ95k2Kz30hq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 09:17:13 +1100 (AEDT)
X-KPN-MessageId: 579a4ff8-1b3c-11f1-8ff1-005056999439
Received: from mta.kpnmail.nl (unknown [10.31.161.191])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 579a4ff8-1b3c-11f1-8ff1-005056999439;
	Sun, 08 Mar 2026 23:15:40 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 57998d88-1b3c-11f1-83d4-00505699891e;
	Sun, 08 Mar 2026 23:15:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=hcBT5b2anZMKuczdBS4bAfgalESQrUwLKiTOvvkw+y8=;
	b=Oiq6AqiG5KSiGKUBOO34N1+3n/EiEdqBcBKhR/YfgawTRDjRNivy+kFff20gvbeTR6EGW3oKGWNs1
	 0D9//rSau5jv8oBcaWYbM9WvQG58q6Hqkg8wZfqh8i0ZGMaMMuttUX4iWJO2Lk4Dv3x3IEhTi11leQ
	 /sp1WZM2oPCyAiMAsZHMPxgTm/SFXaSaUpDS0PhvtMhkegrKbYfC41pK08oe+RLj+Ql2lx0bGpnXaj
	 KLTEhpDYJl+TK4bsIXOP6taUwqgLO+eFWmxEeXdeZAkVqLLLm10ZxRbuA4pOM+9CZ+UsEw8hkSgd08
	 DZ6Bz5YkkaH0oz4yeIhx5ecOzI8EaZw==
X-KPN-MID: 33|qVvGpgj2E0+iH94RbpRRUOLN3kALOFLq02MG6hAdDjG/YR0L93yBiMmPVqO+efF
 Q0xKgwhLwKqkmr9krIjELJQONeVRDDbdpCZKM04vq0jI=
X-CMASSUN: 33|2ObSuLWXdH5oI2JFm6qzFO1TOkb3bRRPuSZGPPQ6ojMqaD6VOk998O9MedpM80+
 1CFEvZyzjHRf3u5AL/ZcjJg==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh01 (cpxoxapps-mh01.personalcloud.so.kpn.org [10.128.135.207])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 578c36e8-1b3c-11f1-94b1-00505699eff2;
	Sun, 08 Mar 2026 23:15:40 +0100 (CET)
Date: Sun, 8 Mar 2026 23:15:40 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Kees Cook <kees@kernel.org>,
	Haren Myneni <haren@linux.ibm.com>,
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Message-ID: <1567347751.876335.1773008140595@kpc.webmail.kpnmail.nl>
In-Reply-To: <2026030846-wince-recess-c338@gregkh>
References: <20260308123917.1013607-1-jkoolstra@xs4all.nl>
 <2026030846-wince-recess-c338@gregkh>
Subject: Re: [PATCH] powerpc: vas-api: constify dynamic struct class in
 coproc api register
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Originating-IP: 178.229.142.230
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 3460723275D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17870-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	HAS_X_PRIO_THREE(0.00)[3];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:srikar@linux.ibm.com,m:sshegde@linux.ibm.com,m:kees@kernel.org,m:haren@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xs4all.nl:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action


> Op 08-03-2026 17:19 CET schreef Greg KH <gregkh@linuxfoundation.org>:
> 
>  
> On Sun, Mar 08, 2026 at 01:39:12PM +0100, Jori Koolstra wrote:
> > diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> > index 9f093176b8db..34403582c895 100644
> > --- a/arch/powerpc/platforms/powernv/vas-window.c
> > +++ b/arch/powerpc/platforms/powernv/vas-window.c
> > @@ -1459,7 +1459,6 @@ static const struct vas_user_win_ops vops =  {
> >  int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
> >  			     const char *name)
> >  {
> > -
> >  	return vas_register_coproc_api(mod, cop_type, name, &vops);
> >  }
> >  EXPORT_SYMBOL_GPL(vas_register_api_powernv);
> > 
> 
> This change wasn't needed here :(
> 
> thanks,
> 
> greg k-h

My bad, I meant to copy this here instead of at the top of me last email:

Now checkpatch complains that:

CHECK: Blank lines aren't necessary after an open brace '{'

So the rule is: don't touch white space unless you absolutely have to?

That is good to know to prevent silly v2's. I know that non-functional
changes are frowned upon; but you also shouldn't sneak in a white space
fixes?

Again, sorry for the silly v2.

