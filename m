Return-Path: <linuxppc-dev+bounces-17176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFCCCFfXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:04:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F096196341
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWvP3829z2xS3;
	Wed, 25 Feb 2026 22:04:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017489;
	cv=none; b=hcP3ffDntQW7fxDWCNhsmk93HhkN107H9/c4CnIzK9S73FCp84RY2L00JRwnWsOycp42b5ve3h72GUDNYFyzInfUOGMlMVbgrdzQ2cGoKhg+zwvPwCxZlwgkjgdkCTXoWhstG5M6TLAm/aZrUYB+o5evgn4kXYgRuTe8KlDAo0g12/EG7IfMn9Q8qNTR+yRbyczgbChg/F+dEq2OtBurT8Il5JFkCGZQZtYBEzZUv6Ok+8Krb2m2A3+GpjGxq/pFKtHa67hapjGFC4FLemUpCdnFMjQb9e//vUxJqYmBtPaTynYJDKPT+1+7/nUJV3SzASlDopi+Mz3Vkd/xfEH1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017489; c=relaxed/relaxed;
	bh=g5KVqfadpQstZ/7tuEPjkEGdNo2tYUxFPdG16RZ/7OI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXMi+LDaD0Gr6S//ThAVg0N6wLYPS6l/YNbG9hB3Per8CPitOTnPF5C2IvoPFbHMgmBLGmRi7B++987iEkqawmDPAOEktJphaEiz8oN8ezsivlOuyAn3gea4ETLWQjQLdUXwMZQckibk+M3FMnuEMueF1U6BuJC5bR7186nbobFG8Nvs4lKzVSoUWVrRugy1lc7ED55knF9igZekvLpdFR17ZZBLM8b38XBxcxmteaN6hPOmVkrURkHhkpZi2vO18p7d5mN4Hjdh3kvwlo/f/EkIFXJJ6hxwnBPadxiXAdIrk4zLJ06HKGJM9IcTzlsE+4DXtKbXWl888MSLDsZvlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NIXY8TFD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NIXY8TFD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWvM5pJSz3cKm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:04:47 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ad9f2ee29aso12454805ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017484; x=1772622284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5KVqfadpQstZ/7tuEPjkEGdNo2tYUxFPdG16RZ/7OI=;
        b=NIXY8TFDC9tyuyYVmulQsm5KOGR9z5HzC3vyr7zI4W4gXaG3gQueu47pSEkP4khLQl
         kMFMGpb+vDEDsCtLpqRZL90d2ZeOTjDVad6fNwZJWYvVU5kd8MxyEoRxKwyO62sJOoEW
         2m5jN7INXS4fFlWZeKi04I+Uw3pX9iHyGB32wELoTYVYBKIorNJJE0TkvM8MVFeFVvrs
         10cbp6I/vSlcrmVzCj4eXIzdGT1T1KCxqyVO1JbvMz3PN7vrRNLFP+vzaBzKZLQ8RE9H
         Nf1xKdYBYcho65bL7fAKsgu/MXTerV+OBylp5S4Q6F57gAKTPyR79SDG3U0VfbvTK7XH
         HNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017484; x=1772622284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5KVqfadpQstZ/7tuEPjkEGdNo2tYUxFPdG16RZ/7OI=;
        b=v6WVHNEk1lJX3vU7ZCzC5u9Fra7QsOs2K2JrcbNwIAeEUMIqC9MUEGpLBV5nFeyRol
         v9gBA1ztfiYzOimUelML+s5XFVV+WYbzDJGOopBzW2ddqzf/yvA6GXTlNCRMt46+35ti
         ljY+71NlVrCjb6JIBQTPl33+BKVZ2Iw8rx3Khf67Fn2DIDminBvpPIJAwDJq/aruOl/J
         2LiI/ukqbDYmoFJA2CNy+Vi3XnijGoL7gUg2bkYQDby4gYAGWq+EY58czgKXyiMFz/jC
         PAJcT0p6stLNExWhQbLJXAL0Xmz4zGH0hHtatQmygR0TwFuc6MHB2Um12aFTek710rdT
         14pQ==
