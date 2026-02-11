Return-Path: <linuxppc-dev+bounces-16799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA+VAbw8jGlyjwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 09:24:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DDF122322
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 09:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9s0h654Fz2yY0;
	Wed, 11 Feb 2026 19:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770798260;
	cv=none; b=cd6hmO9mYe8G/W20TbiWuO0iliwZcEk8PtLLIfkL/PWRUISD/cQ6XiMj2txS/4gD9GBdGdPhL2g93eKGHlKUQsF+2sztfsAGtLXBRLYseWfBTuGnQmwjG5tEbbKZdi5+ak9DXUtOrGO3fQONy/aV1MOBx5Dn0fFt7dYs0AuafUANd4JTsNaPRKFBUajhkE5RFinH5ax+d5h68MMrHx3LxI1v9xwctOd9sj72lc2WlmNDGIH5xElbAfBg2ri7mnROgO8jA4NNHWskRqaBxNjZmRk7naJn4wfSXzlsWyh+kYb5z0N8xd0DkgeW5iKuytUy8UZL8ZAee40gEK+s1WorEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770798260; c=relaxed/relaxed;
	bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:content-type; b=C8qCzTyRp+3S+s8LYtM37ftwwtG5SmIXdeDK0HfgUit349EtywFZlBiIsE+HiOUxa3rkNZWTpRD15CenmAscLIcd+nKJVQLN+60Ub55SPJ5kZB8tICsJRJ73RVAMJocTEtVgN/FExcVbBzSguCQ8GDD6twLybEn3Vp+4SrGQ0HQlazj+22XV2kcq9YKuv0yoIbmYk5o4kOCYqEiEhvkaMppa2HpKcev9webt2EOgL/eNc1/dEYavC5j0hgHzgM32vIu53UdUrBIIaWgjYcM54E/yfpsG0bAWdOT8XfFTNQ2nwhuf5M1tk1oe8awJBT2fYyQMsUg3whZlqnBuA42lJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RoLDxS1t; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RoLDxS1t; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RoLDxS1t;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RoLDxS1t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9s0g2YHWz2xlp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 19:24:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=;
	b=RoLDxS1t2M1rg5JM2bTEhKw3w1PhNwBmcsmmYM1j4K4xBMqBRQ8a71LdKmRYISXWgHcwL5
	ccoPWzgncTk4+03q5R1LLu2VGaUsXD/2ZTNL70o7ist8/4kWF20WeNxjP59WL/zKoSR/CX
	CqbC7TLIdl5aN4/aruIVDio9hjMxSNA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=;
	b=RoLDxS1t2M1rg5JM2bTEhKw3w1PhNwBmcsmmYM1j4K4xBMqBRQ8a71LdKmRYISXWgHcwL5
	ccoPWzgncTk4+03q5R1LLu2VGaUsXD/2ZTNL70o7ist8/4kWF20WeNxjP59WL/zKoSR/CX
	CqbC7TLIdl5aN4/aruIVDio9hjMxSNA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-jfPWT_bUNiyHn6YQ5AtXRQ-1; Wed, 11 Feb 2026 03:24:07 -0500
X-MC-Unique: jfPWT_bUNiyHn6YQ5AtXRQ-1
X-Mimecast-MFC-AGG-ID: jfPWT_bUNiyHn6YQ5AtXRQ_1770798246
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a77040ede0so16875735ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 00:24:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798246; x=1771403046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1KvghMrg5FQLYtugCrRlvN5/+TeaaG+RNwvPgguvEY=;
        b=tERK7KYuzWhsfiNUM6K1JEm6uCkHbya+X9mWYQRXmF+h3UsUpwwGz3Fs2UhwObJptV
         hYUhjHiuYRQhuOFEttzLaKS60ha36bnd2SK8y3w+w5cvJzEVXl8si53akeGgLtDpu8/4
         gIBaH0/8/lTtKpSvyUgsz0+mV01TooEd/W5omMsp/7ocSGgdOMHZlChff6RyLbQCrN2I
         UKOsri93F0X0y7vza9pl91LHuL6qysI4LvjMz5gTxRi/rmmtiYMaDhPnRrg39EjmJ/5V
         vGvfRKMxz+nVLGPQbIO02DC4YeAx43wa4op2q7QMev9/j4C5es7aeX96mHLTB7dNeCAi
         9bOg==
