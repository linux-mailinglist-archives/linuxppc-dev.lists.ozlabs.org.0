Return-Path: <linuxppc-dev+bounces-17924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEqmADwOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17924-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249923E6E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tL4nHpz3cBG;
	Tue, 10 Mar 2026 05:15:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080106;
	cv=none; b=StMchsFHDWhTQWG3eNysj2wuCrx577oJ7XXkCBtbniyM6g+OgUaqjDMfQdBYO4EsaQYwJZcnHRzt9rnxRNVYVdgoZerc7i0mpq1z9v4wY64wdwYcpP6doK0Eok5uAiT3nUC9tIhnYDf4LOLAMNQCrfk3f35DFdPvolFMiIe296//r8GU+zE5Lj1DkvHSVNf+20bQnJusoHN/6sH0SJgd9vYYBH1sA363/z42fHtY8In/7XfkctZDNKc26pamj3TX2rz7wTCyx7ouOFExvMwbtg+tyVvPcHHMCQdsfFK+1DOlkq5wnTbVIEcYIbgeedmvuSk+9SuAyUW+rNQMFWZlVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080106; c=relaxed/relaxed;
	bh=wrQPyrCq4BQHruSSLVtkKoiYU0QHhxaYyWfyUojeFdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+x/DAHjUv2Ki9OQ8nsRLtivqU8nJX9HosPMntrHiqkdjMxDzfknygDTIhDbPW9Qx+iItvCdfwdUN/F+d+55OYDhXcsOtUW5tBYd1j+jmYYCIW6z73e29AeoFxj+sOkU3WHFaKMa2KBb3WUDEhM8hDTRQJLVSo82VeXHW4/bf7sxH9Zu3w+xY1K0pV6MDyCRsATKDe74uV8ygWYq+DzzJG476kRuGI4bJr5UM57rp3rtpse9m7ktkqxJKDAR4Ssich7OkwEf7u/X9ZLZFjWAAtUC7AsDF9NnNU8uwgSe5U2Z1rLiUoVpHjojUL69H3sjurQ3erkTFCiiC6rqehWSpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a3pAISfc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a3pAISfc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tL03W5z3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:05 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1940816b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080103; x=1773684903; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrQPyrCq4BQHruSSLVtkKoiYU0QHhxaYyWfyUojeFdw=;
        b=a3pAISfc9XpCZxnhUWfYbjBuPy0UrJV5erpfmj5PLpQZwPLIzNHr80Tyujz+Lfa1s/
         4SXDCc7boZP9VNb/1WKlnuumj5hpb/Upy7M1orrWEuzvntduuN60a2LYDBouOzQw1wdG
         Wpqs+/zs1sQHCiRclO26Wmm7v8mtzn0poAMlHZ94yCzd0BBPZAKbsgGbPUxlenTUj8tZ
         8nht4XDT1qyCCIbJuYFnyBzEgHKmlTqW+KLonbNR3IPrFOxpJb1mGlIKMZwTw9bojbSt
         jcbPbDmShTVVeJxwnfPO34/Yohs2jcL/K44QRyRdMjaVv7UKnqj83mglWdu7qvTGAAsz
         Jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080103; x=1773684903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrQPyrCq4BQHruSSLVtkKoiYU0QHhxaYyWfyUojeFdw=;
        b=YiA58kudRk8eU9EiA3KcX4SZQ35Q6CllOswgjJHwTI7KuiSEidJiiYoOZpUYBeu85V
         PCcR7EDOeJfK4fp7HxlLipHZgipP3MZ1YsMF8SZa4pPqa0wQR7wVJRNzDlOahezVW0FL
         YLyMfljxdffwE/WYP2rrxIqwEk/YLUNywn42l8Ezilyr1YbV/AReMq7KbV+bwHuwafpR
         3+WieuRVCa/7Gkd9s4yHLfcNDVCv2v+Bh+eAoDzE7dioubnbX/eimZuDtashFmjkjqco
         Tz0Z9RTghSaE9/fCwybnQJPLxjwqyocgYNeNX2IuTLl8leAtfMnn8Btu9Z5oMv+oEPZj
         OqSg==
X-Gm-Message-State: AOJu0Yy/Vp+tWCYrUPhhm2REMBlXpmTfsCAM/YPOQdRKwKVt7vRPXbvK
	w3vio5vk0ENuPK5Sbca4Ij+j3JkQRCmUNVKljWG6QWKWRzciLIep81ZAp4K6fMSz
X-Gm-Gg: ATEYQzxtiAzH6botUOcOsfTkRA1S4PKbzqivEVj+ODm/jgGBs5H8Nq3LZH0jUQQP/H7
	jBrDlJQuAXDO28lMVTyy4aaqt06r0R4wgfOQ995TNimBQGml8ljByjQxNGqDDefXjHEihoFYMiA
	xX5ZnGsYI4s2iTr6yjnUkiqEjV0L8Of9c7n6omWRwh6X1NHAwQ4B8IYytb/BSR+8KmG36nw76IG
	9oS5N0P2ZILNA8C/i21LnKRA/AVQ2BNIsbp+d44HP80u9j4a7IZizv2OIAfXB/tUE9HIuSx+bDu
	PsiLTt9nv15nOo63g05ZTftEV31jaUT7+3RX97x73vUtNY9BHlvMH38d1Miw7O2ptzfOPqt2/vT
	v8aNJ5yBzzBbYW0Wy8pdWkvNgRMuFXqe62mDKfYW+EYC6sLXqEFLOkdbYpcXBHgTp2856sYj71+
	TTunbroG+BfOi+COYVo46yuY2lBdlSuer5cf3q/RiI1NJSJ7PvweQE1MHfQ15NDmER
X-Received: by 2002:a05:6a00:882:b0:81f:3f6e:166 with SMTP id d2e1a72fcca58-829a2f811d3mr10724387b3a.46.1773080103454;
        Mon, 09 Mar 2026 11:15:03 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.14.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:15:02 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 04/10] powerpc/64s/tlbflush-radix: Remove unused radix__flush_tlb_pwc()
Date: Mon,  9 Mar 2026 23:44:27 +0530
Message-ID: <b79c8ce8f00aa3e96ab9b1c77bc004759c397d3f.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 4249923E6E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17924-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Commit 52162ec784fa
("powerpc/mm/book3s64/radix: Use freed_tables instead of need_flush_all")
removed radix__flush_tlb_pwc() definition, but missed to remove the extern
declaration. This patch removes it.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-radix.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index a38542259fab..de9b96660582 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -92,7 +92,6 @@ extern void radix__flush_tlb_page_psize(struct mm_struct *mm, unsigned long vmad
 #define radix__flush_tlb_page(vma,addr)	radix__local_flush_tlb_page(vma,addr)
 #define radix__flush_tlb_page_psize(mm,addr,p) radix__local_flush_tlb_page_psize(mm,addr,p)
 #endif
-extern void radix__flush_tlb_pwc(struct mmu_gather *tlb, unsigned long addr);
 extern void radix__flush_tlb_collapsed_pmd(struct mm_struct *mm, unsigned long addr);
 extern void radix__flush_tlb_all(void);
 
-- 
2.50.1 (Apple Git-155)


