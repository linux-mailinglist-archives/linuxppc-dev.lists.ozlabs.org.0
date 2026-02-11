Return-Path: <linuxppc-dev+bounces-16798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAw4Frs8jGlyjwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 09:24:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 355B0122323
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 09:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9s0h5mryz2ySS;
	Wed, 11 Feb 2026 19:24:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770798260;
	cv=none; b=Atg6xp5aNTIAWrrOs9/FxzV1CIBbILGv8YkpBIsBlOUJaCL65rSG53js98hm1T/LooW8Vt2jby1CG+LzHr4GvnjhmrzrYGBm8rHJqLQmgBlsqBUBT30diTY01eqZM2SJ8WNmTY91uGwpeppNXlPFL1rLHpov8CeJR24MrgzojciRxq4ga+UaTTaHKVgO+1zq1iemVFM5ltMymV3GkZsE0ZPaiiMQCWwIdds7VQPHH5PO7IKzCH1xc5dO57ocW0Y1OyUZND+BJ1B8iojcgBH+ELtn3UtLUeb23V20MXOKpRUaALlk5olcqqTyJiohRbWupR315IKVax7dxPgFwKOqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770798260; c=relaxed/relaxed;
	bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=OYcsWJMNYKCjNbbsZTxi7sfZM3KaYUM9OIlyOcdZHWmpSyI5GDyYTS3gCZ0L15LrR31gdSGzDg8clWLB9qmfxbhkqLToClO+dCJ8pthb3tw/MSoOHwzpJVjEZv90Gsu1uMAAXGzC/1TPez0yIe3w0x9vpztrDVwYd0F3BS6YbJ/0lzyqC5QJEoWvrgE7AFQk/pjbgXSGBYtQlNZTE3aMyGHtMYu7XyNG+ARxJB7N7Yps6hFJLm98pCCX+A2hRZ+Hx0ABVODIRDMT4fmqOkrOP+lWIozM5USb6JFgZGoZqbeg7SWNyqJMq0S3Mx4dgVGyPBiGu7cQNzSDaDgHJuLB6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HGM0BIZ2; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HGM0BIZ2; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HGM0BIZ2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HGM0BIZ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9s0g2Wwbz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 19:24:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=;
	b=HGM0BIZ2j8v/Ckvo+ZUTjfoTeR8qZyKRQafo3MM46cOEZ8By7cR3hnNBDkpdpoh2T0WAIR
	1g2NCUsh7869SpDqdOch7vkAT3334XDhQqnXin9TR45qtZtSYB8+qsOoH59cseIazlnfKY
	8SaT6h7U1jMjbxPyHOUaGPv74O4pNPE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770798253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=;
	b=HGM0BIZ2j8v/Ckvo+ZUTjfoTeR8qZyKRQafo3MM46cOEZ8By7cR3hnNBDkpdpoh2T0WAIR
	1g2NCUsh7869SpDqdOch7vkAT3334XDhQqnXin9TR45qtZtSYB8+qsOoH59cseIazlnfKY
	8SaT6h7U1jMjbxPyHOUaGPv74O4pNPE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-K6tmrgPQNxaex0KodTc-zg-1; Wed, 11 Feb 2026 03:24:11 -0500
X-MC-Unique: K6tmrgPQNxaex0KodTc-zg-1
X-Mimecast-MFC-AGG-ID: K6tmrgPQNxaex0KodTc-zg_1770798250
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad6045810so15371765ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 00:24:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798250; x=1771403050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ihJ36lzkXZ7WFB7v/KaqffqO3gp0QEVYrI9tOHAHfi4=;
        b=mUB26ciEC32Ob33tbfmJ7DrSJeMZ+kkunnAq+r2Xg4WIcqgV5uQz4JGQfyKuT9msFJ
         bvNc5AWF66n2mQ3/AVsK8bwlw+VMgDcTnZmgWzXeFd/RI0QrlOhEI7kBfLgDktoGK/eW
         HOATbCpwNpj9FcSr2EfAnHQzLS9hYrd4abSoxZT2RuNV8opzBTwj7aOFC7yoxi6b8ZW+
         gc9fe8W8TmpIE6bUlI1i6VXPquL1TjNsH4MQ0cAdW23IOE1GVgVNysMlMhQwklwLs/mJ
         i7g85mryeV/0jXNwaVNXQga6GZhiVBBT4EF46nEg3Et8FaNAG8M02sOvUtxV4oOVcpFS
         sLrw==
X-Forwarded-Encrypted: i=1; AJvYcCXw7OTIr/TNwGxeqEbVpJOlj8WjE0IkSSXKxUAPUJsDOmxO3BJYNbQCbBfz4h1bDJb4efdchwr98MV2dEQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyD7PYOz345E7cIHdxLbMiq2tERyT7JUAkFKmJaHayi0Nqy6AXc
	jVHpay1ZADn0FNvk7SrQ4EoV8tua0TfzravC5Efu3869SMfTWotIfT+TxonlTYpBJ+U7yR8tfd6
	Wpc6dWXd0/Xxi8T5cUMUD3tDtTfZadsDI9YbH4fChxlf/hD/k8wKMgrMlXsowZ9TPAY8=
X-Gm-Gg: AZuq6aIMAE8eU7K9J6FNA/C9HfTj6ZcOB6NrZ2EjJw5Qari3E2A8OIHoZHJgBfOkbYj
	1pXtjrjPcF7LVyPaJHKFT9B3FaJm5ulQxZylkI2KXrcOzG1eEqj/8cvLRJZ1Gd6BRMAN0xuBUp5
	U/QQdu58g/wwXydjNg9uYtBklwjMETW/LNXS/WeVtgNe/NYLfOJcosqkNOU1EaittQZZM/a9Yx1
	m0ZEz4n/h8T9YGdsn7zH+bDMTAGF8b4zxGqyH0jFfeqVBuJA2pHRFMn4BZeiAM5TNRvo3fYRTNj
	oCnHgZyyz+rxB62Y5P1WWWaJVLO/LtTODjg0BtDdgPh/I3RtJKnULRQ54iX8HK2mfcq0JmdlZXO
	f+Un/J9ntShrh
X-Received: by 2002:a17:903:1a0e:b0:2a9:4450:abb7 with SMTP id d9443c01a7336-2a9516fcf6amr203049345ad.39.1770798250253;
        Wed, 11 Feb 2026 00:24:10 -0800 (PST)
X-Received: by 2002:a17:903:1a0e:b0:2a9:4450:abb7 with SMTP id d9443c01a7336-2a9516fcf6amr203049015ad.39.1770798249724;
        Wed, 11 Feb 2026 00:24:09 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964c62sm14460265ad.55.2026.02.11.00.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:24:09 -0800 (PST)
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
Subject: [PATCH v4 1/2] crash_dump/dm-crypt: Don't print in arch-specific code
Date: Wed, 11 Feb 2026 16:23:59 +0800
Message-ID: <20260211082401.2407853-2-coxu@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211082401.2407853-1-coxu@redhat.com>
References: <20260211082401.2407853-1-coxu@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 6Pnuh1tthOly9A2JJh9CywcvnoJKpI4oHfWNXuSIsgg_1770798250
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
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16798-lists,linuxppc-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:kexec@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:will@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coxu@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 355B0122323
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
index 7508d0ccc740..d20cf976d01a 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -518,12 +518,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
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
index 401423ba477d..478dacb0625c 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -405,14 +405,16 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 
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
@@ -423,6 +425,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	r = kexec_add_buffer(&kbuf);
 	if (r) {
+		pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
 		kvfree((void *)kbuf.buffer);
 		return r;
 	}
-- 
2.53.0


