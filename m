Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC676D2F0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 17:51:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Ji6vEcAr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGGgK6W12z3bVJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 01:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Ji6vEcAr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGGfT1X0dz2ymM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 01:50:55 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E26A3219FF;
	Wed,  2 Aug 2023 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690991447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eqq4Vm0LVu000apc9oEBff9Oeg2w+Ug93UCmZeZYG6U=;
	b=Ji6vEcArb9iIMblZcbVk9q9oAKbAOktwkmnsUyh8HQ6z8jeFt1Lsn+EDrlP8CSlYdOQXpb
	i6vARq3L+4TuFHcx1E5e4mxjpC6pjJ1546U9AF55sjMsjdGBvXIZDoOt4GxzdimCEe9O22
	FOVBSOQxdxGeOAY/lyYx0W+UpR03E68=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C460A13909;
	Wed,  2 Aug 2023 15:50:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DEPqLFd7ymR7OQAAMHmgww
	(envelope-from <mhocko@suse.com>); Wed, 02 Aug 2023 15:50:47 +0000
Date: Wed, 2 Aug 2023 17:50:46 +0200
From: Michal Hocko <mhocko@suse.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
Message-ID: <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
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
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 02-08-23 10:15:04, Aneesh Kumar K V wrote:
> On 8/1/23 4:20 PM, Michal Hocko wrote:
> > On Tue 01-08-23 14:58:29, Aneesh Kumar K V wrote:
> >> On 8/1/23 2:28 PM, Michal Hocko wrote:
> >>> On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
> >>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
> >>>> hotplug done after the mode update will use the new mmemap_on_memory
> >>>> value.
> >>>
> >>> Well, this is a user space kABI extension and as such you should spend
> >>> more words about the usecase. Why we could live with this static and now
> >>> need dynamic?
> >>>
> >>
> >> This enables easy testing of memmap_on_memory feature without a kernel reboot.
> > 
> > Testing alone is rather weak argument to be honest.
> > 
> >> I also expect people wanting to use that when they find dax kmem memory online
> >> failing because of struct page allocation failures[1]. User could reboot back with
> >> memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
> >> the feature much more useful.
> > 
> > Sure it can be useful but that holds for any feature, right. The main
> > question is whether this is worth maintaing. The current implementation
> > seems rather trivial which is an argument to have it but are there any
> > risks long term? Have you evaluated a potential long term maintenance
> > cost? There is no easy way to go back and disable it later on without
> > breaking some userspace.
> > 
> > All that should be in the changelog!
> 
> I updated it as below. 
> 
> mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
> 
> Allow updating memmap_on_memory mode after the kernel boot. Memory
> hotplug done after the mode update will use the new mmemap_on_memory
> value.
> 
> It is now possible to test the memmap_on_memory feature easily without
> the need for a kernel reboot. Additionally, for those encountering
> struct page allocation failures while using dax kmem memory online, this
> feature may prove useful. Instead of rebooting with the
> memmap_on_memory=y kernel parameter, users can now enable it via sysfs,
> which greatly enhances its usefulness.


I do not really see a solid argument why rebooting is really a problem
TBH. Also is the global policy knob really the right fit for existing
hotplug usecases? In other words, if we really want to make
memmap_on_memory more flexible would it make more sense to have it per
memory block property instead (the global knob being the default if
admin doesn't specify it differently).
-- 
Michal Hocko
SUSE Labs
