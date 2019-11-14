Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FBFC643
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 13:24:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DLJN1vSGzF83c
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 23:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="B7dmBbpa"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DLFC2yfzzF1vV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 23:21:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573734092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZX7pGUHhWmTDW+4G9DVRk0+x/DIsEoLM1+7MqBPpmg=;
 b=B7dmBbpau4dVYxMwSicg9fysX+OqldBVSz3zzZFa+fmVbvLnDBGVLoEDIYcPwIkBp/y5Qe
 dlkowGO82urZzHglN4KD/AjlJqbnEGNRRNdG5qDzr762QaP3tG7Xj4DO7tXM6mRVvguOAA
 Q2zIbZPF0oSVmmEv4N3grv2O0G/Uy8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-fGPYAQngOrqdrOVl2fN1jg-1; Thu, 14 Nov 2019 07:21:29 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48110800C77;
 Thu, 14 Nov 2019 12:21:27 +0000 (UTC)
Received: from [10.36.117.13] (ovpn-117-13.ams2.redhat.com [10.36.117.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE5E55ED4B;
 Thu, 14 Nov 2019 12:21:23 +0000 (UTC)
Subject: Re: [PATCH v1 01/12] powerpc/pseries: CMM: Implement release()
 function for sysfs device
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linux-kernel@vger.kernel.org
References: <47DFy90198z9sSZ@ozlabs.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8e2dc539-e4fc-6eae-568c-21a8e809c0fc@redhat.com>
Date: Thu, 14 Nov 2019 13:21:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <47DFy90198z9sSZ@ozlabs.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: fGPYAQngOrqdrOVl2fN1jg-1
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

Thanks! I'll probably resend patch 11/12 to give it more attention and=20
to fixup one comment leftover in patch 11. I guess if we get ACKs these=20
two patch should also go via your tree to avoid collisions.

--=20

Thanks,

David / dhildenb

