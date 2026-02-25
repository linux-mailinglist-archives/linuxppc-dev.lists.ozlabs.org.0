Return-Path: <linuxppc-dev+bounces-17143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFYgMteQnmnTWAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E140A1923B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLPDN26K7z3dL1;
	Wed, 25 Feb 2026 17:04:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771999444;
	cv=none; b=fTx9LN17OJ6it84+uXD1ysqFlwUZP4mdt1uoVo09E5lGvsQBa3M4tNQ5AwFC06dwY37v8WLCD5sKP+qM97STfjMubfepBWGios4prjAUJ2cBEtPU7TIrb4ecnEstIoWRJteQ+76f+HQiYGAyV/l9gcS4QFyg8qxUOQlLGJ3cdI7d1P2VEdG/6Pu6vKqE1TaFzkmJZEsfmmff8D2cLjkNyhT7OmZ+AOqrJylzwILQ8AFu4wZdK1hcRNczDljhQarW+Tbc525/p7ENFPfeENYChGRCoBAV8tVTmVtLJtIHyHvqW8P8z7jh0E2ob44AoAUb1Bcqp7r5zBzP5lUHhRKPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771999444; c=relaxed/relaxed;
	bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:content-type; b=IU4AEbMThkVWUHkJ+GpnVBOvE4yHdG6t2QjyBRzwJ8hFSzYaPsZQbz4LdCxnZ1kAmFnEOiab2svCgXkQl3+kte3ohDSmyZjbt4ywF0yWrnfJ26AtLc2uTLFcowSJHKe0y/94nm6bTgJjyNM7sva1jQ+8Ap808jhPqyWTMyGyOnTF0+An7ghPHMOP0jjF+nC/J/eqz7F/4ELAMQ+zG3DA2fRJJCUfiae90WPRTccJ/dP76XaBiuEWiimgXRnwKfZKl5f8TmvBVnyrxYN4YLTdS1Mj3PBwFYqKcSXFoYMLXHm0i8z49a0O4DcpGo8p71V1LI3c5s13ru/f14gnSRjbkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8NIXueq; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8NIXueq; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8NIXueq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D8NIXueq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLPDL567nz2xll
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 17:04:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=;
	b=D8NIXueqTSNEp+BZhMMFnrKwOWTgVOSLbZgr1yfCiiTalIgJDDKXuTEkpwr7YDDtaPPbuo
	FgnryQ8M7DfaI3orJo5MsfcpcnlVkQCYqlU5m+eA30IM9r84Icul7KP22aMM/xYiLJrnxA
	KdLGX2BFHWUXTke6b4irDqxBNxewhc4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=;
	b=D8NIXueqTSNEp+BZhMMFnrKwOWTgVOSLbZgr1yfCiiTalIgJDDKXuTEkpwr7YDDtaPPbuo
	FgnryQ8M7DfaI3orJo5MsfcpcnlVkQCYqlU5m+eA30IM9r84Icul7KP22aMM/xYiLJrnxA
	KdLGX2BFHWUXTke6b4irDqxBNxewhc4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-BFlNpQzzNuOSNBIYFk3Pfg-1; Wed, 25 Feb 2026 01:03:54 -0500
X-MC-Unique: BFlNpQzzNuOSNBIYFk3Pfg-1
X-Mimecast-MFC-AGG-ID: BFlNpQzzNuOSNBIYFk3Pfg_1771999433
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4488329a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 22:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999433; x=1772604233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRRYrwJJKmmym1rA1RWT0WjPr4yt1zKA44KIR1qeZ14=;
        b=xNb0JV7pCSd/YPZXYvthN4SQXCqOrb3w2RKLcNoC04k4Gnvns6ukwOgGWmZSq4PJT2
         GBrz8o7jZrP3Dl5s4QtYJxuHF4H/2Hs6pZQKKuRP5S3dGW8Vp+FyiRNeT2aY8RigHkC8
         dg0z9JW9dXDlYP8iNceScxDMsZMCHkJKlyEj3Lq9qJXoKY8M2TdyZbW5nrSaTKNGnChO
         9J33KOkguf4BFMqql38n5MaBNmX3wEwGePI0Ji/Un5ob7SyrBnR7y4QGU5w6o8abKcbx
         Y34LMYZU/Bn6k8kzqz9v8WGy33Hs72m6GoBVXum3Zr4Xnzg2V7xn/GoSv6xrKs56RWg0
         KTxA==
