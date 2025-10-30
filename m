Return-Path: <linuxppc-dev+bounces-13605-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8482BC225B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyGcs04B9z2xnk;
	Fri, 31 Oct 2025 07:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761857804;
	cv=none; b=GZQ7JqRqgUqMcp23ZWKcV3lpGTvMIk4q/QIDXp5nRSq27grmX4Yn44sCNF/tqOVHFduS4weK2oNtP3MdGmh3L2YQg8m3HJLVQCjmRNBpAJ0sfV5++EN0rVKDysZDjupeO2Flf0yMOsuxuHEyDgukuDEbW1vw22s9zkdKgAjT4V/3jqSC0NW/3t/trm12z0Somt7wtMoX3dBJgxbKGZGkhRVa9J15ieA3S7C8pMFfkeHsDTXnyYBTLeWeSyAG04ybyrLiXZ4AMTXSkLx/0QfZe0xMBHbnlhVJpSN2hKxwtMF1FLQ2b2kcox7alW9Sn0rbrFW0VZS/8fMtxoqrWvFIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761857804; c=relaxed/relaxed;
	bh=UX+za681ZLF+H9xjQXJpwgYS36XQPi3DvT8rFDYYswI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=heHW4CqurJXXAP0x7SgcdVZe+X7FtdYndJYp0EpmRddxUp5XMGEX5AWD8C3yxhvpEQsfPPNdNhCDwqDkhlN8A1QmI4nYUuZLfqqM6gjkpZgfF5VFMmSwYQ8/jSXJ9d+57PZlbECYqGT6zbpZev+2kZ929nIRkPZjycHcsTOur7cFIng6dY69KCL/FBWeLSAvrrANVhwkIA8zuzS96O3oK6o8lQWJ6ewYNIfFBAbMBOyM43oq5j9ZCmoNAU4g8dCR9TjssfxY5v1TU6/CbraiFFFlYfZIo5tKO5vx2VS6rG3TEYxuJdppmfjqLNs2h3ZSsMxfpTeQIr7JK9ha+vJX5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=QS3ZkxxU; dkim-atps=neutral; spf=pass (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=QS3ZkxxU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyGcq3XTpz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:56:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761857798; x=1762462598; i=markus.elfring@web.de;
	bh=UX+za681ZLF+H9xjQXJpwgYS36XQPi3DvT8rFDYYswI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QS3ZkxxU0qV4Fegb18U/YOtyNmn30PIePN66qz4Z2Wp53ac+w45yk8+BoKb3CC/W
	 cgTXEoXvsA98T8mX+1fZybkGaY0Jeq7G0rZTGG7+t3U8cnP0IU1djBjpz5leaIgWJ
	 Ue/dk50PBIra/3+I8NHyuDFk4oCoOyHENyEqAvxmd5FTDCBFiRMbyaxrmCLPVBL/x
	 qge+5Dhf45tkQLpVZWuiB7ld+fYu76bDH3kpXI9ywMtKYkRyhhtSJsRcsbzndMjaz
	 I31e1MqWOSKj074zCUPbMUDJfwT9vaSdMnliwxVagd9fEW72yUcymRHdCTZVPPSYF
	 XCATegjJNlOW5sa/Ww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8n4G-1wIxQP1FRu-00zGZd; Thu, 30
 Oct 2025 21:51:03 +0100
Message-ID: <ad42871b-22a6-4819-b5db-835e7044b3f1@web.de>
Date: Thu, 30 Oct 2025 21:51:00 +0100
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
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 Alexander Graf <agraf@suse.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment in
 kvmppc_kvm_pv()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6XSDec5DYQ+59fbNP5IzsgzWfTdFXyH3eZ1ElapDgQ1U38Km2Fb
 lMfJ4kuLtgIN6aFggUBKLyFCYAzuJQZci0K75dhp3kAV19AWcDXgS2OMc9oLGBgSI7SwJde
 srQxqcV1IGyWylwgYLAOd19hXIraxJsyV9LrvvmRvhYyStvPakJGltqUYsTaPo3J5eWDbXL
 DnM5dTpiPGDj+36DuZTgg==
UI-OutboundReport: notjunk:1;M01:P0:52tWwJa66c0=;RJxQ8D3YNA+VSeKkm4721rJnOzy
 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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 30 Oct 2025 21:43:20 +0100
Subject: [PATCH] KVM: PPC: Use pointer from memcpy() call for assignment i=
n kvmppc_kvm_pv()

A pointer was assigned to a variable. The same pointer was used for
the destination parameter of a memcpy() call.
This function is documented in the way that the same value is returned.
Thus convert two separate statements into a direct variable assignment for
the return value from a memory copy action.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/kvm/powerpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ba057171ebe..ae28447b3e04 100644
=2D-- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -216,8 +216,7 @@ int kvmppc_kvm_pv(struct kvm_vcpu *vcpu)
=20
 			shared &=3D PAGE_MASK;
 			shared |=3D vcpu->arch.magic_page_pa & 0xf000;
-			new_shared =3D (void*)shared;
-			memcpy(new_shared, old_shared, 0x1000);
+			new_shared =3D memcpy(shared, old_shared, 0x1000);
 			vcpu->arch.shared =3D new_shared;
 		}
 #endif
=2D-=20
2.51.1


