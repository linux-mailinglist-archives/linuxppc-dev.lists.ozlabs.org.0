Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD3A76E3A6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:53:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sF3+SbxN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGjKq5XFZz3bst
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 18:53:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=sF3+SbxN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGjJz0cHRz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 18:52:16 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F31B41F381;
	Thu,  3 Aug 2023 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691052732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t9D3HOm7zMWuXjtU8sIhIIEaYx21Igl7pf2ICGEcc9E=;
	b=sF3+SbxNeHQ1K1dRKmTniekm7Mo3Up1JFOTPUv8l0nWxxP8sfEw4wh0mHufE2QPA8f1E7G
	Kq2eQbQAoXymq4B2oGuAzNKGhB4EbHRa/fDfXwVNBRz1Xvqu7F/pNU6OttugNUoRIX5z+P
	MN5k0UV+NSXronooFVVvM5WAlEZMuTE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CEEC1134B0;
	Thu,  3 Aug 2023 08:52:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sDuRL7tqy2TFYAAAMHmgww
	(envelope-from <mhocko@suse.com>); Thu, 03 Aug 2023 08:52:11 +0000
Date: Thu, 3 Aug 2023 10:52:11 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Message-ID: <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz>
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com, linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 02-08-23 18:59:04, Michal Hocko wrote:
> On Wed 02-08-23 17:54:04, David Hildenbrand wrote:
> > On 02.08.23 17:50, Michal Hocko wrote:
> > > On Wed 02-08-23 10:15:04, Aneesh Kumar K V wrote:
> > > > On 8/1/23 4:20 PM, Michal Hocko wrote:
> > > > > On Tue 01-08-23 14:58:29, Aneesh Kumar K V wrote:
> > > > > > On 8/1/23 2:28 PM, Michal Hocko wrote:
> > > > > > > On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
> > > > > > > > Allow updating memmap_on_memory mode after the kernel boot. Memory
> > > > > > > > hotplug done after the mode update will use the new mmemap_on_memory
> > > > > > > > value.
> > > > > > > 
> > > > > > > Well, this is a user space kABI extension and as such you should spend
> > > > > > > more words about the usecase. Why we could live with this static and now
> > > > > > > need dynamic?
> > > > > > > 
> > > > > > 
> > > > > > This enables easy testing of memmap_on_memory feature without a kernel reboot.
> > > > > 
> > > > > Testing alone is rather weak argument to be honest.
> > > > > 
> > > > > > I also expect people wanting to use that when they find dax kmem memory online
> > > > > > failing because of struct page allocation failures[1]. User could reboot back with
> > > > > > memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
> > > > > > the feature much more useful.
> > > > > 
> > > > > Sure it can be useful but that holds for any feature, right. The main
> > > > > question is whether this is worth maintaing. The current implementation
> > > > > seems rather trivial which is an argument to have it but are there any
> > > > > risks long term? Have you evaluated a potential long term maintenance
> > > > > cost? There is no easy way to go back and disable it later on without
> > > > > breaking some userspace.
> > > > > 
> > > > > All that should be in the changelog!
> > > > 
> > > > I updated it as below.
> > > > 
> > > > mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
> > > > 
> > > > Allow updating memmap_on_memory mode after the kernel boot. Memory
> > > > hotplug done after the mode update will use the new mmemap_on_memory
> > > > value.
> > > > 
> > > > It is now possible to test the memmap_on_memory feature easily without
> > > > the need for a kernel reboot. Additionally, for those encountering
> > > > struct page allocation failures while using dax kmem memory online, this
> > > > feature may prove useful. Instead of rebooting with the
> > > > memmap_on_memory=y kernel parameter, users can now enable it via sysfs,
> > > > which greatly enhances its usefulness.
> > > 
> > > 
> > > I do not really see a solid argument why rebooting is really a problem
> > > TBH. Also is the global policy knob really the right fit for existing
> > > hotplug usecases? In other words, if we really want to make
> > > memmap_on_memory more flexible would it make more sense to have it per
> > > memory block property instead (the global knob being the default if
> > > admin doesn't specify it differently).
> > 
> > Per memory block isn't possible, due to the creation order.
> 
> I am not sure I follow. Could you elaborate more?

Must have been a tired brain. Now I see what you mean of course. vmemmap
is allocated at the time the range is registered and therefore memory
block sysfs created. So you are right that it is too late in some sense
but I still believe that this would be doable. The memmap_on_memory file
would be readable only when the block is offline and it would reallocate
vmemmap on the change. Makes sense? Are there any risks? Maybe pfn
walkers?

-- 
Michal Hocko
SUSE Labs