X-Forwarded-Encrypted: i=1; AJvYcCV6CxZTHiA/gyLT7549aTj/KFKR+yDr4pBSvpmNQzrB8K8g+qWGsBfXCvtcH3X9SNuZFK28iiEscYEvwyk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0WMUInB/tOZFaYh3qQIYCbhlSUDr7nI+TLGymgcWs9LXNe3Dw
	OJXStcdcQgGnXPPlAH0ic40IBFJWb2Gds3SEK6A/pfBWBXR5lmn5hKQNQqiDNcx7qHFv9YkEXrq
	7INBnPAZ1FAbwrA3yyvcCuVYevXp07NpTsKkXa0YVkR80Nd6ISegkrOMa5Kr8DjsURfk=
X-Gm-Gg: AZuq6aLmzZ0TO9LH7/IQTSG3mnFi/m3pzNsCPTyYyRyv0xPbziC5lEzhvuh3MiJIJOQ
	FmWdctaqQAaGgGhrfc+G6+lqB8KwrQwOg5L6B0cYLWJldUHCSy2skINDiFMMdLb0XhMormmk8D8
	bMeDCFB3VbfVapClff6X48p5eAY653ZgY30kG2gXIOkkKkWky/T931hrYF7NxdhxqVIMGmCJcHy
	Mip//hqb685AHinVFAt7cPXOMwFkwDQRD7Wwp9otiuMTg/u+l6JUZJB0qWUvg9LaCFL/apdM9a9
	IGztpJ4zVQynVqmkYrbD2WnXnLQ1QvjDv6PwdKfbbQzRgvW9tgJBVkPr8IkGKHQV5qcBVlX4/XT
	Xd539bgdxxt9z
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr122999115ad.61.1770798246187;
        Wed, 11 Feb 2026 00:24:06 -0800 (PST)
X-Received: by 2002:a17:903:985:b0:2a9:cb10:42d with SMTP id d9443c01a7336-2a9cb100bcemr122998855ad.61.1770798245566;
        Wed, 11 Feb 2026 00:24:05 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ab0esm15186415ad.9.2026.02.11.00.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:24:05 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/2] kdump: Enable LUKS-encrypted dump target support in ARM64 and PowerPC
Date: Wed, 11 Feb 2026 16:23:58 +0800
Message-ID: <20260211082401.2407853-1-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NyBsnYHQ1Y_V-Qj9xlL6zt58lub-8kSxfsf6z1Lp8nE_1770798246
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16799-lists,linuxppc-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 30DDF122322
X-Rspamd-Action: no action

CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
device dump target by addressing two challenges [1],
 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump.

To also enable this feature for ARM64 and PowerPC, we only need to add a
device tree property dmcryptkeys [2] as similar to elfcorehdr to pass the
memory address of the stored info of dm-crypt keys to the kdump kernel.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://github.com/devicetree-org/dt-schema/pull/181


v4
- Make arch-specific code more succinct by printing more logs in
  arch-independent code [Will Deacon]  

- Also use device tree for PowerPC to pass memory address of dm-crypt
  keys info
  - powerpc v2 patch that passes the dmcryptkeys kernel cmdline
    parameter:
    https://lore.kernel.org/all/20260106074039.564707-1-coxu@redhat.com/

v3
- Delete the property after reading it [Rob Herring]

v2
- Krzysztof
  - Use imperative mood for commit message
  - Add dt-schema ABI Documentation 
    https://github.com/devicetree-org/dt-schema/pull/181
- Don't print dm-crypt keys address via pr_debug

Coiby Xu (2):
  crash_dump/dm-crypt: Don't print in arch-specific code
  arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel

 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 arch/x86/kernel/kexec-bzimage64.c      |  6 +-----
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 kernel/crash_dump_dm_crypt.c           |  7 +++++--
 6 files changed, 54 insertions(+), 7 deletions(-)


base-commit: 2619c62b7ef2f463bcbbb34af122689c09855c23
-- 
2.53.0


