Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB17C2B6925
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 16:55:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb9Wn6VskzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:55:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=UWlBx/r5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UWlBx/r5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb9Ts0R8szDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 02:53:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605628430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45NpE8HlxjJaBCusr1AgP66M2rQRdJBOzgIqToWUpzE=;
 b=UWlBx/r5biFRRC6XLD238qZvphmwY2kXupv1w6M7TpUww5PjaRAbh+S/IUlKdvq7kX9lzN
 Qbq9g5cZDM3fM8qtdMbrJRzBq5EO/PevPa8/yZxS6G1fiaYw2A1jFy+oAG0J2GW5XuzxSz
 SY3O8EkjkM+e2kA/p8mrbY8aHvI3cMQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605628430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45NpE8HlxjJaBCusr1AgP66M2rQRdJBOzgIqToWUpzE=;
 b=UWlBx/r5biFRRC6XLD238qZvphmwY2kXupv1w6M7TpUww5PjaRAbh+S/IUlKdvq7kX9lzN
 Qbq9g5cZDM3fM8qtdMbrJRzBq5EO/PevPa8/yZxS6G1fiaYw2A1jFy+oAG0J2GW5XuzxSz
 SY3O8EkjkM+e2kA/p8mrbY8aHvI3cMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-Mk5rumDnMzelMMXlOPFPBw-1; Tue, 17 Nov 2020 10:53:45 -0500
X-MC-Unique: Mk5rumDnMzelMMXlOPFPBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 526A4CF94A;
 Tue, 17 Nov 2020 15:53:35 +0000 (UTC)
Received: from [10.36.114.99] (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C553E19D6C;
 Tue, 17 Nov 2020 15:53:32 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] powerpc/mm: remove linear mapping if __add_pages()
 fails in arch_add_memory()
To: Oscar Salvador <osalvador@suse.de>
References: <20201111145322.15793-1-david@redhat.com>
 <20201111145322.15793-8-david@redhat.com> <20201117155125.GF15987@linux>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <dac16bcc-8e37-8cb2-ac61-912a17ab5985@redhat.com>
Date: Tue, 17 Nov 2020 16:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201117155125.GF15987@linux>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17.11.20 16:51, Oscar Salvador wrote:
> On Wed, Nov 11, 2020 at 03:53:21PM +0100, David Hildenbrand wrote:
>> Let's revert what we did in case seomthing goes wrong and we return an
> "something" :-)

Thanks! :)

@Michael, I assume if I don't have to resend, this can be fixed up?

-- 
Thanks,

David / dhildenb

