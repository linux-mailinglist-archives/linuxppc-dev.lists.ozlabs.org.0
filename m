Return-Path: <linuxppc-dev+bounces-17166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODDaDSKwnmlxWwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:17:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D41194134
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 09:17:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLSB46VX7z3f5Y;
	Wed, 25 Feb 2026 19:17:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772007436;
	cv=none; b=gkmWspc5bNcv1MJTNSU1Y8vJt2FwoyWpUpMytOCgktuHRR0K8qzri3IvWfJ3VYeiYrU105rutGZ+kKLf5U9FGkWK4LVQqtezrQIQ9784dxhRoDckvuf0/Tu1oT6tTZslNaisP5Zmbeu++BG28EbBWCjey4SwNU51xloSqYKk3gIeIKkXJ+t7gczPtLc2T4DD+GOAEyIYHeEktUPkaAUOm/FGmmbUKd8fRY3otfvCFjwKbU5Zi0SpViTb6jjeMZZ9AzKBwDmG467k7GgjMRleI8mFZkzxTc5IXrnApkmAKZ3sXFbo4ftyjHZOKzL9zWtsUc5cLWQDrFFx0jy1ONFAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772007436; c=relaxed/relaxed;
	bh=oT83zYbQb0MMseAk5Xm5Eaz7XNiK7MPHbcs4LQizA5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=GaloL1/z9aXYSTKm9ubQDr5CPlr9WYf6AgHfYm2dONcRH81ij+OTBEL9wVzNsUJ24LjOVPVByOXfDbfBBFeiQCubdHImGqU/GzeFj9TT3S95SenkY4yK+qWaun9IoiY6qRBI7RJq5R5s6hGvUmNO4cZs8mXDoS0b005Avr6b+IdzUmcBrxOFJl0K1sDTRW6UJfUuzUKTVwvMjfwBv6qSQ3Xedl3Xvl9J0OoBRdOi5Onilfm/qV3cgqxqyVT+rh+cV1tjfxXYi50RBJOhaenu4F/XOsTQYRtt4MKf9501g/KU6ocjWAo0BicUjs4Gmd1DFHq0gDtV7joVagkpl91H8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQtmvt+C; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQtmvt+C; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQtmvt+C;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JQtmvt+C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLSB36hSqz3dWP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 19:17:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oT83zYbQb0MMseAk5Xm5Eaz7XNiK7MPHbcs4LQizA5Y=;
	b=JQtmvt+COuzA8DtSwaCujo+BvxxvbGJ+GQ5fxNULM8N3uluR98ONiM2U/jzTMfVfBHdghh
	c0sXzoKgozUe0L34LdlMMd0CKi8JJqKSrq60UgMl6NjxzbJf6ZROJ04dDf+dRg04Y54REX
	MJgvXM12AGn6ggZCarrGwfs5lzxWve8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oT83zYbQb0MMseAk5Xm5Eaz7XNiK7MPHbcs4LQizA5Y=;
	b=JQtmvt+COuzA8DtSwaCujo+BvxxvbGJ+GQ5fxNULM8N3uluR98ONiM2U/jzTMfVfBHdghh
	c0sXzoKgozUe0L34LdlMMd0CKi8JJqKSrq60UgMl6NjxzbJf6ZROJ04dDf+dRg04Y54REX
	MJgvXM12AGn6ggZCarrGwfs5lzxWve8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68--PGROTGBN1uM5wyFliyqng-1; Wed,
 25 Feb 2026 03:17:06 -0500
X-MC-Unique: -PGROTGBN1uM5wyFliyqng-1
X-Mimecast-MFC-AGG-ID: -PGROTGBN1uM5wyFliyqng_1772007423
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA092195609D;
	Wed, 25 Feb 2026 08:17:03 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2EF4E1800465;
	Wed, 25 Feb 2026 08:16:52 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 14/15] mm/kasan: add document into kernel-parameters.txt
Date: Wed, 25 Feb 2026 16:14:11 +0800
Message-ID: <20260225081412.76502-15-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: MOZmgKTQVy4IRKSFsuR6q1sdFMuODepFIqygb2C8SHI_1772007423
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17166-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kvack.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kernel.org,zankel.net,linux.ibm.com,redhat.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:andreyknvl@gmail.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:linux-kernel@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:chris@zankel.net,m:jcmvbkbc@gmail.com,m:linux-s390@vger.kernel.org,m:hca@linux.ibm.com,m:bhe@redhat.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 63D41194134
X-Rspamd-Action: no action

And also remove the relevant description in dev-tools/kasan.rst
which is hw_tags specificially.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 Documentation/dev-tools/kasan.rst               | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..e0115fad9e60 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2899,6 +2899,10 @@ Kernel parameters
 	js=		[HW,JOY] Analog joystick
 			See Documentation/input/joydev/joystick.rst.
 
+	kasan=		[KNL] controls whether KASAN is enabled.
+			Format: off | on
+			default: on
+
 	kasan_multi_shot
 			[KNL] Enforce KASAN (Kernel Address Sanitizer) to print
 			report on every invalid memory access. Without this
diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index a034700da7c4..eaae83fcb5e4 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -129,8 +129,6 @@ Hardware Tag-Based KASAN mode is intended for use in production as a security
 mitigation. Therefore, it supports additional boot parameters that allow
 disabling KASAN altogether or controlling its features:
 
-- ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
-
 - ``kasan.mode=sync``, ``=async`` or ``=asymm`` controls whether KASAN
   is configured in synchronous, asynchronous or asymmetric mode of
   execution (default: ``sync``).
-- 
2.52.0


