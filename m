Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2091C37B2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 13:06:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0RJ36pFzDqWd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 21:06:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hWWrtqDL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hWWrtqDL; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0NM1DxszDqWd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 21:04:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/zSu0nDaAFA3V8KFg/CmqZq0CD2krMmrv/BPi6ofEA=;
 b=hWWrtqDL5yhEW5CTmGvQ9BI1yO5tPmarBnoUg7pFSzdBcqFYjJTT+Oo37x4LHZ8Q4bpyhz
 Ko3nJUXt+SKGfsvgMqeoF2K55z/6ioRnFBZzzN9B9VoQ5cQzyp7V1DUzO0/981fytx2eyT
 MbgTfvTwPFstbPo84nWVrsOrD11Vbn8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/zSu0nDaAFA3V8KFg/CmqZq0CD2krMmrv/BPi6ofEA=;
 b=hWWrtqDL5yhEW5CTmGvQ9BI1yO5tPmarBnoUg7pFSzdBcqFYjJTT+Oo37x4LHZ8Q4bpyhz
 Ko3nJUXt+SKGfsvgMqeoF2K55z/6ioRnFBZzzN9B9VoQ5cQzyp7V1DUzO0/981fytx2eyT
 MbgTfvTwPFstbPo84nWVrsOrD11Vbn8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-es5Q_3ouPFuLqlIFdkzxlw-1; Mon, 04 May 2020 07:03:54 -0400
X-MC-Unique: es5Q_3ouPFuLqlIFdkzxlw-1
Received: by mail-wm1-f71.google.com with SMTP id n17so3305352wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 04:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=09losalqRUJ7midVbFAi44IAzVHZ/Wi/7WIU6kwrX9U=;
 b=gZHhteAJBMVekCnpLKGGiRGnRMTi6lSJI08QQzCTc044aznCxV673f9L0mkI4VzY0t
 0VWREd2B1mtDJnDF0RArvS1xZYIN+o0XGLPttppLdnV7x76GtJBdgmGxF7fW7Y3iKVP1
 5wHMNXGD6fMzvZKDNdDQq80vhz52ULVMW5cPQAsxJrREMldkqbRgw+XajKWTzD3sE8zm
 1xFcuE/5KYGp2FKLqDASsBDzgncjAcL7UynktKaRlHb69jqBycpuSJWXrUO9cFv4A5jN
 r+z++RAsIuu4K/4Oxdk2tY3RkQYSlflbnObfwCFLnnSLVHkYbrwh8pt4xvXeUbX0lyMO
 +sZw==
X-Gm-Message-State: AGi0PuZGYjySWhbW+AxFzv1a9KZ8Jks5D6P300Q5eDSLh5vqq9CIEQVU
 gQQeMgdJ9NPZ9tO6CKi+HW3fljFu7KbA8cu91YjT/7VSH1La/RUjD2HEF5HVyF+3OjM9xM5OOla
 Iry7vfiORBn7KJq87HOOFjorQVw==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr6739159wrc.24.1588590233131;
 Mon, 04 May 2020 04:03:53 -0700 (PDT)
X-Google-Smtp-Source: APiQypJvuRFnJ0VBK5Hu4muwInjRtI3dy4S4pn3siD3o26S579ZPY0C/y2BIROU3uJD8eKGxaBWo7w==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr6739098wrc.24.1588590232648;
 Mon, 04 May 2020 04:03:52 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
 by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:03:52 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 1/5] refcount,
 kref: add dec-and-test wrappers for rw_semaphores
Date: Mon,  4 May 2020 13:03:40 +0200
Message-Id: <20200504110344.17560-2-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200504110344.17560-1-eesposit@redhat.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to the existing functions that take a mutex or spinlock if and
only if a reference count is decremented to zero, these new function
take an rwsem for writing just before the refcount reaches 0 (and
call a user-provided function in the case of kref_put_rwsem).

These will be used for stats_fs_source data structures, which are
protected by an rw_semaphore to allow concurrent sysfs reads.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/linux/kref.h     | 11 +++++++++++
 include/linux/refcount.h |  2 ++
 lib/refcount.c           | 32 ++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/include/linux/kref.h b/include/linux/kref.h
index d32e21a2538c..2dc935445f45 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -79,6 +79,17 @@ static inline int kref_put_mutex(struct kref *kref,
 =09return 0;
 }
=20
+static inline int kref_put_rwsem(struct kref *kref,
+=09=09=09=09 void (*release)(struct kref *kref),
+=09=09=09=09 struct rw_semaphore *rwsem)
+{
+=09if (refcount_dec_and_down_write(&kref->refcount, rwsem)) {
+=09=09release(kref);
+=09=09return 1;
+=09}
+=09return 0;
+}
+
 static inline int kref_put_lock(struct kref *kref,
 =09=09=09=09void (*release)(struct kref *kref),
 =09=09=09=09spinlock_t *lock)
diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 0e3ee25eb156..a9d5038aec9a 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -99,6 +99,7 @@
 #include <linux/spinlock_types.h>
=20
 struct mutex;
+struct rw_semaphore;
=20
 /**
  * struct refcount_t - variant of atomic_t specialized for reference count=
s
@@ -313,6 +314,7 @@ static inline void refcount_dec(refcount_t *r)
 extern __must_check bool refcount_dec_if_one(refcount_t *r);
 extern __must_check bool refcount_dec_not_one(refcount_t *r);
 extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct=
 mutex *lock);
+extern __must_check bool refcount_dec_and_down_write(refcount_t *r, struct=
 rw_semaphore *rwsem);
 extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *=
lock);
 extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
 =09=09=09=09=09=09       spinlock_t *lock,
diff --git a/lib/refcount.c b/lib/refcount.c
index ebac8b7d15a7..03e113e1b43a 100644
--- a/lib/refcount.c
+++ b/lib/refcount.c
@@ -4,6 +4,7 @@
  */
=20
 #include <linux/mutex.h>
+#include <linux/rwsem.h>
 #include <linux/refcount.h>
 #include <linux/spinlock.h>
 #include <linux/bug.h>
@@ -94,6 +95,37 @@ bool refcount_dec_not_one(refcount_t *r)
 }
 EXPORT_SYMBOL(refcount_dec_not_one);
=20
+/**
+ * refcount_dec_and_down_write - return holding rwsem for writing if able =
to decrement
+ *                               refcount to 0
+ * @r: the refcount
+ * @lock: the mutex to be locked
+ *
+ * Similar to atomic_dec_and_mutex_lock(), it will WARN on underflow and f=
ail
+ * to decrement when saturated at REFCOUNT_SATURATED.
+ *
+ * Provides release memory ordering, such that prior loads and stores are =
done
+ * before, and provides a control dependency such that free() must come af=
ter.
+ * See the comment on top.
+ *
+ * Return: true and hold rwsem for writing if able to decrement refcount t=
o 0, false
+ *         otherwise
+ */
+bool refcount_dec_and_down_write(refcount_t *r, struct rw_semaphore *lock)
+{
+=09if (refcount_dec_not_one(r))
+=09=09return false;
+
+=09down_write(lock);
+=09if (!refcount_dec_and_test(r)) {
+=09=09up_write(lock);
+=09=09return false;
+=09}
+
+=09return true;
+}
+EXPORT_SYMBOL(refcount_dec_and_down_write);
+
 /**
  * refcount_dec_and_mutex_lock - return holding mutex if able to decrement
  *                               refcount to 0
--=20
2.25.2

