Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2442728257D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 19:17:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3YTR1vjqzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Oct 2020 04:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3YNz0q5VzDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Oct 2020 04:13:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C3YNx6nTwz8t4B
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Oct 2020 04:13:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C3YNx513Kz9sT6; Sun,  4 Oct 2020 04:13:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C3YNv3bhQz9sSC
 for <linuxppc-dev@ozlabs.org>; Sun,  4 Oct 2020 04:13:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C3YNg1NrZz9vBn3;
 Sat,  3 Oct 2020 19:13:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tvbExPn2qxUn; Sat,  3 Oct 2020 19:13:39 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C3YNg0bfpz9vBn1;
 Sat,  3 Oct 2020 19:13:39 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 4940BC4E; Sat,  3 Oct 2020 19:15:53 +0200 (CEST)
Received: from 192.168.4.90 ([192.168.4.90]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sat, 03 Oct 2020 19:15:53 +0200
Date: Sat, 03 Oct 2020 19:15:53 +0200
Message-ID: <20201003191553.Horde.qhVjpQA-iJND7COibFfWZQ7@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: talitos - Fix sparse warnings
References: <20201002115236.GA14707@gondor.apana.org.au>
 <be222fed-425b-d55c-3efc-9c4e873ccf8e@csgroup.eu>
 <20201002124223.GA1547@gondor.apana.org.au>
 <20201002124341.GA1587@gondor.apana.org.au>
In-Reply-To: <20201002124341.GA1587@gondor.apana.org.au>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: linuxppc-dev@ozlabs.org, Kim Phillips <kim.phillips@arm.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Horia =?utf-8?b?R2VhbnTEgw==?= <horia.geanta@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Quoting Herbert Xu <herbert@gondor.apana.org.au>:

> On Fri, Oct 02, 2020 at 10:42:23PM +1000, Herbert Xu wrote:
>>
>> I don't think that's a valid optimisation unless it's backed up
>> with real numbers.
>
> Also it only matters on little-endian as they're no-ops on big-endian.
> If I'm right then this driver never even worked on little-endian.
>

The following changes fix the sparse warnings with less churn:

---
diff --git a/drivers/crypto/talitos.c b/drivers/crypto/talitos.c
index 7c547352a862..992d58a4dbf1 100644
--- a/drivers/crypto/talitos.c
+++ b/drivers/crypto/talitos.c
@@ -460,7 +460,7 @@ DEF_TALITOS2_DONE(ch1_3, TALITOS2_ISR_CH_1_3_DONE)
  /*
   * locate current (offending) descriptor
   */
-static u32 current_desc_hdr(struct device *dev, int ch)
+static __be32 current_desc_hdr(struct device *dev, int ch)
  {
  	struct talitos_private *priv = dev_get_drvdata(dev);
  	int tail, iter;
@@ -478,7 +478,7 @@ static u32 current_desc_hdr(struct device *dev, int ch)

  	iter = tail;
  	while (priv->chan[ch].fifo[iter].dma_desc != cur_desc &&
-	       priv->chan[ch].fifo[iter].desc->next_desc != cur_desc) {
+	       priv->chan[ch].fifo[iter].desc->next_desc != cpu_to_be32(cur_desc)) {
  		iter = (iter + 1) & (priv->fifo_len - 1);
  		if (iter == tail) {
  			dev_err(dev, "couldn't locate current descriptor\n");
@@ -486,7 +486,7 @@ static u32 current_desc_hdr(struct device *dev, int ch)
  		}
  	}

-	if (priv->chan[ch].fifo[iter].desc->next_desc == cur_desc) {
+	if (priv->chan[ch].fifo[iter].desc->next_desc == cpu_to_be32(cur_desc)) {
  		struct talitos_edesc *edesc;

  		edesc = container_of(priv->chan[ch].fifo[iter].desc,
@@ -501,13 +501,13 @@ static u32 current_desc_hdr(struct device *dev, int ch)
  /*
   * user diagnostics; report root cause of error based on execution  
unit status
   */
-static void report_eu_error(struct device *dev, int ch, u32 desc_hdr)
+static void report_eu_error(struct device *dev, int ch, __be32 desc_hdr)
  {
  	struct talitos_private *priv = dev_get_drvdata(dev);
  	int i;

  	if (!desc_hdr)
-		desc_hdr = in_be32(priv->chan[ch].reg + TALITOS_DESCBUF);
+		desc_hdr = cpu_to_be32(in_be32(priv->chan[ch].reg + TALITOS_DESCBUF));

  	switch (desc_hdr & DESC_HDR_SEL0_MASK) {
  	case DESC_HDR_SEL0_AFEU:
---
Christophe
