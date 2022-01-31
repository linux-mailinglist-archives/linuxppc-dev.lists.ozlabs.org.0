Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A7A4A3F6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 10:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnNP26YjQz3bSx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 20:41:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TAvjGCxB;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xUgFlc+6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TAvjGCxB; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xUgFlc+6; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnNNL52J5z2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 20:40:50 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42D361F380;
 Mon, 31 Jan 2022 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643622047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y00ZKxq/dpqUDwh0rX8TbLgQbvVTvbkuCSKi0GTnT4o=;
 b=TAvjGCxBgtVEooteuwYwy7uWXHIEi1iRNO342s4/jJ+IIGBmHSjZzV5GBJojCxowtd9VF/
 o3CAUfL8yGH9rRehhR4/C5FstjONcFAU8j7o3FYVmx80A08KFhFcu/K4azbvNlmWYom+Ua
 6mK0Ha0OUepOw9iyGtTEgdVyGEbI2ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643622047;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y00ZKxq/dpqUDwh0rX8TbLgQbvVTvbkuCSKi0GTnT4o=;
 b=xUgFlc+6YdMvHQgFdTVnfhl595dV1vnsZnMruHRjkkwO5586I6U3elglHK3ZC5shbyTZxG
 3d8GjzSobgWcibCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7204D13B68;
 Mon, 31 Jan 2022 09:40:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f0PrF52u92G+DgAAMHmgww
 (envelope-from <osalvador@suse.de>); Mon, 31 Jan 2022 09:40:45 +0000
Date: Mon, 31 Jan 2022 10:40:43 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
Message-ID: <20220131094041.GA15392@linux>
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
 <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, Rich Felker <dalias@libc.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 08:48:54AM +0100, David Hildenbrand wrote:
> Hi Oscar,

Hi David :-),

> Right, and the idea is that the online state of nodes (+ node/zone
> ranges) already has to be known at that point in time, because
> otherwise, we'd be in bigger trouble.

Yeah, I wanted to check where exactly did we mark the nodes online,
and for the few architectures I checked it happens in setup_arch(),
which is called very early in start_kernel(), while driver_init()
gets called through arch_call_rest_init(), which happens at the end
of the function.

I am not sure whether we want to remark that somehow in the changelog,
so it is crystal clear that by the time the node_dev_init() gets called,
we already set the nodes online.

Anyway, just saying, but is fine as is.
 

-- 
Oscar Salvador
SUSE Labs
