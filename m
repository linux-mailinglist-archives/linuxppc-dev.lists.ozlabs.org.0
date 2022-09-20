Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CE5BE5B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 14:25:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX13C5YfDz3cFN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:25:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=STh4r92p;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZ2GBe/n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=STh4r92p;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZ2GBe/n;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX10p0zSJz3bl4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 22:23:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6GwQOORlAeCAftTXw5n0Dxbe+C//NbiEr2ZALpbp4g=;
	b=STh4r92pcIuUOEjdJ3JOgHyEVFgTIvyD3vfwkgi0AGgMiHoUXAfKPZuKQTs0UNWDQcI83E
	ZV4qqHN0T6/AtD7az0hzhr/4lhQqAhV2Ks6LfRHaUPygs1bIUKwV0C8dDuxPvcmk4CT8zs
	+7B/WTEEHrM1KXty3Dqlm7oxeQN/an8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663676598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6GwQOORlAeCAftTXw5n0Dxbe+C//NbiEr2ZALpbp4g=;
	b=QZ2GBe/nyabkFRmYMjCpfXGsYONM9tppT/uTlnAyTnJSrMQUPbSxgax4vcPAB6B/pxa2Uc
	ZHSP4TKxmIT/YNOi2JaLS9wFO91gPabaHusaCJ8JhXfiV+Ejhu+/OUAro+ckklUbFc3bMn
	VLNdWiNW+HGPiCRnQAud29DwCpHZdVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653--clwCHS7MlmdVthTAYbtew-1; Tue, 20 Sep 2022 08:23:14 -0400
X-MC-Unique: -clwCHS7MlmdVthTAYbtew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 850BF101A52A;
	Tue, 20 Sep 2022 12:23:13 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E365C15BBC;
	Tue, 20 Sep 2022 12:23:08 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules ("do not crash the kernel")
Date: Tue, 20 Sep 2022 14:23:00 +0200
Message-Id: <20220920122302.99195-2-david@redhat.com>
In-Reply-To: <20220920122302.99195-1-david@redhat.com>
References: <20220920122302.99195-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Dave Young <dyoung@redhat.com>, linux-doc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus notes [1] that the introduction of new code that uses VM_BUG_ON()
is just as bad as BUG_ON(), because it will crash the kernel on
distributions that enable CONFIG_DEBUG_VM (like Fedora):

    VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
    no different, the only difference is "we can make the code smaller
    because these are less important". [2]

This resulted in a more generic discussion about usage of BUG() and
friends. While there might be corner cases that still deserve a BUG_ON(),
most BUG_ON() cases should simply use WARN_ON_ONCE() and implement a
recovery path if reasonable:

    The only possible case where BUG_ON can validly be used is "I have
    some fundamental data corruption and cannot possibly return an
    error". [2]

As a very good approximation is the general rule:

    "absolutely no new BUG_ON() calls _ever_" [2]

... not even if something really shouldn't ever happen and is merely for
documenting that an invariant always has to hold. However, there are sill
exceptions where BUG_ON() may be used:

    If you have a "this is major internal corruption, there's no way we can
    continue", then BUG_ON() is appropriate. [3]

There is only one good BUG_ON():

    Now, that said, there is one very valid sub-form of BUG_ON():
    BUILD_BUG_ON() is absolutely 100% fine. [2]

While WARN will also crash the machine with panic_on_warn set, that's
exactly to be expected:

    So we have two very different cases: the "virtual machine with good
    logging where a dead machine is fine" - use 'panic_on_warn'. And
    the actual real hardware with real drivers, running real loads by
    users. [4]

The basic idea is that warnings will similarly get reported by users
and be found during testing. However, in contrast to a BUG(), there is a
way to actually influence the expected behavior (e.g., panic_on_warn)
and to eventually keep the machine alive to extract some debug info.

Ingo notes that not all WARN_ON_ONCE cases need recovery. If we don't ever
expect this code to trigger in any case, recovery code is not really
helpful.

    I'd prefer to keep all these warnings 'simple' - i.e. no attempted
    recovery & control flow, unless we ever expect these to trigger.
    [5]

There have been different rules floating around that were never properly
documented. Let's try to clarify.

[1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
[2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
[2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
[4] https://lore.kernel.org/r/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com
[5] https://lore.kernel.org/r/YwIW+mVeZoTOxn%2F4@gmail.com

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/process/coding-style.rst | 61 ++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 03eb53fd029a..e05899cbfd49 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1186,6 +1186,67 @@ expression used.  For instance:
 	#endif /* CONFIG_SOMETHING */
 
 
+22) Do not crash the kernel
+---------------------------
+
+In general, it is not the kernel developer's decision to crash the kernel.
+
+Avoid panic()
+=============
+
+panic() should be used with care and primarily only during system boot.
+panic() is, for example, acceptable when running out of memory during boot and
+not being able to continue.
+
+Use WARN() rather than BUG()
+============================
+
+Do not add new code that uses any of the BUG() variants, such as BUG(),
+BUG_ON(), or VM_BUG_ON(). Instead, use a WARN*() variant, preferably
+WARN_ON_ONCE(), and possibly with recovery code. Recovery code is not
+required if there is no reasonable way to at least partially recover.
+
+"I'm too lazy to do error handling" is not an excuse for using BUG(). Major
+internal corruptions with no way of continuing may still use BUG(), but need
+good justification.
+
+Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
+**************************************************
+
+WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
+is common for a given warning condition, if it occurs at all, to occur
+multiple times. This can fill up and wrap the kernel log, and can even slow
+the system enough that the excessive logging turns into its own, additional
+problem.
+
+Do not WARN lightly
+*******************
+
+WARN*() is intended for unexpected, this-should-never-happen situations.
+WARN*() macros are not to be used for anything that is expected to happen
+during normal operation. These are not pre- or post-condition asserts, for
+example. Again: WARN*() must not be used for a condition that is expected
+to trigger easily, for example, by user space actions. pr_warn_once() is a
+possible alternative, if you need to notify the user of a problem.
+
+Do not worry about panic_on_warn users
+**************************************
+
+A few more words about panic_on_warn: Remember that ``panic_on_warn`` is an
+available kernel option, and that many users set this option. This is why
+there is a "Do not WARN lightly" writeup, above. However, the existence of
+panic_on_warn users is not a valid reason to avoid the judicious use
+WARN*(). That is because, whoever enables panic_on_warn has explicitly
+asked the kernel to crash if a WARN*() fires, and such users must be
+prepared to deal with the consequences of a system that is somewhat more
+likely to crash.
+
+Use BUILD_BUG_ON() for compile-time assertions
+**********************************************
+
+The use of BUILD_BUG_ON() is acceptable and encouraged, because it is a
+compile-time assertion that has no effect at runtime.
+
 Appendix I) References
 ----------------------
 
-- 
2.37.3

