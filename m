Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41939EB2F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 15:39:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473nyX5k9KzDqmf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 01:39:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81; helo=us-smtp-1.mimecast.com;
 envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="dxUVa7Go"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473nlp1cTyzF5nL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 01:29:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572532194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5P7I/G/c69OPjbakvWV4bkQcdrPM+r0Yk0Byj4hhrDo=;
 b=dxUVa7GogaG6YGkRr6TzUoFoHFNZqfJQsc13J0tJS8YIVQmSIdWrKqaMd0K3Z43YRHfH4D
 p9JAcvLk+iZGZB4tDXsyba+J7CoN3Z1IwUMAmjIFkTpfX6+jGA/nXYEYuz8GiXgxxm3t31
 c+lCvSSpbTvJuFL11wv66jpT3jRbkN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-1ewAaRgoNHaIcomH8UFr9A-1; Thu, 31 Oct 2019 10:29:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 300F71800D6B;
 Thu, 31 Oct 2019 14:29:48 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DBF15D70E;
 Thu, 31 Oct 2019 14:29:45 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/12] powerpc/pseries: CMM: Implement release() function
 for sysfs device
Date: Thu, 31 Oct 2019 15:29:22 +0100
Message-Id: <20191031142933.10779-2-david@redhat.com>
In-Reply-To: <20191031142933.10779-1-david@redhat.com>
References: <20191031142933.10779-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 1ewAaRgoNHaIcomH8UFr9A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: David Hildenbrand <david@redhat.com>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Allison Randal <allison@lohutok.net>,
 Arun KS <arunks@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When unloading the module, one gets
[  548.188594] ------------[ cut here ]------------
[  548.188596] Device 'cmm0' does not have a release() function, it is brok=
en and must be fixed. See Documentation/kobject.txt.
[  548.188622] WARNING: CPU: 0 PID: 19308 at drivers/base/core.c:1244 .devi=
ce_release+0xcc/0xf0
...

We only have on static fake device. There is nothing to do when
releasing the device (via cmm_exit).

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Cc: Allison Randal <allison@lohutok.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arun KS <arunks@codeaurora.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/=
pseries/cmm.c
index b33251d75927..572651a5c87b 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -411,6 +411,10 @@ static struct bus_type cmm_subsys =3D {
 =09.dev_name =3D "cmm",
 };
=20
+static void cmm_release_device(struct device *dev)
+{
+}
+
 /**
  * cmm_sysfs_register - Register with sysfs
  *
@@ -426,6 +430,7 @@ static int cmm_sysfs_register(struct device *dev)
=20
 =09dev->id =3D 0;
 =09dev->bus =3D &cmm_subsys;
+=09dev->release =3D cmm_release_device;
=20
 =09if ((rc =3D device_register(dev)))
 =09=09goto subsys_unregister;
--=20
2.21.0

