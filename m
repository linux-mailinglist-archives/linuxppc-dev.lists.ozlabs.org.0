Return-Path: <linuxppc-dev+bounces-17230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B2lIO/wn2lwfAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:06:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C31A19BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:06:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2Yk5Pt0z2yLG;
	Thu, 26 Feb 2026 18:06:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1249"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772089578;
	cv=none; b=ai9vRfeiuyUULl/6mXdWCePjhA526yEAh8kTkx8v5ji//gYnsgmlED1QIvXNTQLCe0B0BA1WnPrLNUciq3W/Cm+8Z7TDgW3Bdo1R6OnzFhtUlt4o5O2fxk8scLoX2yzoEHmV3GLhHvS6H8oFmHrT5gpwwpxSzz3aV+DB3L72ZWsOEloOqjqroqQ07B1KU2RCjhaPLEpaIXobzPQWtT2AojofwKYeipUPx4rTrPUX+EwxGR5MfeTJYtB3RQDoFrV99uUCOd0cDip0P7qWhAnEi6918x67avXVFXzgbyFb6+lyusAAZU7zVE/NhqLR5ww4l3ZV1h2sEzMhuujv75axeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772089578; c=relaxed/relaxed;
	bh=xfjM/VAc0stWw4WShx/yqMtIU9xXg0AJdwokX5oM15c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eF/Bq3gQvdoYNwPvAWh1A1E5HBKOMFejCQGRaPfDl5ZrKfl6jMQLfMV7+lgXnxR8BvJZqnJoGRNwImqUJCaYIUilNBUjy5kvuf9bwTVcY7/D4yx+XIYcQZgz5nutq6dNMshstj+ii/aN3VK+qCb7tu49TCbeSEp2UXgeNAHV4AwnEaHbvm7sr0R8fxzlU8eTuJkmNpONcs7B5oNUjKGduuCksMgMQr6guTO66apOGs5i+lRSaABF1brsOmyrifHLDS/HF6m8ng/+9y1eG8gkpEWd4Jxsy83HRZbmhpv5/sEyYor+KOFh5yOROpJDUk8TOF5FilMYG3V3WPrCGqhIhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YfgooW9l; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1249; helo=mail-dl1-x1249.google.com; envelope-from=35_cfaqykdjwoqnaj7ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=YfgooW9l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1249; helo=mail-dl1-x1249.google.com; envelope-from=35_cfaqykdjwoqnaj7ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1249.google.com (mail-dl1-x1249.google.com [IPv6:2607:f8b0:4864:20::1249])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2Yj6RHCz2yFc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 18:06:17 +1100 (AEDT)
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-12733603eb5so9347992c88.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 23:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772089576; x=1772694376; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfjM/VAc0stWw4WShx/yqMtIU9xXg0AJdwokX5oM15c=;
        b=YfgooW9lpOYUbeGiMAz1fdXgwhU7yJeaU/keagXbBJfn0BTkqefaj0RaltzkMAtF+V
         jQNvIMQLdJYQ420Ua6lq8wG3mvcQhR/Jljp2DpUqf/6s2P6VNNLua+QhNyg/Cy1BKwMU
         OWsoZedWJfxk7WHRVngJId2sl0Z+5OrWKpcQiFlH1W0Qxxz2CJ+Uehy4g4F8rIwmmQ34
         ZQTUZuJYyR4qq/CS7YTcMAAHp2p6ns3TDpoLF/PS2jh5DdVVTbaoVAkJ49y+BzOKoZW6
         K0FtGjwRvO8TmKI9F6/KXD+LszRFj9gj7hUwWaueIiKkpXrHCCrOvP5fJiUErloee85d
         VZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089576; x=1772694376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfjM/VAc0stWw4WShx/yqMtIU9xXg0AJdwokX5oM15c=;
        b=C/tyGKG98iZNJT/5vLUNMIT86Mpg6+m9R0Ru3wTxBr5vZBlR3j8ZAlERPiipcOMsRm
         2PFXhnU0jPeHOWbtCew31eVa0p5PnQJiZD2k1R1jbdxF133QoXqjanxmxRM6nob7eVEW
         WbfRS89KRvVc48y4QHEu5hVquZbJ08zq+IXSPtcHHN7fDT1c+3GUyxpVOygFJc0gLyB/
         dN5ioxLZ29MbkZXsgtx6NEZTst4jLVDI1M8jV6+dX+QtKop7C87Dma83vGs/tP5Rbd6M
         XKVKD57pTlzxAMfwaBPKFEwkFjusEoVEwXo4GRV1/fhUUwpj3eLOjWTBIDsKlFcQx8F+
         vZdg==
X-Forwarded-Encrypted: i=1; AJvYcCW5l2lpOEJAgTUbGWqto1v5im+ysbQjR8qP6BPx2uiAmOFXhErmY7PvpFdKcM1P6OJoedQvqir7enzS9s0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySBS0GUuKGohQNB1QGRsTYxdKZXS54XTgMDIn+biJFrbyR0bFr
	A15zAe7KrHDZy6WSCrS7LOEXz8ZhDoHkl6sIdxH7TWya5tQDcPCDv3+uF/Oo1bQNqXyYi871zVf
	E1eignA==
X-Received: from dlbvv2.prod.google.com ([2002:a05:7022:5f02:b0:124:a76e:bd23])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:626:b0:123:345f:5d9c
 with SMTP id a92af1059eb24-1276acdaa5amr6463857c88.2.1772089575384; Wed, 25
 Feb 2026 23:06:15 -0800 (PST)
Date: Wed, 25 Feb 2026 23:06:07 -0800
In-Reply-To: <20260226070609.3072570-1-surenb@google.com>
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
Mime-Version: 1.0
References: <20260226070609.3072570-1-surenb@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226070609.3072570-2-surenb@google.com>
Subject: [PATCH v3 1/3] mm/vma: cleanup error handling path in vma_expand()
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17230-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:surenb@
 google.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.933];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 231C31A19BB
X-Rspamd-Action: no action

vma_expand() error handling is a bit confusing with "if (ret) return ret;"
mixed with "if (!ret && ...) ret = ...;". Simplify the code to check
for errors and return immediately after an operation that might fail.
This also makes later changes to this function more readable.

No functional change intended.

Suggested-by: Jann Horn <jannh@google.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/vma.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index be64f781a3aa..bb4d0326fecb 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -1186,12 +1186,16 @@ int vma_expand(struct vma_merge_struct *vmg)
 	 * Note that, by convention, callers ignore OOM for this case, so
 	 * we don't need to account for vmg->give_up_on_mm here.
 	 */
-	if (remove_next)
+	if (remove_next) {
 		ret = dup_anon_vma(target, next, &anon_dup);
-	if (!ret && vmg->copied_from)
+		if (ret)
+			return ret;
+	}
+	if (vmg->copied_from) {
 		ret = dup_anon_vma(target, vmg->copied_from, &anon_dup);
-	if (ret)
-		return ret;
+		if (ret)
+			return ret;
+	}
 
 	if (remove_next) {
 		vma_start_write(next);
-- 
2.53.0.414.gf7e9f6c205-goog


