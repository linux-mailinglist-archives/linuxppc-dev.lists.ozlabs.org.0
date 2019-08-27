Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5AA9E2E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 10:43:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hj8K3196zDq9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 18:43:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="jxiN9Ffc"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hj610BNdzDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 18:41:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566895289;
 bh=Kijz/kNQrJoEsdqYzBMm40EhNGYcSH4U5H2MUF6P01U=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=jxiN9FfcytJHptbCIi8q2EYt4EZRjcziynfjjlOkT5gaR4WCDkusyHVybURRJOQ/Y
 elSeliIZdQom16SSLOUct+LdSLpNMpgNgh921o1ILXb2yVHSoqTGf7A7XEovQlL1vw
 smaMJhPLivSWErO289lkEccUJOGuFRLxgz2kf24c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ltnmz-1iAGVq2oLN-0117Zr; Tue, 27
 Aug 2019 10:28:19 +0200
Subject: [PATCH 2/2] powerpc/82xx: Use common error handling code in
 pq2ads_pci_init_irq()
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Enrico Weigelt <lkml@metux.net>, Kate Stewart
 <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
References: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <1a4bafee-562f-5eb4-d2bd-34704f8c5ab3@web.de>
Date: Tue, 27 Aug 2019 10:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gK7A+dxt3fKGGpm2M9nJ9fvVY/qb+NE7oESdQhsqt33simYig0U
 IOgihCH6cngODXnxWog/jvQrwp3bW4mjk4e9ClqHj8p61aqmMqH6Thpxi4nV7rbqpP3i9/b
 Ve5pwUYOYjJFawKhDfHJ41AAB0gcfyCz/cu04O/Zex9ib+ACC396ukX57NB199W9s8mZj9i
 KyKrAETJLhWjDjPf5bJ/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0kDVrIJ8rYI=:YFa144bNXGHBaF4z/3ygpu
 nYhcoi9q8HPMEscJa4n2UlCv9+W3Kbe3MEwFey1+6iIk9aAO/zp4ae32IIpvQCEUVxTJz3dt1
 j/5wfA5m3fpPOefLFuyNLqD65TH6S+lMamfFRqbKjsGfPaCZ6nIZxibtzHA0M+WXFIIxzyEPc
 7Xf73VhXh1glO3pfw9rwH6LZSKWFO/pNotLxh5N7FEkJMCvbx7m9JwrIDwUb6dvuG3euG8Lyv
 mKN04fL3Ff8vCd6ZAuncIlp3LvwGm6wz/GbJwxRRrw6x5Yrlg/aIqKnAEhuHSeRIQUx05jW6/
 P1KANuO53kRPE6SlzuRjr652XpudViQWqg5vlxrA//0xwQAtxVS02XHvIpV6eUcLNZW6EgoWU
 FmjqYGyfunxz7xj1TAhoZUTh8fzj1qgFBS2bIkpCq5xQIyb16jMSqZzUtEoAa/sHEyMs9XEyz
 yt1S66wTDwk1mP4KqK4T8cf3P701P2zEGKTo5Zr0t7E8FUKvtjAhGjWeY8F7YwvThrW3jtwn0
 RtMDh8oUGE77Af4gPtu4RPFM026UsmecsEGJaNlw/PTUpR1Rzklvsp7kqfDqOwaGc9Zh+eTHC
 DOLHlw3CZfIPLSkCoy7cweFYq5BmkUqVNa4SRean9iFEy4DnbH7CQgNnxr+11pRmtWpeRtWbf
 WIfMMvlBJAmZkLH0JsbsimcQ7oCK4f0I26BGC/varfzDDQamhdp7iAIv1UJt0U43mgt/DkcVY
 NdFWKeq87klitcXST7twYeqF6OCOp5CRqp6XCkCuLkjMDs975drDc1acIbES2nTcXsk2UZiEh
 oy67acKfCQkuzHqGkobeax1ulLLDWFjEyckLYLDLrDJW80ZpbqrUhsDrnXYBaTWtJtfthRXUz
 rmM9OyPRvL+HmsmV1VePiETTIIW+HtHN45yKhsuNtgTA8hqLC2XAjeuptjFnvAjXXk48l5fWk
 CEuZhHeN/u+gf3CffOC6nGWXFQ/p+/n8OcW/LxocUCPfAO/Q+Qq1xdHCLqsFy6hjStqx3UWB/
 kIfDWf6DCF9b3z2iiDJMxC1oaVxaxIcIaTtQjt9+g10xvtBBMVABRL6P2/sWY793VCl3f67Gr
 +YLr0aIAni2RNLH3HGMWX45/qLPhotSOZWW0r1buvqdGJ4KbKRZv545wGF/izPwVPRQCvGFjk
 x3/SI=
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 09:19:32 +0200

Adjust jump targets so that a bit of exception handling can be better
reused at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c b/arch/powerpc/p=
latforms/82xx/pq2ads-pci-pic.c
index 6cc054db7043..f82f75a6085c 100644
=2D-- a/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
+++ b/arch/powerpc/platforms/82xx/pq2ads-pci-pic.c
@@ -129,13 +129,11 @@ int __init pq2ads_pci_init_irq(void)
 	irq =3D irq_of_parse_and_map(np, 0);
 	if (!irq) {
 		printk(KERN_ERR "No interrupt in pci pic node.\n");
-		of_node_put(np);
-		goto out;
+		goto out_put_node;
 	}

 	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
-		of_node_put(np);
 		ret =3D -ENOMEM;
 		goto out_unmap_irq;
 	}
@@ -160,17 +158,17 @@ int __init pq2ads_pci_init_irq(void)
 	priv->host =3D host;
 	irq_set_handler_data(irq, priv);
 	irq_set_chained_handler(irq, pq2ads_pci_irq_demux);
-
-	of_node_put(np);
-	return 0;
+	ret =3D 0;
+	goto out_put_node;

 out_unmap_regs:
 	iounmap(priv->regs);
 out_free_kmalloc:
 	kfree(priv);
-	of_node_put(np);
 out_unmap_irq:
 	irq_dispose_mapping(irq);
+out_put_node:
+	of_node_put(np);
 out:
 	return ret;
 }
=2D-
2.23.0

