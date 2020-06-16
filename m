Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAD71FBF46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 21:46:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mdxP20rmzDqg1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 05:46:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XoScRIB/; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XoScRIB/; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mdt03VPSzDqc9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 05:43:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592336613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z6fHUpD/YKa1+K4csbSQ8hpcds1t8FVRWhxbaMjfP4=;
 b=XoScRIB/OUnlC6iHUifIbbqw0nMqyGT44ncKlwjVJ6EzmytEYHukuC+9GeA6NoD4Ia58ob
 zdgyRIA/jM0/wFteh1WPXwdM2my8JrDTe/bGsTs4vlNv/sl6PkBIRr4W0nOkg7Wx8FBO6/
 claoyJXO0QkMR++u/1025GkuGUGIKy8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592336613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Z6fHUpD/YKa1+K4csbSQ8hpcds1t8FVRWhxbaMjfP4=;
 b=XoScRIB/OUnlC6iHUifIbbqw0nMqyGT44ncKlwjVJ6EzmytEYHukuC+9GeA6NoD4Ia58ob
 zdgyRIA/jM0/wFteh1WPXwdM2my8JrDTe/bGsTs4vlNv/sl6PkBIRr4W0nOkg7Wx8FBO6/
 claoyJXO0QkMR++u/1025GkuGUGIKy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-TJgrp6WMNr--nG8NkXkVIQ-1; Tue, 16 Jun 2020 15:43:29 -0400
X-MC-Unique: TJgrp6WMNr--nG8NkXkVIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BAEEE91A;
 Tue, 16 Jun 2020 19:43:23 +0000 (UTC)
Received: from llong.remote.csb (ovpn-114-156.rdu2.redhat.com [10.10.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72FAE5C1BD;
 Tue, 16 Jun 2020 19:43:17 +0000 (UTC)
Subject: Re: [PATCH v4 0/3] mm, treewide: Rename kzfree() to kfree_sensitive()
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <5c70746c-ecfc-316f-f1ff-ab432cf9f32d@redhat.com>
Date: Tue, 16 Jun 2020 15:43:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 David Sterba <dsterba@suse.cz>, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/16/20 2:53 PM, Joe Perches wrote:
> On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
>>   v4:
>>    - Break out the memzero_explicit() change as suggested by Dan Carpenter
>>      so that it can be backported to stable.
>>    - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
>>      now as there can be a bit more discussion on what is best. It will be
>>      introduced as a separate patch later on after this one is merged.
> To this larger audience and last week without reply:
> https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
>
> Are there _any_ fastpath uses of kfree or vfree?

I am not sure about that, but both of them can be slow.


>
> Many patches have been posted recently to fix mispairings
> of specific types of alloc and free functions.
>
> To eliminate these mispairings at a runtime cost of four
> comparisons, should the kfree/vfree/kvfree/kfree_const
> functions be consolidated into a single kfree?
>
> Something like the below:
>
>     void kfree(const void *addr)
>     {
>     	if (is_kernel_rodata((unsigned long)addr))
>     		return;
>
>     	if (is_vmalloc_addr(addr))
>     		_vfree(addr);
>     	else
>     		_kfree(addr);
>     }
>
is_kernel_rodata() is inlined, but is_vmalloc_addr() isn't. So the 
overhead can be a bit bigger.

Cheers,
Longman

