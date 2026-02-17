Return-Path: <linuxppc-dev+bounces-16907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKxuN0GYlGkoFwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 17:33:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0543414E36B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 17:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFlYl3bNhz2yvy;
	Wed, 18 Feb 2026 03:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1349"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771345979;
	cv=none; b=lfxYzWzUp46wuVEBAgc8OWypVdWnq0biXuZcqPnVnPi4gkEu8rvLUEtXfYXgbAmkbYrj2tcJtquM8zw/anNvFR+52xG554KNn27m6PxmJrhyOPtHXOONeKaRpXMga9RZDim/vM6DmI23Pgd//LPUxxwGfAU5T/l1gj+iQHGvRVqvFIDYlP1LFPqcb+TA1eHDAZC6I8KqYTxsT06MlN6AFBBEM5XaHDd8yLZYigpmEqCt9yNQaiKDpsNht+mQutupYq+AnJTQP4/m3st+Bkd9pO5rSz3iOxBhymyxSO6jpvjAgxoMOhtRjPhHm1Gdmm8ashxQsZfMrdsi33S99sP8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771345979; c=relaxed/relaxed;
	bh=20E8AsSTFCwzOiRhIxVDRmNYTsZqkvgm04spnyQD6co=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fkJF1F1p2TpIfoXAjQ/vgGfKWkFHT/ReIQuOJmWtexXiBEAODGrlcypnmzJoZG1G6eFwhqsCSD6lhOrJSJbpDV5ERfVUwbFZZHa+fVQeLe47/dOOQDVNgW2DYfPKyN33nmDoNjgGWMpwrDknbWHr9qWxDXwSTUGuNiJtntaPzNlWYs2kriGxX/2sQLQfr8uAXQLTmC7nZwA1wC1ZLKk0KalP4BwtRVLBJ+D1tXG5rcQwKi2l5IRUbsTxLnxZwkaAOf+1OcraY3s/ytvOOUjzllviQkI3b2Q5wLv04xXCaqQHSZvT5hp2QQoTyzGrAYhX3jSYcXESWdTAqoLNCzPYFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tpQ5T3tF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1349; helo=mail-dy1-x1349.google.com; envelope-from=3n5iuaqykda4685s1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tpQ5T3tF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1349; helo=mail-dy1-x1349.google.com; envelope-from=3n5iuaqykda4685s1pu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x1349.google.com (mail-dy1-x1349.google.com [IPv6:2607:f8b0:4864:20::1349])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFlYk4rNdz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 03:32:58 +1100 (AEDT)
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ba66faa692so5801038eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 08:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771345976; x=1771950776; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=20E8AsSTFCwzOiRhIxVDRmNYTsZqkvgm04spnyQD6co=;
        b=tpQ5T3tFuXIU/pq4209qwukudK0eHaFlJSUm85cs2hN4L3UH9RaJhUEOyr6sFBbMIy
         C9wTGVAV7zDm/o3VSFGJvpbbjjvHVLImmVzjWhXedCSGU65NEy/pifedk4WcGazxZfXc
         kZNux0CD9P+gMYwhsjIm5ec9zxahiO4JvYzc3NWJX7oN2wGO7IEmf9X9Emb2HIPN9nfV
         AxsK4d1iIgCRW0DWG9yIzcZ3r8VDLXlpnQSgrrCCN0dAGAmcqP3RanvQbwzs8y43bg68
         yljHQSpRs5yvtFN+/43ho0tTz9euN0f3QCO64Y9tG/Ynm8yL+2VuYmFOtmSW7b6tSkyH
         RQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345976; x=1771950776;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20E8AsSTFCwzOiRhIxVDRmNYTsZqkvgm04spnyQD6co=;
        b=dPidNeKW0bXGctUoOvWAcByr2ESj4bablfpItDNQ7RnIy4zpYKnv9e2s2ukpBLPMnp
         r/jdhohMulGbQFs0u/lU5KQwG7Bdns1QPaA4fNVmWDObKRYe3UWRxa5eFWxASNaJNCI8
         XRh5STfVTGRPB8KCZCTa3ehNrPwqBlEuiAeLA9wJsCoca4MCgWbKo5eObznx+2IWO6iq
         +ZJ9JTObDVm4efkIMtDDzk6vZEzNhOtrvLUzYXJPdNUedF1AUbpGmsRaK2mJDR4h9a1b
         31VGj4ptb4y1nSk6xh2IVqf4oobn1gWDUzlvkaZD7VrJGZ54Qsc8FrEs2VhUex6JDBFT
         OEOA==
X-Forwarded-Encrypted: i=1; AJvYcCWTjfHfMl4oB9VBabmwdvMGk/18CBg/ukP5E798G6I2RnUmQkihipAgL91g64OdjPAsgrXKTgoe8DcZ9H8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCEi63P41VdrAQERiX3Usny7B70WcAkVC3cmzQQKg5zpM+kSUW
	QhFBBVsWrXTUTbzsPsIIBYTn5WfCuBF1ZYL3Y8GR5rSZToFk5SIBhJeO7CQg1Zve8qUIoxWU+jZ
	DastXRQ==
X-Received: from dybmv5.prod.google.com ([2002:a05:7300:cd45:b0:2ba:9f53:8c70])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2c8b:b0:2ba:7f8c:6754
 with SMTP id 5a478bee46e88-2bac97ceddbmr4300008eec.37.1771345975648; Tue, 17
 Feb 2026 08:32:55 -0800 (PST)
Date: Tue, 17 Feb 2026 08:32:48 -0800
In-Reply-To: <20260217163250.2326001-1-surenb@google.com>
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
References: <20260217163250.2326001-1-surenb@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260217163250.2326001-2-surenb@google.com>
Subject: [PATCH v2 1/3] mm/vma: cleanup error handling path in vma_expand()
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16907-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:surenb@
 google.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0543414E36B
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
2.53.0.273.g2a3d683680-goog


