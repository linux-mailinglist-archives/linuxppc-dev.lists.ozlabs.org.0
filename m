Return-Path: <linuxppc-dev+bounces-17144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Bm/M92QnmnTWAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FAB1923C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 07:04:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLPDQ3ktvz3dRt;
	Wed, 25 Feb 2026 17:04:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771999446;
	cv=none; b=TO65p5299LqUGGAqwdsqflRgRFajKiEOHqyI7Ig9t8F7fo9A8yQpNmHow0TkXVgp0OfPE1b4EqlvRklbsRDDPaG0x5o/gH2w89pLS/9TgchnMyZHFcu858pI9UNzcg0aaUDJ3omCzG02dlVoa1O9spDL9NmjNwWTW81XMYlqujE6zPyYZm210xfM5ef2gECNbKROjauseHosr2sAfxY090mBeFHdkGMJSU5BJARHj3OALsaC5ibxHiyK6WLYMcKLv4S9smBNLOMaGd4QjF/CW/HBPWDCpF++mynDL8YQAqoB20x1iHdzMlrZkxJtABSCBFFr4fc4pLGSo2civYX6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771999446; c=relaxed/relaxed;
	bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=QyiNJjZsV4RyUA3QRFHVZJ1zhLQhvR0xhtTTyacAi65wW3+qfK0wDF6tosfmggzZw/qwZzLFwIW2VEr0X9rJNwjCSvUwyo6BJdOd2YQQ0+YnUBQ7D1roz/RF43ef2jcIvmFixvCtSVs/SSXqSwHgI0xitVgZkQYJ/Nz/BK9YxL1bstexxuziF4aFTBZNFXmP9mWN9lM1SJkLzMUYsyL7ltzheAPPnUqnmL277QDq2bSM2LzTvnUlQvoBIaVjm0wGzG0IQUz9pMKqDdSGT/deiXjai5os72LldZwM0dVun/QM9ce8o+cqY7tytEqz8tOlbzRzE7eMBB1SYrqaK82+0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwXXLidM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fpxHKFZE; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EwXXLidM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fpxHKFZE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLPDP3n8Fz2xll
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 17:04:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=;
	b=EwXXLidMqBPl8XnzVq4unr7dkJWjevZ1tclrWmdPURaDSZJdWJ5aIe+gYhPlVmxsT+1Pjg
	k4htwANqGGwJrnG+qdLfgb27glStA+s7RinLVlnXRjmpdu6w/vTMktE4EYxPOEdnVP6o6a
	3PYtrrijLM7bacTyf72787e0KcJ25xg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771999442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=;
	b=fpxHKFZE2RgTpFFveNzUpKkRxrMgMUD1LQa0nRlXQavh88M7uE0fKZWmJcIiPeog3eiqlJ
	oeIpdxY207H/j2n1BtwKCsxUxYtQDh4lK4fOaKBiLXn+1d4fGau54NG5GocnLQNaKn1Pnz
	daDd62ob5/gHeugywoOfJBrkd9lyL+0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-HhuDgDYxPOauK_PbjIXZww-1; Wed, 25 Feb 2026 01:03:59 -0500
X-MC-Unique: HhuDgDYxPOauK_PbjIXZww-1
X-Mimecast-MFC-AGG-ID: HhuDgDYxPOauK_PbjIXZww_1771999438
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70e94017ceso182792a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 22:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771999438; x=1772604238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmrGSNfnGiWDwNvctHFqdcRxKu8ZGchqf9tdlqmXs2o=;
        b=HOgvVYgxwpS/mKikwEb/HXIpgp/tCxkHoksX6XFR9ZbI6MBTXM1ellwTjSbKFtkBkR
         6jvfFFVYOAQXK3BKWSugfTCyvKvlk419WnNnaAerHypMfgY03qdiRTEuCSD/Mo60hLIT
         tsm7SJBtH9KCBU6Nzlp4+CzK47Bj2f9FpmuQZZ6COA97G8X5XAHCV6QT+cqodj7YIotJ
         WgLCSj3zmEyXNqoLCTJOxpyGVwl0QKdFemY5vDdkboUJAXXyH03Tn6BTjAC5/CWeGZ5j
         2gQusaJoEkddOofuU1a7jqz3RXEFwJI5dDsokUzt6TCPtpaoTunpsXkEuPIa0eUFWfnz
         +/2w==
