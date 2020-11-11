Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D32AF049
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 13:11:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWNr13b6HzDqSW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 23:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jERxhF2u; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRoP7YnC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWNly6xgKzDqSp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 23:07:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g28Vcy6bkD9hVBLAqs39T3DMq7VTyzZfkpQarBjwdtM=;
 b=jERxhF2u4odRUUEWmLLZ3AW+9PWNivV8JSrrpMnbeVquKcrP8H1dOxEMqjNpuEhNwDWQQo
 5LmBGzzWFo+4aX7Wk9VquBC7rzGTqKuOHoh6yGSJ5FwuGLcq0vREJdJ850lu/7S1wEhVww
 g4HK2YgoFquhdoBymqM+6mepUnGOWOw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605096476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g28Vcy6bkD9hVBLAqs39T3DMq7VTyzZfkpQarBjwdtM=;
 b=FRoP7YnCCxSB2zaCs5N5mE7tIV/okBSC5MYaMsLb8yUUMMbcultrQl4rvgn6xCWzxw1g7U
 CkXcn00BUhz6rBYJjzNrU0kEZP5nz/RrKikOQGKZw3vuY/1cLkp2gONcv/2I5QPrgWWPJ6
 e/qqil00/QpTMApTmaiQteV3TgbA4Ew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-QKWvvqh9Nw6dyn1L5bqNgQ-1; Wed, 11 Nov 2020 07:07:51 -0500
X-MC-Unique: QKWvvqh9Nw6dyn1L5bqNgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73BE6809DE6;
 Wed, 11 Nov 2020 12:07:49 +0000 (UTC)
Received: from [10.36.114.151] (ovpn-114-151.ams2.redhat.com [10.36.114.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 767745C1C4;
 Wed, 11 Nov 2020 12:07:45 +0000 (UTC)
Subject: Re: [PATCH v1 3/4] powerpc/mm: remove linear mapping if __add_pages()
 fails in arch_add_memory()
To: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
References: <20201029162718.29910-1-david@redhat.com>
 <20201029162718.29910-4-david@redhat.com>
 <20201104095007.GB4981@localhost.localdomain>
 <20201104120651.GQ4879@kernel.org>
 <20201104121109.GA5126@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <4fd8b15c-3cbf-0016-69a8-235883c0bc46@redhat.com>
Date: Wed, 11 Nov 2020 13:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201104121109.GA5126@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04.11.20 13:11, Oscar Salvador wrote:
> On Wed, Nov 04, 2020 at 02:06:51PM +0200, Mike Rapoport wrote:
>> On Wed, Nov 04, 2020 at 10:50:07AM +0100, osalvador wrote:
>>> On Thu, Oct 29, 2020 at 05:27:17PM +0100, David Hildenbrand wrote:
>>>> Let's revert what we did in case seomthing goes wrong and we return an
>>>> error.
>>>
>>> Dumb question, but should not we do this for other arches as well?
>>
>> It seems arm64 and s390 already do that.
>> x86 could have its arch_add_memory() improved though :)
> 
> Right, I only stared at x86 and see it did not have it.
> I guess we want to have all arches aligned with this.

The ultimate goal would be to get rid of arch-specific arch_add_memory() 
implementations completely, providing arch_create_linear_mapping() / 
arch_remove_linear_mapping() instead (as indicated in patch #1).

The x86 variant certainly needs love, but I'll keep this patch set 
powerpc specific, so it can go via the powerpc tree in one piece. I'll 
add unifying these implementations onto my todo list.

Thanks!

-- 
Thanks,

David / dhildenb

