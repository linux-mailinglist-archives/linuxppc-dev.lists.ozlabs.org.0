Return-Path: <linuxppc-dev+bounces-5262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934AA11083
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 19:51:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXdX10PrCz3bXv;
	Wed, 15 Jan 2025 05:51:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::bc"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736880705;
	cv=none; b=OXYTR1OqU2PsI2ulsORu01VzWWe+YUX04O01s5E2xLsBZK5WU/eO6HjoJ892T4SrHJQYv3mvR1kf09tWRYBo8vR7G4SZvEiWC6+yGySJUpXqes7jiXpK7lFgB5aAiN2yU8hyCdNpv1dbBAlIItSqMDMcv7y805uHN/lL7alnTzV75FsAREao4Mx69xq3dQysLSqw2Wgq7+m/YipcUNlAmOrMMT+ypwlJRJB3fw+bEGgmodDbjlPd9gDbFENQywda3EXuxO/VbQ2L6lJl+3C8M+0otbcw633GCpAHCvkXaI2H9p9rylTY+pNNSnyMJ+M26BVnwrP9ym+vHMwdnxIw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736880705; c=relaxed/relaxed;
	bh=2eozFwwdtkEYzJ2hyZvHDykhTKQHMj/tbtFgxiV9nmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZsYY9rLVdztl4RkgbS2O2SLDQBwHo4ZTH7hUBCMA0hXyGjppxH/xPKd9pJdmzwCHiFefJH+06AWjRLeLWTr/DpjRcoQNORM1wZKt6XB0a86sYaMgMGcEKHZuwedT6btY1IKbKcODpzPbO/DVBBnE1JMfHHYzyNAqjndijIlWbFHHrb/TDBX7mlImnXpl1Uw0DHB5/J5rM01k0j4mrFimKmrSTssR/nUHEkWvJtjGysvIXGXRJ+JfkwfUxxRS14pv3HvyYwMTHieNkv1sdPzdvqbVz+RdajwJtwJ93gJdeLTVeZOacfF7kNQnveszJntKjPIaZO26xN2WCExpiwUkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::bc; helo=out-188.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [IPv6:2001:41d0:1004:224b::bc])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXdWs5Rb6z30T0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 05:51:34 +1100 (AEDT)
Date: Tue, 14 Jan 2025 19:51:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736880667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2eozFwwdtkEYzJ2hyZvHDykhTKQHMj/tbtFgxiV9nmk=;
	b=bDwVpiqwthykPiL4DaZF3p8XdHuWrRCxyc+t3QoVxlq9WllkrRjz253Cd2sapgSU4PpTuG
	DBtaCXDW1u7il2zRd6EYwHlzoZ1xsuWES603N8XxALx+eGQSDb769jEfu92II30o+alkaZ
	mznHVpGOOinL8YdOWHkCwYRK3h0Supg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 2/5] configure: Display the default
 processor for arm and arm64
Message-ID: <20250114-a36510d222fc3410b9b7654e@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-3-alexandru.elisei@arm.com>
 <20250113-45b57478be2241a35ffa1b67@orel>
 <Z4acKHEn/dE0yLM2@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4acKHEn/dE0yLM2@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 05:17:28PM +0000, Alexandru Elisei wrote:
...
> > > +# $arch will have changed when cross-compiling.
> > > +[ -z "$processor" ] && processor=$(get_default_processor $arch)
> > 
> > The fact that $arch and $processor are wrong until they've had a chance to
> 
> $processor is never wrong. $processor is unset until either the user sets it
> with --processor, or until this line. This patch introduces $default_processor
> only for the purpose of having an accurate help text, it doesn't change when and
> how $processor is assigned.

I should have said "The fact that $arch and $default_processor are wrong..."

> 
> > be converted might be another reason for the $do_help idea. But it'll
> > always be fragile since another change that does some sort of conversion
> > could end up getting added after the '[ $do_help ] && usage' someday.
> 
> configure needs to distinguish between:
> 
> 1. The user not having specified --processor when doing ./configure.
> 2. The user having set --processor.
> 
> If 1, then kvm-unit-tests can use the default $processor value for $arch,
> which could have also been specified by the user.
> 
> If 2, then kvm-unit-tests should not touch $processor because that's what the
> user wants.
> 
> Do you see something wrong with that reasoning?

If we output $default_processor in usage() before it's had a chance to be
set correctly based on a given cross arch, then it won't display the
correct name.

> 
> Also, I don't understand why you say it's fragile, since configure doesn't

I wrote "it'll always be fragile" where 'it' refers to the most recent
object of my paragraph ("the $do_help idea"). But, TBH, I'm not sure
how important it is to get the help text accurate, so we can just not
care if we call usage() with the wrong strings sometimes.

Thanks,
drew

> touch $processor until this point (and unless the user sets it, of course).
> 
> Thanks,
> Alex
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