X-Forwarded-Encrypted: i=1; AJvYcCUHDSL1DjZueh0BCQYfEjhfYhLzWDK0VJP/nWSOQ1rnlPf1IQufcrUtckJ/P5TWuUZh1QrrkbB2MKXjGzU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIUfzzT1yte6mh0p3OR4gJcvKXSezNEQuPUYfk7AIjAgOFNGuo
	PyRXXSfq7ebs2EAkWKUfjTfcn7LhhCUA4tEhaN0IWtuiYBkYsRIWvWEreumDfZv57oCItEqyA38
	UvV+QfzAb4pAVu/KkdoyrmP9rElwXyUdEYgd76yqywKQkX3XXix8JzMU6rSx/5AA6rNs=
X-Gm-Gg: ATEYQzwiealWCg85GpYzT9EXc0DkApNCTsjTPb0WZoNGJm3YavbmAY9oyTwRPxWGhFL
	Pd7N+N7iWreZRujF3WVLnIW6O4tkdU5PNYWUXn+CSu14J46Jp9eFCim0i/+2/87k1e048zL0THi
	pk4AJuxfTRoIGkNdnFASj+TVVacDTw8qyVHEesW/RjJn/1wHe3I4LYUhe8juaQO8DUPCZGchacA
	fZl7lBbk12amxQk+mMpVwTFrGwZuWQTKw6xxr4PdXMPedp4Tnd8LAE06z6WeDohZ1d+KAHhJft5
	0jGbb6IqWowxnXMAp1FrQ3RXCxErQV8aVs0tlCy7OxjMN7OTm9o9vGaAHHnqDC5fibZHsQJkweR
	/Vr2TBLygOQo+
X-Received: by 2002:a05:6a00:4c82:b0:81f:4d16:5d8a with SMTP id d2e1a72fcca58-82724a3529bmr1223051b3a.29.1771999437869;
        Tue, 24 Feb 2026 22:03:57 -0800 (PST)
X-Received: by 2002:a05:6a00:4c82:b0:81f:4d16:5d8a with SMTP id d2e1a72fcca58-82724a3529bmr1223028b3a.29.1771999437424;
        Tue, 24 Feb 2026 22:03:57 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8fdb81sm13000482b3a.64.2026.02.24.22.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:03:57 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH v5 1/3] crash_dump/dm-crypt: Don't print in arch-specific code
Date: Wed, 25 Feb 2026 14:03:44 +0800
Message-ID: <20260225060347.718905-2-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225060347.718905-1-coxu@redhat.com>
References: <20260225060347.718905-1-coxu@redhat.com>
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
X-Mimecast-MFC-PROC-ID: MpEgQnQhWXI4LzqLjDUowlssFW1H0JUEw3ybVYHL68I_1771999438
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17144-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:will@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E1FAB1923C1
X-Rspamd-Action: no action

When the vmcore dumping target is not a LUKS-encrypted target, it's
expected that there is no dm-crypt key thus no need to return -ENOENT.
Also print more logs in crash_load_dm_crypt_keys. The benefit is
arch-specific code can be more succinct.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/x86/kernel/kexec-bzimage64.c | 6 +-----
 kernel/crash_dump_dm_crypt.c      | 7 +++++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 5630c7dca1f3..7e980ea49d8d 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -525,12 +525,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		if (ret)
 			return ERR_PTR(ret);
 		ret = crash_load_dm_crypt_keys(image);
-		if (ret == -ENOENT) {
-			kexec_dprintk("No dm crypt key to load\n");
-		} else if (ret) {
-			pr_err("Failed to load dm crypt keys\n");
+		if (ret)
 			return ERR_PTR(ret);
-		}
 		if (image->dm_crypt_keys_addr &&
 		    cmdline_len + MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN >
 			    header->cmdline_size) {
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 1f4067fbdb94..2f7b42b09673 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -414,14 +414,16 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 
 	if (key_count <= 0) {
 		kexec_dprintk("No dm-crypt keys\n");
-		return -ENOENT;
+		return 0;
 	}
 
 	if (!is_dm_key_reused) {
 		image->dm_crypt_keys_addr = 0;
 		r = build_keys_header();
-		if (r)
+		if (r) {
+			pr_err("Failed to build dm-crypt keys header, ret=%d\n", r);
 			return r;
+		}
 	}
 
 	kbuf.buffer = keys_header;
@@ -432,6 +434,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	r = kexec_add_buffer(&kbuf);
 	if (r) {
+		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
 		kvfree((void *)kbuf.buffer);
 		return r;
 	}
-- 
2.53.0


