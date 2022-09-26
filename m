Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4345E9AB9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 09:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZY12t3yz3c2W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:45:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mevbU99/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mevbU99/;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZXP27fkz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 17:44:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CE92360D30;
	Mon, 26 Sep 2022 07:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC0DC4347C;
	Mon, 26 Sep 2022 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664178272;
	bh=zBd0nArrnoxpH7BK8G59CVIeT52Rmoc4NPF1f78MmAU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=mevbU99/eYutUpCn1H9p1DPCf79291EqQRj1MRmDDpWnPEaMJbWCxqmKRWpB5ybmp
	 rpKBvILUtYi4W6N7bI/kUmv6hlXNcML6Xs1ZD/ji012sDLEhQnDSAvdykmM+pNo1Km
	 e5Y4yKJ+bM4AYYMisnkTeDOywfDt3lDHdavQAZeKvGAqWIzx+dokm3kTgGh6UmqnJ6
	 S7ujFPSP7OUAgWfuuelJvpMPsvNzaHRgUwq0EMN99C04k7RoM0OgViq/rYpTUw9j6R
	 oUOVGx/siC1s4xEZNHjVksSgMnra1sLsRGB8FVIeh0qZeDVPISU6Pufpkx7u4yZfKY
	 PJWIfK90Uud7Q==
From: Kalle Valo <kvalo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules ("do not crash the kernel")
References: <20220920122302.99195-1-david@redhat.com>
	<20220920122302.99195-2-david@redhat.com> <87pmfp8hnj.fsf@kernel.org>
	<d1ceedca-b28e-c47e-aa0d-aa1cb36d12b9@redhat.com>
Date: Mon, 26 Sep 2022 10:44:23 +0300
In-Reply-To: <d1ceedca-b28e-c47e-aa0d-aa1cb36d12b9@redhat.com> (David
	Hildenbrand's message of "Thu, 22 Sep 2022 16:12:05 +0200")
Message-ID: <87leq64m20.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

>>> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
>>> +**************************************************
>>> +
>>> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
>>> +is common for a given warning condition, if it occurs at all, to occur
>>> +multiple times. This can fill up and wrap the kernel log, and can even slow
>>> +the system enough that the excessive logging turns into its own, additional
>>> +problem.
>>
>> FWIW I have had cases where WARN() messages caused a reboot, maybe
>> mention that here? In my case the logging was so excessive that the
>> watchdog wasn't updated and in the end the device was forcefully
>> rebooted.
>>
>
> That should be covered by the last part, no? What would be your suggestion?

I was just thinking that maybe make it more obvious that even WARN_ON()
can crash the system, something along these lines:

"..., additional problem like stalling the system so much that it causes
a reboot."

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
