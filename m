Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDB530A762
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 13:17:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTn4c1Hx6zDrQc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 23:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jeyu@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HaH7mujA; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTmxS0JG9zDrQj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 23:10:51 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7928C64E2C;
 Mon,  1 Feb 2021 12:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612181448;
 bh=VpXCDfyNDkFB6N2oS+yv9UYv1FFtVEhcO5B6o8eybU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaH7mujAr3wAdUU7Wbx8NZL1I+ehA6nkr8Ywa4kIYDvUwHUoZx2E28Pxr7ifUj0mt
 7ljJAQsR2C8cmJAhCEfFz7WlBbFbcYk6h1CXB2Y9PzQv9yo4WszIpL5OHIbr+huud/
 DTJ+YupZxs4692+MeXtltnemY6HxUucQSaELW53wykG+dmhx/UvhvmlITS+Idy3evG
 6qzrY4zJuBmI9bQgKtqj9S8Vxz3ss0nQSNYmw9hIaMuF6P5GYtPl/DuUcSxMjQJcLy
 tT307SwHtzy9d8kG545Zqjsb+38DqN6yFxfRVMnwI9dVoBzO/0f1HxxpxD93Q+NZid
 37O97iC4kLFKA==
Date: Mon, 1 Feb 2021 13:10:37 +0100
From: Jessica Yu <jeyu@kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH 04/13] module: use RCU to synchronize find_module
Message-ID: <YBfvvdna9pSeu+1g@gunter>
References: <20210128181421.2279-1-hch@lst.de>
 <20210128181421.2279-5-hch@lst.de>
 <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.21.2101291626080.22237@pobox.suse.cz>
X-OS: Linux gunter 5.10.9-1-default x86_64
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, linux-kbuild@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 live-patching@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Vetter <daniel@ffwll.ch>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+++ Miroslav Benes [29/01/21 16:29 +0100]:
>On Thu, 28 Jan 2021, Christoph Hellwig wrote:
>
>> Allow for a RCU-sched critical section around find_module, following
>> the lower level find_module_all helper, and switch the two callers
>> outside of module.c to use such a RCU-sched critical section instead
>> of module_mutex.
>
>That's a nice idea.
>
>> @@ -57,7 +58,7 @@ static void klp_find_object_module(struct klp_object *obj)
>>  	if (!klp_is_module(obj))
>>  		return;
>>
>> -	mutex_lock(&module_mutex);
>> +	rcu_read_lock_sched();
>>  	/*
>>  	 * We do not want to block removal of patched modules and therefore
>>  	 * we do not take a reference here. The patches are removed by
>> @@ -74,7 +75,7 @@ static void klp_find_object_module(struct klp_object *obj)
>>  	if (mod && mod->klp_alive)
>
>RCU always baffles me a bit, so I'll ask. Don't we need
>rcu_dereference_sched() here? "mod" comes from a RCU-protected list, so I
>wonder.

Same here :-) I had to double check the RCU documentation. For our
modules list case I believe the rcu list API should take care of that
for us. Worth noting is this snippet from Documentation/RCU/whatisRCU.txt:

    rcu_dereference() is typically used indirectly, via the _rcu
    list-manipulation primitives, such as list_for_each_entry_rcu()


