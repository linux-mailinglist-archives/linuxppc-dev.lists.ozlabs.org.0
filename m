Return-Path: <linuxppc-dev+bounces-1279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901589764B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 10:35:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X49kC2v7Dz2yG9;
	Thu, 12 Sep 2024 18:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726130131;
	cv=none; b=Nfg9CbhFy3h5rylmjF4IeQpO+h0MWK3PEXNWqP5ip8QWjqLl6olFI2Bij1icFFMuDUGTjqZttbXetprcObb3b0B5vmijBcDq5EaMs3rKFJeh2pKMryvIjO/wcjTxB5chiqv2QqTBF2XaI/mXtxtdepDRJv4o35T+A4arbogfUlHsBlbuhhCoxCGKKTEDQdWtEMX32eVA7+OpwKtZiGWHCX50YYxcgcoWfXGFlUlGDWCOBUNamFv4exzX4NDsa9bqZYDKkZtaWY5SHSiAobIEzHGsfsIJsp/01c+XedJvKiVyTmGBqqBAzMsPVzPY1qkEpRgKVka+TH34uKgv6c7tTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726130131; c=relaxed/relaxed;
	bh=8n8VSjvILIl7oYC7bobYUFaIgZoDIf7snFAjTE/j5ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrM1tuMO3kTNM+vnv1xIpzjqvUCEsIoJCdZn/HL0ytBF3e5Udo5lpa98ND4D22bq59CG7cczMtvY2slmZsuwfv/E/B5cPy50lOsR4AkQTbALPsCSlVVd5FD2ISJI0a2tMih/5NmiQWL6IVC+nh4/rOpTse+Mgse4siWFz2A0V9X04zXpKOthhGDJuw3N1lXnoh26cuhVphCXJcKpV+pAj/X5C/vPJKKHqH1h0RorNhJrSfgMLbdAnuL7DGEtcz400AZglZfidhb9FM86Z1o2B6YmZZuZd9m/d+87Fk+1ps6bQQg4GQnLI+VOvCuL2giBKWdIiL0h3gACpq/yYGv5sg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpLkLrs0; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpLkLrs0; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpLkLrs0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EpLkLrs0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X49kB6NdNz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 18:35:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726130125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8n8VSjvILIl7oYC7bobYUFaIgZoDIf7snFAjTE/j5ps=;
	b=EpLkLrs0g60HyMv9lwso4AGVplHM/Zfhj5BJraVXuU/64h8Ogp+GkLBmZ43f6F26njdyGE
	MaDluj72PSeQoB2wblT22vDXv4A375imHhqtTTHQ9sOdBKUOdO8D6Fgt0gufz0BBwijR8m
	JlUjCgqVrMsJtA+VEg6/exRKwo8nQwY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726130125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8n8VSjvILIl7oYC7bobYUFaIgZoDIf7snFAjTE/j5ps=;
	b=EpLkLrs0g60HyMv9lwso4AGVplHM/Zfhj5BJraVXuU/64h8Ogp+GkLBmZ43f6F26njdyGE
	MaDluj72PSeQoB2wblT22vDXv4A375imHhqtTTHQ9sOdBKUOdO8D6Fgt0gufz0BBwijR8m
	JlUjCgqVrMsJtA+VEg6/exRKwo8nQwY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-2BlVXIOmMKqAuDa4ttDdxw-1; Thu,
 12 Sep 2024 04:35:21 -0400
X-MC-Unique: 2BlVXIOmMKqAuDa4ttDdxw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78FAF1955D47;
	Thu, 12 Sep 2024 08:35:19 +0000 (UTC)
Received: from localhost (unknown [10.72.112.58])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95D0119560A3;
	Thu, 12 Sep 2024 08:35:17 +0000 (UTC)
Date: Thu, 12 Sep 2024 16:35:13 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, akpm@linux-foundation.org
Cc: Hari Bathini <hbathini@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Sachin P Bappalige <sachinpb@linux.vnet.ibm.com>
Subject: Re: [PATCH RESEND v2] kexec/crash: no crash update when kexec in
 progress
Message-ID: <ZuKnwcqv9xQDNOrl@MiWiFi-R3L-srv>
References: <20240911112111.108056-1-sourabhjain@linux.ibm.com>
 <ZuGnH5R+FOC481V3@MiWiFi-R3L-srv>
 <f4dcb6b4-2da8-4355-9d89-8b41af30214d@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4dcb6b4-2da8-4355-9d89-8b41af30214d@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/12/24 at 01:33pm, Sourabh Jain wrote:
> Hello Baoquan,
> 
> On 11/09/24 19:50, Baoquan He wrote:
> > On 09/11/24 at 04:51pm, Sourabh Jain wrote:
> > > The following errors are observed when kexec is done with SMT=off on
> > > powerpc.
> > > 
> > > [  358.458385] Removing IBM Power 842 compression device
> > > [  374.795734] kexec_core: Starting new kernel
> > > [  374.795748] kexec: Waking offline cpu 1.
> > > [  374.875695] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
> > > [  374.935833] kexec: Waking offline cpu 2.
> > > [  375.015664] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
> > > snip..
> > > [  375.515823] kexec: Waking offline cpu 6.
> > > [  375.635667] crash hp: kexec_trylock() failed, elfcorehdr may be inaccurate
> > > [  375.695836] kexec: Waking offline cpu 7.
> > > 
> > > To avoid kexec kernel boot failure on PowerPC, all the present CPUs that
> > > are offline are brought online during kexec. For more information, refer
> > > to commit e8e5c2155b00 ("powerpc/kexec: Fix orphaned offline CPUs across
> > > kexec"). Bringing the CPUs online triggers the crash hotplug handler,
> > > crash_handle_hotplug_event(), to update the kdump image. Since the
> > > system is on the kexec kernel boot path and the kexec lock is held, the
> > > crash_handle_hotplug_event() function fails to acquire the same lock to
> > > update the kdump image, resulting in the error messages mentioned above.
> > > 
> > > To fix this, return from crash_handle_hotplug_event() without printing
> > > the error message if kexec is in progress.
> > > 
> > > The same applies to the crash_check_hotplug_support() function. Return
> > > 0 if kexec is in progress because kernel is not in a position to update
> > > the kdump image.
> > LGTM, thanks.
> > 
> > Acked-by: Baoquan he <bhe@redhat.com>
> 
> Thank you for the Ack!
> 
> My understanding is that this patch will go upstream via the linux-next
> tree, as it is based on
> https://lore.kernel.org/all/20240902034708.88EC1C4CEC2@smtp.kernel.org/
> which is already part of the linux-next master branch. - Sourabh Jain

Then you should mark it as [PATCH linux-next] in subject.

Since this patch is in generic code, it needs Andrew's help to
pick it. Let's wait and see if Andrew need a new post to change
the subject.

Thanks
Baoquan


