Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 010759E852
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 14:49:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hpc460SwzDqSF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:49:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="XisjNBZo"; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HpVv0BqbzDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 22:45:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1566909878;
 bh=Zl705TxJ8OTiSJaTO/uNmvnIN8rPHaMxkAQRT6rw9Ls=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=XisjNBZo7fdPVkK6UrnXece09zLZn9X3xEiozHXnQlxaCQqhUQQH1mNIJ857kqg3v
 lZvDUSxMY3qsEcf99AwpNS9r0o/u02tOehz1op0REC/lZyCEdBa/Oo9SAwzuuqFCIn
 0GRxsdsGvN9pPfRwI0nZ7ltR83ndcJBXi3/6TPr8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.143.232]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M8iH2-1huraz3jhc-00CBAr; Tue, 27
 Aug 2019 14:44:38 +0200
Subject: [PATCH 2/2] powerpc/pseries: Delete an error message for a failed
 string duplication in dlpar_store()
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Frank Rowand <frank.rowand@sony.com>, Gen Zhang <blackgod016574@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
References: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <535cfec2-782f-61ec-f6fb-c50186ead2af@web.de>
Date: Tue, 27 Aug 2019 14:44:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IeKF7aaoShfZTIhKH5bi7ZBjC3Rau2OxHJWecP4M8+nxkKqwcPa
 C5iXYKWmudtfXJ8vD84hGusc/bUgbD0pr11Yms97UuKzjK/T2dTPnDnZoxlRlRbvKoeteIQ
 959bNgb6Kkn9e7KJ2CSo/5rOAjpePQraseo5jBS+kHFcbsAoTs4uuqXQyRCddU4Z9l+8/qV
 uq0+UrmWNJBP0nJuwheQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hXQ3nD+jrh0=:XUgUIGQ9HyOB0+93btQ8QH
 sRaaUY1D77ExgfWO3W2v3S9kdhLMO4VqjGB6PLeAlU1V1RYkmFukFV3uEAo1KraQV18/GMmKf
 lHHtthavgEi9eio9gPEI5uQhe+1QKf/41N/26g9l/u0qdo0ME8BPHNPZj37ICZZdex8DrCFX3
 HamMWDuJKKKzxdQ4aXeO+jHkTgC6+ny2hy73KGVR1uk10nixcVCdAbfeaCpHPD6CcYrHfPIr6
 paixAiYof66i7V3ydpNGacTH3fsT/ho8f76jb5bAk5VmI72OZ/VsveeEUivetgay4My/R7HYU
 /4cyC5FnC7bdCuYRqQUCV25a+iU3+0n8zw9/G4uMK5CFlbKwfwdVEQgbfESUfoh/dfvdx+eXF
 0OQZAWo23280CZiwCTJWGsKzR7lKRZdAetahGyQGAUjnMqhVfUNyUfZ5NScfcMcKNbjP8i6VV
 e48PFwFEp8CN7FEeWu3udbxlgMRPdxTyTKXY83ZZFm/cH4FYxbYF79SX0N8RqH41xRXavLLWk
 C2biDQoHlVGqcc1J42EAQlsGgqPM1yfz9tpTO8TvhXUIZG3tsCEni6eHXD3UiW2SinB+ukq/r
 2FneGezPNhhkmDbvCxvJxo6zLh7LBVyD6zXaOfvBKP55ZVbOXpR5QnCb8fo9kag0P+MTW1lHw
 UKWTP4r3wMrRLMe+soBjqMO9bhMZWmpyT1QXIeL7jASR7fkj1/PefYsU6g0rtph9GmfGtvTJy
 dwwu86wcJaXfs1mnFyV1aWhM1VwXWkmqobDMkPjFa5DF97R2giaI4eJ7/cmGqQpVrxV+cl7cV
 ij0g9KgTwhWWxGS5ON9mhD6LsPD0+rdzesxT+BmXkzt+bZFJYCUr1VwVUrhTaxvWqmrO8Q0uj
 oB2JuX31oxVlxdLT/MMvJMDISo2xlU8fGlSiGXOnY19bGpisEggcW4V10ZjdUk4iqF/4k2Szb
 umAKmAWwsGTHyyDsmHDtUHs3qqqCqzNeGvvwJSLlJk2I61LdsevFrTFy3qtRGL/7kJto1Y5hb
 PQ9PpKZcMUhcBrul41ypCbulgsJ/BtSZJCykPajf5VjuGDDqgAUvnGqhyN4r3CH4gpdMFIM5S
 Aw7u+PlQpE3VUHc7O4Gk+mo0FE/D6W+X9JwQ+LW8I3e8iPnehRQY5OaX/dH9cWaqONATDcpwf
 pnEcw=
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
Date: Tue, 27 Aug 2019 13:37:56 +0200

Omit an extra message for a memory allocation failure in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/pseries/dlpar.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platfor=
ms/pseries/dlpar.c
index 2a783dc0cfa7..deb48b41d488 100644
=2D-- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -521,10 +521,8 @@ static ssize_t dlpar_store(struct class *class, struc=
t class_attribute *attr,
 	int rc;

 	args =3D argbuf =3D kstrdup(buf, GFP_KERNEL);
-	if (!argbuf) {
-		pr_info("Could not allocate resources for DLPAR operation\n");
+	if (!argbuf)
 		return -ENOMEM;
-	}

 	/*
 	 * Parse out the request from the user, this will be in the form:
=2D-
2.23.0