X-Forwarded-Encrypted: i=1; AJvYcCVUbPqwC8bm7iWZsEhLnWD4lu3lgLthYo37Jly+1ga3KDQR88KXSqRURU5cZGJUNwhT57DMcgvNYGRhB0k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwXSadD5ZIAgP1o7vzPe+9etIjW1QwuVUDGRSQtDb+PBya2OyRx
	GsMURSa+T0Tmb2tRe6A5LXMPMRA+IdcqJdQA2Z8RALjUIn8R/LpvedzUKXlpwwwc7tTg2c3eCBO
	mTfpkz+ZrFev0lEJlKXIeEPX4nOqOG2li4L/uIGn6IRVIFENtiD6YZyx89MednVEbI+XEj09G2K
	QWAA==
X-Gm-Gg: ATEYQzxqvHJtV+Vp0TyJGrNQX51dnop/MD1I5VwH+mbZopQJLy0btgfJz9IkkzHHAPc
	2QZQAXP8xx7y5F67SIB7VfsDYQEKwSaWTnNr5NBbOPs+Q+QJKtUN6eWVRNj3e/H2lmW+087J6Y8
	Nsvhf5pXaj2Bc8sEVtCbGQ4QGO5r1UQyUpB/9yhC5CfomHqwSePGmCKtVHcGKaqaZQ4S6lLMOdC
	mcjlF6+z8nfrNV8YtG1V762WCPnjqGkXHiYKsxoj3EEiKpw2BoErBSydAmTmfia+DrHLzTkP7ER
	9oBd4bcXnFswVP7WfYTUAZbC9wOgjDyGLTSaQhlsd0NnbasXuVpCynmk5CLSJKTu1xJAPlfyb5g
	RVXpW/P8kcnfx
X-Received: by 2002:a05:6a00:ac3:b0:81e:8e66:38e0 with SMTP id d2e1a72fcca58-827249f8d7dmr1267963b3a.20.1771999432585;
        Tue, 24 Feb 2026 22:03:52 -0800 (PST)
X-Received: by 2002:a05:6a00:ac3:b0:81e:8e66:38e0 with SMTP id d2e1a72fcca58-827249f8d7dmr1267934b3a.20.1771999432047;
        Tue, 24 Feb 2026 22:03:52 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ecc83sm12341778b3a.62.2026.02.24.22.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:03:51 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 0/3] kdump: Enable LUKS-encrypted dump target support in ARM64 and PowerPC
Date: Wed, 25 Feb 2026 14:03:43 +0800
Message-ID: <20260225060347.718905-1-coxu@redhat.com>
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
X-Mimecast-MFC-PROC-ID: EtM4jp7FiLr1L9wLPAsvX9MDoSpyikHcRuTvIzac8c0_1771999433
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17143-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E140A1923B3
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

To also enable this feature for ARM64 and PowerPC, we need to add a
device tree property dmcryptkeys [2] as similar to elfcorehdr to pass
the memory address of the stored info of dm-crypt keys to the kdump
kernel.

[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
[2] https://github.com/devicetree-org/dt-schema/pull/181


v5
- Improve commit msg [Christophe]
- Fix a compiling error found by kernel test robot

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

Coiby Xu (3):
  crash_dump/dm-crypt: Don't print in arch-specific code
  crash: Align the declaration of crash_load_dm_crypt_keys with
    CONFIG_CRASH_DM_CRYPT
  arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel

 arch/arm64/kernel/machine_kexec_file.c |  4 ++++
 arch/powerpc/kexec/elf_64.c            |  4 ++++
 arch/x86/kernel/kexec-bzimage64.c      |  6 +-----
 drivers/of/fdt.c                       | 21 +++++++++++++++++++++
 drivers/of/kexec.c                     | 19 +++++++++++++++++++
 include/linux/crash_core.h             | 14 +++++++-------
 kernel/crash_dump_dm_crypt.c           |  7 +++++--
 7 files changed, 61 insertions(+), 14 deletions(-)


base-commit: 7dff99b354601dd01829e1511711846e04340a69
-- 
2.53.0


