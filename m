Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4681272F331
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 05:44:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=c6jHFt+8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgrrh1B2mz30P4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 13:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="unknown key version" header.d=208.org header.i=@208.org header.a=rsa-sha256 header.s=dkim header.b=c6jHFt+8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=208suo.com (client-ip=183.242.55.162; helo=mail.208.org; envelope-from=baomingtong001@208suo.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 464 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 12:42:43 AEST
Received: from mail.208.org (unknown [183.242.55.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgqTb68Zgz306B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 12:42:43 +1000 (AEST)
Received: from mail.208.org (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTP id 4QgqJP5TJ2zBJL9w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 10:34:45 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
	content-transfer-encoding:content-type:message-id:user-agent
	:references:in-reply-to:subject:to:from:date:mime-version; s=
	dkim; t=1686710085; x=1689302086; bh=/153KFImgT+gktyfP9V8RqyB2R8
	agRq0rd6nSMh42WI=; b=c6jHFt+8uhaVx8AgCb70a/2HxXNGL3cV1/olgvE6wsM
	b/Nc7kYIM+dhAFrRDhaABSDg2lUujKDHq+BsZxMs1SazTBEeXbIS0FvG1ayEk3t+
	4YnM7iK9LskVvxahleYV2o23Bpa7DvM9Kwd08hBI0JW1QeUAI4zs+tbkLX/8OmOt
	ZztmzXwJSKkoOioKlzuZ3EbBAZyjZ8i0ot+vR/oO11O7YmwFW+CWF1T/9/HdZPKo
	t0s+ocM1sVA1guZRPlzBOLPIh19EnVvbwV4M3/3OC+f3vKdZBJdg4XH3/TLzrpMC
	sGrV5RCaHsceH055a+TawgjEDXyo3P2db9ADeIqMLIA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
	by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HuEjzm4sUO9a for <linuxppc-dev@lists.ozlabs.org>;
	Wed, 14 Jun 2023 10:34:45 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
	by mail.208.org (Postfix) with ESMTPSA id 4QgqJP2FFCzBJCMY;
	Wed, 14 Jun 2023 10:34:45 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 14 Jun 2023 10:34:45 +0800
From: baomingtong001@208suo.com
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 pbonzini@redhat.com, paulus@ozlabs.org, seanjc@google.com, thuth@redhat.com
Subject: [PATCH] KVM: PPC: remove unneeded variable
In-Reply-To: <20230614023206.3865-1-luojianhong@cdjrlc.com>
References: <20230614023206.3865-1-luojianhong@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <de7ae31f88510a6b04f29fc01ab44854@208suo.com>
X-Sender: baomingtong001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 14 Jun 2023 13:43:36 +1000
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

fix the following coccicheck warning:

arch/powerpc/kvm/book3s_pr.c:424:5-6: Unneeded variable: "r".

Signed-off-by: Mingtong Bao <baomingtong001@208suo.com>
---
  arch/powerpc/kvm/book3s_pr.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index 9118242063fb..d03b31b240d7 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -421,14 +421,14 @@ void kvmppc_restore_tm_pr(struct kvm_vcpu *vcpu)

  static int kvmppc_core_check_requests_pr(struct kvm_vcpu *vcpu)
  {
-    int r = 1; /* Indicate we want to get back into the guest */
+    /* Indicate we want to get back into the guest */

      /* We misuse TLB_FLUSH to indicate that we want to clear
         all shadow cache entries */
      if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
          kvmppc_mmu_pte_flush(vcpu, 0, 0);

-    return r;
+    return 1;
  }

  /************* MMU Notifiers *************/
