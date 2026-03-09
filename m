Return-Path: <linuxppc-dev+bounces-17923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFMxEDQOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967123E6DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tG6YXVz3cGL;
	Tue, 10 Mar 2026 05:15:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080102;
	cv=none; b=gEYBQNSknU3mdQHkVzNiIizgnDZ+bk+o6kC6IF37VoTLsjkm2RMO+LhZghD4X+j1bnB8RlziP6rUfaBdfPazCvLkvYqVI6N+UD/xWWkNYAGAj3bbLdJOE+gTBVBm67j48ExhzyvC996ph8lRUzAdiT3t1uOpnryTWmxNVD+xhJCVI/CyIBDZMjEJ4O2SuybYb/N9vz6+g2ocXGLb8c1YwE43E7oIsrK0DFs7uHwShaomnMIq+tINNyefNEH/2ImhwZRcKIqxXBe4TyhuWIzBXuL4LPSP195itHeK0AIfP+6kICHewhE9sEw4WRID+K14i7DG9V7raLiL19bjM94pjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080102; c=relaxed/relaxed;
	bh=58JlIixqdiS5VK0Y8iFt93l9NbthkLO1ZJ5xNB+HQfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXsO684lJXmVl1B/3K5VtImbkDFoL9iA4iBd3G3N9Jl+sTZ+zURy9Er6IY0IIGiOZCpH2kNr0/JdRLyfnGNq3zP0tfMur+2xnjlF0ZPhQHiz4gB8oTIT7P+CnHtmBsmppSnETNYoTOo6jLcsqjeZ6YQnzMWQ+FMoa6kJNJSXiiRnCEUpsE3x1Wx22MXsVCYR1y9iDsY86Pg6YVTYxw14k+W4SVd0fZkArvNnKpX7rENAmqsYBqkH9hS9PbN7krvuswWGEEtMKKgEtvKhJG/qX+BJPiWraa3wHkdPChRPxeMIdrVdqxahC+WqaM6lrAJsZIlQbXdlUP6QWEZxjF1iAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A51yCXog; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A51yCXog;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tF73Grz3cF4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:01 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8297c035d28so1791834b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080100; x=1773684900; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58JlIixqdiS5VK0Y8iFt93l9NbthkLO1ZJ5xNB+HQfc=;
        b=A51yCXoge5nZAMnZCA6IJZTU7s9lKAYrDR6udNofvBElMK/f4g0YUnhYnLWRG8J2Lq
         y36GipSW4v40PGaLyGJtU++H2yl5VG09cJcjp6xasu3DdvV9NWbRrJf/Z/Nu7ENtkcj5
         C0NB0oQlW9GiP+hFoha/Jc0OQE5ieEsZOmMKxVsOK7D9fH5dr+u9fm6Gp2Znym7ZPxXh
         HM5eljfAJj8s4zX1AXZU9dTfCXzrKH3e0bF4G+P42DZ3vF8Fj1HSlRyDao3bkYPdCJZE
         tCoMgiLPABb4hSIBncqcircfOkyLIvnHZkFyd6kyjumwDfmrz/2tboD7l9gJD/Cx21FH
         IQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080100; x=1773684900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=58JlIixqdiS5VK0Y8iFt93l9NbthkLO1ZJ5xNB+HQfc=;
        b=iFlTxBgz9mBCetmwza1gAIMsJoIk6X5fxSKLdv/Jo+WSU7PHJCxHDB2TZp0jCy8B1r
         sE1ZVT4dGlmOGFPQiq0MIUH4OBazyTpxR6S6FzP7kdOtt2pWj4rihLOk95K/OVNJedCm
         XbUWo8X3b6fqsa1OJlxZrrWYnYJJiBeJ/TPkXwgUFpU5fxkBohAfrcN2xuevVxybmjhU
         Kx+B9HZItdv9r7AYOgwjojiQwrjxrBKna1nx5Whvk5TlbShaMww1c7O8h9mi/X5ESobq
         KULbfGBIBt0SQGhUhal+AX0oUubLS4ZVA7D+2xr1Aba1B4VR5GB8XT+V+U79+aEjcVl7
         YHqQ==
X-Gm-Message-State: AOJu0Yx4fcnRLjIrEhenXdlOaEczny1G9KEN6/dHOnsL3E4lVRqaidq1
	JqjAQNo33VyYWo6xY8CRmLBOF+gGJgitUvPT8Rdn6F6gZgBdpgXsU4FiWXzh+w5o
