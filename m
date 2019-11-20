Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FE81037B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 11:37:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hzfl3SjYzDqBb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 21:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="FAINWCHR"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HzcR1BpdzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 21:35:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574246147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/xDM99yDTDLv4Ym8i8Vqr3jGmgK95cfJTK+1ci9q0Y=;
 b=FAINWCHRPDMms76pHJZXjCurOvb96Xq9UBci2ivTa7MfPzSQRiWnDSN+bDRzUkMhHPn3ku
 kyxrvj2kQsu9gP+k6rPsB5tXtZ94Wmd8b/feBtB8xkHJXKYGiy46yHRA812fgyXgyT32HA
 sMfl3B+NWxBM8DTAW8X784w5imvEpZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-2pPJKldfNQapjGbh34vBPQ-1; Wed, 20 Nov 2019 05:35:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14BCA477;
 Wed, 20 Nov 2019 10:35:41 +0000 (UTC)
Received: from [10.36.118.126] (unknown [10.36.118.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B71019EE6;
 Wed, 20 Nov 2019 10:35:37 +0000 (UTC)
Subject: Re: [PATCH v1 01/12] powerpc/pseries: CMM: Implement release()
 function for sysfs device
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linux-kernel@vger.kernel.org
References: <47DFy90198z9sSZ@ozlabs.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <23fed8a4-d87a-c6f6-e145-715eceea4e64@redhat.com>
Date: Wed, 20 Nov 2019 11:35:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <47DFy90198z9sSZ@ozlabs.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 2pPJKldfNQapjGbh34vBPQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Vlastimil Babka <vbabka@suse.cz>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14.11.19 10:08, Michael Ellerman wrote:
> On Thu, 2019-10-31 at 14:29:22 UTC, David Hildenbrand wrote:
>> When unloading the module, one gets
>> [  548.188594] ------------[ cut here ]------------
>> [  548.188596] Device 'cmm0' does not have a release() function, it is b=
rok=3D
>> en and must be fixed. See Documentation/kobject.txt.
>> [  548.188622] WARNING: CPU: 0 PID: 19308 at drivers/base/core.c:1244 .d=
evi=3D
>> ce_release+0xcc/0xf0
>> ...
>>
>> We only have on static fake device. There is nothing to do when
>> releasing the device (via cmm_exit).
>>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
>> Cc: Allison Randal <allison@lohutok.net>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Arun KS <arunks@codeaurora.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>=20
> Patches 1-10 applied to powerpc next, thanks.
>=20
> https://git.kernel.org/powerpc/c/7d8212747435c534c8d564fbef4541a463c976ff
>=20
> cheers
>=20

Hi Michael,

just to make sure you saw the two MM patches (and the ACKs from Michal)

https://lkml.org/lkml/2019/11/14/410

if you prefer that Andrew picks these up, please let me know.

Cheers!

--=20

Thanks,

David / dhildenb

