Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B828C864D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 14:33:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NckYuHVu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JxD72PD4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgmZd3xxMz3cm7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 22:32:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NckYuHVu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JxD72PD4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=asavkov@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgfSR3m92z30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 17:57:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715932628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsCKnSd8SY21HTUjj+hbf4r5AF/uUdXnBR6lfnTM7uI=;
	b=NckYuHVu/xTbPR/msFnXPJ7Q1gEWc5sJWIu7IFxeNdNUpSHXMItsC50IyEtZKDa+N6qfq5
	PlXhxTSl7uU3dbXHj71IGypaOo0R3db+WJIoLkpl8D3HXJG6ACPPAMiJ/aWJYa9lca1OmL
	4qNkOyBPnnDzEWm3W6gLL3jyV2FwaXg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715932629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EsCKnSd8SY21HTUjj+hbf4r5AF/uUdXnBR6lfnTM7uI=;
	b=JxD72PD4bKXVgL9je8PZsZwseON0bsQu4eGiVuj4uConAI3SiqU73Wbt+Ww7eG0Mw0TG8H
	1M9IOBYaxTSrcB8rFi0dXfaWF5qdLPMg7gsexZgMXRtcmFDLxeGcrhbYzQh4TV3uLFWL0l
	81nOwRsxm9Vwcybcqt/F0KV2eDQg3Wc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-vWFqYgpbOEGkJTvFzMf7zg-1; Fri,
 17 May 2024 03:57:05 -0400
X-MC-Unique: vWFqYgpbOEGkJTvFzMf7zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 765E529AA3AC;
	Fri, 17 May 2024 07:57:04 +0000 (UTC)
Received: from alecto.usersys.redhat.com (unknown [10.43.17.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD402740F;
	Fri, 17 May 2024 07:57:02 +0000 (UTC)
From: Artem Savkov <asavkov@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc64/bpf: jit support for sign extended mov
Date: Fri, 17 May 2024 09:56:49 +0200
Message-ID: <20240517075650.248801-5-asavkov@redhat.com>
In-Reply-To: <20240517075650.248801-1-asavkov@redhat.com>
References: <20240517075650.248801-1-asavkov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mailman-Approved-At: Fri, 17 May 2024 22:30:12 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, Artem Savkov <asavkov@redhat.com>, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add jit support for sign extended mov. Tested using test_bpf module.

Signed-off-by: Artem Savkov <asavkov@redhat.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b9f47398b311d..811775cfd3a1b 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -676,8 +676,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				/* special mov32 for zext */
 				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
 				break;
-			}
-			EMIT(PPC_RAW_MR(dst_reg, src_reg));
+			} else if (off == 8) {
+				EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
+			} else if (off == 16) {
+				EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
+			} else if (off == 32) {
+				EMIT(PPC_RAW_EXTSW(dst_reg, src_reg));
+			} else if (dst_reg != src_reg)
+				EMIT(PPC_RAW_MR(dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_MOV | BPF_K: /* (u32) dst = imm */
 		case BPF_ALU64 | BPF_MOV | BPF_K: /* dst = (s64) imm */
-- 
2.45.0

