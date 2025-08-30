Return-Path: <linuxppc-dev+bounces-11516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE6B3C7AB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLqK2YNSz300F;
	Sat, 30 Aug 2025 13:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526061;
	cv=none; b=hdAG8H+B81Cq7N2LOUzLu5cXJ3R22LoKn/mDdbvC01EBbmuWZRJPQDIHHWFTiUDGmt9aBzlhHe9PXEK+ti2CK745QCoTdebUmbpk4Fn2/mECWa7ImMeSFE0tZiSqR6uou2Gnfy/jp/rv9FeD+iNk3bGp2ugBD7j7WGaq7o/uTJVCci4tSg9StiJ4WkMvKp7f0TDXESFKrTaj/6EjF0pN+JzH56dwNsXeqSYCNp/HIR8UaAUCVLFGJrkVuPvERxUyJTZ6FOJhUBiC5iofMRHH7PyzJBAqBFAd/fValQlwucQByKF1lgmrPGWsdwUrTDVbHjPN0BvQFkiv8I6g4H8daQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526061; c=relaxed/relaxed;
	bh=w+YeVa94sRlmZ0nq34HuS5G+Fyh2Uxqmz3Ls5c8SH+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTUe8LQFdfmb4b2HZ4OnYUjONyLFGKHa3lyWk0kFxKL7uWjTd5Budalx1izXZy9kFFSW5MG5zdA1/a3Kf7ErDTKJCMswTsznJzt8qAnOEvtW0DDYGsQmsiaVpQDzEo68IQAS5PaUO1pP16CBDuTyp011OFRES/pI5yzUZAS2NguvYi28XAka2/5zyyoSe8D7801f4ntgcebhAvSzTZI6tJRu4KIgYG716GEOdYAlScBmduDlKNpy0I90AtO79bc7SKNaErXB1C5NWEKRd0yQ+ohp665jI5ppHXB2p5uhWsoLnNHTmoXmv31TMr4JCPqOwMlYAZOpn3/Z388vFZuRvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ol4QW4B/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ol4QW4B/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLqJ5Mv6z2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:20 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-327f1fef76cso1168515a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526058; x=1757130858; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+YeVa94sRlmZ0nq34HuS5G+Fyh2Uxqmz3Ls5c8SH+A=;
        b=Ol4QW4B/rvCQyiUOlfWfcsTarCJLbJ5i9oGvy0w6V8fflwwKDSolfWI3QCPl1bCTAA
         fweWZyIBlnSCzdzJGxMNdfVSLtbTpDPst/G2sd9sgET4I0NjWmXkBEZm7PSke0L9HCtp
         lhW1eNaOmzDnblTKvtDEvUSwhY0z0b/8064ViRDUeOVa1eSRB67Get0yJoDPeLoBww4B
         VxvgM9JcEETzJTTnXoiRHkg6pzIj311FfuF3q9aA9ZAk5RCcmRZsrSLP0d3MNgqSaG13
         ZdXgwbkqcVWs0cLL9rU4JVytii5KnhheWsby58auqn03GKkPUEyqN7LghOzZNkdHN6Yk
         STpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526058; x=1757130858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+YeVa94sRlmZ0nq34HuS5G+Fyh2Uxqmz3Ls5c8SH+A=;
        b=sQIIfkHCGdmDVC5WMIKK2YeqrPw1JnZR0Nvk18apecF/nDT3NrFbvGbvIJpQH5F+qn
         I3yf07spS+UdJ0anhgjajBHgmuLGuDCH/nUxfalDT6iHFe0NOR2J3O81+WR/lU2QI3Q9
         VXor7WfZs7MgPcZ7B7LeEBI20tEhkeFEqH9b+8s7S9ysYU/RtQPNpval+W/dYMHroPKS
         XgqwZQ2nuK8gqbmGYjmOedUvEYJu3AtOkvEU24aEFVRTF51uwpzyKHc94wEwkqTn/l0g
         9BrtAYlKN2dbBqfSWZKdTS5464CxZ5y5Mkrr2qOJZMfXwUQlx7XGkk371oriauG7oEim
         8ozg==
X-Gm-Message-State: AOJu0YxADtkujyHPNn5TpqMaszDDY5tSe3VAIG7l+NIJBtzKAeSUZipB
	lVtsHLPoGEMV+M1Hh8gxhbtgFV+p5KCugcdDS74ZhM4JwnXjIa5hozaAjZT4DQ==
X-Gm-Gg: ASbGnctijnXjNCQBRS4JzDsSJ1HTTN1OFDErZ5R3h8PbT4MuyYFFC9aSoMrJVqzCHdI
	7ekI6ibsFzS+jG4yOXXr+cDJI5rhPJymYvhrnuunQOKz7oV2xEegFcDads4fpXtdTe5+0n4T8Lz
	/4UpYeSeSi0/mJgNSrpNG2lQq2UVwa7E0izuaTub/fSfnK2EXSwKzCx7FTDIAYSnjFuUk3Vq6NJ
	HpMh9HD2o2pavaYgVu0ZUFOKvoa6l6kWk/X42EUK/2Wqk9eKU5K2msfZ5j7/8rEWes9cM1gzrZI
	7TAO/jEn/cDoOZnCsEHCBsK9BggW32jXR7CjETLkQD+nSrO1NVfoIYHIHW2QSgoD9M+oeAZkLsr
	RPS+A5+FSMGbG4ux07qnskQBUnQ==
X-Google-Smtp-Source: AGHT+IF2/OdN8tCTtZ39E/4bVUXWoGvK0gBzJAIBV1w8VsxZE9pUxN6u0hvJuP/YkZecjHCOthV90w==
X-Received: by 2002:a17:90a:e7cd:b0:328:d94:174 with SMTP id 98e67ed59e1d1-32815412b69mr1074952a91.5.1756526057668;
        Fri, 29 Aug 2025 20:54:17 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:17 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 4/8] powerpc/ptdump/64: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
Date: Sat, 30 Aug 2025 09:21:43 +0530
Message-ID: <91cdba6f4a58d3e11ae95be99df3852c49baf2a7.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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

HPTE format was changed since Power9 (ISA 3.0) onwards. While dumping
kernel hash page tables, nothing gets printed on powernv P9+. This patch
utilizes the helpers added in the patch tagged as fixes, to convert new
format to old format and dump the hptes. This fix is only needed for
native_find() (powernv), since pseries continues to work fine with the
old format.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: 6b243fcfb5f1e ("powerpc/64: Simplify adaptation to new ISA v3.00 HPTE format")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/ptdump/hashpagetable.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index a6baa6166d94..671d0dc00c6d 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -216,6 +216,8 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 	vpn  = hpt_vpn(ea, vsid, ssize);
 	hash = hpt_hash(vpn, shift, ssize);
 	want_v = hpte_encode_avpn(vpn, psize, ssize);
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		want_v = hpte_old_to_new_v(want_v);

 	/* to check in the secondary hash table, we invert the hash */
 	if (!primary)
@@ -229,6 +231,10 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 			/* HPTE matches */
 			*v = be64_to_cpu(hptep->v);
 			*r = be64_to_cpu(hptep->r);
+			if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+				*v = hpte_new_to_old_v(*v, *r);
+				*r = hpte_new_to_old_r(*r);
+			}
 			return 0;
 		}
 		++hpte_group;
--
2.50.1


