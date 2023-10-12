Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 966337C6B5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 12:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5mRk32Rfz3vZP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 21:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=strlen.de (client-ip=2a0a:51c0:0:237:300::1; helo=chamillionaire.breakpoint.cc; envelope-from=fw@strlen.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 2635 seconds by postgrey-1.37 at boromir; Thu, 12 Oct 2023 21:41:57 AEDT
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:237:300::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5mR91sxrz3c1Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 21:41:56 +1100 (AEDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1qqsRu-0007Vp-5J; Thu, 12 Oct 2023 11:57:46 +0200
Date: Thu, 12 Oct 2023 11:57:46 +0200
From: Florian Westphal <fw@strlen.de>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: Re: [Bisected] [1b4fa28a8b07] Build failure "net/core/gso_test.c"
Message-ID: <20231012095746.GA26871@breakpoint.cc>
References: <79fbe35c-4dd1-4f27-acb2-7a60794bc348@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79fbe35c-4dd1-4f27-acb2-7a60794bc348@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: willemb@google.com, netdev@vger.kernel.org, fw@strlen.de, linux-kernel@vger.kernel.org, sachinp@linux.vnet.com, abdhalee@linux.vnet.ibm.com, edumazet@google.com, mputtash@linux.vnet.com, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com> wrote:
> Greetings,
> 
> [net-next] [6.6-rc4] Build failure "net/core/gso_test.c"
> 
> --- Traces ---
> 
> make -j 33 -s && make modules_install && make install
> net/core/gso_test.c:58:48: error: initializer element is not constant
>    58 |                 .segs = (const unsigned int[]) { gso_size },
>       |                                                ^

Ouch, I can reproduce this with: gcc --version
gcc (Debian 12.2.0-14) 12.2.0
Copyright (C) 2022 Free Software Foundation, Inc.

gcc 13.2.1 and clang-16.0.6 are ok.

Whats the preference here?  We could use simple preprocessor constant
or we could require much more recent compiler version for the net
kunit tests via kconfig.

gcc-12.2.0 can compile it after this simple s//g "fix":

diff --git a/net/core/gso_test.c b/net/core/gso_test.c
--- a/net/core/gso_test.c
+++ b/net/core/gso_test.c
@@ -4,7 +4,7 @@
 #include <linux/skbuff.h>
 
 static const char hdr[] = "abcdefgh";
-static const int gso_size = 1000;
+#define GSO_TEST_SIZE 1000
 
 static void __init_skb(struct sk_buff *skb)
 {
@@ -18,7 +18,7 @@ static void __init_skb(struct sk_buff *skb)
 
 	/* proto is arbitrary, as long as not ETH_P_TEB or vlan */
 	skb->protocol = htons(ETH_P_ATALK);
-	skb_shinfo(skb)->gso_size = gso_size;
+	skb_shinfo(skb)->gso_size = GSO_TEST_SIZE;
 }
 
 enum gso_test_nr {
@@ -53,70 +53,70 @@ static struct gso_test_case cases[] = {
 	{
 		.id = GSO_TEST_NO_GSO,
 		.name = "no_gso",
-		.linear_len = gso_size,
+		.linear_len = GSO_TEST_SIZE,
 		.nr_segs = 1,
-		.segs = (const unsigned int[]) { gso_size },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE },
 	},
 	{
 		.id = GSO_TEST_LINEAR,
 		.name = "linear",
-		.linear_len = gso_size + gso_size + 1,
+		.linear_len = GSO_TEST_SIZE + GSO_TEST_SIZE + 1,
 		.nr_segs = 3,
-		.segs = (const unsigned int[]) { gso_size, gso_size, 1 },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 1 },
 	},
 	{
 		.id = GSO_TEST_FRAGS,
 		.name = "frags",
-		.linear_len = gso_size,
+		.linear_len = GSO_TEST_SIZE,
 		.nr_frags = 2,
-		.frags = (const unsigned int[]) { gso_size, 1 },
+		.frags = (const unsigned int[]) { GSO_TEST_SIZE, 1 },
 		.nr_segs = 3,
-		.segs = (const unsigned int[]) { gso_size, gso_size, 1 },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 1 },
 	},
 	{
 		.id = GSO_TEST_FRAGS_PURE,
 		.name = "frags_pure",
 		.nr_frags = 3,
-		.frags = (const unsigned int[]) { gso_size, gso_size, 2 },
+		.frags = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 2 },
 		.nr_segs = 3,
-		.segs = (const unsigned int[]) { gso_size, gso_size, 2 },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 2 },
 	},
 	{
 		.id = GSO_TEST_GSO_PARTIAL,
 		.name = "gso_partial",
-		.linear_len = gso_size,
+		.linear_len = GSO_TEST_SIZE,
 		.nr_frags = 2,
-		.frags = (const unsigned int[]) { gso_size, 3 },
+		.frags = (const unsigned int[]) { GSO_TEST_SIZE, 3 },
 		.nr_segs = 2,
-		.segs = (const unsigned int[]) { 2 * gso_size, 3 },
+		.segs = (const unsigned int[]) { 2 * GSO_TEST_SIZE, 3 },
 	},
 	{
 		/* commit 89319d3801d1: frag_list on mss boundaries */
 		.id = GSO_TEST_FRAG_LIST,
 		.name = "frag_list",
-		.linear_len = gso_size,
+		.linear_len = GSO_TEST_SIZE,
 		.nr_frag_skbs = 2,
-		.frag_skbs = (const unsigned int[]) { gso_size, gso_size },
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
 		.nr_segs = 3,
-		.segs = (const unsigned int[]) { gso_size, gso_size, gso_size },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, GSO_TEST_SIZE },
 	},
 	{
 		.id = GSO_TEST_FRAG_LIST_PURE,
 		.name = "frag_list_pure",
 		.nr_frag_skbs = 2,
-		.frag_skbs = (const unsigned int[]) { gso_size, gso_size },
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
 		.nr_segs = 2,
-		.segs = (const unsigned int[]) { gso_size, gso_size },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
 	},
 	{
 		/* commit 43170c4e0ba7: GRO of frag_list trains */
 		.id = GSO_TEST_FRAG_LIST_NON_UNIFORM,
 		.name = "frag_list_non_uniform",
-		.linear_len = gso_size,
+		.linear_len = GSO_TEST_SIZE,
 		.nr_frag_skbs = 4,
-		.frag_skbs = (const unsigned int[]) { gso_size, 1, gso_size, 2 },
+		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, 1, GSO_TEST_SIZE, 2 },
 		.nr_segs = 4,
-		.segs = (const unsigned int[]) { gso_size, gso_size, gso_size, 3 },
+		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, GSO_TEST_SIZE, 3 },
 	},
 	{
 		/* commit 3953c46c3ac7 ("sk_buff: allow segmenting based on frag sizes") and
