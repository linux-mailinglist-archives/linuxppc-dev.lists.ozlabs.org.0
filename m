Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B8172F4F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 08:35:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=PrEj1izm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgwfb5Y76z3bNv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 16:35:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=PrEj1izm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=baomingtong001@208suo.com; receiver=lists.ozlabs.org)
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgvr72s3sz302F
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 15:59:02 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4Qgvr14Lb0zBJLB4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 13:58:57 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1686722337; x=1689314338; bh=CQeigO8zNNy9tYDvPbKf+Gx+si+
	jCka9K2RQRkU/TXw=; b=PrEj1izmoY+OV649nLDab0dAkHJsZxf1F2A7JM3CSby
	/hvFUXPHGl4sncu+S61zOH6kU4vpdQa9bb5t0gKvWgDwQA4rkuldl2BN8u6kEVLy
	0ObXODyBTJTLa/QD/lr7+ug1JQ5AcDkh8XpX10IK3LwDEVyMr/+A3ynAtKXxqIyA
	XvYFmVLhlPHAWLIKQs+cl1z+YmfEzjVmw6gl4bmAs/U2aN9z4PPJz8IBR5v2LJsZ
	ThVDNNYNagIWateIx+O46ru9pL8aNoFrugfbCMx4okHAP6q2TPINg5BVAbT6dbHO
	IZSRfdxnNuAXbBAqoIx0XpcGP49/V7LjXdSu8ZEf38w==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id j15dv5Qj1sGE for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 14 Jun 2023 13:58:57 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4Qgvr11YgyzBJLB3;
	Wed, 14 Jun 2023 13:58:57 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 13:58:57 +0800
From: baomingtong001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 pbonzini@redhat.com, paulus@ozlabs.org, maz@kernel.org, thuth@redhat.com
Subject: [PATCH] KVM: PPC: remove unneeded variable
In-Reply-To: <20230614055354.27565-1-luojianhong@cdjrlc.com>
References: <20230614055354.27565-1-luojianhong@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <a231e235fc55e782e70e5f186ecd7588@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 14 Jun 2023 16:35:08 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fix the following coccicheck warning:

arch/powerpc/kvm/book3s_pr.c:424:5-6: Unneeded variable: "r".

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  arch/powerpc/kvm/book3s_pr.c | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 9118242063fb..1b68de369b88 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -421,14 +421,13 @@ void kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu)

  static int kvmppc_core_check_requests_pr(struct kvm_vcpu *vcpu)
  {
-    int r = 1; /* Indicate we want to get back into the guest */

      /* We misuse TLB_FLUSH to indicate that we want to clear
         all shadow cache entries */
      if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
          kvmppc_mmu_pte_flush(vcpu, 0, 0);
-
-    return r;
+    /* Indicate we want to get back into the guest */
+    return 1;
  }

  /************* MMU Notifiers *************/
