Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A21CB8C3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 22:05:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JhCf07ppzDr6P
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 06:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Poj0OkKv; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Poj0OkKv; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Jh9N5Dg4zDrBx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 06:03:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588968228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5kwfCZ8GEMui0d70gWIkFX2ZjpyuOsqtOJu+2yxxqE=;
 b=Poj0OkKvHUY9YLvqHwXl2cCF7MBzq8musmd5F5D63EYNYpyJbHp2inUgVCE+6OFfQV7xpb
 HJ0Y/fSoiuurodnypxfdQ+1wRO2v8eH4qDISEExCEAZ9Bt2O/xjIIBkRLZw73yWGo1uhc2
 5+aE4/UKvUkUVe/0Jq2SWNhRudRNC74=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588968228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5kwfCZ8GEMui0d70gWIkFX2ZjpyuOsqtOJu+2yxxqE=;
 b=Poj0OkKvHUY9YLvqHwXl2cCF7MBzq8musmd5F5D63EYNYpyJbHp2inUgVCE+6OFfQV7xpb
 HJ0Y/fSoiuurodnypxfdQ+1wRO2v8eH4qDISEExCEAZ9Bt2O/xjIIBkRLZw73yWGo1uhc2
 5+aE4/UKvUkUVe/0Jq2SWNhRudRNC74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-enATtp9oPj2wo-KN0UthHg-1; Fri, 08 May 2020 16:03:26 -0400
X-MC-Unique: enATtp9oPj2wo-KN0UthHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F6401005510;
 Fri,  8 May 2020 20:03:25 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-187.ams2.redhat.com
 [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 607B8702EC;
 Fri,  8 May 2020 20:03:22 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH 2/2] selftests: vm: pkeys: Fix powerpc access right updates
References: <cover.1588959697.git.sandipan@linux.ibm.com>
 <cover.1588959697.git.sandipan@linux.ibm.com>
 <5f65cf37be993760de8112a88da194e3ccbb2bf8.1588959697.git.sandipan@linux.ibm.com>
 <87blmymhkx.fsf@oldenburg2.str.redhat.com>
 <a40c364d-e204-1d63-c211-7cdfdccb32e0@linux.ibm.com>
Date: Fri, 08 May 2020 22:03:20 +0200
In-Reply-To: <a40c364d-e204-1d63-c211-7cdfdccb32e0@linux.ibm.com> (Sandipan
 Das's message of "Sat, 9 May 2020 01:24:26 +0530")
Message-ID: <87mu6ii48n.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Sandipan Das:

> Hi Florian,
>
> On 08/05/20 11:31 pm, Florian Weimer wrote:
>> * Sandipan Das:
>> 
>>> The Power ISA mandates that all writes to the Authority
>>> Mask Register (AMR) must always be preceded as well as
>>> succeeded by a context-synchronizing instruction. This
>>> applies to both the privileged and unprivileged variants
>>> of the Move To AMR instruction.
>> 
>> Ugh.  Do you have a reference for that?
>> 
>> We need to fix this in glibc.
>> 
>
> This is from Table 6 of Chapter 11 in page 1134 of Power
> ISA 3.0B. The document can be found here:
> https://ibm.ent.box.com/s/1hzcwkwf8rbju5h9iyf44wm94amnlcrv

Thanks a lot!  I filed:

  <https://sourceware.org/bugzilla/show_bug.cgi?id=25954>

Florian