X-Gm-Message-State: AOJu0Yx37HjFuNugyLEtAWGzJObyPApXQ0RngK1PGqkyvxCL5hPet8bL
	En94kXogfdAOTa8yPc62zdHjTE0R3Y+2ps/44UOxtLrL0696rblQCcFpWzMRxA==
X-Gm-Gg: ATEYQzzxnX4OSpNq1UN4Nw2jEeajOm6OMtKP0cXtIz+oQ9AzrcuERZ2oX95qENKEWTF
	lT2Pmx69vQVxIaPOAdBLO5dFN7Dy/LE6WaC+Em3rVomVOF7oi9fDCVuVZnrSEY7FJkGNlMiCGs0
	PK9dr1Kr7aGNfdo3pLe2WT0VfVhoALzVTcABSS3YnsdAEj8x+pboJdnv3MF2CsJAIqnZkKe65ZV
	aUnHXzJa3y4SgItQCGjI+HMfHd/HfxA4m4HQRiDp0LSBxRPw+gDecWuGms0USxHdd2400knPCr4
	968CPdXNRqygy0MwAv2tEsAKbyre9bFaxN9BYjUTSxMVZLRSClR4B3bUSPpnzu+vbXBZOwv+8Gp
	7SVgMIbRM7h1o+PJTpxivRscTTGvA/Acckb52B5wy+7Q72AaP/JZBpblWm6giICX1tWABbbzJ0P
	lCgnMR8He0mhFqwJI+HtOT8PtsxWr2SRk=
X-Received: by 2002:a17:903:3885:b0:2aa:daf7:84f6 with SMTP id d9443c01a7336-2ad74597df5mr135442095ad.55.1772017483592;
        Wed, 25 Feb 2026 03:04:43 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:04:42 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 00/10] Misc powerpc fixes and refactoring
Date: Wed, 25 Feb 2026 16:34:21 +0530
Message-ID: <cover.1772013273.git.ritesh.list@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17176-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2F096196341
X-Rspamd-Action: no action

Hello All,

- Patches 1 & 2, are fixes found during reviews and while running mm selftests.
- Patch-3 adds a way to verify / test this race using debug_vm_pgtable.c
- Patches 4-10 are various cleanups and refactoring, that I have been carrying in
  my tree. I felt it's time to push it, if those changes seems logical to others too.

Please review and share your thoughts!

-ritesh


Ritesh Harjani (IBM) (10):
  powerpc/pgtable-frag: Fix bad page state in pte_frag_destroy
  powerpc: book3s64: Fix unmap race with PMD THP migration entry
  mm/debug_vm_pgtable.c: Add test to zap THP migration entry
  powerpc/64s/tlbflush-radix: Remove unused radix__flush_tlb_pwc()
  powerpc/64s: Move serialize_against_pte_lookup() to hash_pgtable.c
  powerpc/64s: Kill the unused argument of exit_lazy_flush_tlb
  powerpc: book3s64: Rename tlbie_va_lpid to tlbie_va_pid_lpid
  powerpc: book3s64: Rename tlbie_lpid_va to tlbie_va_lpid
  powerpc: book3s64: Make use of H_RPTI_TYPE_ALL macro
  powerpc: Add MMU_FTRS_POSSIBLE & MMU_FTRS_ALWAYS

 arch/powerpc/include/asm/book3s/64/pgtable.h  |  1 -
 .../include/asm/book3s/64/tlbflush-radix.h    |  1 -
 arch/powerpc/kernel/setup-common.c            |  4 ++
 arch/powerpc/mm/book3s64/hash_pgtable.c       | 21 +++++++
 arch/powerpc/mm/book3s64/internal.h           |  2 -
 arch/powerpc/mm/book3s64/pgtable.c            | 46 ++++++--------
 arch/powerpc/mm/book3s64/radix_tlb.c          | 61 ++++++++-----------
 arch/powerpc/mm/pgtable-frag.c                |  1 +
 mm/debug_vm_pgtable.c                         | 38 ++++++++++++
 9 files changed, 108 insertions(+), 67 deletions(-)

--
2.53.0


