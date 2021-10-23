Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A843814E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 03:38:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbkPh5VBVz3cCB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 12:38:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g3oizmIU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g3oizmIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=g3oizmIU; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=g3oizmIU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbkP05tQlz3bXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 12:37:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634953053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMIfEUdyS7S9YycGnN8abTq0K/b0QBW0FaCGofvAkWQ=;
 b=g3oizmIUyfEVLVQbUUsOpGbHvpJw8/hJVMnn4S4/SjYfewKeSVcNbXHhckXywOV30Manjh
 7KlVmiKUN+dnQmX+SF31tytNifrA066oDy2bLUxL+zxQoomvfdI27zd206u9SHy7uizKtC
 +GQWfp3jl8FSVGkOi0AQcpB1U0zaC1o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634953053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMIfEUdyS7S9YycGnN8abTq0K/b0QBW0FaCGofvAkWQ=;
 b=g3oizmIUyfEVLVQbUUsOpGbHvpJw8/hJVMnn4S4/SjYfewKeSVcNbXHhckXywOV30Manjh
 7KlVmiKUN+dnQmX+SF31tytNifrA066oDy2bLUxL+zxQoomvfdI27zd206u9SHy7uizKtC
 +GQWfp3jl8FSVGkOi0AQcpB1U0zaC1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-dGKLLbnsONGXIqdLVyqF3w-1; Fri, 22 Oct 2021 21:37:31 -0400
X-MC-Unique: dGKLLbnsONGXIqdLVyqF3w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89FC5362F8;
 Sat, 23 Oct 2021 01:37:27 +0000 (UTC)
Received: from llong.remote.csb (unknown [10.22.16.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E1F817CEE;
 Sat, 23 Oct 2021 01:37:23 +0000 (UTC)
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
To: Arnd Bergmann <arnd@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
References: <20211022120058.1031690-1-arnd@kernel.org>
From: Waiman Long <longman@redhat.com>
Message-ID: <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
Date: Fri, 22 Oct 2021 21:37:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211022120058.1031690-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-ia64@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, linux-parisc@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/22/21 7:59 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> parisc, ia64 and powerpc32 are the only remaining architectures that
> provide custom arch_{spin,read,write}_lock_flags() functions, which are
> meant to re-enable interrupts while waiting for a spinlock.
>
> However, none of these can actually run into this codepath, because
> it is only called on architectures without CONFIG_GENERIC_LOCKBREAK,
> or when CONFIG_DEBUG_LOCK_ALLOC is set without CONFIG_LOCKDEP, and none
> of those combinations are possible on the three architectures.
>
> Going back in the git history, it appears that arch/mn10300 may have
> been able to run into this code path, but there is a good chance that
> it never worked. On the architectures that still exist, it was
> already impossible to hit back in 2008 after the introduction of
> CONFIG_GENERIC_LOCKBREAK, and possibly earlier.
>
> As this is all dead code, just remove it and the helper functions built
> around it. For arch/ia64, the inline asm could be cleaned up, but
> it seems safer to leave it untouched.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Does that mean we can also remove the GENERIC_LOCKBREAK config option 
from the Kconfig files as well?

Cheers,
Longman


