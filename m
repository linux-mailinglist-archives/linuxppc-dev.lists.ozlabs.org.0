Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3EE14D0FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 20:07:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487Cf23MkkzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 06:07:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=JcGo+H5v; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487CbX19qYzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 06:04:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580324693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MbiGVjrJioZ203LFcL8jX4cOOERITrueTv3xiDYiAOg=;
 b=JcGo+H5vsO0zQrgYgYZgnKvXIU9rpjZ/9VncNyjySs1X6xZpGiYTA4UtTd+EGi90q0IOYh
 Vubn8LZZqfBjLpEL5hhmX01qstcRhFL8rz1LssYg7mbKQY5PKAqFyp3PauElze87+DKkja
 d9YFz47S1UliwP8AY1KfH/DnRY3jYGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-OxcRtN58MxuutJS4mbvVFA-1; Wed, 29 Jan 2020 14:04:48 -0500
X-MC-Unique: OxcRtN58MxuutJS4mbvVFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85103100550E;
 Wed, 29 Jan 2020 19:04:46 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-29.ams2.redhat.com
 [10.36.116.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB1FA5C28C;
 Wed, 29 Jan 2020 19:04:42 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v16 00/23] selftests, powerpc, x86: Memory Protection Keys
References: <cover.1579507768.git.sandipan@linux.ibm.com>
 <3ceb2814-f8b0-ec6b-3c24-ec72297a99f5@intel.com>
Date: Wed, 29 Jan 2020 20:04:40 +0100
In-Reply-To: <3ceb2814-f8b0-ec6b-3c24-ec72297a99f5@intel.com> (Dave Hansen's
 message of "Wed, 22 Jan 2020 10:45:27 -0800")
Message-ID: <8736by84on.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org,
 linuxram@us.ibm.com, linuxppc-dev@lists.ozlabs.org, mhocko@kernel.org,
 linux-mm@kvack.org, mingo@redhat.com, Sandipan Das <sandipan@linux.ibm.com>,
 linux-kselftest@vger.kernel.org, msuchanek@suse.de, shuah@kernel.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Dave Hansen:

> Still doesn't build for me:
>
>> # make
>> make --no-builtin-rules ARCH=x86_64 -C ../../../.. headers_install
>> make[1]: Entering directory '/home/dave/linux.git'
>>   INSTALL ./usr/include
>> make[1]: Leaving directory '/home/dave/linux.git'
>> make: *** No rule to make target '/home/dave/linux.git/tools/testing/selftests/vm/protection_keys_32', needed by 'all'.  Stop.

Do you have 32-bit libraries installed?

Thanks,
Florian

