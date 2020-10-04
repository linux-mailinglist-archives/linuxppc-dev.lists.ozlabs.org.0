Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF9282792
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 02:21:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3ktW4wwvzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 11:21:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.36; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0036.hostedemail.com
 [216.40.44.36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3kph6sb3zDqP5
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Oct 2020 11:18:20 +1100 (AEDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 821CB837F24A;
 Sun,  4 Oct 2020 00:18:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1311:1314:1345:1359:1437:1515:1534:1539:1567:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3865:3872:4250:4321:5007:6261:6742:10004:10848:11026:11473:11658:11914:12043:12297:12555:12895:13069:13311:13357:13894:14096:14181:14384:14394:14721:21080:21627:30054:30089,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: chalk68_201509d271b1
X-Filterd-Recvd-Size: 2027
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf15.hostedemail.com (Postfix) with ESMTPA;
 Sun,  4 Oct 2020 00:18:15 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Paul Mackerras <paulus@ozlabs.org>
Subject: [PATCH 1/4] KVM: PPC: Book3S HV: Make struct kernel_param_ops
 definition const
Date: Sat,  3 Oct 2020 17:18:06 -0700
Message-Id: <d130e88dd4c82a12d979da747cc0365c72c3ba15.1601770305.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1601770305.git.joe@perches.com>
References: <cover.1601770305.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm-ppc@vger.kernel.org, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This should be const, so make it so.

Signed-off-by: Joe Perches <joe@perches.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4ba06a2a306c..2b215852cdc9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -111,7 +111,7 @@ module_param(one_vm_per_core, bool, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a core (requires indep_threads_mode=N)");
 
 #ifdef CONFIG_KVM_XICS
-static struct kernel_param_ops module_param_ops = {
+static const struct kernel_param_ops module_param_ops = {
 	.set = param_set_int,
 	.get = param_get_int,
 };
-- 
2.26.0

