Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE6375A7E6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 09:35:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=it5qt/70;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R64Gt1xfYz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 17:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=it5qt/70;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=hanyu001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R64G303pnz2ytQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 17:34:50 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4R64Fy2N8szBRDsZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 15:34:46 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1689838486; x=1692430487; bh=mo1EPzzbB1CtIWdWKzQA3xIryWc
	yJGZHiG1dyCtVH0E=; b=it5qt/70QvKfOLoQndmo/tLrM1SjGXLu4oDt8JEq/WQ
	pegzzctXB99PN7+MR7+ixcKG0iUzW9V1iQTW6bzt+I3N5qX7v+VF1mMsXm37XULu
	td/ZzVV4EMMpjSSZIIbiad3OKdZiqEQg3vDdB8asXFhw3VAtjsU96HpHjggySog/
	dzI0mHss+tITOK6+b9vwM/4En6089mf5u64rnvziPXLV+ru2LVvk80qGl0A8SqTN
	lnEgP57OeWkbglx4cTdg5BNtMq1TEvNpluwtROPpG1v/IsDLjsaQzhFcmKe5UXrZ
	u3aeXV0TqbPCjkbMbrUrIJx42wxmpqQPXZslBtvS7jQ==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id a-MmoBGgj9eR for <linuxppc-dev@lists.ozlabs.org>;
	Thu, 20 Jul 2023 15:34:46 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4R64Fx6P7qzBRDs1;
	Thu, 20 Jul 2023 15:34:45 +0800 (CST)
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 15:34:45 +0800
From: hanyu001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 Liam.Howlett@Oracle.com, vbabka@suse.cz, akpm@linux-foundation.org,
 dave@stgolabs.net, willy@infradead.org
Subject: [PATCH] mm: book3s32: add require space around that '?' and ':'
In-Reply-To: <tencent_78C62F88E268136A2FCE91042CAB212A7709@qq.com>
References: <tencent_78C62F88E268136A2FCE91042CAB212A7709@qq.com>
User-Agent: Roundcube Webmail
Message-ID: <44c1e39667c838d00c9dbb007184ccf1@208suo.com>
X-Sender: hanyu001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix below checkpatch errors:

./arch/powerpc/mm/book3s32/tlb.c:102: ERROR: spaces required around that 
'?' (ctx:VxW)
./arch/powerpc/mm/book3s32/tlb.c:102: ERROR: spaces required around that 
':' (ctx:VxW)

Signed-off-by: Yu Han <hanyu001@208suo.com>
---
  arch/powerpc/mm/book3s32/tlb.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s32/tlb.c 
b/arch/powerpc/mm/book3s32/tlb.c
index 9ad6b56bfec9..de4abfe3d06b 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -99,7 +99,7 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, 
unsigned long vmaddr)
      struct mm_struct *mm;
      pmd_t *pmd;

-    mm = (vmaddr < TASK_SIZE)? vma->vm_mm: &init_mm;
+    mm = (vmaddr < TASK_SIZE) ? vma->vm_mm : &init_mm;
      pmd = pmd_off(mm, vmaddr);
      if (!pmd_none(*pmd))
          flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