X-Gm-Gg: ATEYQzz3GC2mISsnoMiIFpduGjIRMz80Vwf/1oZJhaS18WklziHQW0sHZvqIFYbE+VN
	EgQT1onzLtjR2P2alo7YMhZxGIsD9Z0s+s+noHBDYx9IRhiju7O+4bA+ya1Z/rN8lbC2BsuCDrR
	i/u9J/KE6K6l5tcnpKXvk0Nw+i4mDG2mf6EbmKYT7fSRtksqhKMvnYapgbwbLT1wwI0DIoT/b63
	8j/T+xT2qJBkvH46HrBbZZiTUB1xMeNpfiTH+69j1Cn3ErC2rv5rJRZtHyv/peIEk8V1iJX5Au3
	FnT9B7H3GGGxp1tXqikEHDF3zVLEWoCWwlfpypLu0TSt1tnlMlDxQlINlyXiAVjerTOyU6yGcgy
	SfiGgw+R4V6Q9NZwCMuL2QsnGZlcjmXru0F6ZfipktqGOBXOpwmLtayoh2hi4th2JzNiRZBGLJ+
	FWsAOkusgSyRGaFOdkun/ysK++KNxQb49aBijDIpS6pjASC0lnt0jUDIlbMZdyv23a
X-Received: by 2002:a05:6a00:3021:b0:824:a8a9:e08e with SMTP id d2e1a72fcca58-829a2e1308fmr9763195b3a.14.1773080099409;
        Mon, 09 Mar 2026 11:14:59 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.14.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:14:58 -0700 (PDT)
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
Subject: [PATCH v2 03/10] powerpc/64s: Fix _HPAGE_CHG_MASK to include _PAGE_SPECIAL bit
Date: Mon,  9 Mar 2026 23:44:26 +0530
Message-ID: <7416f5cdbcfeaad947860fcac488b483f1287172.1773078178.git.ritesh.list@gmail.com>
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
X-Rspamd-Queue-Id: 8967123E6DA
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
	TAGGED_FROM(0.00)[bounces-17923-lists,linuxppc-dev=lfdr.de];
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

commit af38538801c6a ("mm/memory: factor out common code from vm_normal_page_*()"),
added a VM_WARN_ON_ONCE for huge zero pfn.

This can lead to the following call stack.

 ------------[ cut here ]------------
 WARNING: mm/memory.c:735 at vm_normal_page_pmd+0xf0/0x140, CPU#19: hmm-tests/3366
 NIP [c00000000078d0c0] vm_normal_page_pmd+0xf0/0x140
 LR [c00000000078d060] vm_normal_page_pmd+0x90/0x140
 Call Trace:
 [c00000016f56f850] [c00000000078d060] vm_normal_page_pmd+0x90/0x140 (unreliable)
 [c00000016f56f8a0] [c0000000008a9e30] change_huge_pmd+0x7c0/0x870
 [c00000016f56f930] [c0000000007b2bc4] change_protection+0x17a4/0x1e10
 [c00000016f56fba0] [c0000000007b3440] mprotect_fixup+0x210/0x4c0
 [c00000016f56fc30] [c0000000007b3c3c] do_mprotect_pkey+0x54c/0x780
 [c00000016f56fdb0] [c0000000007b3ed8] sys_mprotect+0x68/0x90
 [c00000016f56fdf0] [c00000000003ae40] system_call_exception+0x190/0x500
 [c00000016f56fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec

This happens when we call mprotect -> change_huge_pmd()
mprotect()
  change_pmd_range()
    pmd_modify(oldpmd, newprot) 	# this clears _PAGE_SPECIAL for zero huge pmd
	    pmdv = pmd_val(pmd);
	    pmdv &= _HPAGE_CHG_MASK;	# -> gets cleared here
	    return pmd_set_protbits(__pmd(pmdv), newprot);
    can_change_pmd_writable(vma, vmf->address, pmd)
      vm_normal_page_pmd(vma, addr, pmd)
        __vm_normal_page()
          VM_WARN_ON(is_zero_pfn(pfn) || is_huge_zero_pfn(pfn));  # this get hits as _PAGE_SPECIAL for zero huge pmd was cleared.

It can be easily reproduced with the following testcase:
	p = mmap(NULL, 2 * hpage_pmd_size, PROT_READ, MAP_PRIVATE |
		 MAP_ANONYMOUS, -1, 0);
	madvise((void *)p, 2 * hpage_pmd_size, MADV_HUGEPAGE);
	aligned = (char*)(((unsigned long)p + hpage_pmd_size - 1) &
				~(hpage_pmd_size - 1));
	(void)(*(volatile char*)aligned);  // read fault, installs huge zero PMD
	mprotect((void *)aligned, hpage_pmd_size, PROT_READ | PROT_WRITE);

This patch adds _PAGE_SPECIAL to _HPAGE_CHG_MASK similar to
_PAGE_CHG_MASK, as we don't want to clear this bit when calling
pmd_modify() while changing protection bits.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 43d442a80a23..6be7428fdde4 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -107,8 +107,8 @@
  * in here, on radix we expect them to be zero.
  */
 #define _HPAGE_CHG_MASK (PTE_RPN_MASK | _PAGE_HPTEFLAGS | _PAGE_DIRTY | \
-			 _PAGE_ACCESSED | H_PAGE_THP_HUGE | _PAGE_PTE | \
-			 _PAGE_SOFT_DIRTY)
+			 _PAGE_ACCESSED | H_PAGE_THP_HUGE | _PAGE_SPECIAL | \
+			 _PAGE_PTE | _PAGE_SOFT_DIRTY)
 /*
  * user access blocked by key
  */
-- 
2.50.1 (Apple Git-155)


